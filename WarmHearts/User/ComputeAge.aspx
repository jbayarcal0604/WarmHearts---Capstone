<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master"  AutoEventWireup="true" ValidateRequest="false" CodeBehind="ComputeAge.aspx.cs" Inherits="WarmHearts.User.ComputeAge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br /><%--ValidateRequest="false"--%>
    <br />
    <br />
    
                                <div class="row">
                                    <div class="col">
                                        <label>Date Of Birth</label>
                                        <div class="form-group">
                                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:TextBox CssClass="form-control" ID="txtBday" runat="server" TextMode="Date"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
       <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
