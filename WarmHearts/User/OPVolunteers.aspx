<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="OPVolunteers.aspx.cs" Inherits="WarmHearts.User.OPVolunteers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container">
            <div class="container">
                <div class="row">
                <div class="col">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                        <div>
                            <hr />
                        </div>       
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPSponsorship" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPSponsorship_Click" />                                       
                                    </center>
                                </div>
                                <center>
                                    <label>Add Orphan</label>
                                </center>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPOrphanListID" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/list.png" OnClick="OPOrphanListID_Click"/>
                                    </center>
                                </div>
                                <center>
                                    <label>Orphan List</label>
                                </center>
                            </div>
                    
                        <div class="col">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OpVwDnrs" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png" OnClick="OpVwDnrs_Click"  />
                                </center>
                            </div>
                            <center>
                                <label>View Donors</label>
                            </center>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OPVolunRqst" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vlnreqs.png" OnClick="OPVolunRqst_Click" />
                                </center>
                            </div>
                            <center>
                                <label>Requests</label>
                            </center>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OPreports" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/reprts.png" OnClick="OPreports_Click" />
                                </center>
                            </div>
                            <center>
                                <label>Reports</label>
                            </center>
                        </div>

                    </div>

                        <div>
                            <hr />
                        </div>    

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                    <h2>Volunteer Applicants</h2>
                                    </center>
                                </div>
                            </div>                                                                                                                      
                        </div> 

                     
                        <hr />
                        <div class="row">
                        <div class="col">                                                 
                            <asp:GridView ID="GridView2" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" runat="server" >
                                <Columns>                                                        
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-3">                                                                           
                                                        Name:<br />
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("V_NAME") %>' Font-Bold="true"></asp:Label>
                                                        
                                                        <div class="row">
                                                            <div class="col">
                                                                
                                                            </div>
                                                        </div>                                                      
                                                    </div>
                                                    <hr />
                                             
                                                     <div class="col-lg-8">
                                                        <div class="row">
                                                            <div class="col-lg-6">

                                                                Email:<br />
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("V_EMAIL") %>' Font-Bold="True" ></asp:Label>
                                                            </div>
                                                        </div> 
                                                    </div>     
                                                </div>

                                                <br />
                                                <br />

                                                <div class="row">
                                                    <div class="col-md-4 mx-auto">
                                                        <center>                  
                                                            <asp:LinkButton ID="lnkAccept"  runat="server" CssClass="btn btn-success btn-block btn-sm" CommandArgument='<%# Eval("V_ID") %>' CommandName="Accept" OnClick="lnkAccept_Click">Accept</asp:LinkButton>
                                                        </center>                                                        
                                                    </div>
                                                    
                                                    <div class="col-md-4 mx-auto">
                                                        <center>                  
                                                            <asp:LinkButton ID="lnkDecline" runat="server" CssClass="btn btn-danger btn-block btn-sm"  CommandArgument='<%# Eval("V_ID") %>' CommandName="Decline" OnClick="lnkDecline_Click">Decline</asp:LinkButton>
                                                        </center>                                                        
                                                    </div>
                                                </div>
                                                <br />
                                             </div>
                                  </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
               </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString4 %>" SelectCommand="SELECT * FROM [REQVOL] WHERE (([OP_ID] = @OP_ID) AND ([V_STATUS] = @V_STATUS))">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OP_ID" SessionField="OP_ID" Type="Int32" />
                                    <asp:Parameter DefaultValue="pending" Name="V_STATUS" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        </div>


                        <asp:Label ID="Label1" visble="false" runat="server"></asp:Label>
                         <center>
                             <hr />
                                <label>Accepted</label>
                            </center>
                         <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString3 %>" SelectCommand="SELECT * FROM [REQVOL] WHERE (([OP_ID] = @OP_ID) AND ([V_STATUS] = @V_STATUS))">
                        <SelectParameters>
                            <asp:SessionParameter Name="OP_ID" SessionField="OP_ID" Type="Int32" />
                            <asp:Parameter DefaultValue="Accept" Name="V_STATUS" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        <div class="col">                                                 
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" runat="server" >
                                <Columns>                                                        
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col">                                                                           
                                                        Name: <asp:Label ID="Label12" runat="server" Text='<%# Eval("V_NAME") %>' Font-Bold="true"></asp:Label>                                                                                                                                                                       
                                                    </div>                                                
                                                </div>  
                                                
                                                <div class="row">
                                                    <div class="col">
                                                        Email:
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("V_EMAIL") %>' Font-Bold="True" ></asp:Label>
                                                    </div>
                                                </div> 
                                                                                                                                                                            
                                            </div>
                                  </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
               </asp:GridView>
                            
                </div>
           </div>
                        <hr />

                        <%--<div class="row">
                            <div class="col-md-8 mx-auto">
                                <div class="form-group">
                                    <label>Name</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <label>Action</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <p>John Doe</p>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <button type="button" class="buttonVolunteers">
                                        <span class="button__text">Approve</span>
                                        <span class="button__icon"><ion-icon name="checkmark-circle-outline"></ion-icon></span>
                                    </button>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <button type="button" class="buttonDeclineVolunteers">
                                        <span class="button__text">Decline</span>
                                        <span class="button__iconDecline"><ion-icon name="close-circle-outline"></ion-icon></span>
                                    </button>
                                </div>
                            </div>
                        </div>--%>
                        <%-- Supplies --%>
                        <hr />
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                    <h2>Donation Needs</h2>
                                    </center>
                                </div>
                            </div>                                                                                                                      
                        </div> 
                        <hr />
                          <asp:Repeater ID="r2" runat="server" >
    <ItemTemplate>
        <span class="message media-body">
            <center>
            <label style="font-size:18px;"><b><%#Eval("Needs_Dname") %></b></label>
            <br />
            <p>Wants to Donate: <%#Eval("Needs_name") %>  </p>
            <br />
            </center>
        </span>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <center><label>Select Date</label></center>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="txtDateDS" runat="server" TextMode="Date" ></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 mx-auto">
                <center><label>Select Time</label></center>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="txtTimeDS" runat="server" TextMode="Time" ></asp:TextBox>
                </div>
            </div>  
        </div>
        <div class="row">
            <div class="col-md-4 mx-auto">
                <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("Needs_ID")+";"+ Eval("DONOR_ID") %>' OnClick="btnAccept_Click"  />
            </div>
            <div class="col-md-4 mx-auto">
                <asp:Button class="btn btn-danger btn-block btn-lg" ID="btnDecline" runat="server" Text="Decline"  />
            </div>
        </div>
        <hr />  
    </ItemTemplate>
