// Copyright (c) 2014-2015, The Monero Project
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification, are
// permitted provided that the following conditions are met:
// 
// 1. Redistributions of source code must retain the above copyright notice, this list of
//    conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above copyright notice, this list
//    of conditions and the following disclaimer in the documentation and/or other
//    materials provided with the distribution.
// 
// 3. Neither the name of the copyright holder nor the names of its contributors may be
//    used to endorse or promote products derived from this software without specific
//    prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
// THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import QtQuick 2.0

Item {
    id: delegateItem
    width: 1
    height: 48
    property bool mainTick: false
    property int currentIndex
    property int currentX

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        visible: parent.mainTick
        source: "../images/privacyTick.png"

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            font.family: "Arial"
            font.bold: true
            font.pixelSize: 12
            color: "#4A4949"
            text: {
                if(currentIndex === 0) return qsTr("LOW (x1 fee)") + translationManager.emptyString
                if(currentIndex === 3) return qsTr("MEDIUM (x20 fee)") + translationManager.emptyString
                if(currentIndex === 13) return qsTr("HIGH (x166 fee)") + translationManager.emptyString
                return ""
            }
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: 14
        width: 1
        color: "#DBDBDB"
        height: currentIndex === 8 ? 16 : 8
        visible: !parent.mainTick
    }
}
