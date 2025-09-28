# Intro

YeahOK is, well, **Yet another hasty Onscreen Keyboard**.

Why? Because I needed one with the following specs:

* based on Qt 6
* injects key presses into the [uinput Linux kernel](https://kernel.org/doc/html/latest/input/uinput.html) (through the usual libevdev stack)
	* mostly to be agnostic regarding Wayland/X11, but also: because why not.
* looks that mesh well with the rest of my UI
* folds when not in use

# Dependencies

* Linux kernel with uinput activated
* libevdev
* Qt 6 core and quick/declarative libs
* to display key characters correctly:
	* By default, open-sans font 
	* Coupled to a font that handles UTF8 symbols like ❌, *e.g.* [noto-emoji](https://fonts.google.com/noto/fonts) works well

# Building

With CMake. Not gonna hold your hand, here.

Produces a single executable named `yeah_ok`.

# Configuration

An [example configuration file](./yeah_ok.conf) is available at the root of the project.

On first run, `yeah_ok` will create a default configuration in whatever directory Qt uses for application configuration files.

# Accessing `/dev/uinput`

The `yeah_ok` executable must be run with read and write permissions on `/dev/uinput`. Depending on your system, there are various ways to achieve this requirement.

# A word about keyboard layouts

YeahOK is dumb and doesn't know what a keyboard layout is. What it does is stupidly inject scancodes into uinput. (In the much complicated universe that lies between mechanical keypress and on-screen display, stupidity is underrated, believe me.)

***Cosmetically***, YeahOK associates a scancode to a key position, with a character label, using a .qml file, *e.g.* [Layout_us.qml](content/Layout_us.qml).

However, YeahOK has NO CONTROL WHATSOEVER as to *how* the rest of the system is going to interpret a scancode. There can (and, if care is not taken, will) be a decorrelation between YeahOK's cosmetic layout and the actual system layout.

Its the user's responsibility to figure out if the cosmetic layout displayed by YeahOK matches the actual layout used by the system.

# Known Issues

* UI flickers on (un)folding

# Roadmap

* Dynamic position changes
* Show/hide exit button based on setting
