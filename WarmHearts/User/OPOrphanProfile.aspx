<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="OPOrphanProfile.aspx.cs" Inherits="WarmHearts.User.OrphanProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
       <br />
       <br />
        <div class="offer_container">
            <div class="container">
                <div class="row">
                <div class="col">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">
                        <div class="row">
                            <div class="col mx-auto">                                                                    
                                <asp:Image ID="Image1" height="400px" Width="100%" runat="server"  src="../BootstrapFiles/images/cscs.png"/>                                          
                            </div>                                                      
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="235px" placeholder="Enter orphan name"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text="Search" />
                                </center>
                            </div>
                        </div>   
                        
                      <hr />

                     <div class="row">
                            <div class="col-md-4"> 
                                <div class="box"> 
                                    <center>
                                    <asp:Image ID="OPimgProfile" height="200px" Width="200px" runat="server"  src="../BootstrapFiles/images/dnrprofile.png"/>                                     

                                    </center>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <h2>Profile</h2>
                                
                                <div class="row">
                                    <div class="col-md-4">
                                        <label> Fullname:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6>James Smith</h6>
                                    </div>                                                                     
                                </div>

                                <div class="row">
                                    <div class="col-md-4">                                                                        
                                        <label>Age:</label>                                       
                                    </div>
                                    <div class="col-md-8">
                                        <h6>16 </h6>
                                    </div>
                                </div>
                                    
                                <div class="row">
                                    <div class="col-md-4">
                                        <label> Date of Birth:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6> May 30, 2001
                                           </h6>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label> Gender:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6> Male </h6>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4">
                                        <label>Place of birth:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6>Cebu City</h6>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4">
                                        <label>Current grade level:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6>8 </h6>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label>School name:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6>Cebu technological University </h6>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4">
                                        <label>Hobbies:</label>
                                    </div>
                                    <div class="col-md-8"> 
                                        <h6>Playing games and reading books</h6>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4">
                                        <label>Dreams:</label>
                                    </div>
                                    <div class="col-md-8"> 
                                        <h6>To Become A Pilot</h6>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4">
                                        <label>Status:</label>
                                    </div>
                                    <div class="col-md-8">
                                        <h6>
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>Active</asp:ListItem>
                                                <asp:ListItem>Of-Age</asp:ListItem>
                                                <asp:ListItem>Adopted</asp:ListItem>
                                                <asp:ListItem>Deceased</asp:ListItem>

                                            </asp:DropDownList> </h6>
                                    </div>


                                </div>
                            </div>
                        </div>
    

                       <hr />

                    <div class="row">                                                 
                        <div class="col">
                            <div class="form-group">
                                <center>
                                    <asp:ImageButton ID="OpVwDnrs" height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png"  />
                                </center>
                            </div>
                            <center>
                                <label>Update</label>
                            </center>
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
