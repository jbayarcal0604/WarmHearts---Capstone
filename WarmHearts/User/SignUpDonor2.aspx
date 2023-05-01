<%@ Page Title="" Language="C#" MasterPageFile="~/User/LOGSIGN.Master" AutoEventWireup="true" CodeBehind="SignUpDonor2.aspx.cs" Inherits="WarmHearts.User.SignUpDonor2" %>

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
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

          <%--   checkbox validator--%>
     <script type = "text/javascript">
         function ValidateCheckBox(sender, args) {
             if (document.getElementById("<%=tacCheck.ClientID %>").checked == true) {
                 args.IsValid = true;
             } else {
                 args.IsValid = false;
             }
         }
     </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <section class="offer_section layout_padding-bottom" style="background-color: pink">
    <div class="offer_container">
    <div class="container" >
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">

                        <%--  Label Message--%>
                        <div class="align-self-end">
                            <br />
                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col">
                               
                                <h6>DONOR</h6>
                                 <center>
                               <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Create Account</h2>"></asp:Label>
                                     </center>
                            </div>
                        </div>

                        <!--Personaol Info -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h4>Personal Information</h4>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Juan" ID="txtFName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FNameRFV" runat="server" ErrorMessage="Please Enter First Name" ForeColor="Red" 
                                        Display="Dynamic" ControlToValidate="txtFName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col">
                                <label>Middle Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Pablo" ID="txtMidName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Dela Cruz" ID="txtLName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LNameRFV" runat="server" ErrorMessage="Please Enter Last Name" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. A. Gabuya St." ID="txtAddress" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AddressRFV" runat="server" ErrorMessage="Please Enter Address" ForeColor="Red" Display="Dynamic" ControlToValidate="txtAddress" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. CarCar City" ID="txtProvince" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ProvinceRFV" runat="server" ErrorMessage="Please Enter Province" ForeColor="Red" Display="Dynamic" ControlToValidate="txtProvince" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. 6000" ID="txtZipCode" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ZipCodeRFV" runat="server" ErrorMessage="Please Enter Zip Code" ForeColor="Red" Display="Dynamic" ControlToValidate="txtZipCode" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Birth Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBday" runat="server" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="BdayRFV" runat="server" ErrorMessage="Please Enter Birth Date" ForeColor="Red" Display="Dynamic" ControlToValidate="txtBday" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. 09622023244" ID="txtContactNum" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ContactNumRFV" runat="server" ErrorMessage="Please Enter Contact Number" ForeColor="Red" Display="Dynamic" ControlToValidate="txtContactNum" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="ContactNumREV" runat="server" ErrorMessage="Please Enter Contact Number" Display="Dynamic" ForeColor="Red" Text="Invalid Contact Number" ControlToValidate="txtContactNum" SetFocusOnError="true" ValidationExpression="\d+$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. juandelacruz@gmail.com" ID="txtEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailAddRFV" runat="server" ErrorMessage="Please Enter Email" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmailAdd" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="EmailAddREV" runat="server" ErrorMessage="Please Enter Email" Display="Dynamic" ForeColor="Red" Text="Invalid Email" ControlToValidate="txtEmailAdd" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                              <!--Background Info -->
                <div class="row">
                   <div class="col">
                       <center>
                             <hr>
                       </center>
                   </div>
                </div>

                <div class="row">
                   <div class="col">
                       <h4>Background Information</h4>
                   </div>
                </div>
                <br />

                <div class="row">
                    <div class="col">
                        <center><label>Education</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. BSIT" ID="txtEducation" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="EducRVF" runat="server" ErrorMessage="Please Enter Course." ForeColor="Red" Display="Dynamic" ControlToValidate="txtEducation" SetFocusOnError="True"></asp:RequiredFieldValidator>


                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>School/University</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. Cebu Technological University" ID="txtSchoolUniv" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="SchoolRFV" runat="server" ErrorMessage="Please Enter School." ForeColor="Red" Display="Dynamic" ControlToValidate="txtSchoolUniv" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>Work</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. Web Developer" ID="txtWork" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Work." ForeColor="Red" Display="Dynamic" ControlToValidate="txtWork" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center><label>Place of Work</label></center>
                        <div class="form-group">
                            <asp:TextBox Class="form-control" placeholder="ex. IT Park" ID="txtPlaceWork" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Place Of work." ForeColor="Red" Display="Dynamic" ControlToValidate="txtPlaceWork" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
           <%-- Background info ends--%>

          
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="txtDonorUsername" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="DonUsernameRFV" runat="server" ErrorMessage="Please Enter Username" Display="Dynamic" ForeColor="Red" ControlToValidate="txtDonorUsername" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="txtDonorPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red" ControlToValidate="txtDonorPassword" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:regularexpressionvalidator id="RegularExpressionValidator3" display="Dynamic" errormessage="Password must be 8-10 characters long</br> with at least one numeric character." forecolor="Red" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" controltovalidate="txtDonorPassword" runat="server">
</asp:regularexpressionvalidator>

                                    <!--ayohonon pa ang custom validator-->
                                </div>
                            </div>
                        </div>                       

                        <div class="row">
                            <div class="col-md-5 mx-auto">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="box">
                                            <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" Width="200px" Height="200px"/>
                                        </div>
                                        <br />
                                        <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Donor Profile" onchange="ImagePreview(this);" />

                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row" id="divPolicy" runat="server">
                            <div class="col">
                                <div class="form-group">
                                    <asp:CheckBox ID="tacCheck" runat="server" />
                                    I agree to WarmHearts Terms of Service and Privacy Policy.    
                                     </br>
                          <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Please Agree to our TOC and Privacy Policy" 
                              ClientValidationFunction = "ValidateCheckBox"></asp:CustomValidator><br />
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
    </div>
</section>
</asp:Content>
