<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" AutoEventWireup="true" CodeBehind="OPViewDonors.aspx.cs" Inherits="WarmHearts.User.OPViewDonors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         $(document).ready(function () {
             $('#<%=GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
     <section class="offer_section layout_padding-bottom" style="background-color: pink">
    <div class="offer_container">
    <div class="container" >
        <div class="row">
            <div class="col mx-auto">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">

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
                                    <asp:ImageButton ID="OpVwDnrs" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png" OnClick="OpVwDnrs_Click" />
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

                      <hr />


                        <div class="row">
                            <div class="col">
                                <center>
                                   <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Donors</h2>"></asp:Label>
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
                       <center>
                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                               <Columns>                             
                                   <asp:TemplateField>
                                       <HeaderTemplate>
                                           <div class="row">   
                                               <div class="col-md-2">
                                                   <label>Donor Name</label>
                                               </div>
                                               
                                               <div class="col-md-2">
                                                   <label>Donation Amount</label>
                                               </div>
                                               
                                               <div class="col-md-2">
                                                   <label>Donation Supplies</label>
                                               </div>
                                               
                                               <div class="col-md-2">
                                                   <label>Donor Message</label>
                                               </div>

                                               <div class="col-md-2">
                                                   <label>Scheduled Date and Time</label>
                                               </div>
                                           </div>
                                       </HeaderTemplate>
                                       <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col-md-2">          
                                                       <asp:Label ID="lblName" runat="server" Text='<%# Eval("D_NAME") %>'></asp:Label>
                                                   </div>

                                                   <div class="col-md-2">
                                                       <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                                   </div>

                                                   <div class="col-md-2">
                                                       <asp:Label ID="lblSupplies" runat="server" Text='<%# Eval("D_SUPPLIES") %>'></asp:Label>
                                                   </div>
                                                                                                     
                                                   <div class="col-md-2">
                                                       <asp:Label ID="lblMSG" runat="server" Text='<%# Eval("D_MSG") %>'></asp:Label>
                                                   </div>

                                                   <div class="col-md-2">
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("D_DATETIME") %>'></asp:Label>
                                                   </div>

                                               </div>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString2 %>" SelectCommand="SELECT * FROM [dbo].[DONATION] WHERE ([ORPH_ID] = @ORPH_ID)">
                               <SelectParameters>
                                   <asp:SessionParameter Name="ORPH_ID" SessionField="OP_ID" Type="Int32" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                       </center>
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
