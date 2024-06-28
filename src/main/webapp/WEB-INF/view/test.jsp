<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<a href="tel:01012345678" id="callTelTag" style="display: none"></a>

<p style="text-align: center;font-size: 40px;">Webview Interface Test</p>
<br>
<button onclick="telNum()" style="width: 100%;height: 200px;">test telNum btn</button>
<br>
<button onclick="copyToClipboard()" style="width: 100%; height: 200px;">
    Copy to Clipboard
</button>
<br>
<button onclick="sendGPS()" style="width: 100%;height: 200px;">test sendGPS btn</button>
<br>
<button onclick="savePhoneNum()" style="width: 100%;height: 200px;">test savePhoneNum btn</button>
<br>
<br>
<button onclick="getVersionInfo()" style="width: 100%;height: 200px;">test getVersionInfo btn</button>
<br>
<input class="file" type="file" accept="image/*" capture="camera">
<br>
<a href="https://play.google.com/store/apps/details?id=kr.co.kepco.ele.powercheck">앱스토어 테스틑용 파워체크모바일 이동</a>
<br>
<button onclick="stopGPS()" style="width: 100%;height: 200px;">test stopGPS btn</button>
<br>
<button onclick="exeKakaoMapApp()" style="width: 100%;height: 200px;">test exeKakaoMapApp btn</button>
<br>
<button onclick="searchNearbyPoliceStation()" style="width: 100%;height: 200px;">test searchNearbyPoliceStation btn</button>
<br>
<button onclick="getAppInfo()" style="width: 100%;height: 200px;">test getAppInfo btn</button>

<!-- 모달 구조 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p id="modalText"></p>
    </div>
</div>

</body>
</html>

<script>
    let modal;
    let modalText;
    let callTelTag;


    function telNum() {
        //window.moj.callTelNum("01012345678"); interface 동작시
        callTelTag.href = "tel:01011112222";
        callTelTag.click();


    }

    function sendGPS() {
        window.moj.sendGPS();
    }

    function savePhoneNum() {
        let name = encodeURIComponent("윤재락");
        console.log(name);
        let number = "01012345678";
        window.moj.savePhoneNum("윤재락", number);
    }

    document.addEventListener("DOMContentLoaded", function() {
        // Additional DOMContentLoaded actions can be added here
         modal = document.getElementById("myModal");
         modalText = document.getElementById("modalText");
         callTelTag = document.getElementById("callTelTag");

        let span = document.getElementsByClassName("close")[0];

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }


    });


    function showStatus(test){
        modalText.textContent = test;
        modal.style.display = "block";
    }

    function copyToClipboard() {
        let textToCopy = "test123";
        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(textToCopy)
                .then(() => {
                    alert("Text copied to clipboard successfully!");
                })
                .catch(err => {
                    alert("Failed to copy text: ", err);
                });
        } else {
            alert("Clipboard API not supported");
        }
    }

    /*이름 변경 완료*/
    function getVersionInfo(){
        let test = jsonParser(window.moj.getVersionInfo());
        debugger;
        alert(test.versionName);
    }

    function checkVersion(){
        window.moj.checkVersion();

    }

    function compareVersion(lastVersion, currentVersion){
        console.log("lastVersion : " + lastVersion);
        console.log("currentVersion : " + currentVersion);
    }

    function stopGPS(){
        window.moj.stopGPS();
    }

    function jsonParser(json){
        let obj = JSON.parse(json);
        return obj;
    }

    function exeKakaoMapApp(){
        window.moj.exeKakaoMapApp("은평구 연서로 40길 17-13");
    }

    function searchNearbyPoliceStation(){
        window.moj.searchNearbyPoliceStation();
    }

    function searchNbearby(json) {
        let obj = JSON.parse(json);
        console.log(obj);
    }

    function getAppInfo() {

        let array = ["test", "test2"];

        let test = window.moj.getAppInfo(JSON.stringify(array));
        alert(test);
    }


</script>
