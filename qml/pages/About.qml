/*
 * Copyright (C) 2022  Thomas Büning
 * Copyright (C) 2023 - 2024 Rúben Carneiro
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * print is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

Page {
    id: aboutPage
    anchors.fill: parent

    header: PageHeader {
        id: header
        title: "About"
    }

    Flickable {
		id: flickable
		anchors.fill: parent
		contentHeight:  layout.height  + units.dp(80)
		contentWidth: parent.width

        Column {
            id: layout
            spacing: units.gu(2)
            anchors {
                margins: units.gu(2)
                //top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            LomiriShape {
                //Layout.alignment: Qt.AlignHCenter
                 //width: units.gu(12); height: units.gu(12)
                anchors.horizontalCenter: parent.horizontalCenter
                radius: "large"
                image: Image {
                source: Qt.resolvedUrl("../../assets/icon.svg")
                }
            }

             Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 4 / 5
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                text: i18n.tr("<a href=\"https://github.com/tbuen/print-ut\">Source Code</a>")
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 4 / 5
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                text: i18n.tr("Simple Print is a easy print tool for Ubuntu Touch")
            }

            ListItem {
            height: printerItem.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: aboutDev
                title.text: i18n.tr("Developer")
                subtitle.text: "<a href=\"mailto:buening@online.de\">Thomas Büning</a>"
            }
            onClicked: mainStack.push(Qt.openUrlExternally("mailto:buening@online.de"))
        }
            ListItem {
            height: printerItem.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: aboutMaintainer
                title.text: i18n.tr("Maintainer")
                subtitle.text: "<a href=\"mailto:rubencarneiro01@gmail.com\">Rúben Carneiro</a>"
                }
                onClicked: mainStack.push(Qt.openUrlExternally("mailto:rubencarneiro01@gmail.com"))
            }
        }
    }
}