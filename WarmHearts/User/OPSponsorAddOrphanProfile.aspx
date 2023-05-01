<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="OPSponsorAddOrphanProfile.aspx.cs" Inherits="WarmHearts.User.OPSponsorAddOrphanProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";

            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgOrph.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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

                                <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPSponsorshipbtn" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPSponsorshipbtn_Click" />
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
                                        <asp:ImageButton ID="OPPstNeeds" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/pstneeds.png" OnClick="OPPstNeeds_Click" />
                                    </center>
                                </div>
                                <center>
                                    <label>Post Needs</label>
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
                                    <label>Volunteer Requests</label>
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
                            <div class="col-md-3 mx-auto">
                                <h2>Orphan Profile</h2>
                                <div class="box">
                                    <asp:Image ID="imgOrph" runat="server" CssClass="img-thumbnail" Width="100%" Height="200" />
                                </div>
                                <br />
                                <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control"
                                    onchange="ImagePreview(this);"></asp:FileUpload>
                                <div>
                                </div>
                                <%-- <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAddOrphanProfile" runat="server" Text="Add Picture" />            --%>
                            </div>

                            <div class="col">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Skyler" ID="FnameText" runat="server"></asp:TextBox>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Last Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex. Reyess" ID="LnameText" runat="server"></asp:TextBox>
                                            <asp:HiddenField ID="hdnID" runat="server" Value="0" />

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Age</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex.13" ID="AgeText" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Date Of Birth</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtBday" runat="server" TextMode="Date"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Gender</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex. Male" ID="GenderText" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col">
                                        <label>Description</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="Please enter the child's description." ID="DscrpText" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label></label>
                                        <div class="form-group">
                                            <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Active" />
                                        </div>
                                    </div>


                                </div>
                                <div class="row">
                                    <div class="col">
                                        <%-- <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button1" runat="server" Text="Submit" />            --%>
                                        <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button1" runat="server" Text="Add"
                                            OnClick="btnAddorUpdate_Click" />
                                        <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button2" runat="server" Text="Clear" />
                                        <br />
                                        <br />
                                        <br />

                                <div class="pcoded-inner-content pt-0">
                                    <div class="align-align-self-end">
                                        <center>
                                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                                        </center>
                                    </div>
                                </div>
                                      
                                    </div>

                                </div>
                            </div>
                            

                                    <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>


                        </div>
                            </div>
                        </div>                 
                    </div>
                </div>
            </div>
        </div>


         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>

    </section>

</asp:Content>
