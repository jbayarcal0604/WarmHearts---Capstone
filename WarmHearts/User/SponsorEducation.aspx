<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SponsorEducation.aspx.cs" Inherits="WarmHearts.User.SponsorEducation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="scrm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container">
            


                                                             
            <br />
            <br />
            <div class="container">
                    <div class="col">
                        <div class="card" style="border-radius: 4rem">
                            <div class="card-body" style="text-align: center">
                                <div>
                                    <hr />
                                </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Button  ID="BackOPOrphanList2" runat="server" Text="Back" class="btn btn-success btn-block btn-lg" OnClick="BackOPOrphanList2_Click" />
                                        </div>
                                    </div>

                                <div class="col-md-6 mx-auto">
                                        <center>
                                            <label><h1>Sponsor Education</h1></label><br />
                                            <asp:Label runat="server" Id="orphname"></asp:Label>
                                            <asp:Label runat="server" Id="Label1"></asp:Label>
                                        </center>
                                </div>
                                <br />

                           <div class="row">
                            <div class="col-md-6">
                                <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="txtFName" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                            <div class="col-md-6">
                                <label>Middle Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="txtMidName" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="txtLName" runat="server" ReadOnly="true" ></asp:TextBox>
                                      </div>
                            </div>
                            <div class="col-md-6">
                                <label>Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="txtAddress" runat="server" ReadOnly="true" ></asp:TextBox>
                                       </div>
                              </div>
                                    </div> 
                                <hr />
                                 <div class="col-md-6 mx-auto">
                                        <center>
                                            <label><h1>orphan Details</h1></label>
                                            
                                        </center>
                                </div>
                            
                                 <div class="row">
                            <div class="col-md-6">
                                <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="TextBox2" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                            <div class="col-md-6">
                                <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="TextBox3" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                            </div>
                           
                                     </div>
                              

                               <label><h2>Do you wish to sponsor this child monthly?</h2></label>
                                <br />
                                
                           
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBAck ="true" class="col-md-4 mx-auto" style="left: 0px; top: 1px">
                                    <asp:ListItem Value="150" >150</asp:ListItem>
                                    <asp:ListItem Value="250" >250</asp:ListItem>
                                    <asp:ListItem Value="350" >350</asp:ListItem>
                                    
                                </asp:RadioButtonList>
                                

                              


                                <br />
                                <br />

                           

                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <div class="form-group">
                                            <asp:Button  ID="SubmitSponsorEducation" runat="server" Text="Submit" class="btn btn-success btn-block btn-lg" OnClick="SubmitSponsorEducation_Click" />
                                        </div>                               
                                    </div>
                                </div> 

                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     </ContentTemplate></asp:UpdatePanel>
</asp:Content>
