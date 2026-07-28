import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic


ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("jett")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    Mybutton{
        radius: 20
           color: "blue"

           Text {
               anchors.fill: parent
               Text: "Launch"
           }
    }

    // GridLayout {
    //     id: grid
    //     columns: width < 400 ? 1 : 2
    //     rowSpacing: 0
    //     columnSpacing: 0
    //     anchors.fill: parent
    // }
}

