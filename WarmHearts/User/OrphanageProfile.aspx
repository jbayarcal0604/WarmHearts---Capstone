<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="OrphanageProfile.aspx.cs" Inherits="WarmHearts.User.OrphanageProfile" %>

<%@ Import Namespace="WarmHearts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=OPPostNeedsimgprw.ClientID%>').prop('src', e.target.result)
                        .width(260)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#myTable').DataTable();
        });
    </script>

    <%-- <script>

        function getData(e) {
            e.preventDefault();
        }



    </script>--%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0&callback=myMap" defer></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%
        string imageUrl2 = Session["OP_IMG"].ToString();
    %>

    <section class="offer_section" style="background-color: lightblue">
        <div class="offer_container">
            <div class="row">
                <div class="col">
                </div>
            </div>
        </div>
    </section>


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

                                <%-- Orphanage Features--%>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <center>
                                                <asp:ImageButton ID="OPSponsorship" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPSponsorship_Click" />
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
                                <%-- Orphanage Features--%>
                                <div>
                                    <hr />
                                </div>

                                <%-- Orphanage Profile Pic--%>
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="box">
                                            <img src="<%= Connection.Utils.GetImageUrl2(imageUrl2) %>" id="imgProfilePic" style="width: 100%; height: 350px;" class="img-thumbnail" />
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col">
                                                <div class="middle pt-2">
                                                    <a href="SignupOrphanage.aspx?id=<% Response.Write(Session["OP_ID"]); %>" class="btn btn-info">
                                                        <i class="fa fa-pencil"></i>Edit Details
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <%-- Orphanage Details Starts--%>
                                    <div class="col-md-6">

                                        <br />

                                        <div class="row">
                                            <div class="col">
                                                <asp:Repeater ID="rOrphProfile" runat="server">
                                                    <ItemTemplate>
                                                        <h2>About Us</h2>
                                                        <div class="row">
                                                            <hr />
                                                            <div class="col">
                                                                <%# Eval("OP_ABOUT")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Name:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_NAME")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Address:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_ADD")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Province:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_PROV")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Zip Code:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_ZIP")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Email:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_MAIL")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Contact Number:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_CONT")  %>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Date Established:</label>
                                                            </div>
                                                            <hr />
                                                            <div class="col-md-8">
                                                                <%# Eval("OP_DATE")  %>
                                                            </div>
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Orphanage Details Ends--%>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col">
                                        <asp:Repeater ID="rptr2" runat="server"><ItemTemplate>
                                        <center>
                                            <asp:Image runat="server" src="../Images/DSWD-Logo.png" style="width: 200px; height:200px   " ></asp:Image>
                                            <h2 style="font-family:Arial, Helvetica, sans-serif">ACCREDITATION</h2>
                                            <br />

                                        </center>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <label style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: large">DSWD Authority/Solicitation Permit No:</label>
                                            </div>
                                            <hr />
                                            <div class="col-md-8">
                                                <%# Eval("OP_SOLCT")  %>
                                            </div>
                                        </div>

                                           <div class="row">
                                            <div class="col-md-4">
                                                <label style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: large">DSWD License:</label>
                                            </div>
                                            <hr />
                                            <div class="col-md-8">
                                                <%# Eval("OP_LCENSE")  %>
                                            </div>
                                        </div>

                                           <div class="row">
                                            <div class="col-md-4">
                                                <label style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: large ">DSWD Accreditation:</label>
                                            </div>
                                            <hr />
                                            <div class="col-md-8">
                                                <%# Eval("OP_ACDTN")  %>
                                            </div>
                                        </div>


                                           <div class="row">
                                            <div class="col-md-4">
                                                <label style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: large">PNC Accreditation No:</label>
                                            </div>
                                            <hr />
                                            <div class="col-md-8">
                                                <%# Eval("OP_PNC")  %>
                                            </div>
                                        </div>
                                            </ItemTemplate></asp:Repeater>
                                    </div>
                                </div>


                                <br />
                                <hr />

                                <%-- Orphanage Post Needs--%>
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h2>Needs</h2>
                                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="box">
                                                    <asp:Image ID="OPPostNeedsimgprw" runat="server" CssClass="img-thumbnail" Width="100%" Height="200" />
                                                </div>
                                                <br />
                                                <asp:FileUpload ID="FileImg" runat="server" CssClass="form-control" onchange="ImagePreview(this);"></asp:FileUpload>
                                            </div>
                                        </div>

                                        <br />
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Input your needs.</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtPostNeeds" placeholder="Describe here the needs of your orphanage..." TextMode="Multiline" Rows="5" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btnSubmitOrUpdate" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="form-group">
                                                    <asp:Button class="btn btn-info btn-block btn-lg" ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                    <%-- display needs  --%>
                                    <div class="col">
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">

                                                <asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>

                                                <asp:Repeater ID="rPostNeeds" runat="server" OnItemCommand="rPostNeeds_ItemCommand" OnItemDataBound="rPostNeeds_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">Needs</th>
                                                                    <th>Images</th>
                                                                    <th class="datatable-nosort">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus">
                                                                <asp:Label ID="lblpostNds" runat="server" Text='<%# Eval("post_needs") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <img alt="" src="<%# Connection.Utils.GetImageUrl3( Eval("post_img")) %>" width="100px" height="100px" />
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("post_ID") %>' CommandName="edit"><%--<i class="ti-pencil">--%>Edit</i></asp:LinkButton>
                                                                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("post_ID") %>' CommandName="delete" OnClientClick="return confirm('Do you want to delete this Post?');"><%--<i class="ti-trash">--%>Delete</i></asp:LinkButton>
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
                                <br />


                                <%-- Orphanage Post Needs--%>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>


                                <br />
                                <br />
                                <br />

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h2>You Can Find Us Here</h2>
                                        </center>

                                    </div>
                                </div>
                                <div id="map" class="" style="width: 100%; height: 600px;"></div>
                                <script>
                                    function myMap() {
                                        var lat = <%=this.lati %>;
                                var lon = <%=this.longi %>;

                                        var prty = {
                                            center: new google.maps.LatLng(lat, lon),
                                            zoom: 15,
                                        };
                                        var map = new google.maps.Map(document.getElementById("map"), prty);
                                        const mapCenter = new google.maps.LatLng(lat, lon);
                                        var marker = new google.maps.Marker({ position: mapCenter });

                                        marker.setMap(map);


                                    }

                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
