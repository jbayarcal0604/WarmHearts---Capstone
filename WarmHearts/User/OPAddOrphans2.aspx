<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="OPAddOrphans2.aspx.cs" Inherits="WarmHearts.User.OPAddOrphans2" %>
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
                    $('#<%=imgOrph.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="card" style="border-radius: 2rem">
                            <div class="card-body">

                                <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPSponsorshipbtn" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/addorphan.png" OnClick="OPSponsorshipbtn_Click" CausesValidation="false"/>
                                    </center>
                                </div>
                                <center>
                                    <label>Add Orphan</label>
                                </center>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPOrphanListID" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/list.png" OnClick="OPOrphanListID_Click" CausesValidation="false" />
                                    </center>
                                </div>
                                <center>
                                    <label>Orphan List</label>
                                </center>
                            </div>


                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OpVwDnrs" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vwdnrs.png" OnClick="OpVwDnrs_Click" CausesValidation="false"/>
                                    </center>
                                </div>
                                <center>
                                    <label>View Donors</label>
                                </center>
                            </div>

                            <div class="col">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPVolunRqst" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/vlnreqs.png" OnClick="OPVolunRqst_Click" CausesValidation="false"/>
                                    </center>
                                </div>
                                <center>
                                    <label>Requests</label>
                                </center>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <center>
                                        <asp:ImageButton ID="OPreports" Height="100px" Width="100px" runat="server" ImageUrl="../BootstrapFiles/images/reprts.png" OnClick="OPreports_Click" CausesValidation="false"/>
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
                            <div class="col-md-3 mx-auto">
                                <h2>Orphan Profile</h2>
                                <div class="box">
                                    <asp:Image ID="imgOrph" runat="server" CssClass="img-thumbnail" Width="100%" Height="200px" />

                                </div>
                                <br />
                                <asp:FileUpload ID="FileImg" runat="server" CssClass="form-control" onchange="ImagePreview(this);"></asp:FileUpload>
                                <div>
                                </div>

                                <br />
                                <div class="col-md-9">
                                 <asp:TextBox CssClass="form-control" ID="orphID" placeholder="Orphan ID" runat="server"></asp:TextBox>
                                <asp:Button  class="form-control btn btn-primary" runat="server" Text="Go" ID="goBtn" OnClick="goBtn_Click" CausesValidation="false"  />
                            </div>


                                <%-- <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAddOrphanProfile" runat="server" Text="Add Picture" />            --%>
                            </div>

                             
                           
                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>

                            <div class="col">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="ex. Skyler" ID="FnameText" runat="server"></asp:TextBox>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Last Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex. Reyess" ID="LnameText" runat="server"></asp:TextBox>
                                            <asp:HiddenField ID="hdnID" runat="server" Value="0" />

                                        </div>
                                    </div>
                                </div>

                               <%-- <div class="row">
                                    <div class="col">
                                        <label>Age</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex.13" ID="AgeText" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col">
                                        <label>Date Of Birth</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtBday" runat="server" TextMode="Date"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Gender</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="ddlGender" runat="server">
                                                 <asp:ListItem Selected="True" Text="Select" Value="" />
                                                <asp:ListItem Text="Male" Value="Male" />
                                                <asp:ListItem Text="Female" Value="Female" />
                                              
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Specific Needs</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="ex. Medicine" ID="txtNeeds" runat="server"></asp:TextBox>
                                            <%--<asp:HiddenField ID="HiddenField1" runat="server" Value="0" />--%>         
                                            <asp:RequiredFieldValidator ID="RVneeds" runat="server" ErrorMessage="Please input needs." ForeColor="Red" Display="Dynamic" ControlToValidate="txtNeeds" SetFocusOnError="true"></asp:RequiredFieldValidator>              
                                            <asp:RegularExpressionValidator
                                            ID="revInput"
                                            runat="server"
                                            ControlToValidate="txtNeeds"
                                            ValidationExpression="^[a-zA-Z0-9'\s]*$"
                                            ErrorMessage="Special characters are not allowed."
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                        </div>
                                    </div>        
                                </div>

                                 <div class="row">                                  
                                    <div class="col mx-auto">
                                        <label>Priority</label>
                                        <div class="form-group">                                                                                    
                                            <asp:DropDownList class="form-control" ID="ddlPrio" runat="server">
                                                 <asp:ListItem Selected="True" Text="Select" Value="" />
                                                 <asp:ListItem Text="High Priority" Value="High Priority" />
                                                 <asp:ListItem Text="Normal Priority" Value="Normal Priority" />
                                                 <asp:ListItem Text="Low Priority" Value="Low Priority" />                                           
                                            </asp:DropDownList>   
                                            <asp:RequiredFieldValidator ID="RVddl" runat="server" ErrorMessage="Please select a priority." ForeColor="Red" Display="Dynamic" ControlToValidate="ddlPrio" SetFocusOnError="true"></asp:RequiredFieldValidator>                                                         
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label>Description</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="Please enter the child's description." 
                                                ID="dscrpTEXT" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                 

                                <%--CHECKBOX--%>
                          <%--      <div class="row">
                                    <div class="col">
                                        <label></label>
                                        <div class="form-group">
                                            <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Active" />
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col">
                                        <%-- <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button1" runat="server" Text="Submit" />            --%>
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Add" OnClick="btnAddorUpdate_Click" />

                                        <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button2" runat="server" Text="Update" Onclick="Button2_Click1" />
                                        <br />
                                        <br />
                                        <br />

                                          <div class="pcoded-inner-content pt-0">
                                            <div class="align-align-self-end">
                                                <center>
                                                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                                                </center>
                                            </div>
                                         </div>                                     
                                    </div>
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
