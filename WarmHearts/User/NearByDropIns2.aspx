<%@ Page Title="" Language="C#" MasterPageFile="~/User/OP.Master" AutoEventWireup="true" CodeBehind="NearbyDropIns.aspx.cs" Inherits="WarmHearts.User.NearbyDropIns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--  Google Map Api Source--%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0&callback=initMap" defer></script>

    <%--    JavaScript Api--%>
    <%--<script src="../BootstrapFiles/js/mapsapi.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

        <script src="../BootstrapFiles/gmapsapi/nearbydropins.js" type="text/javascript"></script>            

             
   
    <br />
    <br />
    <section class="offer_section layout_padding-bottom" style="background-color: pink;">
      

        <div class="offer_container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="card" style="border-radius: 2rem">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h2>Nearby Drop-in Centers</h2>
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <hr>
                                        </center>
                                    </div>
                                </div>


                                <div id="map" class="" style="width: 100%; height: 600px;"></div>
                                <button id="btnGetLocation">Get Location</button>
                               
                            </div>


                        </div>

                        <div></div>

                    </div>

                </div>
            </div>
        </div>
    </section>

       </ContentTemplate></asp:UpdatePanel>

</asp:Content>
