<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WarmHearts.User.ForgotPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   <section class="book_section layout_padding">

         <div class="container">
             <div class="heading_container">
                 <div class="align-self-end">
                     <asp:Label runat="server" ID="lblMsg"></asp:Label>
                    </div>
                 <h2>Forgot Password</h2>
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

                     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfUser" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                 </div>

               
                 <br />
              
                 <div class="btn_box">
                     <asp:Button ID="btnUserLogin" runat="server" Text="Submit" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnUserLogin_Click"/>
                  </div>
             </div>
        </div>
        </div>
        </div>
    </section>









</asp:Content>