</asp:Repeater>

<%-- Spplies to Specific orphan --%>
                         <hr />
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                    <h2>Orphan Donations Needs</h2>
                                    </center>
                                </div>
                            </div>                                                                                                                      
                        </div> 
                        <hr />
                          <asp:Repeater ID="Rep1" runat="server" >
                            <ItemTemplate>
        <center>
            <label style="font-size:18px;"><b><%#Eval("Needs_Dname") %></b></label>
            <br />
            <p>Wants to Donate: <%#Eval("Needs_name") %>  </p>
            <br />
            </center>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <center><label>Select Date</label></center>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" TextMode="Date" ></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 mx-auto">
                <center><label>Select Time</label></center>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="txtTime" runat="server" TextMode="Time" ></asp:TextBox>
                </div>
            </div>  
        </div>
        <div class="row">
            <div class="col-md-4 mx-auto">
                <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAcceptORP" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("Needs_ID")+";"+ Eval("DONOR_ID")+";"+ Eval("orphan_ID") %>'  OnClick="btnAcceptORP_Click"  />
            </div>
            <div class="col-md-4 mx-auto">
                <asp:Button class="btn btn-danger btn-block btn-lg" ID="btnDecline" runat="server" Text="Decline"  />
            </div>
        </div>
        <hr />  
    </ItemTemplate>
                        </asp:Repeater>
                        <hr />
                    </div>                   
                </div>
            </div>
        </div>   
            </div>                        
        </div>
    </section>

  <%--  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>--%>

</asp:Content>
