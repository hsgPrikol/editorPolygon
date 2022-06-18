import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.12
import QtPositioning 5.12
import QtQuick.Shapes 1.1

MapCircle {

    property var coor

    id: circle
    center: coor
    radius: 500
    border.width: 3
    border.color: "black"
    color: "green"

    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }

    onCenterChanged: {
        console.log(center)
    }

    Component.onCompleted: {
        console.log(center)
        console.log(center.latitude)
    }
}
