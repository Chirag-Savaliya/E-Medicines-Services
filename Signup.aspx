<%@ Page Title="" Language="C#" MasterPageFile="~/E-Medicines Services.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <script type="text/javascript">
       function Validatin() {
           var Rslt = false;
           if (document.getElementById("txtFrstName").value.length < 1) {
               document.getElementById("lblError").innerHTML = "First Name Must Not Be Empty.";
           }
           else if (!TextValidation(document.getElementById("txtFrstName").value)) {
               document.getElementById("lblError").innerHTML = "Enter Valid First Name.";
           }
           else if (document.getElementById("txtLstName").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Last Name Must Not Be Empty.";
           }
           else if (!TextValidation(document.getElementById("txtLstName").value)) {
               document.getElementById("lblError").innerHTML = "Enter Valid Last Name.";
           }
           else if (document.getElementById("txtAddrs").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Address Must Not Be Empty.";
           }
           else if (!AddressValidation(document.getElementById("txtAddrs").value)) {
               document.getElementById("lblError").innerHTML = "Enter Valid Address.";
           }
           else if (document.getElementById("txtMono").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Phone No Must Not Be Empty.";
           }
           else if (document.getElementById("txtMono").value.length < 10) {
               document.getElementById("lblError").innerHTML = "Enter Valid Phone No.It Must Be 10 Digits.";
           }
           else if (!DigitValidation(document.getElementById("txtMono").value)) {
               document.getElementById("lblError").innerHTML = "Enter Valid Phone No.";
           }
           else if (document.getElementById("txtEml").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Email Must Not Be Empty.";
           }
           else if (!EmailValidation(document.getElementById("txtEml").value)) {
               document.getElementById("lblError").innerHTML = "Enter Valid Email.";
           }
           else if (document.getElementById("txtPasswrd").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Password Must Not Be Empty.";
           }
           else if (document.getElementById("txtCnfrmPasswrd").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Confirm Password Must Not Be Empty.";
           }
           else if (document.getElementById("txtSecQstn").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Security Question Must Not Be Empty.";
           }
           else if (document.getElementById("txtQstnAnsr").value.length < 1) {
               document.getElementById("lblError").innerHTML = "Question Answer Must Not Be Empty.";
           }
           else if (!PasswordValidation()) {
               document.getElementById("lblError").innerHTML = "Password Does Not Match.";
           }
           else {
               document.getElementById("lblError").innerHTML = "";
               Rslt = true;
           }
           return Rslt;
       }

       function PasswordValidation() {
           if (document.getElementById("txtPasswrd").value == document.getElementById("txtCnfrmPasswrd").value) {
               return true;
           }
           else {
               return false;
           }
       }

    </script>
     <table border="0" class="Tbl-Outer">
        <tr>
            <td colspan="4" align="center">
                <table>
                    <tr>
                        <td class="Lbl-Inst">
                             Note : All Fields With
                        </td>
                        <td>
                             <p style="color:red">*</p>
                        </td>
                        <td class="Lbl-Inst">
                            Are Required.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
          <tr width="100%">
            <td colspan="4" align="center">
                <asp:Label ID="lblError" ClientIDMode="Static" runat="server" CssClass="Lbl-Error"/>
            </td>
        </tr>
        <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter First Name</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtFrstName" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Last Name</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtLstName" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Address</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtAddrs" runat="server" ClientIDMode="Static" Width="80%" TextMode="MultiLine" style="resize:none"/>
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Mobile No.</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMono" MaxLength="10" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Email Adress</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtEml" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Password</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtPasswrd" runat="server" ClientIDMode="Static" TextMode="Password" />
            </td>
        </tr>
          <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Confirm Password</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtCnfrmPasswrd" runat="server" ClientIDMode="Static" TextMode="Password" />
            </td>
        </tr>
         <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Your Security Question</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtSecQstn" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
         <tr>
             <td align="right" width="30%">
                   <p style="color:red">*</p>
             </td>
             <td align="left" width="20%">
                  <p class="Lbl-Msg">Enter Question Answer</p>
             </td>
            <td align="center" width="4%">
                <p style="font-weight:bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtQstnAnsr" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnSignup" runat="server" Text="SIGNUP" Width="10%" OnClientClick="return Validatin()" OnClick="btnSignup_Click" CssClass="Btn" />
            </td>
        </tr>
    </table>
</asp:Content>

