<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="DnrProfile2.aspx.cs" Inherits="WarmHearts.User.DnrProfile" %>

<%@ Import Namespace="WarmHearts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
<%--          <script type="text/javascript"> 
              $(document).ready(function () {
                  $('#<%=GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
              });             
          </script>--%>


     <script type="text/javascript"> 
         $(document).ready(function () {
             $('#<%=GridView2.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
              });
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <%
        string imageUrl = Session["DONOR_PIMAGE"].ToString();
    %>


    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <h2>User Profile</h2>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex">
                                    <div class="image-container">
                                        <img src="<%= Connection.Utils.GetImageUrl(imageUrl) %>" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                        <div class="middle pt-2">
                                            <a href="SignUpDonor2.aspx?id=<%Response.Write(Session["DONOR_ID"]); %>" class="btn btn-warning">
                                                <i class="fa fa-pencil"></i>Edit Details
                                            </a>
                                        </div>
                                    </div>

                                    
                                </div>
                                <br />
                                
                      
                            </div>
                            

                            <div class="row">
                                <div class="col">
                                 <!-- BASIC INFO START -->
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                       

                                        <li class="nav-item">
                                        <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab"
                                            href="#basicInfo" role="tab" aria-controls="basicInfo"
                                            aria-selected="true"><i class="fa fa-id-badge mr-2"></i>Basic Info</a>
                                        </li>


                                    <li class="nav-item">
                                        <a class="nav-link  text-info" id="Donation-tab" data-toggle="tab"
                                            href="#Donation" role="tab" aria-controls="Donation"
                                            aria-selected="false"><i class="fa fa-clock-o mr-2"></i>Donation History</a>
                                    </li>
                                        
                                        <li class="nav-item">
                                        <a class="nav-link  text-info" id="Sponsor-tab" data-toggle="tab"
                                            href="#Sposnor" role="tab" aria-controls="Sponsor"
                                            aria-selected="false"><i class="fa fa-clock-o mr-2"></i>Sponsor</a>
                                    </li>

                                    </ul>

                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">                                 
                                            <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Full Name:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_FNAME")  %>&nbsp  <%# Eval("DONOR_MNAME")  %>&nbsp  <%# Eval("DONOR_LNAME")  %>
                                                    </div>
                                                </div>
                                        
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Address:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_ADD")  %>
                                                    </div>
                                                </div>

                                                <hr />
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Email Address:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_EMAIL")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Contact Number:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_CONT")  %>
                                                    </div>
                                                </div>
                                                <hr />


                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Zip code:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_ZIPCODE")  %>
                                                    </div>

                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Birthday:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_BDAY")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Contact Number:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_CONT")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Email Address:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_EMAIL")  %>
                                                    </div>
                                                </div>
                                               
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Course Graduated:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_EDUC")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>School Graduated:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_SCHOOLGRAD")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Work:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_WORK")  %>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label><b>Place of Work:</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <%# Eval("DONOR_PWORK")  %>
                                                    </div>
                                                </div>
                                                <hr />
                                            </ItemTemplate>
                                        </asp:Repeater> 
                                        </div>

                                        <div class="tab-pane fade" id="Donation" role="tabpanel" aria-labelledby="Donation-tab">
                                            <asp:Repeater ID="Rep2" runat="server">
                                             <HeaderTemplate>
                                                <div class="row">
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Orphanage Name</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Amount</b></label>
                                                    </div>
                                                  <%--  <div class="col">
                                                        <label style="font-size: 18px;"><b>Supplies</b></label>
                                                    </div>--%>
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Date and Time</b></label>
                                                    </div>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Label ID="lblfname" runat="server" Text='<%# Eval("D_OPNAME")  %>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("D_AMOUNT")%>'></asp:Label>
                                                    </div>

                                                    <%--<div class="col">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("D_SUPPLIES")  %>'></asp:Label>
                                                    </div>--%>

                                                    <div class="col">
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("D_DATETIME") %>'></asp:Label>
                                                    </div>
                                                </div>                   
                                            </ItemTemplate>
                                        </asp:Repeater>
                                            <hr />
                                            <asp:Repeater ID="Repeater2" runat="server">
                                             <HeaderTemplate>
                                                <div class="row">
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Orphanage Name</b></label>
                                                    </div>
                                                    
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Supplies</b></label>
                                                    </div>
                                                     <div class="col">
                                                        <label style="font-size: 18px;"><b>Scheduled Date</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Scheduled Time</b></label>
                                                    </div>
                                                    <div class="col">
                                                        <label style="font-size: 18px;"><b>Date and Time</b></label>
                                                    </div>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Label ID="lblfname" runat="server" Text='<%# Eval("Op_name")  %>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("Needs_name")%>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Needs_Sched")  %>'></asp:Label>
                                                    </div>
                                                     <div class="col">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Needs_Time")  %>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                                    </div>
                                                </div>                   
                                            </ItemTemplate>
                                        </asp:Repeater>

                                          <%--  <asp:GridView ID="GridView1" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" runat="server">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                             <div class="row">
                                                    <div class="col">
                                                        <label>Orphanage Name</label>
                                                    </div>
                                                    <div class="col">
                                                        <label>Amount</label>
                                                    </div>
                                                    <div class="col">
                                                        <label>Supplies</label>
                                                    </div>
                                                    <div class="col">
                                                        <label>Date and Time</label>
                                                    </div>
                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                             <div class="row">
                                                    <%--<div class="col">
                                                        <asp:Label ID="lblfname" runat="server" Text='<%# Eval("D_OPNAME")  %>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("D_AMOUNT")%>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("D_SUPPLIES")  %>'></asp:Label>
                                                    </div>

                                                    <div class="col">
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("D_DATETIME")  %> '></asp:Label>
                                                    </div>
                                                </div>                   
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString %>" SelectCommand="SELECT * FROM DONATION WHERE ([DON_ID] = @DONOR_ID)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="DONOR_ID" SessionField="DONOR_ID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>
                                            
                                        </div>

                                        <div class="tab-pane fade" id="Sposnor" role="tabpanel" aria-labelledby="Sponsor-tab">

                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound"  AutoPostBack="True">
                                    <Columns>
                                      <%--   <asp:BoundField DataField="D_OPNAME" HeaderText="ORPHANAGE NAME" SortExpression="D_OPNAME" />--%>
                                        <asp:BoundField DataField="D_ORPHAN" HeaderText="Orphan Name" SortExpression="D_ORPHAN" />
                                        <asp:BoundField DataField="D_AMOUNT" HeaderText="Amount" SortExpression="D_AMOUNT" />
                                        <asp:BoundField DataField="D_SPSDATE" HeaderText="Start" SortExpression="D_SPSDATE" />
                                        <asp:BoundField DataField="D_SPEDATE" HeaderText="End" SortExpression="D_SPEDATE" />
                                        <asp:BoundField DataField="orphan_ID" HeaderText="Orphan ID" SortExpression="orphan_ID" visible="true"/>
                                        <asp:BoundField DataField="ORPH_ID" HeaderText="Orphanage ID" SortExpression="ORPH_ID" visible="true"/>
                                        <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" Text="Donate" OnClick="Button1_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString4 %>" SelectCommand="SELECT [D_ORPHAN], [D_AMOUNT], [D_SPSDATE], [D_SPEDATE], [orphan_ID], [ORPH_ID] FROM [DONATION] WHERE (([DON_ID] = @DON_ID) AND ([orphan_ID] IS NOT NULL))">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="DON_ID" SessionField="DONOR_ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                           <%-- <asp:GridView ID="GridView2" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound"  AutoPostBack="True">
                                                <Columns>
                                                    <asp:TemplateField>
                                       <HeaderTemplate>
                                           <div class="row">
                                               <div class="col">
                                                   <label>Orphan ID</label>
                                               </div>
                                               <div class="col">
                                                   <label>Orphanage Name</label>
                                               </div>
                                               <div class="col">
                                                   <label>Orphan Name</label>
                                               </div>
                                               <div class="col">
                                                   <label>Donation Amount</label>
                                               </div>
                                               <div class="col">
                                                   <label>Start</label>
                                               </div>
                                               <div class="col">
                                                   <label>End</label>
                                               </div>
                                               <div class="col">
                                                   <label></label>
                                               </div>
                                           </div>
                                       </HeaderTemplate>
                                       <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col">
                                                       <asp:Label ID="Label5" runat="server" Text='<%# Eval("orphan_ID") %>'></asp:Label>
                                                   </div>

                                                   <div class="col">
                                                       <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_OPNAME") %>'></asp:Label>
                                                   </div>

                                                   <div class="col">
                                                       <asp:Label ID="lblAge" runat="server" Text='<%# Eval("D_ORPHAN") %>'></asp:Label>
                                                   </div>
                                                                                                     
                                                   <div class="col">
                                                       <asp:Label ID="lblGender" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                                   </div>
                                                   
                                                   <div class="col">
                                                       <asp:Label ID="lblBday" runat="server" Text='<%# Eval("D_SPSDATE") %>'></asp:Label>
                                                   </div>

                                                   <div class="col">
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("D_SPEDATE") %>'></asp:Label>
                                                   </div>

                                                   <div class="col">
                                                       <asp:Button ID="Button1" class="btn btn-primary btn-block btn-sm" runat="server" Text="Donate" OnClick="Button1_Click" />
                                                   </div>
                                               </div>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString4 %>" SelectCommand="SELECT [D_OPNAME], [D_ORPHAN], [D_AMOUNT], [D_SPSDATE], [D_SPEDATE], [orphan_ID], [ORPH_ID] FROM [DONATION] WHERE (([DON_ID] = @DON_ID) AND ([orphan_ID] IS NOT NULL))">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="DON_ID" SessionField="DONOR_ID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>

                                         <%--   <asp:Repeater ID="Repeater2" runat="server">
                                                 <HeaderTemplate>
                                                <table class="table data-table-export table-hover nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="table-plus">Orphan ID</th>
                                                            <th>Orphanage Name</th>
                                                            <th>Orphan Name</th>
                                                            <th>Donation Amount</th> 
                                                            <th>Start</th>
                                                            <th>End</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>                                              
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="table-plus">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("orphan_ID") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_OPNAME") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAge" runat="server" Text='<%# Eval("D_ORPHAN") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("D_AMOUNT") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBday" runat="server" Text='<%# Eval("D_SPSDATE") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("D_SPEDATE") %>'></asp:Label>
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
                </div>
            </div>
         </div>
    </section>

    

</asp:Content>
