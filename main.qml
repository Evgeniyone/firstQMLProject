import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


ApplicationWindow {
    visible: true
    width: 200
    height: 200
    title: "Controls"
    Repeater{
        id:repeater
        model: [colorDialog,fontDialog,fileDialog]
        Button{
            x:0
            y:index*(parent.height/repeater.count)
            height: parent.height/repeater.count
            width: parent.width
            text: modelData.title
            onClicked: {
                messageDialog.visible = false;
                modelData.visible = true;
            }

        }
    }
    ColorDialog{
        id: colorDialog
        visible: false
        modality: Qt.WindowМodal
        title: "Select color"
        color: "blue"
        onAccepted: {
            messageDialog.informativeText="Selected color"+color;
            messageDialog.visible=true;
        }
    }
    FontDialog{
        id: fontDialog
        visible: false
        modality: Qt.WindowModal
        title: "Select font"
        onAccepted: {
            messageDialog.informativeText="Selected font"+font;
            messageDialog.visible=true;
        }
    }
    FileDialog{
        id: fileDialog
        visible: false
        modality: Qt.WindowModal
        title: "Choose file"
        folder: "/home/"
        onAccepted: {
            messageDialog.informativeText="Selected file"+fileUrls;
            messageDialog.visible=true;
        }
    }


    MessageDialog{
        id: messageDialog
        visible: false
        modality: Qt.NonМodal
        title: "Message"
    }
}
