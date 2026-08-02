import QtQuick
import QtQuick.Controls

Item {
    id: root

    property string shape: "rectangle"
    property color color: "blue"
    property string text: ""

    signal clicked()

    width: 150
    height: 60


    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            let ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)

            ctx.fillStyle = root.color

            if (root.shape === "triangle") {

                ctx.beginPath()

                // вершина сверху
                ctx.moveTo(width / 2, 0)

                // левый нижний угол
                ctx.lineTo(0, height)

                // правый нижний угол
                ctx.lineTo(width, height)

                ctx.closePath()
                ctx.fill()

            } else {

                // обычный прямоугольник
                ctx.fillRect(0, 0, width, height)
            }
        }
    }


    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }


    Text {
        anchors.centerIn: parent
        text: root.text
        color: "white"
    }
}