<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAdmin.aspx.cs" Inherits="WarmHearts.User.ManageAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
       </script>


  
</asp:Content>

        <%--Kuwang Revoke Admin--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Admin Details</h4>
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
                                <label>Admin ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="admnID" runat="server"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" OnClick="LinkButton4_Click" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>




                            <div class="col-md-9">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fnameText" runat="server" ></asp:TextBox>
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
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" Onclick="LinkButton3_Click" runat="server"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pause-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M5 6.25a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5zm3.5 0a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5z"/>
</svg></asp:LinkButton>

                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dnContact" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="usrname" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="oldpssword" Placeholder="Old Password" runat="server" ReadOnly="false" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="newpssword" Placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                       





                        <div class="row">
                            <div class="col">
                                <asp:Button ID="Button1" Onclick="addbtn_Click" class="btn btn-lg btn-block btn-info" runat="server" Text="Add" />

                            </div>

                            <div class="col">

                                <asp:Button ID="Button3" OnClick="updbtn_Click" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" />
                            </div>
                        </div>
                  

                        
                        <br />
                        <div class="row">                                                                               
                            <div class="col">
                                <h3>LEGEND</h3>
                                    <p style="font-size: 16px;"  class="btn-primary col-md-5">Blue - Search Admin ID</p>
                            </div>   
                        </div> 
                        
                        <div class="row">                                                                               
                            <div class="col">
                                
                                    <p style="font-size: 16px;"  class="btn-success col-md-5">Green - Make Admin</p>
                                
                            </div>   
                        </div>
                        
                        <div class="row">                                                                               
                            <div class="col">
                             
                                    <p style="font-size: 16px;" class="btn-danger col-md-5">Red - Deactivate Admin</p>
                                
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
                                    <h4>Admin List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT * FROM [ADMIN_TABLE]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="admin_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="admin_ID" HeaderText="admin_ID" InsertVisible="False" ReadOnly="True" SortExpression="admin_ID" />
                                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                        <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                        <asp:BoundField DataField="contact_num" HeaderText="contact_num" SortExpression="contact_num" />
                                        <asp:BoundField DataField="acc_status" HeaderText="acc_status" SortExpression="acc_status" />
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
