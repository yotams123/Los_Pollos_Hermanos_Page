<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title> admin </title>
    <style>
        body{
            background-color:cornflowerblue;
        }

        #form1{
            float:right;
            position:relative;
            width:40%;
            padding-bottom: 10%;
            height:100%;
            top:-50%;
        }

        #table{
            position:relative;
            float:left;
            width:40%;
        }
        
        #admin_title{
            position:relative;
            text-align:center;
            width:90%;
        }

        #users_title{
            position:relative;
            text-align:center;
            width:90%;
        }

        #submit{
            margin-bottom:10%;
        }

    </style>
    <script>
        function checkUpdate() {
            var update_column = document.getElementById("colname").value;
            if (update_column == 'fName') {
                return FnameCheck();
            }
            if (update_column == 'lname') {
                return LnameCheck();
            }                
            if (update_column == 'uname') {
                return UnameCheck();
            }
            if (update_column == 'pass') {
                return PassCheck();
            }
            if (update_column == 'mail') {
                return EmailCheck();
            }
            if (update_column != "") {
                window.alert("Enter a valid column name: Fname, lname, uname, pass or mail");                
                return false;
            }

            var update_row = document.getElementById("updaterow").value;
            if (isNaN(update_row)) {
                window.alert("Enter valid row id to update");
                return false;
            }

            var del_row = document.getElementById("del").value;
            if (isNaN(del_row) && del_row != "") {
                window.alert("Enter valid row id to delete");
                return false;
            }

            var ordercol = document.getElementById("order").value;
            if ((isNaN(ordercol) && ordercol != "") || ordercol < 2 || ordercol > 6) {
                window.alert("Enter valid column id to order by. Must be a number between 2-6");
                return false;
            }

            return true;
        }

        function FnameCheck() {
            var flag = true;
            var fname = document.getElementById("colval").value;
            if (fname == "") {
                alert("Please enter a first name");
                flag = false;
            }
            if (fname[0] != fname[0].toUpperCase()) {
                alert("First name must start with a capital letter");
                flag = false;
            }
            var letters = /^[A-Za-z\s]+$/;
            if (!(fname.match(letters))) {
                flag = false;
                window.alert("First name cannot contain spaces, numbers or special characters");
            }
            return flag;
        }


        function LnameCheck() {
            var letters = /^[A-Za-z\s]+$/;
            var flag = true;
            var lname = document.getElementById("colval").value;
            if (lname == "") {
                window.alert("Please enter a last name");
                flag = false;
            }
            if (lname[0] != lname[0].toUpperCase()) {
                window.alert("Last name must start with a capital letter");
                flag = false;
            }
            if (!lname.match(letters)) {
                flag = false;
                window.alert("Last name cannot contain spaces or special characters");
            }
            return flag;
        }


        function UnameCheck() {
            var flag = true;
            var uname = document.getElementById("colval").value;
            if (uname.length < 4) {
                flag = false;
                window.alert("Username must be at least 4 characters long");
            }
            var nums_letters = /^[A-Za-z0-9]+$/;
            if (!uname.match(nums_letters)) {
                flag = false;
                window.alert("Username must include only numbers and letters");
            }
            return flag;
        }


        function PassCheck() {
            var flag = true;
            var pass = document.getElementById("colval").value;
            var rules = [
                /[0-9]/,
                /[a-z]/,
                /[A-Z]/,
                /[{!@#$%^&*}<>]/
            ];
            if (pass.length < 6) {
                flag = false;
                window.alert("Password must contain at least 6 characters");
            }
            var passflag = false;
            for (var i = 0; i < rules.length; i++) {
                if (!rules[i].test(pass)) {
                    flag = false;
                    passflag = true;
                }
            }
            if (passflag == true) {
                window.alert("password must contain at least one capital letter, a lowercase letter, a number, and at least one special character !@#$%^&*");
            }
            return flag;
        }


        function EmailCheck() {
            var flag = true;
            var email = document.getElementById("colval").value;
            var letters = /^[A-Za-z\s]+$/;
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (!email.match(mailformat)) {
                window.alert("Email must start with a letter, contain an @ character and include a valid domain");
                flag = false;
            }
            var fmail = email[0];
            if (!fmail.match(letters)) {
                window.alert("Email address must start with a letter");
                flag = false;
            }
            return flag;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 id="admin_title"> Admin Page</h1>
    <h2 id="users_title"> Users table</h2>
    <div id="table"> 
        <%=tb %>
    </div>
    <form id="form1" name="form1" method="post" runat="server" action="" onsubmit="return checkUpdate()">
        <p>
             <label for="del">Enter id of row to be deleted:</label> 
             <input type="text" id="del" name="del" value="" />
        </p>
        <br />
        <br />
        <p>
            <label for="updaterow"> Enter id of row to update:</label>
            <input type="text" name="updaterow" id="updaterow"/>
        </p>
        <br />
        <p>
            <label for="colname"> Enter Column to update:</label>
            <input type="text" name="colname" id="colname" />
        </p>
        <br />
        <p>
            <label for="colval"> Enter new value: </label>
            <input type="text" name="colval" id="colval" />
        </p>
        <br />
        <br />
        <p>
            <label for="order"> Enter column by which to order the table: </label>
            <input type="text" name="order" id="order" />
        </p>
        <br />
            <input type="submit" id="submit" name="submit" value="submit" />
    </form>
</asp:Content>

