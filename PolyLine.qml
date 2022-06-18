import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.12
import QtPositioning 5.12
import QtQuick.Shapes 1.1

MapPolyline{
    id: lines
    line.width: 3
    line.color: "black"
//    MapPolyline.Backend: {

//    }

    MouseArea{
        anchors.fill: parent
        drag.target: parent

        onClicked: {
            console.log("PolyLine");
        }
    }
}
