<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WarmHearts.User.Homepage" %>

<%@ Import Namespace="WarmHearts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  

    <%--<script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

    </script>--%>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0" defer></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- top section -->
    <!-- top section -->
    <a id="Top"></a>
      <a id="orph"></a>
    <section class="offer_section layout_padding-bottom" style="background-color: pink">
        <div class="offer_container">
            <div class="container reveal">
              
                <div class="heading_container">
                    <br />
                    <br />

                    
                    <h2>Search Orphanage
                    </h2>
                </div>

                <br />
           
                <%-- try to get id --%>
                <asp:Label runat="server" ID="post"></asp:Label>
                <asp:Label runat="server" ID="idpost"></asp:Label>
                <asp:Label runat="server" ID="name"></asp:Label>
                <asp:Label runat="server" ID="email"></asp:Label>
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="border-radius: 1rem">
                            <div class="card-body">


                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString3 %>" SelectCommand="SELECT * FROM [OP_TABLE] WHERE ([OP_STAT] = @OP_STAT) ORDER BY CASE WHEN OP_TOTALDONATION IS NULL OR OP_TOTALDONATION = 0 THEN 1 ELSE 2 END, OP_TOTALDONATION">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Active" Name="OP_STAT" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView ID="GridView2" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" runat="server">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("OP_NAME") %>' Font-Bold="true"></asp:Label>

                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <hr />
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                           <img alt="" src="<%# Connection.Utils.GetImageUrl3( Eval("OP_IMG")) %>" width="200px" height="200px" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-8">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            Address:
                                                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("OP_ADD") %>' Font-Bold="True"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Number of Orphans:
                                                                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Text='<%# Eval("orp_num") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Total Donation:
                                                                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Text='<%# Eval("OP_TOTALDONATION") %>'></asp:Label>
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col">
                                                                    <center>

                                                                      <asp:LinkButton ID="lnkDonate" Text="Donate" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("OP_ID") %>' CommandName="donate" OnClick="lnkDonate_Click">Donate</asp:LinkButton>
                                                                       <asp:LinkButton ID="lnkVolunteer" Text="Volunteer" runat="server" CssClass="badge badge-info"  CommandArgument='<%# Eval("OP_ID") %>' CommandName="volunteer" OnClick="lnkVolunteer_Click" >Volunteer</asp:LinkButton>
                                                                       <asp:LinkButton ID="lnkView" Text="View" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("OP_ID") %>' CommandName="view"  OnClick="lnkView_Click">View Profile</asp:LinkButton>
                                                                    </center>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                               <%-- <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <table>
                                            <tr></tr>
                                        
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td> 
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("OP_NAME") %>' Font-Bold="true"></asp:Label>
                                            </td>

                                            <td>
                                                <img alt="" src="<%# Connection.Utils.GetImageUrl3( Eval("OP_IMG")) %>" width="100px" height="100px" />
                                            </td>

                                            <td>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("OP_ADD") %>' Font-Bold="True"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("OP_MAIL") %>'></asp:Label>
                                            </td>

                                            <td>
                                                 <asp:Label ID="Label15" runat="server" Font-Bold="True" Text='<%# Eval("OP_CONT") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </table>
                                    </FooterTemplate>
                                </asp:Repeater>--%>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <div class="modal fade" id="ModalVol" tabindex="-2" data-backdrop="static" data-keyboard="false"
            data-toggle="modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Request to volunteer</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <h4>Volunteer Details</h4>

                                <h4>You are sending request to
                                    <asp:Label ID="txtop" runat="server"></asp:Label></h4>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtFName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col">
                                <label>Middle Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtMidName" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtLName" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtAddress" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtContactNum" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="txtEmailAdd" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- end top section -->

    <a id="adoption"></a>
    <!-- adoption section -->
    <section class="about_section layout_padding" style="background-color: #696880">
        <div class="container reveal ">

            <div class="heading_container">
                <br />
                <br />
                <h2>Adoption
                </h2>
                <br />
                <br />
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="detail-box">
                        <p>
                            A good alternative for those who are unable to have children of their own is adoption. 
                        It is a life-saving event for the unborn kid as well as a saving grace for those whose lives cannot support the child.<br />
                            Here are the requirements and procedures on adopting a child in the Philippines.
                        </p>
                        <br />
                        <br />
                        <br />

                    </div>
                </div>

            </div>

            <div class="detail-box">
                <div class="heading_container">

                    <h2>Adoption Requirements
                    </h2>
                </div>
            </div>

            <br />
            <br />
            <div id="customCarousel2" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-25">
                                    <div class="detail-box">
                                        <h3>DOMESTIC ADOPTION </h3>
                                        <p>Adoption is a socio-legal process of providing a permanent home to a child whose parents have voluntarily or involuntarily relinquished parental authority over the child. </p>

                                        <div class="btn-box">
                                            <a href="https://fo4b.dswd.gov.ph/wp-content/uploads/2021/03/Application-Form-for-Adoption.pdf" class="btn2">Application Form
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item ">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-50">
                                    <div class="detail-box">
                                        <h3>WHO CAN AVAIL OF THE SERVICES </h3>
                                        <p>Any Filipino citizen or alien residing in the Philippines who has the following qualifications: </p>
                                        <p>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />Of legal age
                                            <br />
                                            <asp:CheckBox ID="CheckBox2" runat="server" />At least 16 years older than the adoptee, except when the adoptee is the biological parent or sibling of the adoptee of the spouse of the adoptee’s parent
                                            <br />
                                            <asp:CheckBox ID="CheckBox3" runat="server" />Has the capacity to act and assume all the rights and duties incident to the exercise of parental authority
                                            <br />
                                            <asp:CheckBox ID="CheckBox4" runat="server" />Is of good moral character and has not been convicted of a crime involving moral turpitude
                                            <br />
                                            <asp:CheckBox ID="CheckBox5" runat="server" />In a position to support , educate and care for his/her legitimate children and the child to be adopted
                                            <br />
                                            <asp:CheckBox ID="CheckBox6" runat="server" />Has undergone pre-adoptive services
                                        </p>

                                        <div class="btn-box">
                                            <a href="https://fo4b.dswd.gov.ph/wp-content/uploads/2021/03/Application-Form-for-Adoption.pdf" class="btn2">Application Form
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-25">
                                    <div class="detail-box">
                                        <h3>REQUIREMENTS FOR THE PROSPECTIVE ADOPTIVE PARENT (PAP) </h3>
                                        <p>
                                            <asp:CheckBox ID="CheckBox7" runat="server" />Authenticated birth certificate
                                            <br />
                                            <asp:CheckBox ID="CheckBox8" runat="server" />Marriage Contract or Divorce
                                            <br />
                                            <asp:CheckBox ID="CheckBox9" runat="server" />Written consent to the adoption of the legitimate, adopted or legitimate children living with the applicant who are aged 10 years old and above
                                            <br />
                                            <asp:CheckBox ID="CheckBox10" runat="server" />Income Tax
                                            <br />
                                            <asp:CheckBox ID="CheckBox11" runat="server" />Character references
                                            <br />
                                            <asp:CheckBox ID="CheckBox12" runat="server" />3X5 photo
                                            <br />
                                            <asp:CheckBox ID="CheckBox13" runat="server" />Certificate of Attendance to the Adoption Forum
                                            <br />
                                            <asp:CheckBox ID="CheckBox14" runat="server" />Home Study Report
                                            <br />
                                        </p>
                                        <div class="btn-box">
                                            <a href="https://fo4b.dswd.gov.ph/wp-content/uploads/2021/03/Application-Form-for-Adoption.pdf" class="btn2">Application Form
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-25">
                                    <div class="detail-box">
                                        <h3>REQUIREMENTS FOR THE PROSPECTIVE ADOPTIVE CHILD </h3>
                                        <p>
                                            <asp:CheckBox ID="CheckBox15" runat="server" />1 whole body picture
                                            <br />
                                            <asp:CheckBox ID="CheckBox16" runat="server" />Authenticated birth certificate or foundling certificate
                                            <br />
                                            <asp:CheckBox ID="CheckBox17" runat="server" />Written consent to adoption by the biological parent/s or the legal guardian
                                            <br />
                                            <asp:CheckBox ID="CheckBox18" runat="server" />Death certificate of biological parents or decree of abandonment or Deed of Voluntary Commitment
                                            <br />
                                            <asp:CheckBox ID="CheckBox19" runat="server" />Medical evaluation of the child and his/her parents
                                            <br />
                                            <asp:CheckBox ID="CheckBox20" runat="server" />Psychological evaluation
                                            <br />
                                            <asp:CheckBox ID="CheckBox21" runat="server" />A Child Study Report prepared by the licensed Social Worker of DSWD or child caring Agency not involved in the child placement
                                            <br />
                                        </p>

                                        <div class="btn-box">
                                            <a href="https://fo4b.dswd.gov.ph/wp-content/uploads/2021/03/Application-Form-for-Adoption.pdf" class="btn2">Application Form
                                            </a>
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
            <br />
            <div class="container">
                <ol class="carousel-indicators">
                    <li data-target="#customCarousel2" data-slide-to="0" class="active"></li>
                    <li data-target="#customCarousel2" data-slide-to="1"></li>
                    <li data-target="#customCarousel2" data-slide-to="2"></li>
                    <li data-target="#customCarousel2" data-slide-to="3"></li>
                </ol>
            </div>
        </div>
        <br />
        <br />

        <div class="row">
            <div class="col">
                <h1>
                    <center>Adoption Procedures</center>
                </h1>
            </div>
        </div>
        <br />



        <div class="item">
            <div class="container ">
                <div class="row">
                    <div class="col">
                        <div class="detail-box">

                            <div class="row">
                                <div class="col-md-4">
                                    <h3 style="text-decoration: underline">Step No.</h3>
                                    <p>&nbsp;</p>
                                </div>

                                <div class="col-md-4">
                                    <h3 style="text-decoration: underline">Client's Adoptive Parents</h3>
                                    <p>&nbsp;</p>
                                </div>

                                <div class="col-md-4">
                                    <h3 style="text-decoration: underline">Office Activity</h3>
                                    <p>&nbsp;</p>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        1
                                    </div>

                                    <div class="col">
                                        Proceed to the Retained Community Based Services Unit Field Office 1 for filing
                                    </div>

                                    <div class="col">
                                        Conduct adoption forum of counseling and discussion or required documents
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        2
                                    </div>

                                    <div class="col">
                                        Submission of required documents to the Social Welfare Officers II
                                    </div>

                                    <div class="col">
                                        Review and assess the documents for submission to the Child Placement Section (CPS).
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        3
                                    </div>

                                    <div class="col" style="color: #696880">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    </div>

                                    <div class="col">
                                        Conduct of home visit collateral interviews validation of submitted documents.
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        4
                                    </div>

                                    <div class="col" style="color: #696880">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    </div>

                                    <div class="col">
                                        ◉Conducts assessment of eligibility
                                        <br />
                                        ◉Drafts the Social Case Study Report (SCSR)
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        5
                                    </div>

                                    <div class="col" style="color: #696880">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    </div>

                                    <div class="col">
                                        ◉Provide input/comment on the draft SCSR
                                        <br />
                                        ◉Finalize the SCSR
                                        <br />
                                        ◉Review SCSR and other supporting documents Recommends approval of the SCSR
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        6
                                    </div>

                                    <div class="col">
                                        <span style="color: #696880">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span>
                                    </div>

                                    <div class="col">
                                        Presentation of the case for matching
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        7
                                    </div>

                                    <div class="col" style="text-decoration: underline; color: #696880">
                                        Lorem ipsum dolor sit amhuet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    </div>

                                    <div class="col">
                                        Pre-adoption placement for 6 month
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        8
                                    </div>

                                    <div class="col">
                                        Filing of adoption in court
                                    </div>

                                    <div class="col">
                                        <span style="color: #696880">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        9
                                    </div>

                                    <div class="col" style="color: #696880">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    </div>

                                    <div class="col">
                                        Provision of post adoption services
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>
                            </div>

                            <br />
                            <div class="row">
                                <div class="col">
                                    <div class="btn-box">
                                        <center>
                                            <a href="https://adoption.dswd.gov.ph/" class="btn2">Click this for more information
                                            </a>
                                        </center>
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
    <!-- end adoption section -->

    <a id="about"></a>
    <!-- about  us section -->
    <section class="about_section layout_padding">

        <div class="container reveal ">

            <div class="heading_container">
                <br />
                <br />
                <h2>About Us
                </h2>
                <br />
                <br />
            </div>
            <div class="row">
                <div class="col-md-6">

                    <div class="img-box">
                        <img src="../BootstrapFiles/images/illums1.png" alt="" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">

                            <h2>We are WarmHearts!
                            </h2>
                        </div>
                        <p>
                            It all started with a random letter. Several of those were joined forces to create a random word. 
                        The words decided to get together and form a random sentence. They decided not to stop there and it wasn't long before a random paragraph had been cobbled together. 
                        The question was whether or not they could continue the momentum long enough to create a random short story.
                        </p>
                        <a href="#">Read More
                        </a>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />





                    </div>
                </div>

            </div>

        </div>



    </section>
    <!-- end about  us section -->


    <a id="contact"></a>
    <!-- start contact  us section -->
    <section class="book_section layout_padding" style="background-color: floralwhite">
        <div class="container reveal">
            <div class="heading_container">
                <br />
                <br />
                <h2 class="text-dark">Contact Us
                </h2>
                <br />

                <div>
                    <h3 class="text-danger">We’d love to hear from you!
                    </h3>
                    <p>
                        Contact WarmHearts if you have any inquiries,<br />
                        concerns and suggestions on how we can improve our site.
                    </p>
                </div>


            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <input type="text" class="form-control" placeholder="Full Name" />
                        </div>
                        <div>
                            <input type="email" class="form-control" placeholder="Email Address" />
                        </div>

                        <div>
                            <input type="text" class="form-control" placeholder="Phone Number" />
                        </div>

                        <div>
                            <textarea id="txtarea1" cols="63" rows="4" class="form-control" placeholder=" Message"></textarea>
                        </div>

                        <div class="btn_box">
                            <button>
                                SEND
                            </button>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />


                        </div>

                    </div>
                </div>

            </div>
        </div>

    </section>

    <!-- end contact  us section -->

    <%-- MAP SECTION STARTS--%>

    <a id="maps"></a>
    <section class="book_section layout_padding" style="background-color: navajowhite">
       
        

                <h2 class="text-dark">ORPHANAGE MAP LOCATIONS
                </h2>

                        <script type="text/javascript">
                            var markers = [
                                <asp:Repeater ID="rptMarkers" runat="server">
                                    <ItemTemplate>
                                        {
                                            "title": '<%# System.DBNull.Value.Equals(Eval("OP_NAME")) ? "" : Server.HtmlEncode((string)Eval("OP_NAME")) %>',
                                             "lat": '<%# Eval("OP_LAT") %>',
                                             "lng": '<%# Eval("OP_LON") %>',
                                              "orp_num": '<%# Eval("orp_num") %>'

    }
                                    </ItemTemplate>

                                    <SeparatorTemplate>
                                        ,
                                    </SeparatorTemplate>
                                </asp:Repeater>
                            ];
                        </script>
                        <script type="text/javascript">
                            window.onload = function () {
                                var mapOptions = {
                                    center: new google.maps.LatLng(10.311780, 123.916412),
                                    zoom: 10,
                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                };
                                var infoWindow = new google.maps.InfoWindow();
                                var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                                for (i = 0; i < markers.length; i++) {
                                    var data = markers[i]
                                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                                    var marker = new google.maps.Marker({
                                        position: myLatlng,
                                        map: map,
                                        title: data.title
                                    });
                                    (function (marker, data) {
                                        google.maps.event.addListener(marker, "click", function (e) {
                                            infoWindow.setContent( data.title + "</br>" + "Number of Orphans: " + data.orp_num);
                                            infoWindow.open(map, marker);
                                        });
                                    })(marker, data);
                                }
                            }
                        </script>
                        <div id="dvMap" style="width: 100%; height: 800px;"">
                        </div>

           

     

    </section>









    <%-- MAP SECTION ENDS--%>
    <a id="laf"></a>
    <!-- Lost and Found Section -->
    <section class="offer_section layout_padding-bottom" style="background-color: lightblue">
        <div class="offer_container reveal">
            <div class="container">
                <div class="heading_container">
                    <br />
                    <br />
                    <h2>Lost And Found
                    </h2>
                    <br />
                    <br />
                </div>

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="border-radius: 1rem">
                            <div class="card-body">
                                <div class="row" id="srchmissing1" runat="server">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                <h2>Missing Children</h2>
                                                <p>You can track here what you're looking for.</p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <center>
                                                    <hr>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="row">                         
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <input class="form-control mr-sm-2" type="search" placeholder="ex. Walter O'Brien" aria-label="Search for Name"/>
                                                <asp:TextBox class="form-control mr-sm-2"  ID="txtMissingSearch" placeholder="ex. Walter O'Brien" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <input class="btn btn-info btn-block" type="button" ID="btnOPVDSearch" value="Search" runat="server" />
                                                <asp:Button class="btn btn-info btn-block" ID="btnMissingSearch" runat="server" Text="Search" />
                                            </div>
                                        </div>
                                                                     
                                   </div>--%>



                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString3 %>" SelectCommand="SELECT * FROM [LostChild_TABLE]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView ID="GridView1" class="table table-striped table-bordered" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" runat="server">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    Name:
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("LC_Fname") %>' Font-Bold="True"></asp:Label>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("LC_Lname") %>' Font-Bold="True"></asp:Label>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("LC_MI") %>' Font-Bold="True"></asp:Label>

                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <hr />
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            <asp:Image ID="Image1" Width="200px" Height="200px" class="img-fluid" ImageUrl='<%# Eval("LC_Image") %>' runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-8">
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Location Lost:
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("LC_Location") %>' Font-Bold="True"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Date Lost:
                                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("LC_DateLost") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Time Lost:
                                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("LC_TimeLost") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div>
                                                                        <hr />
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Guardian Name: 
                                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("LCGuardian_Fname") %>'></asp:Label>
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("LCGUardian_Lname") %>'></asp:Label>
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("LCGUardian_MI") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Email: 
                                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("LCGuardian_Email") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            Contact Number: 
                                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("LCGuardian_ContactNumber") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-8" style="margin-top: 30px">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-8 mx-auto">
                        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="border-radius: 1rem">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h2>Lost a child?</h2>
                                        <p>No Worries! Submit here we will try our best to find your child.</p>
                                    </div>
                                </div>
                                <div class="row" id="filemissing" runat="server">
                                    <div class="col-md-5 mx-auto">
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnSubmitLostChild" runat="server" Text="Submit Lost Child" OnClick="btnSubmitLostChild_Click" />
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

    <!-- end Lost and Found Section -->
    <section>
        <%-- <%-- REVEAL ELEMENTS SCRIPT --%>
        <script>
            window.addEventListener('scroll', reveal);

            function reveal() {
                var reveals = document.querySelectorAll('.reveal');

                for (var i = 0; i < reveals.length; i++) {


                    var windowheight = window.innerHeight;
                    var revealtop = reveals[i].getBoundingClientRect().top;
                    var revealpoint = 150;

                    if (revealtop < windowheight - revealpoint) {
                        reveals[i].classList.add('active');
                    }
                    else {
                        reveals[i].classList.remove('active');
                    }
                }

            }
        </script>

    </section>
</asp:Content>
