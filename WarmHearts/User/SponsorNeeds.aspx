<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SponsorNeeds.aspx.cs" Inherits="WarmHearts.User.SponsorNeeds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container">
            <br />
            <br />
            <div class="container">
                    <div class="col">
                        <div class="card" style="border-radius: 2rem">
                            <div class="card-body">
                                <div>
                                    <hr />
                                </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Button  ID="BackOPOrphanList" runat="server" Text="Back" class="btn btn-success btn-block btn-lg"  OnClick="BackOPOrphanList_Click" />
                                        </div>
                                    </div>

                                <div class="col-md-6 mx-auto">
                                        <center>
                                            <label><h1>Sponsor Supplies/Needs</h1></label><br />
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </center>
                                </div>
                                <br />

                           <div class="row">
                            <div class="col-md-6">
                                <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Juan" ID="txtFName" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                            <div class="col-md-6">
                                <label>Middle Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Pablo" ID="txtMidName" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Dela Cruz" ID="txtLName" runat="server" ReadOnly="true"></asp:TextBox>
                                      </div>
                            </div>
                            <div class="col-md-6">
                                <label>Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. A. Gabuya St." ID="txtAddress" runat="server" ReadOnly="true" ></asp:TextBox>
                                       </div>
                              </div>
                                    </div> 
                                <hr />
                                <div class="col-md-6 mx-auto">
                                        <center>
                                            <label><h1>Orphan Details </h1></label>
                                           
                                        </center>
                                </div>
                                 <div class="row">
                            <div class="col-md-6">
                                <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Juan" ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                            <div class="col-md-6">
                                <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Pablo" ID="TextBox2" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                            </div>
                          
                         
                                    </div> 
                                <hr />
                            
                                     <div class="col-md-6 mx-auto">
                                        <center>
                                            <label><h2>Needs</h2></label>
                                        </center>
                                    </div>

                                    <div class="col-md-8 mx-auto">                           
                                        <div class="form-group">
                                            <center>
                                                  <asp:Label ID="Needs" runat="server" Text="Label"></asp:Label>
                                            </center>
                                        </div>
                                    </div>
                               <%-- <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <center><label>Select Date</label></center>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtDateDS" runat="server" TextMode="Date"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="DateDS" runat="server" ErrorMessage="Please Enter Date" Forecolor="Red" Display="Dynamic" ControlToValidate="txtDateDS" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                       <div class="col-md-6 mx-auto">
                                        <center><label>Select Time</label></center>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtTimeDS" runat="server" TextMode="Time"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="TimeDS" runat="server" ErrorMessage="Please Enter Time" Forecolor="Red" Display="Dynamic" ControlToValidate="txtTimeDS" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>  
                                </div>--%>
                        
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <div class="form-group">
                                            <asp:Button  ID="SubmitSponsorNeeds" runat="server" Text="Submit" class="btn btn-success btn-block btn-lg" OnClick="SubmitSponsorNeeds_Click"  />
                                        </div>                               
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>