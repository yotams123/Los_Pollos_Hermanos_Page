﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="protecteditem.aspx.cs" Inherits="protecteditem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background-color:cornflowerblue;
        }

        img{
            cursor: pointer;
        }

        form{
            position:relative;
            float:left;
            width:30%;
            }

        h1{
            position:relative;
            left:45%;
        }

        h2{
            position:relative;
            left:32%;
        }

        .hidden{
            display:none;
        }

        #protected_page_title {
            color: orangered;
            font-size: 40px;
        }

        #foodmenu {
            position: relative;
            top: 10px;
            border: 10px solid black;
            border-color:orangered;
        }

        #foodmenu tr, #foodmenu td {
            border: 5px solid black;
            text-align: center;
            width: 275px;
            font-weight:bold;
            border-color:orangered;
        }

        #sandwich{
            width:275px;
            height:183px;
        }

        #tenders {
            width: 275px;
            height: 183px
        }

        #slaw{
            width:275px;
            height:183px;
        }

        #sauces{
            position:relative;
            left:31%;
            border-color:orangered;
        }

        #sauces td, #sauces tr {
           width: 183px;
           border: 5px solid black;
           text-align: center;
           border-color:orangered;
           font-weight:bold;
           cursor: pointer;
        }

    </style>
    <script>
        let needSauce = false;

        function addSandwich() {
            if (needSauce == false) {
                document.getElementById("order").innerHTML += " ABQ Sandwich, $8.00";
                document.getElementById("ordersend").value += "(ABQ Sandwich, $8.00";
                const price = document.getElementById("total").innerHTML;
                const pricenum = (Number(price.substr(8)) + 8.00).toFixed(2);
                document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
                needSauce = true;
            }
            else {
                window.alert("Choose a sauce to go with your item");
            }
        }

        function addTenders() {
            if (needSauce == false) {
                document.getElementById("order").innerHTML += " Chicken Tenders, $7.50";
                document.getElementById("ordersend").value += "(Chicken Tenders, $7.50";
                const price = document.getElementById("total").innerHTML;
                const pricenum = (Number(price.substr(8)) + 7.50).toFixed(2);
                document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
                needSauce = true;
            }
            else {
                window.alert("Choose a sauce to go with your item");
            }
        }

        function addFries() {
            if (needSauce == false) {
                document.getElementById("order").innerHTML += " Fring Fries, $7.00";
                document.getElementById("ordersend").value += "(Fring Fries, $7.00";
                const price = document.getElementById("total").innerHTML;
                const pricenum = (Number(price.substr(8)) + 7.00).toFixed(2);
                document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
                needSauce = true;
            }
            else {
                window.alert("Choose a sauce to go with your item");
            }
        }

        function addSlaw() {
            if (needSauce == false) {
                document.getElementById("order").innerHTML += " Slaw Goodman, $6.00";
                document.getElementById("ordersend").value += "(Slaw Goodman, $6.00";
                const price = document.getElementById("total").innerHTML;
                const pricenum = (Number(price.substr(8)) + 6.00).toFixed(2);
                document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
                needSauce = true;
            }
            else {
                window.alert("Choose a sauce to go with your item");
            }
        }

        function addBBQ() {
            if (needSauce == true) {
                document.getElementById("order").innerHTML += ", with BBQ Sauce <br>";
                document.getElementById("ordersend").value += ", with BBQ Sauce), ";
                needSauce = false;
            }
            else {
                window.alert("You must choose another item to get another sauce");
            }
        }

        function addRanch() {
            if (needSauce == true) {
                document.getElementById("order").innerHTML += ", with Chef's Ranch <br>";
                document.getElementById("ordersend").value += ", with Chefs Ranch), ";
                needSauce = false;
            }
            else {
                window.alert("You must choose another item to get another sauce");
            }
        }

        function addRemoulade() {
            if (needSauce == true) {
                document.getElementById("order").innerHTML += ", with Remoulade <br>";
                document.getElementById("ordersend").value += ", with Remoulade), ";
                needSauce = false;
            }
            else {
                window.alert("You must choose another item to get another sauce");
            }
        }

        function checkOrder() {
            if (needSauce == true) {
                window.alert("Choose another sauce to go with your meal");
                return false;
            }
            const price = document.getElementById("total").innerHTML;
            const pricenum = Number(price.substr(8)).toFixed(2);
            document.getElementById("price").value = pricenum;
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content5">
        <h1 id="protected_page_title" >Our menu: </h1>
        <form id="form1" name="form1" method="post" runat="server" action="" onsubmit="return checkOrder();">
            <p id="order" name="order" value=""> Your order: <br /></p>
            <p id="total" name="total">Total: $0.00</p>
            <input type="text" id="ordersend" name="ordersend" value=" " class="hidden"/>
            <input type="text" id="price" name="price" value=" " class="hidden"/>
            <input type="submit" name="submit" id="submit" value="Submit order" />
        </form>
        <table id="foodmenu" >
            <tr>
                <td id="sandwichtxt">ABQ Hot Chicken Sandwich   $8.00</td>
                <td id="tenderstxt">Pollos Tenders  $7.50</td>
            </tr>
            <tr>
                <td id="sandwichimg"><img src="images/chickensandwich.jpg" id="sandwich" onclick="addSandwich();"/></td>
                <td id="tendersimg"><img src="images/chickentenders.jpg" id="tenders" onclick="addTenders();" /></td>
            </tr>
            <tr>
                <td id="friestxt">Fring Fries   $7.00</td>
                <td id="slawtxt">Slaw Goodman   $6.00</td>
            </tr>
            <tr>
                <td id="friesimg"><img src="images/curlyfries.jpg" id="fries" onclick="addFries();" /></td>
                <td id="slawimg"><img src="images/slaw.jpg" id="slaw"  onclick="addSlaw();"/></td>
            </tr>
         </table>
        <h2 id="sauce">Your Meal Also Comes With A Sauce Of Your Choice: </h2>
         <table id="sauces">  
            <tr>
                <td id="bbq" onclick="addBBQ();">505 Barbeque Sauce</td>
                <td id="ranch" onclick="addRanch();">Chef's Ranch</td>
                <td id="remoulade" onclick="addRemoulade();">Remoulade</td>
            </tr>
        </table>
    </div>
</asp:Content>

