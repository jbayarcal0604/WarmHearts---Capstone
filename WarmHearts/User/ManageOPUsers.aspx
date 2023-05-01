<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOPUsers.aspx.cs" Inherits="WarmHearts.User.ManageOPUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


   <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
   </script>

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Orphanage Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../BootstrapFiles/images/opuser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Orphanage ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="OpID" runat="server"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" OnClick="LinkButton4_Click" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>




                            <div class="col-md-9">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPfname" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>
                            
                            
                            

                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPContact" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                 <label>Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control mr-1" ID="accstatus" runat="server"  ReadOnly="True"></asp:TextBox>
                              <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><i class="fas fa-check-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click1"><i class="far fa-pause-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click1"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-12">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPEmail" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>



                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPAddress" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-5">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPProv" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPZip" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label>Date Established</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="OPdate" runat="server"  Type="Date" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>                                                                           
                        </div>
                      
                        <div>
                            <table>
                               
                                <tr>
                                    <th class="table-plus">
                                        
                                    </th>
                                </tr>
                            </table>
                        </div>


                        <br />

                        
                        <div class="row">                                                                               
                            <div class="col">
                                <h3>LEGEND</h3>
                                    <p style="font-size: 16px;"  class="btn-primary col-md-5">Blue - Search User</p>
                            </div>   
                        </div> 

                        <div class="row">                                                                               
                            <div class="col">
                                    <p style="font-size: 16px;"  class="btn-success col-md-5">Green - Active Account</p>
                            </div>   
                        </div> 

                        <div class="row">                                                                               
                            <div class="col">
                                    <p style="font-size: 16px;"  class="btn-warning col-md-5">Yellow - Pending Account</p>
                            </div>   
                        </div> 

                        <div class="row">                                                                               
                            <div class="col">
                                    <p style="font-size: 16px;"  class="btn-danger col-md-5">Red - Inactive Account</p>
                            </div>   
                        </div> 

                    </div>
                </div>
               
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Orphanage List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                       <%-- <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT [OrphID], [Fname], [Orph_Address], [OrphEmail], [Orph_Contact], [account_status], [orph_prov], [orph_zip], [orph_date], [Orph_certificates] FROM [Orphanage_TABLE]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrphID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <div class="container-fluid">
                                                                    <div class="row">                                                                       
                                                                        <div class="col-lg-10">
                                                                            <div class="row">
                                                                                <div class="col">      
                                                                                    Id Number:                                                                                                                                                                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("OrphID") %>' Font-Bold="True" ></asp:Label> 
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Orphanage Name:                                                                                  
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Fname") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                             
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Address:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Orph_Address") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Contact Number:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Orph_Contact") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Email Address:                                                                                     
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("OrphEmail") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Date:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("orph_date") %>'></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Status:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("account_status") %>'></asp:Label>
                                                                                </div>
                                                                            </div>                                                                                                                                                                                                                                                                                                                                                                                                       
                                                                       </div>                                                                      
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>--%>
                           <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT [OP_ID], [OP_NAME], [OP_ADD], [OP_CONT], [OP_STAT], [OP_UNAME], [OP_MAIL] FROM [OP_TABLE]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OP_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <div class="container-fluid">
                                                                    <div class="row">                                                                       
                                                                        <div class="col-lg-10">
                                                                            <div class="row">
                                                                                <div class="col">      
                                                                                    Id Number:                                                                                                                                                                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("OP_ID") %>' Font-Bold="True" ></asp:Label> 
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Orphanage Name:                                                                                  
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("OP_NAME") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                             
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Address:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("OP_ADD") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Contact Number:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("OP_CONT") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Email Address:                                                                                     
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("OP_MAIL") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    USER NAME:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("OP_UNAME") %>'></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Status:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("OP_STAT") %>'></asp:Label>
                                                                                </div>
                                                                            </div>  
                                                                             <div class="row">
                                                                                <div class="col">
                                                                                    File:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                     <%--  <asp:CommandField ShowSelectButton="True" Text="Download" ControlStyle-ForeColor="Blue" />--%>
                                                                                   <%-- <asp:TextBox ID="TextBox1" runat="server" Visible="false" Text='<%# Eval("OP_ID") %>'></asp:TextBox>--%>
                                                                                     <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" CommandArgument='<%# Eval("OP_ID") %>'>Download</asp:LinkButton>
                                                                                </div>
                                                                                  <div class="col">
                                                                                     <%--  <asp:CommandField ShowSelectButton="True" Text="Download" ControlStyle-ForeColor="Blue" />--%>
                                                                                   <%-- <asp:TextBox ID="TextBox1" runat="server" Visible="false" Text='<%# Eval("OP_ID") %>'></asp:TextBox>--%>
                                                                                     <asp:LinkButton ID="view" runat="server" OnClick="view_Click" CommandArgument='<%# Eval("OP_ID") %>'>view</asp:LinkButton>
                                                                                </div>
                                                                            </div>   
                                                                            

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
</asp:Content>
