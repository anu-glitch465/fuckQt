import QtQuick

// Rectangle {
//     id: root
//     property string text
//     x: 100
//     y: 100
//     width: 200
//     height: 200
//        Text{
//     text: root.text
//     anchors.centerIn: parent
//     color: "white"
//     }
Rectangle {
    id: root

    property string text

    width: 200
    height: 200
    radius: 20
    clip: true   // ВАЖНО


    ShaderEffect {
        anchors.fill: parent

        // 👇 ПОД ЭТО ДОЛЖЕН БЫТЬ ТАКОЙ ЖЕ uniform В ШЕЙДЕРЕ
        property real u_time: 0
        property vector2d u_resolution: Qt.vector2d(width, height)

        NumberAnimation on u_time {
            from: 0
            to: 1000
            duration: 100000
            loops: Animation.Infinite
        }

        // vertexShader: "qrc:/qt/qml/projettback/shader.vert.qsb"
        fragmentShader: "qrc:/qt/qml/projettback/shader.frag.qsb"
    }

    Text {
        text: root.text
        anchors.centerIn: parent
        color: "white"
    }
}
