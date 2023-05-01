<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SubmitFoundChildPage.aspx.cs" Inherits="WarmHearts.User.SubmitFoundChildPage" %>
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
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <section class="offer_section layout_padding-bottom" style="background-color: pink;" >
    <div class="offer_container">
    <div class="container">
        <div class="row" >
            <div class="col">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                
                    <div class="row">
                        <div class="col">
                            <center><h2>Submit Found Child</h2></center>
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
                                    <asp:TextBox CssClass="form-control" placeholder="First Name" ID="txtSFCPFName" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    
                        <div class="col-md-4">
                            <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Last Name" ID="txtSFCPLName" runat="server"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-4">
                            <label>Middle Initial</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Middle Initial" ID="txtSFCPMI" runat="server"></asp:TextBox>
                                </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Location</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Location" ID="txtSFCPLoccation" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    
                        <div class="col-md-4">
                            <label>Date Lost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSFCPDateLost" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-4">
                            <label>Time Lost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSFCPTimeLost" runat="server" TextMode="Time"></asp:TextBox>
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
                                                <asp:FileUpload ID="SFCPimg" runat="server" CssClass="form-control" onchange="ImagePreview(this);"/>                                        
                                            </center>
                                        </div>
                                        <div class="pcoded-inner-content pt-0">
                                            <div class="align-align-self-end">
                                                <center>
                                                    <asp:Label ID="SFCPlblMsg" runat="server" Visible="false"></asp:Label>
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
                                    <asp:TextBox CssClass="form-control" placeholder="ex. John" ID="txtSFCPContactInfoFName" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    
                        <div class="col-md-4">
                            <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Doe" ID="txtSFCPContactInfoLName" runat="server"></asp:TextBox>
                                </div>
                        </div>

                        <div class="col-md-4">
                            <label>Middle Initial</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Q" ID="txtSFCPContactInfoMI" runat="server"></asp:TextBox>
                                </div>
                        </div>                           
                    </div>
                
                <div class="row">
                    <div class="col-md-6">
                            <label>Email Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" placeholder="ex. neilzkcrew@gmail.com" ID="txtSFLPEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                    

                        <div class="col-md-6">
                            <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. 09237702918" ID="txtSFLPContactNum" runat="server" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                </div>

                
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Button class="btn btn-info btn-block btn-lg" ID="btnSFCPPublish" runat="server" Text="Publish" OnClick="btnSFCPPublish_Click" />
                        </div>
                    </div>


                    <div class="col">
                        <div class="form-group">
                            <asp:Button class="btn btn-success btn-block btn-lg" ID="btnNearbyDropIns" runat="server" Text="View Nearby Drop-Ins"  />
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
            </div>
     </div>
    </div>
    </div>
    </section>

</asp:Content>
