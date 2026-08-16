import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Effects

Button {
    id: control

    implicitWidth: 160
    implicitHeight: 48

    // ----- анимация времени для шейдера (непрерывная, без "скачков") -----
    FrameAnimation {
        id: frameAnim
        running: true
        onTriggered: shaderBg.u_time += frameTime
    }

    background: Item {
        anchors.fill: parent

        // 1) базовая чёрная заливка (видна, когда шейдер ещё не проявился)
        Rectangle {
            id: cornerMask
            anchors.fill: parent
            radius: 8
            color: "white"
            visible: false
        }

        // 2) сам шейдерный фон, плавно проявляется при наведении
        ShaderEffect {
            id: shaderBg
            anchors.fill: parent

            opacity: control.hovered ? 1.0 : 0.0
            Behavior on opacity {
                NumberAnimation { duration: 350; easing.type: Easing.InOutQuad }
            }

            // имена свойств должны совпадать с именами в uniform-блоке шейдера
            property vector2d u_resolution: Qt.vector2d(width, height)
            property vector2d u_mouse: Qt.vector2d(0, 0)
            property real u_time: 0

            // ЗАМЕНИТЕ пути на реальные пути к вашим .qsb в ресурсах проекта
            vertexShader: "qrc:/qt/qml/projettback/shader.vert.qsb"
            fragmentShader: "qrc:/qt/qml/projettback/shader.frag.qsb"

        //        layer.enabled: true
        //         layer.effect: MultiEffect {
        //           maskEnabled: true
        //           maskSource: cornerMask
        // }
    }

        // 3) чёрный контур поверх всего — виден всегда, и до, и после наведения
        Rectangle {
            anchors.fill: parent
            radius: 8
            color: "transparent"
            border.color: "black"
            border.width: 2
        }
    }

    contentItem: Text {
        text: control.text
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        color: control.hovered ? "white" : "black"
        Behavior on color {
            ColorAnimation { duration: 350 }
        }
    }
}