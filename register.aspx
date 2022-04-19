<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         body{
            background-color:aqua;
         }

         input{
             width:25%;
         }

         #form1{
             position:relative;
             left:30%;
             font-size:30px;
             color:red;
             width:50%;
             height:70%;
         }

         #submit{
             width:15%
         }

         .pad{
             padding-bottom:10%;
         }

         .short{
             width:7%;
         }


    </style>
    <script>
        function checkForm() {
            var flag = true;
            flag = (
                checkFname() &&
                checkLname() &&
                checkUname() &&
                checkPass() &&
                checkEmail() &&
                checkPhone()
            )
            return flag;
        }


        function checkFname() {
            var fname = document.getElementById("firstname").value;
            var flag = true;
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


        function checkLname() {
            var letters = /^[A-Za-z\s]+$/;
            var flag = true;
            var lname = document.getElementById("lastname").value;
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


        function checkUname() {
            var flag = true;
            var uname = document.getElementById("newuser").value;
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


        function checkPass() {
            var flag = true;
            var rules = [
                /[0-9]/,
                /[a-z]/,
                /[A-Z]/,
                /[{!@#$%^&*}<>]/
            ];
            var pass = document.getElementById("newpass").value;
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
            var passcheck = document.getElementById("passconfirm").value;
            if (passcheck != pass) {
                window.alert("Password confirmation field must be identical to password");
                flag = false;
            }
            return flag;
        }


        function checkEmail() {
            var flag = true;
            var letters = /^[A-Za-z\s]+$/;
            var email = document.getElementById("mail").value;
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


        function checkPhone() {
            var flag = true;
            var start = document.getElementById("start").value;
            if (start == "") {
                window.alert("Please choose the first 3 digits of your phone number");
                flag = false;
            }
            var phone = document.getElementById("num").value;
            if (isNaN(phone)) {
                window.alert("please enter a valid number as your phone number");
                flag = false;
            }
            if (phone.length != 7) {
                window.alert("Your phone number must be 7 digits long, not including the first three digits");
                flag = false;
            }
            return flag;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="content4">
     <form id="form1" name="form1" method="post" runat="server" action="" onsubmit="return checkForm()">
         <p class="pad">
            First Name: <input type="text" id="firstname" name="firstname" /><br />
            Last Name: <input type="text" id="lastname" name="lastname"/><br />
            Username  : <input type="text" id="newuser" name="newuser"/><br />
            Password  : <input type="password" id="newpass" name="newpass"/> <br />
            Confirm Password: <input type="password" id="passconfirm" name="passconfirm" /> <br />
            Email     : <input type="email" id="mail"  name="mail"/><br />
            Birthday: <input type="date" id="birthday" name="birthday"/><br />
            Location: <input list="states" id="loc" name="loc"/> <br />
            <datalist id="states">
                <option value="New Mexico" />
                <option value="Arizona" />
                <option value="Texas" />
                <option value="Colorado" />
                <option value="Utah" />
                <option value="In the USA, outside of the states above" />
                <option value="Outside of the USA" />
            </datalist>
            Gender:      Male<input type="radio" value="male" class="short"/>     Female<input type="radio" value="female" class="short" /> <br />
            Phone Number:   <input list="starts" id="start" name="start" class="short"/> <input type="text" id="num" name="num" /> <br />
            <datalist id="starts">
                <option value="050" />
                <option value="052" />
                <option value="053" />
                <option value="054" />
                <option value="055" />
                <option value="058" />
            </datalist>
            <input type="submit" id="submit" name="submit" value="submit"/>
         </p>
    </form>
   </div>
</asp:Content>

