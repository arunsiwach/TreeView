<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeViewPage1.aspx.cs" Inherits="TreeView.TreeViewPage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <title>Status Hirerarchy</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .tree {
        list-style-type: none;
        padding-left: 20px;
        position: center;
    } 
    .tree li {
        position: relative;
        padding: 5px 0 5px 20px;
    }
    .tree li::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        /*border-left: 1px dotted #000;
        border-bottom: 1px dotted #000;*/
        width: 15px;
        height: 10px;
    }
    .tree li::after {
        content: "";
        position: absolute;
        top: 10px;
        left: 0;
       /* border-left: 1px dotted #000;*/
        width: 0;
        height: 100%;
    }
    .tree li:last-child::after {
        display: none;
    }
    .tree li span {
        display: inline-flex;
        align-items: center;
        padding: 5px;
        background: #f4f4f4;
        border: 1px solid #ddd;
        border-radius: 5px;
        cursor: pointer;
    }
    .tree li span::before {
        content: '\1F4C1'; /* Folder icon */
        font-size: 12px; /* Small icon size */
        margin-right:5px;
    }
    .floating-tree {
        align-content:center;
        position:center;
        top: 20px;
        left: 20px;
        background: white;
        padding: 10px;
        border: 1px solid #ccc;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    }
    .tree ul {
        display: none;
        padding-left: 20px;
    }
    .tree .expanded > ul {
        display: block;
    }
</style>
<body>
<%--    <form id="form1" runat="server">--%>
        <div class="floating-tree">
            <ul class="tree">
                <li><span>Set your Work Status Levels</span> 
                    <ul>
                        <li><span>Status level 1 </span> <input type="text" id="txtlevel1" placeholder="Name your status Level 1" /></li>
                        <li><span>Status level 2</span> <input type="text" id="txtlevel2" placeholder="Name your status Level 2"/></li>
                        <li><span>Status level 3</span> <input type="text" id="txtlevel3" placeholder="Name your status Level 3"/></li>
                        <li><span>Status level 4 </span> <input type="text" id="txtlevel4" placeholder="Name your status Level 4" /></li>
                        <li><span>Status level 5</span> <input type="text" id="txtlevel5" placeholder="Name your status Level 5"/></li>
                        <li><span>Status level 6</span> <input type="text" id="txtlevel6" placeholder="Name your status Level 6"/></li>
                        <li><span>Status level 7</span> <input type="text" id="txtlevel7" placeholder="Name your status Level 7" /></li>
                        <li><span>Status level 8</span> <input type="text" id="txtlevel8" placeholder="Name your status Level 8"/></li>
                        <li><span>Status level 9</span> <input type="text" id="txtlevel9" placeholder="Name your status Level 9"/></li>
                        <li><span>Status level 10</span> <input type="text" id="txtlevel10" placeholder="Name your status Level 10"/></li>
                    </ul>
                </li>
            </ul>        
            <button onclick="onSubmitForm()">Save your levels</button>        
        </div>     
    <%--</form>      --%>   
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".tree span").forEach(span => {
                span.addEventListener("click", function () {
                    let parentLi = this.parentElement;                    
                    parentLi.classList.toggle("expanded");
                    document.getElementById("txtlevel1").focus();
                });
            });
        });

        function getTreeTextValues() {
            let values = [];
            document.querySelectorAll(".tree li").forEach(li => {
                let textSpan = li.querySelector("span");
                let inputField = li.querySelector("input");
                let textValue = textSpan ? textSpan.textContent.trim() : "";
                let inputValue = inputField ? inputField.value.trim() : "";
                //values.push({ text: textValue, input: inputValue });
                //alert(textValue + '' + inputValue);
            });
            //console.log(values);
            //return values;
        }

        function onSubmitForm() {

            alert('Helo arun siwach')
            document.querySelector(".tree span").classList.toggle("expanded");                              
        }


        function onSubmitForm() {

            
            var postdata = JSON.stringify(
                {"level1": document.getElementById("txtlevel1").value,
                 "level2": document.getElementById("txtlevel2").value,
                 "Level3": document.getElementById("txtlevel3").value,
                 "level4": document.getElementById("txtlevel4").value,
                 "level5": document.getElementById("txtlevel5").value,
                 "level6": document.getElementById("txtlevel6").value,
                 "level7": document.getElementById("txtlevel7").value,
                 "level8": document.getElementById("txtlevel8").value,
                 "level9": document.getElementById("txtlevel9").value,
                 "level10":document.getElementById("txtlevel10").value
                });
            /*alert(postdata);*/                        
            console.log(postdata);   
            debugger;    
            try {
                $.ajax({
                    type: "POST",
                    url: "TreeviewPage1.aspx/saverecord",
                   //url: "TreeviewPage2.aspx/getname",                    
                    data: postdata,
                    contentType: "application/json; charset=utf-8",                    
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            } catch (e) {
                alert(e);
            }
            
            function OnSuccess(response) {
                alert(response.d);
            }                 
        };
    </script>
</body>
</html>
