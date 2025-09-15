#include "KeyPressTransmitter.h"

#include <QKeySequence>
#include <libevdev/libevdev-uinput.h>
#include <libevdev/libevdev.h>
#include <unistd.h>

constexpr int KEY_PRESSED = 1;
constexpr int KEY_UNPRESSED = 0;

static void fatal_on_negative_errno( char const * const message, int error )
{
	qFatal( message, strerror( -error ) );
}

KeyPressTransmitter::KeyPressTransmitter( QObject * parent )
	: QObject { parent }
{
	evdev = libevdev_new();
	libevdev_set_name( evdev, "YeahOK" );
	libevdev_enable_event_type( evdev, EV_KEY );

	for ( unsigned i = 1; i < 106u; ++i ) { libevdev_enable_event_code( evdev, EV_KEY, i, NULL ); }

	int const result = libevdev_uinput_create_from_device( evdev, LIBEVDEV_UINPUT_OPEN_MANAGED, &uinput );

	if ( result != 0 )
	{
		libevdev_free( evdev );
		fatal_on_negative_errno( "Cannot create uinput managed device: %s", result );
	}
}

KeyPressTransmitter::~KeyPressTransmitter()
{
	int const ui_fd = libevdev_uinput_get_fd( uinput );
	libevdev_uinput_destroy( uinput );
	close( ui_fd );
	libevdev_free( evdev );
}

void KeyPressTransmitter::on_click( int scanCode ) const
{
	if ( scanCode > 0 )
	{
		send_key_tap( { unsigned( scanCode ) } );
	}
	else
	{
		qWarning( "on_click: unexpected key scancode %d", scanCode );
	}
}

void KeyPressTransmitter::on_modifier_changed( int scanCode, bool pressed )
{
	if ( scanCode > 0 )
	{
		if ( pressed )
		{
			active_modifiers.insert( { unsigned( scanCode ) } );
		}
		else
		{
			active_modifiers.erase( { unsigned( scanCode ) } );
		}
	}
	else
	{
		qWarning( "on_modifier_changed: unexpected key scancode %d", scanCode );
	}
}

void KeyPressTransmitter::send_event( unsigned int type, unsigned code, int value ) const
{
	int const result = libevdev_uinput_write_event( uinput, type, code, value );

	if ( result != 0 )
	{
		fatal_on_negative_errno( "libevdev_uinput_write_event error(%u, %u, %u): %s", result );
	}
}

void KeyPressTransmitter::send_key_event( unsigned code, int value ) const
{
	send_event( EV_KEY, code, value );
}

void KeyPressTransmitter::send_key_down( UInputKey key ) const
{
	for ( UInputKey mod_key : active_modifiers ) { send_key_event( mod_key.code, KEY_PRESSED ); }

	send_key_event( key.code, KEY_PRESSED );
}

void KeyPressTransmitter::send_key_up( UInputKey key ) const
{
	send_key_event( key.code, KEY_UNPRESSED );

	for ( UInputKey mod_key : active_modifiers ) { send_key_event( mod_key.code, KEY_UNPRESSED ); }
}

void KeyPressTransmitter::send_sync() const
{
	send_event( EV_SYN, SYN_REPORT, 0 );
}
