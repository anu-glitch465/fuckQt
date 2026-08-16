import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Effects
import Qt5Compat.GraphicalEffects


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
Window{
    visible: true
        maximumWidth: 800
        maximumHeight: 600

        ShaderEffect {
            id: shader
            anchors.fill: parent

                vertexShader: "qrc:/qt/qml/projettback/shader.vert.qsb"
                fragmentShader: "qrc:/qt/qml/projettback/shader.frag.qsb"

                property vector2d u_resolution: Qt.vector2d(width, height)
                property real u_time: 0.0
                property vector2d u_mouse: Qt.vector2d(0, 0)

                NumberAnimation on u_time {
                    from: 0
                    to: 100
                    duration: 100000   // 100 секунд
                    loops: Animation.Infinite
                }
        }
}

    AnimatedImage{
        id: background
        anchors.fill: parent
         source: "qrc:/qt/qml/projettback/background.gif"
         fillMode: Image.PreserveAspectCrop
         visible: false
    }

    MultiEffect {
        anchors.fill: background
        source: background

        blurEnabled: true
        blur: 0.8
    }

    Buttoncircle {
        scale: mouse1.containsMouse ? 1.1 : 1.0
        Behavior on scale {NumberAnimation {duration: 150; easing.type: Easing.OutCirc }}

        MouseArea{
        id: mouse1
        anchors.fill: parent
        hoverEnabled: true
        }
        onClicked: {
            console.log("triangle clicked")
        }
    }

    TrianButt{
        id: targetItem
        x: 500
        y:100
        width: 100
        height: 100

        scale: mouse.containsMouse ? 1.1 : 1.0

        Behavior on scale {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutQuad
            }
        }


        MouseArea {
               id: mouse
               anchors.fill: parent
               hoverEnabled: true
           }
        shape: "triangle"
        color: "#7B8EAB"

        onClicked: {
            console.log("triangle clicked")
        }
}
    Mybutton{
        id: crug
        radius: 20
        color: "blue"
        text:"Truahat"
        // ShaderEffect {
        //     id: effect
        //     anchors.fill: parent

        //     opacity: crug.hovered ? 1.0 : 0.0

        //     Behavior on opacity {
        //         NumberAnimation { duration: 200 }
        //     }

        //     property real u_time: Qt.binding(() => performance.now() / 1000)
        //     property vector2d u_resolution: Qt.vector2d(width, height)

        //     fragmentShader: "qrc:/shaders/gradient.frag.qsb"
        // }

    // background: ShaderEffect {
    //        anchors.fill: parent

    //        // uniform из шейдера
    //        property real time: 0

    //        // 👉 анимация времени
    //        NumberAnimation on time {
    //            from: 0
    //            to: 1000
    //            duration: 100000
    //            loops: Animation.Infinite
    //        }

    //        // 👉 ВАЖНО: подключаешь свои файлы
    //        vertexShader: "qrc:/shaders/fullscreen.vert.qsb"
    //        fragmentShader: "qrc:/shaders/gradient.frag.qsb"
    //    }
}
    Mybutt {
            anchors.centerIn: parent
            text: "Наведи на меня"
        }

    // GridLayout {
    //     id: grid
    //     columns: width < 400 ? 1 : 2
    //     rowSpacing: 0
    //     columnSpacing: 0
    //     anchors.fill: parent
    // }
    }

