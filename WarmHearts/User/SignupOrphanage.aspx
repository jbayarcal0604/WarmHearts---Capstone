<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" AutoEventWireup="true" CodeBehind="SignupOrphanage.aspx.cs" Inherits="WarmHearts.User.SignupOrphanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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

    <%-- checkbox validator--%>
    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=tacCheck.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>


    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />


    <script src='https://maps.google.com/maps/api/js?libraries=places&key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0'></script>

                            <script src="../BootstrapFiles/gmapsapi/locpicker.jquery.js"></script>


    <script language="javascript" type="text/javascript">
        $(function () {
            var scntDiv = $('#divAttach');
            var i = $('#divAttach p').size() + 1;

            $('#addUploader').live('click', function () {
                $('<p><input type="file" id="FileUploader' + i + '" name="FileUploader' + i + '" /></label> <a href="#" id="removeUploader">Remove</a></p>').appendTo(scntDiv);
                i++;
                return false;
            });

            $('#removeUploader').live('click', function () {
                if (i > 2) {
                    $(this).parents('p').remove();
                    i--;
                }
                return false;
            });
        });

    </script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <section class="offer_section layout_padding-bottom" style="background-color: pink">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card" style="border-radius: 2rem">
                        <div class="card-body">

                            <div class="align-self-end">
                                <br />
                                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                            </div>
                            <br />

                            <div class="row" id="divHideOrphUpdate" runat="server">
                                <div class="col">
                                    <h6>ORPHANAGE</h6>
                                    <center>
                                        <h2>CREATE ACCOUNT</h2>
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

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Orphanage Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. ChildHope" ID="txtOrphanageName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="OrphRFV" runat="server" ErrorMessage="Please Enter Orphanage Name" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOrphanageName" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator
                                            ID="revInput"
                                            runat="server"
                                            ControlToValidate="txtOrphanageName"
                                            ValidationExpression="^[a-zA-Z0-9'\s]*$"
                                            ErrorMessage="Special characters are not allowed."
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <center>
                                        <label>Orphanage Address</label>
                                        <div class="col-md-12">
                                            <div class="form-outline">
                                                <div>

                                                    <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default responsive">
                                                        <span class="glyphicon glyphicon-map-marker"></span>
                                                        <span id="OPLocation">Select Orphanage Address</span>

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
                                                                                <asp:TextBox ID="OPLoc" CssClass="form-control" runat="server"></asp:TextBox>

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
                                                                                    <asp:TextBox ID="OPLat" CssClass="form-control" runat="server" Style="width: 200px"></asp:TextBox>
                                                                                </div>

                                                                                <div class="col">
                                                                                    <label>Long:</label>
                                                                                    <asp:TextBox ID="OPLon" CssClass="form-control" runat="server" Style="width: 200px"></asp:TextBox>
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
                                                                                    latitudeInput: $('#<%=OPLat.ClientID%>'),
                                                                                    longitudeInput: $('#<%=OPLon.ClientID%>'),
                                                                                    locationNameInput: $('#<%=OPLoc.ClientID%>')
                                                                                },
                                                                                onchanged: function (currentLocation, radius, isMarkerDropped) {
                                                                                    $('#OPLocation').html($('#<%=OPLoc.ClientID%>').val());
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
                            <br />


                            <div class="row">
                                <div class="col-md-6">
                                    <label>Province</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. Cebu City" ID="txtOPProvince" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ProvinceRFV" runat="server" ErrorMessage="Please Enter Province" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOPProvince" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator
                                            ID="revExp"
                                            runat="server"
                                            ControlToValidate="txtOPProvince"
                                            ValidationExpression="^[a-zA-Z0-9'\s]*$"
                                            ErrorMessage="Special characters are not allowed."
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. 6000" ID="txtOPZipCode" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ZipCodeRFV" runat="server" ErrorMessage="Please Enter Zip Code" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOPZipCode" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator
                                            ID="revExpzip"
                                            runat="server"
                                            ControlToValidate="txtOPZipCode"
                                            ValidationExpression="^\d{4}$"
                                            ErrorMessage="Only 4 digits Zip Code are allowed."
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. childhope@gmail.com" ID="txtOPEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRFV" runat="server" ErrorMessage="Please Enter Email" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOPEmailAdd" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="EmailREV" runat="server" ErrorMessage="Please Enter Email" Display="Dynamic" ForeColor="Red" Text="Invalid Email" ControlToValidate="txtOPEmailAdd" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="ex. 09672023265" ID="txtOPContactNum" runat="server" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ContactNumRFV" runat="server" ErrorMessage="Please Enter Contact Number" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOPContactNum" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="ContactNumREV" runat="server" ErrorMessage="Please Enter Contact Number" Display="Dynamic" ForeColor="Red" Text="Invalid Contact Number" ControlToValidate="txtOPContactNum" SetFocusOnError="true" ValidationExpression="\d+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mx-auto">
                                        <label>Date Established</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtOPDateEstab" runat="server" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="DateEstabRFV" runat="server" ErrorMessage="Please Enter Date" ForeColor="Red" Display="Dynamic" ControlToValidate="txtOPDateEstab" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6 mx-auto">
                                        <label>Put the number of all your Orphans</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtnumOrph" runat="server" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Number of orphans" ForeColor="Red" Display="Dynamic" ControlToValidate="txtnumOrph" SetFocusOnError="True"></asp:RequiredFieldValidator>                                      
                                    </div>
                                </div>




                            </div>

                            <div class="row">
                            </div>

                            <%--Sabotan pang certificates--%>
                            <div class="row" runat="server" id="divAttach">
                                <div class="col">
                                    <label>Attachments:</label><p style="font-size: 15px">Please attach the files needed below in single PDF file.</p>
                                    <p style="font-size: 13px; color: maroon; font-weight: bold;">DSWD Authority/Solicitation Permit.</p>
                                    <p style="font-size: 13px; color: maroon; font-weight: bold;">DSWD License.</p>
                                    <p style="font-size: 13px; color: maroon; font-weight: bold;">DSWD Accreditation.</p>
                                    <p style="font-size: 13px; color: maroon; font-weight: bold;">PNC Accreditation.</p>
                                    <p style="font-size: 15px">If you haven't merge your files, you can visit this website for merging <a href="https://www.ilovepdf.com/jpg_to_pdf" target="_blank">Merge PDF.</a>
                                    </p>
                                    <div class="form-group">
                                        <div class="card">
                                            <div class="card-body">
                                                <center>
                                                    <asp:FileUpload ID="OPFile" runat="server" AllowMultiple="True" /></center>
                                               <%-- <a href="#" id="addUploader" style="font-size:12pt; color:blue; text-decoration:underline;">Add Another</a>--%>
                                                <%--<asp:RequiredFieldValidator ID="FileUploadRFV" runat="server" ErrorMessage="Please Attach Images Only." Display="Dynamic" ForeColor="Red" ControlToValidate="OPFile" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                               <%-- <asp:RegularExpressionValidator ID="revPDF" runat="server" ControlToValidate="OPFile" ValidationExpression="(?i)^.*\.(jpg|jpeg|png)$" ErrorMessage="Please Attach Images Only." ForeColor="Red" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" runat="server" id="Credentials">
                                <div class="col">
                                                  <!--DSWD PERMITS -->
                <div class="row">
                   <div class="col">
                       <center>
                             <hr>
                       </center>
                   </div>
                </div>

                <div class="row">
                   <div class="col">
                       <h4>Accreditation</h4>
                   </div>
                </div>
                <br />

                <div class="row">
                    <div class="col">
                        <center><label>DSWD Authority/Solicitation Permit No:</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. DSWD-SB-SP-00013-2022" ID="txtPermit" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RVF1" runat="server" ErrorMessage="Please Authority/Solicitation Permit No." ForeColor="Red" Display="Dynamic" ControlToValidate="txtPermit" SetFocusOnError="True"></asp:RequiredFieldValidator>


                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>DSWD License:</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. DSWD-FO NCR-L-00058-2021" ID="txtLicense" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RVF2" runat="server" ErrorMessage="Please Enter License." ForeColor="Red" Display="Dynamic" ControlToValidate="txtLicense" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>DSWD Accreditation: </label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. DSWD-SB-A-216-2019" ID="txtAccreditation" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Accreditation." ForeColor="Red" Display="Dynamic" ControlToValidate="txtAccreditation" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>PNC Accreditation No:</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. 2021-004-January23, 2023" ID="txtPNC" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter PNC Accreditation No." ForeColor="Red" Display="Dynamic" ControlToValidate="txtPNC" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
           <%-- Background info ends--%>
                                </div>
                            </div>

                            <div class="row" runat="server" id="divAboutUs" visible="false">
                                <div class="col">
                                    <label>About Us:</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" placeholder="Enter your Orphanage Description here." ID="txtOPAboutUs" runat="server" TextMode="Multiline" Rows="5"></asp:TextBox>
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
                                <div class="col-md-6">
                                    <label>Username</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="txtOrphUsername" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="OrphUsernameRFV" runat="server" ErrorMessage="Please Enter Username" Display="Dynamic" ForeColor="Red" ControlToValidate="txtOrphUsername" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="txtOrphPassword" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                        <p style="font-size: 12px;">Password must be 6-10 characters long with at least one capital letter and one numeric character.</p>
                                        <asp:RequiredFieldValidator ID="OrphPassRFV" runat="server" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red" ControlToValidate="txtOrphPassword" SetFocusOnError="true"></asp:RequiredFieldValidator>                                        
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ErrorMessage="Invalid Password." ForeColor="Red" ValidationExpression="^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{6,10}$" ControlToValidate="txtOrphPassword" runat="server">
                                        </asp:RegularExpressionValidator>                                             
                                    </div>
                                     <input type="checkbox" onclick="myFunction()">&nbsp<asp:Label runat="server">Show password</asp:Label>
                                    <script>
                                        function myFunction() {
                                            var x = document.getElementById("txtOrphPassword");
                                            if (x.type === "password") {
                                                x.type = "text";
                                            } else {
                                                x.type = "password";
                                            }
                                        }
                                    </script>
                                </div>
                            </div>

                            <div class="row" runat="server" id="divProfPic" visible="false">
                                <div class="col-md-5 mx-auto">
                                    <label>Profile Picture</label>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="box">
                                                <asp:Image ID="imgOrph" runat="server" CssClass="img-thumbnail" Width="200px" Height="200px" />
                                            </div>
                                            <br />
                                            <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Orphanage Profile" onchange="ImagePreview(this);" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br />



                            <br />
                            <br />
                            <div class="row" runat="server" id="divPolicy">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:CheckBox ID="tacCheck" runat="server" />
                                        I agree to WarmHearts Terms of Service and Privacy Policy.
                                        </br>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Please Agree to our TOC and Privacy Policy" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator><br />

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btnSubmit" runat="server" Text="Sign Up" OnClick="btnSubmit_Click" />
                                    </div>
                                </div>
                            </div>





                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />

    </section>

</asp:Content>
