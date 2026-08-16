cmake_minimum_required(VERSION 3.16)

project(projettback VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Quick QuickControls2 Core5Compat)

qt_standard_project_setup(REQUIRES 6.10)

# Content of downloaded design from Figma to Qt or similar
if (EXISTS "${CMAKE_CURRENT_LIST_DIR}/importedcontent/CMakeLists.txt")
    add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/importedcontent)
endif()

qt_add_executable(appprojettback
    main.cpp
)

qt_add_qml_module(appprojettback
    URI projettback
    QML_FILES
        Main.qml
        Mybutton.qml
        RESOURCES
                logo.png
                background.gif
                QML_FILES TrianButt.qml
                QML_FILES Buttoncircle.qml
                gradient.frag.qsb
                fullscreen.vert.qsb
                shader.frag.qsb
                shader.vert.qsb
                QML_FILES Mybutt.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appprojettback PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appprojettback
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appprojettback
    PRIVATE Qt6::Quick
            Qt6::QuickControls2
            Qt6::Core5Compat
)

install(TARGETS appprojettback
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
