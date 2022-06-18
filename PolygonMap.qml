import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.12
import QtPositioning 5.12
import QtQuick.Shapes 1.1

MapPolygon
{
    id:polygon
    border.width: 3
    color: "green"

    MouseArea{
        anchors.fill: parent


    }
}
