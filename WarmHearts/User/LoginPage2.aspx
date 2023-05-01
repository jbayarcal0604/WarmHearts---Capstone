<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" AutoEventWireup="true" CodeBehind="LoginPage2.aspx.cs" Inherits="WarmHearts.User.LoginPage2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">

         <div class="container">
             <div class="heading_container">
                 <div class="align-self-end">
                     <asp:Label runat="server" ID="lblMsg"></asp:Label>
                    </div>
                 <h2>LogIn</h2>
             </div>

             <div class="row">
                 <div class="col-md-6">
                     <div class="form_container">
                     <img id="userLogin" src="../BootstrapFiles/Images/usrlgin.jpg" alt="" class="img-thumbnail" />
                 </div>
             </div>
                 <div class="col-md-6">
             <div class="form_container">
                 <div>
                         <asp:Label runat ="server" ID="pass" ></asp:Label>

                     <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfUser" runat="server" ErrorMessage="*" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                 </div>

                 <div>
                     <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfPassword" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                      <input type="checkbox" onclick="myFunction()">&nbsp<asp:Label runat="server">Show password</asp:Label>
                 </div>
                 <br />
                 <script>
                     function myFunction() {
                         var x = document.getElementById("txtPassword");
                         if (x.type === "password") {
                             x.type = "text";
                         } else {
                             x.type = "password";
                         }
                     }
                 </script>
                 <div class="btn_box">
                     <asp:Button ID="btnUserLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnUserLogin_Click"/>
                     <span class="pl-3 text-info"><a href="ForgotPassword.aspx">Forgot Password? </a></span>
                  </div>
             </div>
        </div>
        </div>
        </div>
    </section>
       
</asp:Content>