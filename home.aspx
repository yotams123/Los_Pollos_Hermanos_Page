<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #quote {
            color:white;
            font-family: 'Lucida Console', 'Courier New', monospace;
            width:55%;
            position:relative;
            top:5%;
            left:3%;
        }

        #about{
            color:snow;
            font-family:'Lucida Bright','Courier New',monospace;
            position:relative;
            left:3%;
            width:90%;
        }

        #ad{
            height:200px;
            width:400px;
            float:right;
            position:relative;
        }

        #titleabout{
            color:red;
            position:relative;
            left:3%;
        }

        body{
            background-color:cornflowerblue;
        }

        #gus{
            position:relative;
            left:3%
        }

        #mascot{
            position:relative;
            left:20%;
        }

        #food{
            position:relative;
            left:30%;
            height:186px;
        }

        #tag{
            color:red;
            position:relative;
            left:3%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content1">
        <video id="ad" controls autoplay muted>
            <source src="images/los pollos hermano commercial.mp4" />
            /los p type="video/mp4" />
            Commercial for Los Pollos Hermanos
        </video>
        <p id="quote">
        "In the little village where I was born, life moved at a slower pace... yet felt all the richer for it. 
        There, my two uncles were known far and wide for their delicious cooking. They seasoned their zesty 
        chicken using only the freshest herbs and spices. People called them “Los Pollos Hermanos” -- the 
        Chicken Brothers. Today, we carry on their tradition in a manner that would make my uncles proud.
        The finest ingredients are brought together with loving care, then slow-cooked to perfection. Yes,
        the old ways are still best at Los Pollos Hermanos. But don’t take my word for it. One taste and you’ll
        know." -Gustavo Fring, Owner of Los Pollos Hermanos
        </p>
        <h1 id="titleabout"> About us</h1>
        <p id="about">
            Los Pollos Hermanos is a casual, family resturant chain, serving you the best mexican-style fried chicken you can find
            in the south west. With fourteen locations across 5 states, millions have tried and fell in love
            with the chicken brothers. 
            Welcome to our site! Here you can watch and learn about us- how we make our food, how we run our business 
            and so much more. You can also make an order and have our delicious chicken brought directly to your 
            door!
            If you haven't tried Los Pollos Hermanos already, be sure to come on by when you have the chance. We
            promise you'll return for more.
        </p>
        <img src="images/gus.jpg"  id="gus"/>
        <img src="images/mascot.jpg" id="mascot" />
        <img src="images/food.jpg" id="food" />
        <br />
        <p id="tag"> Gustavo Fring, owner of Los Pollos Hermanos</p>
    </div>
</asp:Content>

