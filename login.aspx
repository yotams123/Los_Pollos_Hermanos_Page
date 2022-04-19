<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         body{
             background-color:aqua;
         }

         #form{
             position:relative;
             left:30%;
             color:red;
             font-size:50px;
             width:50%;
             height:70%;
         }

        #pass{
             height:50px;
             width:300px;
        }

        #user{
             height:50px;
             width:300px;
        }

        #nouser{
             position:relative;
             left:31%;
             color:orangered;
             width:50%;
             top:700%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="content2">
        <form id="form" name="form" method="post" runat="server" action="">
            <p >
            Username: <input type="text" id="user" name="user"/><br />
            Password : <input type="password" id="pass" name="pass" /><br />
            <input type="submit" id="submit" name="submit" value="submit" /><br /> 
            </p>
        </form>
            <p id="nouser"> Don't have an account yet? <a href="register.aspx">Click here</a> to create one!</p>
   </div>
</asp:Content>

