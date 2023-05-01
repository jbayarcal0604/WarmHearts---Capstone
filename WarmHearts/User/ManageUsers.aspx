<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WarmHearts.User.ManageUsers" %>

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
                                    <h4>Donor Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../BootstrapFiles/images/donoruser.png" />
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
                                <label>Donor ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="dnrID" runat="server"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" OnClick="LinkButton4_Click" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>




                            <div class="col-md-3">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fnameText" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-md-3">
                                <label>Middle Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="midnameText" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="lnameText" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="accstatus" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton2" Onclick="LinkButton2_Click"  runat="server"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                            </svg></asp:LinkButton>


                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton1" OnClick="LinkButton1_Click" runat="server"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnContact" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnAddress" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnProv" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnZipCode" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Birthday</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnDOB" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnEmail" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>School</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnSchool" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label>WorkPlace</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnWork" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                                                
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
                                    <h4>Donor List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT * FROM [DONOR_USERS]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DONOR_ID" DataSourceID="SqlDataSource1">
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
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("DONOR_ID") %>' Font-Bold="True" ></asp:Label> 
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Donor Name:                                                                                  
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DONOR_FNAME") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                             
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Address:                                                                                    
                                                                                </div>

                                                                                <div class="col">                                                                                   
                                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("DONOR_ADD") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Contact Number:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    
                                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("DONOR_CONT") %>'></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Email Address:                                                                                     
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("DONOR_EMAIL") %>'></asp:Label>                                                                                   
                                                                                </div>                                                                            

                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Birth Date:                                                                                    
                                                                                </div>

                                                                                <div class="col">
                                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("DONOR_BDAY") %>' Font-Bold="True" ></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    Status:                                                                                    
                                                                                </div>

                                                                                <div class="col">                                                                                   
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("acc_status") %>' Font-Bold="True" ></asp:Label>
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
