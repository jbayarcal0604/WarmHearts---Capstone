<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="DonorProfile2.aspx.cs" Inherits="WarmHearts.User.DonorProfile2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <br />
                                    <br />
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <img id="imgview" class="img-box" height="120px" width="120px" src="../BootstrapFiles/images/dnrprofile.png" />
                                        </div>

                                        
                                    </div>
                                </center>
                            </div>
                        </div>
                      <br />

                        <div class="row">
                            <div class="col">
                                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload2" runat="server" />

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your status"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fname" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Middle Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="mname" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="lname" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-12">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="address" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="prov" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="zipcode" runat="server" ></asp:TextBox>
                                </div>
                            </div>



                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dob" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="contactn" runat="server"  TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="emailad" runat="server" TextMode="Email"></asp:TextBox>
                                </div>

                                

                            </div>

                            <div class="col-md-6">
                                <label>Course</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="course" runat="server"  ></asp:TextBox>
                                </div>
                            </div>
                             
                              <div class="col-md-12">
                                <label>School Graduated</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="schoolg" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label>Work</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="work" runat="server"  ></asp:TextBox>
                                </div>
                            </div>
                             
                              <div class="col-md-6">
                                <label>Place of Work</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="placework" runat="server" ></asp:TextBox>
                                </div>
                            </div>


                        </div>
                        
                      
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="usrname" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="oldpsword" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="newpsword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                            <br />
                           
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                         <div class="row">
                     <%--<div class="col">
                         <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" class="form-control"  />
                     </div>--%>
                  </div>
                        <div class="row">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
