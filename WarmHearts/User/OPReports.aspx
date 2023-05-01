<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" AutoEventWireup="true" CodeBehind="OPReports.aspx.cs" Inherits="WarmHearts.User.OPReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <%--  <script type="text/javascript"> 
        $(document).ready(function () {
            $('#<%=GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>

   <%-- <script type="text/javascript"> 
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>
    
  <%--  <script type="text/javascript"> 
        $(document).ready(function () {
            $('#<%=GridView3.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>

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
                                        <asp:ImageButton ID="OPAddOrphans" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPAddOrphans_Click"/>                                       
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
                            <div>
                                
                            </div>

                    </div>

                        <div>
                            <hr />
                        </div>   
                        
                        <br />
                        <br />
                        <center>

                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <div class="form-group">  
                                    <h2>Generate Reports</h2>                                  
                                </div>
                            </div>                                                                                                                                       
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>Lists</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlOPReportList"  runat="server" >
                                        <asp:ListItem Selected="True" Value="0">...</asp:ListItem>
                                        <asp:ListItem Value="1">List of Donors</asp:ListItem>
                                        <asp:ListItem Value="2">List of Orphans</asp:ListItem>
                                        <asp:ListItem Value="3">List of Sponsors</asp:ListItem>
                                    </asp:DropDownList>  
                                     
                                </div>
                            </div>                                                                                 
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <div class="form-group">
                                   <asp:Button class="btn btn-warning btn-block btn-lg" ID="btnOPReportsGenerate" runat="server" Text="Generate" Width="40%" OnClick="btnOPReportsGenerate_Click" />
                                </div>
                            </div>
                        </div>
                            </center>
                        <hr />
                        <br />
                    
                        <div class="row">
                        <div class="col">
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">

                                        <asp:Repeater ID="Repeater1" runat="server" Visible="false">
                                            <HeaderTemplate>
                                                <table class="table data-table-export table-hover nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="table-plus">Name</th>
                                                            <th>Amount</th>
                                                            <th>Supplies</th>
                                                            <th>Date and Time</th>
                                                           
                                                        </tr>
                                                    </thead>                                              
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="table-plus">
                                                        <asp:Label ID="lblfname" runat="server" Text='<%# Eval("D_NAME") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAge" runat="server" Text='<%# Eval("D_SUPPLIES") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("D_DATETIME")%>'></asp:Label>
                                                    </td>                                               
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </div>

                                </div>
                            </div>
                        </div>

               <%-- <div class="row">
                   <div class="col">
                       <center>
                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="false">
                               <Columns>                             
                                   <asp:TemplateField>
                                       <HeaderTemplate>
                                           <div class="row">   
                                               <div class="col-md-3">
                                                   <label>Donor Name</label>
                                               </div>
                                               
                                               <div class="col-md-2">
                                                   <label>Donation Amount</label>
                                               </div>
                                               
                                               <div class="col-md-3">
                                                   <label>Donation Supplies</label>
                                               </div>
                                               
                                               <div class="col-md-4">
                                                   <label>Donor Message</label>
                                               </div>
                                           </div>
                                       </HeaderTemplate>
                                       <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col-md-3">          
                                                       <asp:Label ID="lblName" runat="server" Text='<%# Eval("D_NAME") %>'></asp:Label>
                                                   </div>

                                                   <div class="col-md-2">
                                                       <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                                   </div>

                                                   <div class="col-md-3">
                                                       <asp:Label ID="lblSupplies" runat="server" Text='<%# Eval("D_SUPPLIES") %>'></asp:Label>
                                                   </div>
                                                                                                     
                                                   <div class="col-md-4">
                                                       <asp:Label ID="lblMSG" runat="server" Text='<%# Eval("D_MSG") %>'></asp:Label>

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
                </div>--%>


                        
               <%--  <div class="row">
                   <div class="col">
                       <center>
                           <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Visible="false">
                               <Columns>                             
                                   <asp:TemplateField>
                                       <HeaderTemplate>
                                           
                                       </HeaderTemplate>
                                       <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col">          
                                                       <asp:Label ID="lblFName" runat="server" Text='<%# Eval("Fname") %>'></asp:Label>                                                     
                                                   </div>

                                                   <div class="col">
                                                       <asp:Label ID="lblLname" runat="server" Text='<%# Eval("Lname") %>'></asp:Label>
                                                   </div>

                                                   <div class="col">
                                                       <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                                                   </div>
                                                                                                     
                                                   <div class="col">
                                                       <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                                   </div>
                                                   
                                                   <div class="col">
                                                       <asp:Label ID="lblBday" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                                                   </div>
                                               </div>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString2 %>" SelectCommand="SELECT * FROM [dbo].[Orphan_USERS]">
                              
                           </asp:SqlDataSource>
                       </center>
                   </div>
                </div>--%>

                    <div class="row">
                        <div class="col">
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">

                                        <asp:Repeater ID="rOrphanList" runat="server" Visible="false">
                                            <HeaderTemplate>
                                                <table class="table data-table-export table-hover nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="table-plus">First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Age</th>
                                                            <th>Gender</th>
                                                            <th>Birthday</th>
                                                        </tr>
                                                    </thead>                                              
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="table-plus">
                                                        <asp:Label ID="lblfname" runat="server" Text='<%# Eval("Fname") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("Lname") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBday" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                                                        
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row" runat="server" visible="false" id="DivSpon">
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <div class="row">
                                            <div class="col">
                                                <label>Donor ID</label>
                                            </div>
                                            <div class="col">
                                                <label>Donor Name</label>
                                            </div>
                                            <div class="col">
                                                <label>Orphan Name</label>
                                            </div>
                                            <div class="col">
                                                <label>Donation Amount</label>
                                            </div>
                                            <div class="col">
                                                <label>Start</label>
                                            </div>
                                            <div class="col">
                                                <label>End</label>
                                            </div>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DON_ID") %>'></asp:Label>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("D_NAME") %>'></asp:Label>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("D_ORPHAN") %>'></asp:Label>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("D_SPSDATE") %>'></asp:Label>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("D_SPEDATE") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString4 %>" SelectCommand="SELECT [D_NAME], [D_ORPHAN], [D_AMOUNT], [D_SPSDATE], [D_SPEDATE], [DON_ID] FROM [DONATION] WHERE (([ORPH_ID] = @ORPH_ID) AND ([orphan_ID] IS NOT NULL))">
                            <SelectParameters>
                                <asp:SessionParameter Name="ORPH_ID" SessionField="OP_ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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



