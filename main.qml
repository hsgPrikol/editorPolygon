import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.12
import QtPositioning 5.12
import QtQuick.Shapes 1.1


Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    property var polygon: []
    property var circles: []
    property int indexCircles: 0
    property var circle
    property var arrayCoordinate: []
    property var line

    function createMapCirkle()
    {
        var tmpCircle = circle.createObject(map, {
                                                center: map.toCoordinate(Qt.point(mouseMap.mouseX, mouseMap.mouseY))
                                            }
                                            );
        circles.push(tmpCircle);
        map.addMapItem(tmpCircle);
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        //        zoomLevel: 25
        center: QtPositioning.coordinate(50.57, 30.19)

        MapPolygon{
            z: 1
            id: mapPolygon
            color: "red"

            MouseArea{
                anchors.fill: parent

                onDoubleClicked: {
                    console.log("polygon");
                }
            }
        }

        MouseArea{
            id: mouseMap
            anchors.fill: parent

            onClicked: {
                var crd = map.toCoordinate(Qt.point(mouseX, mouseY));

                var tmpCircle = circle.createObject(map, {
                                                        coor: map.toCoordinate(Qt.point(mouseMap.mouseX, mouseMap.mouseY))
                                                    }
                                                    );
                circles.push(tmpCircle);
                map.addMapItem(tmpCircle);

                arrayCoordinate.push(tmpCircle.center);
                var tmpLine = line.createObject(map, {
                                                        path: arrayCoordinate


                                                });
//                mapPolygon.path = arrayCoordinate;
            }
        }

        Component.onCompleted: {
            window.circle = Qt.createComponent("CircleMap.qml");

            window.line = Qt.createComponent("PolyLine.qml");

            //            map.addMapItem(circle)
            console.log("createMapCircle");
        }
    }
}
