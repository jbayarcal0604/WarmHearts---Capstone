<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="PostNeedsSched.aspx.cs" Inherits="WarmHearts.User.PostNeedsSched" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container">
            <div class="container">
                    <div class="col">
                        <div class="card" style="border-radius: 2rem">
                            <div class="card-body">
                                <div>
                                    <hr />
                                </div>

                                <%--<div class="row">
                                    <div class="col">
                                        <!-- Calendly inline widget begin -->
                                        <div class="calendly-inline-widget" data-url="https://calendly.com/neilzkcrew/post-needs" style="min-width:320px;height:630px;"></div>
                                        <script type="text/javascript" src="https://assets.calendly.com/assets/external/widget.js" async></script>
                                        <!-- Calendly inline widget end -->
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col">
                                        <center><h2>Schedule Donation</h2>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </center>
                                    </div>
                                </div>

                                <hr />
                                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                <center>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>First Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="" ID="txtFnameDdetails" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <label>Last Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="" ID="txtLnameDdetails" runat="server"></asp:TextBox>
                                        </div>
                                    </div>   
                                 
                                </div>
                                    </center>

                             
                                
                                
                                <div class="row">
                                    <div class="col-md-4 mx-auto">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnSubmit" runat="server" Text="Schedule Now" OnClick="btnSubmit_Click" />
                                    </div>
                                </div>
                                
                                <!--need mag add column sa DONATION table og Date, Time, Company Name,-->


                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>