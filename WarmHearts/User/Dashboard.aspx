<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WarmHearts.User.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%--    JavaScript Api--%>
    <%--<script src="../BootstrapFiles/js/mapsapi.js" type="text/javascript"></script>--%>

   <script>

       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
   </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
     <h1>  &nbsp; Dashboard Page</h1>

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
                                            <h2>USER LOGS</h2>
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
                                   <div class="col">
                                       <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString3 %>" SelectCommand="SELECT * FROM [USERLOGS_TBL]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView ID="GridView1" class="table table-striped table-bordered" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" runat="server">
                                            <Columns>
                                                <asp:boundfield datafield="OP_ID" readonly="true"  headertext="OP_ID"/> 
                                                <asp:boundfield datafield="DONOR_ID" readonly="true"  headertext="DONOR_ID"/> 
                                                <asp:boundfield datafield="TIMESTAMPP" readonly="true"  headertext="TIMESTAMPP"/> 
                                                <asp:boundfield datafield="ACTIVITY" readonly="true"  headertext="ACTIVITY"/> 
                                             <%--    <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                             <div class="row">
                                                              <div class="col-lg-3">

                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("OP_ID") %>' Font-Bold="True"></asp:Label>

                                                                    <div class="row">
                                                                        <div class="col-lg">
                                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("DONOR_ID") %>' Font-Bold="True"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-8">
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TIMESTAMPP") %>' Font-Bold="True"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("ACTIVITY") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                   </div>
                               </div>

                                
                               
                                </div>
                      


                            </div>

                            <div></div>

                        </div>

                    </div>
                </div>
            </div>
    </section>






</asp:Content>
