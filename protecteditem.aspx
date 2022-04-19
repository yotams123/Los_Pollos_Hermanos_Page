<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="protecteditem.aspx.cs" Inherits="protecteditem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background-color:cornflowerblue;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content5">
        <h1 id="protected_page_title" >Our menu: </h1>
        <table id="foodmenu" >
            <tr>
                <td id="sandwichtxt">ABQ Hot Chicken Sandwich</td>
                <td id="tenderstxt">Pollos Tenders</td>
            </tr>
            <tr>
                <td id="sandwichimg"><img src="images/chickensandwich.jpg" id="sandwich"/></td>
                <td id="tendersimg"><img src="images/chickentenders.jpg" id="tenders" /></td>
            </tr>
            <tr>
                <td id="friestxt">Fring Fries</td>
                <td id="slawtxt">Slaw Goodman</td>
            </tr>
            <tr>
                <td id="friesimg"><img src="images/curlyfries.jpg" id="fries" /></td>
                <td id="slawimg"><img src="images/slaw.jpg" id="slaw" /></td>
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

