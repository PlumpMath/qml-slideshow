import QtQuick 2.4
import "." as SS

SS.Box {
    id: body

    centralText.horizontalAlignment: (centralText.lineCount > 1) ?
                                     Text.AlignLeft : Text.AlignHCenter
    centralText.width: content.width
    centralText.wrapMode: Text.WordWrap

    property var bottomLeft
    property var bottomRight
    property var topLeft
    property var topRight

    onBottomLeftChanged: {
        internal.anchor(bottomLeft, "bottom", "left");
    }

    onBottomRightChanged: {
        internal.anchor(bottomRight, "bottom", "right");
    }

    onTopLeftChanged: {
        internal.anchor(topLeft, "top", "left");
    }

    onTopRightChanged: {
        internal.anchor(topRight, "top", "right");
    }

    QtObject {
        id: internal

        function anchor(obj, location1, location2) {
            if (obj) {
                obj.parent = body.content;
                obj.anchors[location1] = body.content[location1];
                obj.anchors[location2] = body.content[location2];
            }
        }
    }
}
