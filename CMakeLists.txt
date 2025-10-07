cmake_minimum_required(VERSION 3.21.1)

project(yeah_ok
    DESCRIPTION "Yet another hasty Onscreen Keyboard"
    VERSION 1.0.0
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(PkgConfig)
pkg_check_modules(LIBEVDEV REQUIRED libevdev)

qt_standard_project_setup()

qt_add_executable(yeah_ok
    main.cpp
)

qt_add_qml_module(yeah_ok
    URI YeahOK
    VERSION 1.0
    QML_FILES
        Main.qml
        module/AltGrKey.qml
        module/ControlBarFactory.qml
        module/ExitButton.qml
        module/FoldButton.qml
        module/HorizontalBar.qml
        module/Key.qml
        module/Layout_fr.qml
        module/Layout_us.qml
        module/ModifierKey.qml
        module/Position.qml
        module/PositionHandler.qml
        module/ShiftKey.qml
        module/StyledButton.qml
        module/VerticalBar.qml
    SOURCES
        module/KeyPressTransmitter.h
        module/KeyPressTransmitter.cpp
)

target_include_directories(yeah_ok PRIVATE
    ${LIBEVDEV_INCLUDE_DIRS}
    module/
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(yeah_ok PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appYeahOK
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(yeah_ok
    PRIVATE Qt6::Quick PRIVATE
    ${LIBEVDEV_LIBRARIES}
)

include(GNUInstallDirs)
install(TARGETS yeah_ok
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
