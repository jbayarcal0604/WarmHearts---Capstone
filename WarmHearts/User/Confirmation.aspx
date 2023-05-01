<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="WarmHearts.User.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
   
    <div class="col">
        <center>

         <h1>Thank you for your Donation &nbsp &nbsp&nbsp
        <% Response.Write(Session["name"]); %>
    </h1>
     
     <blockquote>
     <p>
    <%--Thank you for your generous order of <b>$<%= this.amount %></b>--%>
     <p>
 Thank You for Donating &nbsp &nbsp &nbsp
         <label style="font-weight: bold;"><% Response.Write(Session["Mon"]); %></label>&nbsp&nbsp&nbsp
          <label style="font-weight: bold;"><% Response.Write(Session["name"]); %></label>
<p>
Please Come Back and Visit Us Again.
<p>

</blockquote>
        </center>
    </div>
    <center>
    <asp:Button ID="redi" runat="server" class="btn btn-success" Text="Done" width="50%" OnClick="redi_Click"  />
        </center>
<hr>
<small> Best Buddy Website, &copy; WarmHearts &trade;</small>
</asp:Content>
