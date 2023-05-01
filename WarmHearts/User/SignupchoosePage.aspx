<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" AutoEventWireup="true" CodeBehind="SignupchoosePage.aspx.cs" Inherits="WarmHearts.User.SignupPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />

    <div class="container" style="border-radius: 2rem" >
        <div class="row">
            <div class="col">
                <center><h2>SIGN UP</h2></center>
                <center><h5>Are you an/a?</h5></center>
            </div>
        </div>
    </div>

    <div class="container" style="background-color: pink; padding-top: 15px; padding-bottom: 15px; border-radius: 2rem" >
        <div class="row">
            <div class="col-md-6">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <center>
                                    <img src="../BootstrapFiles/images/orphanageuser.png" width="300px" />
                                    <h3>Orphanage User</h3>                       
                                    <a href="SignupOrphanage.aspx" class="user_login">Click Here</a>
                                </center>               
                            </div>
                        </div>
                        
                    </div>
                </div> 
            </div>
            
            <div class="col-md-6">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                        <div class="row">                                               
                            <div class="col-md-6 mx-auto">
                                <center>
                                    <img src="../BootstrapFiles/images/donor.png" width="200px" />
                                    <h3>Donor User</h3>                                                           
                                    <a href="SignupDonor2.aspx" class="user_login">Click Here</a>                               
                                </center>               
                           </div>
                            
                        </div>
                        
                    </div>           
                </div>  
            </div>
        </div>     
     </div>
    <br />
    <br />

</asp:Content>
