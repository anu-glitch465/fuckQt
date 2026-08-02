import QtQuick

Rectangle {
    id: root
    property string text
    x: 100
    y: 100
    width: 200
    height: 200
    Text{
    text: root.text
    anchors.centerIn: parent
    color: "white"
    }

}
