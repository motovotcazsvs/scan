import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int scaner_num: 0

    function textFieldChanged(){
        timer_scanner.running = false
        if(scaner_num >= 8){
            console.log("просканированно" + scan.text);
        }
        scaner_num = 0
    }

    Timer {
        id: timer_scanner
        interval: 200
        repeat: false
        running: false
        onTriggered: textFieldChanged()
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10

        Label {
            text: "Просканируйте пробирку"
        }

        TextField {
            id:scan
            focus: true
            //text: "просканируйте"
            placeholderText: qsTr("Enter barcode")
            onTextChanged: {
                console.log("введено " + scan.text);
                console.log("scaner_num " + scaner_num);
                scaner_num = scaner_num + 1
                timer_scanner.running = true
            }
        }
    }

}
