<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="protecteditem.aspx.cs" Inherits="protecteditem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background-color:cornflowerblue;
        }

        img{
            cursor: pointer;
        }

        #protected_page_title {
            color: orangered;
            font-size: 40px;
            text-align: center;
        }

        #foodmenu {
            position: relative;
            left: 350px;
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

        #sauce{
            position:relative;
            left:380px;
        }

        #sauces{
            position:relative;
            left:355px;
            border-color:orangered;
        }

        #sauces td, #sauces tr {
           width: 183px;
           border: 5px solid black;
           text-align: center;
           border-color:orangered;
           font-weight:bold;
        }

    </style>
    <script>
        var order = [];
        var orderinput = document.getElementById("order");

        function addSandwich() {
            order.push('ABQ sandwich', 8.00);
            document.getElementById("order").innerHTML += " (ABQ Sandwich, $8.00) <br>";
            var price = document.getElementById("total").innerHTML;
            var pricenum = (Number(price.substr(8)) + 8.00).toFixed(2);
            document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
        }

        function addTenders() {
            order.push('Chicken Tenders', 7.50);
            document.getElementById("order").innerHTML += " (Chicken Tenders, $7.50) <br>";
            var price = document.getElementById("total").innerHTML;
            var pricenum = (Number(price.substr(8)) + 7.50).toFixed(2);
            document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
        }

        function addFries() {
            order.push('Fring Fries', 7.00);
            document.getElementById("order").innerHTML += " (Fring Fries, $7.00) <br>";
            var price = document.getElementById("total").innerHTML;
            var pricenum = (Number(price.substr(8)) + 7.00).toFixed(2);
            document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
        }

        function addSlaw() {
            order.push('Slaw Goodman', 6.00);
            document.getElementById("order").innerHTML += " (Slaw Goodman, $6.00) <br>";
            var price = document.getElementById("total").innerHTML;
            var pricenum = (Number(price.substr(8)) + 6.00).toFixed(2);
            document.getElementById("total").innerHTML = "Total: $" + String(pricenum);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content5">
        <h1 id="protected_page_title" >Our menu: </h1>
        <p id="order" name="order"> Your order: <br /></p>
        <p id="total" name="total">Total: $0.00</p>
        <%--<input type="button" id="buy" name="buy" runat="server" onserverclick="makeorder" />--%>
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
                <td id="bbq">505 Barbeque Sauce</td>
                <td id="ranch">Chef's Ranch</td>
                <td id="remoulade">Remoulade</td>
            </tr>
        </table>
    </div>
</asp:Content>

