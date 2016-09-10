import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Dialog example")
    // main area
    Column{
        anchors.fill: parent
        spacing: 5
        Button{
            id: dbtn
            width: parent.width
            text:"open simple dialog"
            onClicked: simpleDialog.open()
        }
        Button{
            id: mdbtn
            width: parent.width
            text:"open message dialog"
            onClicked: messageDialog.open()
        }
        Button{
            id: fbtn
            width: parent.width
            text:"open font dialog"
            onClicked: fontDialog.open()
        }
        Button{
            id: cbtn
            width: parent.width
            text:"open color dialog"
            onClicked: colorDialog.open()
        }
        Button{
            width: parent.width
            text:"open file dialog"
            onClicked: fileDialog.open()
        }

        Text {
            id: t
            text: qsTr("font")
            horizontalAlignment:  Text.AlignHCenter
            width: parent.width
        }


        Rectangle{
            id: forColorDialog
            width: parent.width /1.07
            anchors.horizontalCenter: parent.horizontalCenter
            height:     200
            border.color: "black"
            border.width: 1
        }
    }



/// DIALOGS

    Dialog{
        id: simpleDialog
        title:  "simple Dialog"
        Text {
            text: qsTr("This is a simple Dialog")
        }
        onAccepted: this.close()
    }




    MessageDialog{
        id: messageDialog
        title:  "simple Dialog"
        text: "I am the Header"
        icon: StandardIcon.Information
        informativeText: "I am under the header"
        detailedText: "I am not shown unless user clicks details"
        onAccepted: this.close()
    }


    FontDialog{
        id: fontDialog
        title: "Message dialog"

        modality: Qt.WindowModal
        onAccepted: {
            t.font.bold = fontDialog.font.bold
            t.font.italic = fontDialog.font.italic
            t.font.weight = fontDialog.font.weight
            t.font.family = fontDialog.font
            t.font.pixelSize = fontDialog.font.pixelSize
            t.font.underline = fontDialog.font.underline

        }
        onRejected: {
            this.close()
            btn.text = "Just Closed"
        }
    }


    ColorDialog{
        id: colorDialog
        showAlphaChannel: true
        onAccepted: forColorDialog.color = this.color
    }

    FileDialog{
        id: fileDialog
        selectMultiple: false
        selectFolder: false
        nameFilters: "*.o , *.cpp"
        onAccepted:{
            selectMultiple ?
            console.log(this.fileUrls)
                      :
            t.text = this.fileUrl
        }

    }




}
