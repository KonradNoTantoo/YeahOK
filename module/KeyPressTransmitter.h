#pragma once

#include <QObject>
#include <QQmlEngine>
#include <set>

extern "C"
{
	struct libevdev;
	struct libevdev_uinput;
}

struct UInputKey
{
	unsigned int code;

	friend auto operator<=>( UInputKey const &, UInputKey const & ) = default;
};

class KeyPressTransmitter : public QObject
{
	Q_OBJECT
	QML_ELEMENT
	QML_SINGLETON

  public:
	explicit KeyPressTransmitter( QObject * parent = nullptr );
	~KeyPressTransmitter();

	Q_INVOKABLE void on_click( int scanCode ) const;
	Q_INVOKABLE void on_modifier_changed( int scanCode, bool pressed );

  protected:
	void send_event( unsigned int type, unsigned code, int value ) const;
	void send_key_event( unsigned code, int value ) const;

	void send_key_down( UInputKey key ) const;
	void send_key_up( UInputKey key ) const;
	void send_sync() const;

	void send_key_tap( UInputKey key ) const
	{
		send_key_down( key );
		send_sync();
		send_key_up( key );
		send_sync();
	}

  private:
	std::set< UInputKey > active_modifiers;
	struct libevdev * evdev = nullptr;
	struct libevdev_uinput * uinput = nullptr;
};
