<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WarmHearts.User.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   


    <section class="book_section layout_padding">

         <div class="container">
             <div class="heading_container">
                 <div class="align-self-end">
                     <asp:Label runat="server" ID="lblMsg"></asp:Label>
                    </div>
                 <h2>Reset Password</h2>
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

                     <asp:TextBox ID="txtnewpass" runat="server" CssClass="form-control" placeholder="Enter New Password"  TextMode="Password" ></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red" ControlToValidate="txtnewpass" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ErrorMessage="Invalid Password." ForeColor="Red" ValidationExpression="^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{6,10}$" ControlToValidate="txtnewpass" runat="server">
                                        </asp:RegularExpressionValidator> 


                     <asp:TextBox ID="txtconpass" runat="server" CssClass="form-control" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                       <p style="font-size: 12px; color: darkblue;" >Password must be 6-10 characters long with at least one capital letter and one numeric character.</p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red" ControlToValidate="txtconpass" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ErrorMessage="Invalid Password." ForeColor="Red" ValidationExpression="^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{6,10}$" ControlToValidate="txtconpass" runat="server">
                                        </asp:RegularExpressionValidator> 

               
                 <br />
              
                <div class="btn_box">
                     <asp:Button ID="btnUserLogin"  runat="server" Text="Submit" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnUserLogin_Click"/>
                  </div>
             </div>
        </div>
        </div>
        </div>
    </section>









</asp:Content>








