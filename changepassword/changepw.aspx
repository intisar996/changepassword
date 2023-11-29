<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepw.aspx.cs" Inherits="changepassword.changepw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 
          
             <div class="container d-flex justify-content-center align-items-center mt-5">
    <div class="row">
         <div class="changePassword  d-flex flex-column p-5 ">
               <div class="changeText col-12 mb-1">
                <label for="txtcurrentpass">Current Password:</label>
                <asp:TextBox TextMode="Password" class="form-control"  id="txtcurrentpass"  runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcurrentpass" ErrorMessage="يرجى إدخال الرقم السري الحالي" ForeColor="Red"
                   SetFocusOnError="true"></asp:RequiredFieldValidator>
               </div>
               <div class="changeText col-12 mb-1">
                <label for="txtnewpass">New Password:</label>
                <asp:TextBox TextMode="Password" class="form-control"  id="txtnewpass" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewpass" ErrorMessage="يرجى إدخال الرقم السري الجديد" ForeColor="Red"
                 SetFocusOnError="true"></asp:RequiredFieldValidator>
               </div>
               <div class="changeText col-12 mb-1">
                <label for="txtconfirmpass">Conform Password:</label>
                <asp:TextBox TextMode="password"  class="form-control"  id="txtconfirmpass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpass" ErrorMessage="يرجى تأكيد الرقم السري" ForeColor="Red"
                 SetFocusOnError="true"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpass" ControlToValidate="txtconfirmpass" ErrorMessage="الرقم السري غير متتطابقة" ForeColor="Red"></asp:CompareValidator>
               </div>
               <div class="changeText changeText col-12 mb-3">
                <asp:Button ID="btnchangepass" Text="Change Password" class="btn btn-primary" runat="server" OnClick="btnchangepass_Click"/>
               </div>
         </div>
    </div>
  </div>


           






        </div>
    </form>
</body>
</html>
