<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SubmitLostChildPage.aspx.cs" Inherits="WarmHearts.User.SubmitLostChildPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">

    function ImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#<%=imgOrph.ClientID%>').prop('src', e.target.result)
                    .width(680)
                    .height(650);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
    
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />

    <script src='https://maps.google.com/maps/api/js?libraries=places&key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0'></script>
    <script src="../BootstrapFiles/gmapsapi/locpicker.jquery.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <section class="offer_section layout_padding-bottom" style="background-color: pink;" >
    <div class="offer_container">
    <div class="container">
        <div class="row" >
            <div class="col-md-9 mx-auto">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                
                    <div class="row">
                        <div class="col">
                            <center><h2>Submit Lost Child</h2></center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <center>
                                <hr>
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="First Name" ID="txtSLCPFName" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    
                        <div class="col-md-4">
                            <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Last Name" ID="txtSLCPLName" runat="server"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-4">
                            <label>Middle Initial</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Middle Initial" ID="txtSLCPMI" runat="server"></asp:TextBox>
                                </div>
                        </div>

                    </div>

                
                        <div class="row">
                                <div class="col-md-12">
                                    <center>
                                    <label>Location</label>                                 
                                    <div class="col-md-12">
                                        <div class="form-outline">
                                            <div>

                                                <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default responsive">
                                                    <span class="glyphicon glyphicon-map-marker"></span>
                                                    <span id="OPLocation">Please Select Address</span>

                                                </button>

                                               <%-- LOCATION SEARCH--%>
                                                <style>
                                                    .pac-container {
                                                        z-index: 99999;
                                                    }
                                                </style>


                                                <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                                                    <br />
                                                  
                                                  
                                                    
                                                  

                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <div class="form-horizontal">
                                                                    <div class="form-group">

                                                                        <div class="col-sm-11">
                                                                            <label for="exampleInputEmail">Location</label>
                                                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                                                            <asp:TextBox ID="LC_Loc" CssClass="form-control" runat="server"></asp:TextBox>

                                                                        </div>
                                                                        <div class="col-sm-1">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                    </div>


                                                                     <%-- MAP MODAL STARTS--%>
                                                                    <div id="LocMapModal" style="width: 100%; height: 500px;"></div>
                                                                    <div class="clearfix">&nbsp;</div>
                                                                    <div class="m-t-small">

                                                                     <div class="row">
                                                                        <div class="col">
                                                                            <label>Lat:</label>
                                                                            <asp:TextBox ID="LC_lat" CssClass="form-control" runat="server" Style="width: 200px"></asp:TextBox>
                                                                        </div>
                                                                                                                                                                                                      
                                                                        <div class="col">
                                                                            <label>Long:</label>
                                                                            <asp:TextBox ID="LC_lon" CssClass="form-control" runat="server" Style="width: 200px"></asp:TextBox>
                                                                        </div>                                                                                                                                               
                                                                    </div>
                                                                        <br />
                                                                    <div class="row">
                                                                        <div class="col-md-3 mx-auto">
                                                                            <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">Accept</button>
                                                                        </div>
                                                                    </div>

                                                                   </div>
                                                                    <div class="clearfix"></div>
                                                                    <script>

                                                                        $('#LocMapModal').locationpicker({
                                                                            radius: 0,
                                                                            zoom: 9,
                                                                            location: {
                                                                                latitude: 10.2971967,
                                                                                longitude: 123.9071525
                                                                            },
                                                                            enableAutocomplete: true,
                                                                            inputBinding: {
                                                                                latitudeInput: $('#<%=LC_lat.ClientID%>'),
                                                                                longitudeInput: $('#<%=LC_lon.ClientID%>'),
                                                                        locationNameInput: $('#<%=LC_Loc.ClientID%>')
                                                                    },
                                                                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                                                                        $('#OPLocation').html($('#<%=LC_Loc.ClientID%>').val());
                                                                                var mapContext = $(this).locationpicker('map');
                                                                                mapContext.map.setZoom(15);
                                                                            }


                                                                        });
                                                                        $('ModalMap').on('shown.bs.modal', function () {
                                                                            $('#LocMapModal').locationpicker('autosize');
                                                                        });
                                                                    </script>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    </center>
                                </div>
                            </div>                                       
                 

                        <div class="row">
                            <div class="col-md-6">
                            <label>Date Lost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSLCPDateLost" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-6">
                            <label>Time Lost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSLCPTimeLost" runat="server" TextMode="Time"></asp:TextBox>
                                </div>
                        </div>
                        </div>

                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <label>Upload Image</label>
                                <div class="form-group">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="box">
                                                <asp:Image ID="imgOrph" runat="server" CssClass="img-thumbnail" Width="100%" Height="400" />                                               
                                            </div>
                                            <br />
                                            <center>
                                                <asp:FileUpload ID="SLCPimg" runat="server" CssClass="form-control" onchange="ImagePreview(this);"/>                                        
                                            </center>
                                        </div>
                                        <div class="pcoded-inner-content pt-0">
                                            <div class="align-align-self-end">
                                                <center>
                                                    <asp:Label ID="SLCPlblMsg" runat="server" Visible="false"></asp:Label>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>          
                    </div>

                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col">
                            <center><h2>Your Contact Information</h2></center>
                        </div>
                    </div>
                
                    <div class="row">
                        <div class="col">
                            <center>
                                <hr>
                            </center>
                        </div>
                    </div>
               
                    <div class="row">
                        <div class="col-md-4">
                            <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. John" ID="txtSLCPContactInfoFName" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    
                        <div class="col-md-4">
                            <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Doe" ID="txtSLCPContactInfoLName" runat="server"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-4">
                            <label>Middle Initial</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Q" ID="txtSLCPContactInfoMI" runat="server"></asp:TextBox>
                                </div>
                        </div>                           
                    </div>
                
                <div class="row">
                    <div class="col-md-6">
                            <label>Email Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" placeholder="ex. neilzkcrew@gmail.com" ID="txtSLCPEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                    

                        <div class="col-md-6">
                            <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. 09237702918" ID="txtSLCPContactNum" runat="server" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                </div>

                
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Button class="btn btn-info btn-block btn-lg" ID="btnSLCPSubmit" runat="server" Text="Submit" OnClick="btnSLCPSubmit_Click" />
                        </div>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <asp:Button class="btn btn-success btn-block btn-lg" ID="btnNearbyDropIns" runat="server" Text="View Nearby Drop-Ins" OnClick="btnNearbyDropIns_Click"  />
                        </div>
                    </div>
                </div>
            </div>
            
                </div>               
            </div>
          
     </div>
        <br />
        <br />
    </div>
    </div>
    </section>
    <br />
    <br />

</asp:Content>
