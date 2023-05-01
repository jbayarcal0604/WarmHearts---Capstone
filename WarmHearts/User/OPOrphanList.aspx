<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" AutoEventWireup="true" CodeBehind="OPOrphanList.aspx.cs" Inherits="WarmHearts.User.OPOrphanList" %>

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
                                                <asp:ImageButton ID="OPAddOrphan" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPAddOrphan_Click" />
                                            </center>
                                        </div>
                                        <center>
                                            <label>Add Orphan</label>
                                        </center>
                                    </div>

                                    <div class="col">
                                        <div class="form-group">
                                            <center>
                                                <asp:ImageButton ID="OPOrphanListID" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/list.png" OnClick="OPOrphanListID_Click" />
                                            </center>
                                        </div>
                                        <center>
                                            <label>Orphan List</label>
                                        </center>
                                    </div>

                                    <div class="col">
                                        <div class="form-group">
                                            <center>
                                                <asp:ImageButton ID="OpVwDnrs" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png" OnClick="OpVwDnrs_Click" />
                                            </center>
                                        </div>
                                        <center>
                                            <label>View Donors</label>
                                        </center>
                                    </div>

                                    <div class="col">
                                        <div class="form-group">
                                            <center>
                                                <asp:ImageButton ID="OPVolunRqst" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vlnreqs.png" OnClick="OPVolunRqst_Click" />
                                            </center>
                                        </div>
                                        <center>
                                            <label>Requests</label>
                                        </center>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <center>
                                                <asp:ImageButton ID="OPreports" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/reprts.png" OnClick="OPreports_Click" />
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
                                        <center>
                                            <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Orphan List</h2>"></asp:Label>
                                        </center>
                                    </div>
                               </div>   

                                <%--  GRIDVIEW--%>
                                 <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT * FROM [ORPHANS_TBL] WHERE ([OP_ID] = @OP_ID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="OP_ID" SessionField="OP_ID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView ID="GridView1" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" runat="server">
                                            <Columns>                                               
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg">                                                                   
                                                                    ID number:
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("orphan_ID") %>'></asp:Label>
                                                                    

                                                                     <div class="row">
                                                                        <div class="col-lg">
                                                                            Name:
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Fname") %>'></asp:Label>
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Lname") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            Age:
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Age") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            Gender:
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Gender") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            Date of Birth:
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("DOB") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="row">
                                                                        <div class="col-lg">
                                                                            Needs:
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Needs") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            Description:
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("dscrpt") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                </div>

                                                                <div class="col-lg-4">
                                                                    <asp:Image ID="Image1" Width="200px" Height="200px" class="img-fluid" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
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
