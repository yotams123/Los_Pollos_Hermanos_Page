<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="openall.aspx.cs" Inherits="openall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-color: cornflowerblue;
        }

        p{
            position:relative;
            color:azure;
            width:300px;
            text-align:justify;
        }

        img{
            height:168px;
            width:300px;
        }

        h1{
            width:250px;
            color:orangered;
        }

        #training{
            height:200px;
        }
        
        #food{
            position:relative;
            left:35%;
            top:-700px;
        }

        #history{
            position:relative;
            left:70%;
            top:-1400px;
        }

        .column{
            width:30%;
            height:680px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="employees" class="column">
        <h1 id="employeestitle">Our Employees: </h1>
        <a href="https://www.youtube.com/watch?v=lSHaBnRd9MU&list=PL4XYugONL7lZovnsdYCwehreahGVRkrfc&index=1">
        <img src="images/employee training.png" id="training" /></a>
        <br /><p id="trainingtag"> Click on the Image above to view our employee training program!
                We operate according to these rules to ensure you recieve the highest quality food and service there is.
           </p>
        <img src="images/employee.jpg"  id="employee"/>
    </div>
    <div id="food" class="column">
        <h1 id="foodtitle"> Our Food: </h1>
        <p id="ourfood">
            We at Los Pollos Hermanos know how important it is to feed your family right,
            which is why every meal we serve is fresh, flavorful, delicous and made with love and care.
            In our kitchens, there is always something cooking, from our delicous fries to the wonderful
            dipping sauces. We are also constantly innovating and creating delicous new items, as well as
            improving our existing dishes by making them tastier, greener and healthier.
        </p>
        <img src="images/family.jpg" id="family" />
    </div>
    <div id="history" class="column">
        <h1 id="historytitle"> Our history: </h1>
        <p id="ourhistory">
            Los Pollos Hermanos was founded by Gustavo Fring and his business partner Max Arciniega. 
            Together, the 2 made a name for themselves by selling the best fried chicken in Mexico,
            with authentic flavors and spices. Now, the chain has arrived in the USA, after rapidly
            growing in the past few years. We look forward to our continued growth and feeding thousands
            more families just like yours.
        </p>
        <img src="images/history.jpg" id="historyimg" />
    </div>
    
</asp:Content>

