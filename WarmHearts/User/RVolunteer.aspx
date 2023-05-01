<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="RVolunteer.aspx.cs" Inherits="WarmHearts.User.RVolunteer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color: pink; padding-top: 15px; padding-bottom: 15px; border-radius: 2rem">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">

                        <%--  Label Message--%>
                        
                        <br />


                        <div class="row">
                            <div class="col">
                               
                                <h6>Volunteer</h6>
                                 <center>
                               <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Request to Volunteer</h2>"></asp:Label>
                                     <asp:Label ID="txtopname"  runat="server" ></asp:Label>
                                     </center>
                            </div>
                           
                        </div>

                        <!--Personaol Info -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h4>Volunteer Information</h4>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Juan" ID="txtFName" runat="server"></asp:TextBox>
                                 </div>
                            </div>

                            <div class="col">
                                <label>Middle Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Pablo" ID="txtMidName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Dela Cruz" ID="txtLName" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. A. Gabuya St." ID="txtAddress" runat="server"></asp:TextBox>
                                  </div>
                            </div>

                        </div>

                        <div class="row">
                         
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. 09622023244" ID="txtContactNum" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. juandelacruz@gmail.com" ID="txtEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                                   </div>
                            </div>
                        </div>
                         
                              <!--Background Info -->
               

     
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btnReqVol" runat="server" Text="Submit" OnClick="btnReqVol_Click"   />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
