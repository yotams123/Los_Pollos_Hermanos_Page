﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title> admin </title>
    <style>
        body{
            background-color:cornflowerblue;
        }

        #form1{
            float:right;
            position:relative;
            width:30%;
            padding-bottom: 10%;
            height:100%;
            top:-50%;
        }

        #table{
            position:relative;
            float:left;
            width:40%;
        }
        
        #deliveries{
            position:relative;
            top:600%;
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
            const update_table = document.getElementsByName("table");
            let flag = true;
            let chosentable = "";
            const update_row = document.getElementById("updaterow").value;

            for (var table of update_table) {
                if (table.checked) {
                    chosentable = table.value;
                }
            }

            if (chosentable == "[User_Info]" && update_row != "") {
                flag = checkUpdateUser();
            }

            if (chosentable == "[Orders]" && update_row != "") {
                flag = checkUpdateFood();
            }

            if (chosentable == "") {
                window.alert("Please choose a table to update");
                return false;
            }

            
            if (isNaN(update_row) && update_row != "") {
                window.alert("Enter valid row id to update");
                return false;
            }

            const del_row = document.getElementById("del").value;
            if (isNaN(del_row) && del_row != "") {
                window.alert("Enter valid row id to delete");
                return false;
            }

            const ordercol = document.getElementById("order").value;
            if ((isNaN(ordercol) || ordercol == "" || Number(ordercol) < 1 || Number(ordercol) > 10)) {
                window.alert("Enter valid column id to order by. Must be a number between 1-11");
                return false;
            }

            return flag;
        }

        function checkUpdateFood() {
            const update_column = document.getElementById("colname").value;
            if (update_column == "Content" || update_column == "Location") {
                return true;
            }
            if (update_column == "TotalPrice") {
                const price = document.getElementById("colval").value;
                if (isNaN(price)) {
                    window.alert("enter valid price");
                    return false;
                }
                return true;
            }
            if (update_column == "Name") {
                return FnameCheck;
            }
            if (update_column == "Phone") {
                return PhoneCheck();
            }
            window.alert("Choose a valid column to update: Content, TotalPrice, Location, name, phone")
            return false;
        }

        function checkUpdateUser() {
            const update_column = document.getElementById("colname").value;
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
            if (update_column == 'phone') {
                return PhoneCheck();
            }
            if (update_column == 'birthday') {
                return BdayCheck();
            }
            if (update_column == 'gender') {
                return GenderCheck();
            }
            if (update_column == 'location') {
                return LocCheck();
            }
            if (update_column != "") {
                window.alert("Enter a valid column name: Fname, lname, uname, pass or mail");                
                return false;
            }

        }

        function FnameCheck() {
            let flag = true;
            const fname = document.getElementById("colval").value;
            if (fname == "") {
                alert("Please enter a first name");
                flag = false;
            }
            if (fname[0] != fname[0].toUpperCase()) {
                alert("First name must start with a capital letter");
                flag = false;
            }
            const letters = /^[A-Za-z\s]+$/;
            if (!(fname.match(letters))) {
                flag = false;
                window.alert("First name cannot contain spaces, numbers or special characters");
            }
            return flag;
        }


        function LnameCheck() {
            const letters = /^[A-Za-z\s]+$/;
            let flag = true;
            const lname = document.getElementById("colval").value;
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
            let flag = true;
            const uname = document.getElementById("colval").value;
            if (uname.length < 4) {
                flag = false;
                window.alert("Username must be at least 4 characters long");
            }
            const nums_letters = /^[A-Za-z0-9]+$/;
            if (!uname.match(nums_letters)) {
                flag = false;
                window.alert("Username must include only numbers and letters");
            }
            return flag;
        }


        function PassCheck() {
            let flag = true;
            const pass = document.getElementById("colval").value;
            const rules = [
                /[0-9]/,
                /[a-z]/,
                /[A-Z]/,
                /[{!@#$%^&*}<>]/
            ];
            if (pass.length < 6) {
                flag = false;
                window.alert("Password must contain at least 6 characters");
            }
            let passflag = false;
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
            let flag = true;
            const email = document.getElementById("colval").value;
            const letters = /^[A-Za-z\s]+$/;
            const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (!email.match(mailformat)) {
                window.alert("Email must start with a letter, contain an @ character and include a valid domain");
                flag = false;
            }
            const fmail = email[0];
            if (!fmail.match(letters)) {
                window.alert("Email address must start with a letter");
                flag = false;
            }
            return flag;
        }

        function BdayCheck() {
            let flag = true;
            const Bday = document.getElementById("colval").value;
            if (Bday == "") {
                window.alert("Please enter a valid birthday");
                flag = false;
            }
            return flag;
        }

        function LocCheck() {
            let flag = true;
            const loc = document.getElementById("colval").value;
            if (loc == "") {
                window.alert("Please enter your location");
                flag = false;
            }
            return flag;
        }

        function GenderCheck() {
            let flag = true;
            const gender = document.getElementById("colval").value;
            if (gender == "") {
                window.alert("Select a gender");
                flag = false;
            }
            return flag;
        }

        function PhoneCheck() {
            let flag = true;
            const phone = document.getElementById("colval").value;
            if (isNaN(phone)) {
                window.alert("please enter a valid number as your phone number");
                flag = false;
            }
            if (phone.length != 10) {
                window.alert("Your phone number must be 10 digits long");
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
            <label> Choose Table to update: </label><br />
            User_Info: <input type="radio" name="table" id="userstable" value="[User_Info]" checked="checked"/>     Orders: <input type="radio" name="table" id="orderstable" value="[Orders]" /><br />
        </p>
        <br />
        <br />
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
            <label for="colname"> Enter column to update:</label>
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
            <input type="text" name="order" id="order" value="1" />
        </p>
        <br />
            <input type="submit" id="submit" name="submit" value="submit" />
    </form>
    <div id="deliveries">
        <%=ord %>
    </div>
</asp:Content>

