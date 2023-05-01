<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" MaintainScrollPositionOnPostback="true"  AutoEventWireup="true" CodeBehind="Sponsor.aspx.cs" Inherits="WarmHearts.User.Sponsor" %>
<%@ Import Namespace="WarmHearts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>--%>

    <script>

        function getData(e) {
            e.preventDefault();
        }



    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0&callback=myMap" defer></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%
        string imageUrl = Session["OP_IMG"].ToString();
     %> 

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
                            <center>
                                <h2>Orphanage Profile</h2>
                            </center>
                        <div>
                            <hr />
                            
                        </div>

                         <%-- Orphanage Profile Pic--%>
                        <div class="row">
                            <div class="col-md-5"> 
                                <div class="box">                                   
                                   <img src="<%= Connection.Utils.GetImageUrl(imageUrl) %>" id="imgProfilePic" style="width: 100%; height: 250px;" class="img-thumbnail" />
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <div class="middle pt-2">
                                            <a href=<%--"SignupOrphanage.aspx?id=<% Response.Write(Session["OP_ID"]); %>"--%> class="btn btn-info">
                                               <%-- <i class="fa fa-pencil"></i>Edit Details--%>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <%-- Orphanage Details Starts--%>
                            <div class="col-md-6">
                                
                                <br />

                                <hr />

                                <div class="row">
                                    <div class="col">
                                        <asp:Repeater ID="rOrphProfile" runat="server">
                                            <ItemTemplate>

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


                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>                                                                
                            </div>
                            <%-- Orphanage Details Ends--%>

                          

                            <%-- Orphanage Details Starts--%>
                           
                           


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
                        <br />
                        <br />

                     <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                               <center><h2>Orphans</h2></center>
                            </div>
                        </div>
                    

                        
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                         <%--  GRIDVIEW--%>
                                 <div class="row">
                                    <div class="col">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="True" Font-Names="Arial" Font-Size="11pt" class="table table-striped table-bordered"
                                            OnPageIndexChanging="OnPaging">
                                            
                                            <Columns>                                               
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <center>
                                                        PRIORITY LEVEL: 
                                                        <asp:DropDownList ID="ddlCountry" runat="server" OnSelectedIndexChanged="CountryChanged"
                                                            AutoPostBack="true" AppendDataBoundItems="true">
                                                            <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                            <asp:ListItem Text="Top 10" Value="10"></asp:ListItem>
                                                        </asp:DropDownList>
                                                         <ItemTemplate>
                                                       <%# Eval("priorty") %>
                                                       </center>
                                                    </ItemTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-5">    
                                                                 <center>
                                                                    <div class="col-lg">
                                                                        <asp:Image ID="Image1" Width="130px" Height="130px" class="img-fluid" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                                                    </div>
                                                                    <br />
                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("Fname") %>'></asp:Label>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Lname") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                  


                                                                    <div class="row">
                                                                        <div class="col-lg">                                                                         
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="false" Text='<%# Eval("Age" ) %>'></asp:Label>&nbsp;years old.
                                                                        </div>
                                                                    </div>

                                                                     
                                                                 </center> 
                                                                </div>
                                                                
                                                               <div class="col-lg">
                                                                   <label style="font-size:20px;">Needs</label><br />
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="false" Text='<%# Eval("Needs" ) %>'></asp:Label>
                                                                   <br />
                                                                   <br />
                                                                   <div class="row">
                                                                       <div class="col-lg">
                                                                            <label style="font-size:20px;">Number of Donors</label><br />
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="false" Text='<%# Eval("DONATION_NUM") %>'></asp:Label>
                                                                       </div>
                                                                   </div>
                                                               </div>
                                                                 
                                                                

                                                                <div class="col-lg-4">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <asp:LinkButton ID="lnkSpNeeds" Text="Sponsor Needs" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("orphan_ID") +";"+ Eval("OP_ID")%>' CommandName="Needs" OnClick="lnkSpNeeds_Click">Sponsor Needs</asp:LinkButton>
                                                                        
                                                                        <div class="row">
                                                                            <div class="col">
                                                                            <asp:LinkButton ID="lnkSpEduc" Text="Sponsor Education" runat="server" CssClass="badge badge-success" CommandArgument='<%# Eval("orphan_ID") +";"+ Eval("OP_ID")%>' CommandName="Needs" OnClick="lnkSpEduc_Click">Sponsor Education</asp:LinkButton>
                                                                        </div>
                                                                        </div>
                                                                        </div>

                                                                        
                                                                    </div>
                                                                </div>
                                                                
                                                            </div>
                                                            <br />
                                                        </div>


                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>

                       
                        
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