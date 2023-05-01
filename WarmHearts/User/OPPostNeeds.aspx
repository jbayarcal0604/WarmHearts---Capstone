<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="OPPostNeeds.aspx.cs" Inherits="WarmHearts.User.OPPostNeeds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

    function imagepreview(input){
    if(input.files && input.files[0])
        {   
            var fildr = new FileReader();
        fildr.onload = function (e) {
            $('#OPPostNeedsimgprw').attr('src', e.target.result);
        }
        fildr.readAsDataURL(input.files[0]);
        }
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPSponsorship" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPSponsorship_Click" />                                       
                                    </center>
                                </div>
                                <center>
                                    <label>Add Orphan</label>
                                </center>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPOrphanListID" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/list.png" OnClick="OPOrphanListID_Click"/>
                                    </center>
                                </div>
                                <center>
                                    <label>Orphan List</label>
                                </center>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPPstNeeds" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/pstneeds.png" OnClick="OPPstNeeds_Click" />                                       
                                    </center>
                                </div>
                                <center>
                                    <label>Post Needs</label>
                                </center>
                            </div>
                    
                        <div class="col">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OpVwDnrs" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png" OnClick="OpVwDnrs_Click" />
                                </center>
                            </div>
                            <center>
                                <label>View Donors</label>
                            </center>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OPVolunRqst" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vlnreqs.png" OnClick="OPVolunRqst_Click" />
                                </center>
                            </div>
                            <center>
                                <label>Requests</label>
                            </center>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OPreports" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/reprts.png" OnClick="OPreports_Click" />
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
                            <div class="col-md-4">
                                <center>
                                    <label>Add Images</label>
                                </center>
                            </div>

                            <div class="col-md-8">                           
                                    <div class="form-group">
                                        <div class="card">
                                            <div class="card-body">
                                                <center>
                                                    <asp:FileUpload ID="OPPostNeedsImgs" runat="server" onchange="imagepreview(this)"/> 
                                                    <img id="OPPostNeedsimgprw" />
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                            </div> 
                            
                             <div class="col-md-4">
                                <center>
                                    <label>Description</label>
                                </center>
                            </div>

                            <div class="col-md-8">                           
                                <div class="form-group">
                                    <center>
                                        <asp:TextBox CssClass="form-control" ID="txtOPPostNeedsDescription"  placeholder="Describe here the needs of your orphanage..." TextMode="Multiline" Rows="5" runat="server"></asp:TextBox>
                                    </center>
                                </div>
                            </div>
                        </div>  
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button  ID="OPPostNeedsPost" runat="server" Text="Post" class="btn btn-success btn-block btn-lg" />
                                    
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
