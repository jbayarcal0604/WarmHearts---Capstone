<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SampleGridview.aspx.cs" Inherits="WarmHearts.User.SampleGridview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1>Sample</h1>




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
                                <center>
                                    <h2>Sample Dropdown</h2>
                                </center>
                                <div>
                                    <hr />

                                </div>

                                <div class="col">
                                    <div class="row">

                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="True" Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B"
                                            HeaderStyle-BackColor="green" OnPageIndexChanging="OnPaging">
                                            <AlternatingRowStyle BackColor="#C2D69B"></AlternatingRowStyle>
                                            <Columns>
                                                <asp:BoundField DataField="Fname" HeaderText="First Name" SortExpression="First Name" />
                                                <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Last Name" />
                                                <asp:BoundField DataField="priorty" HeaderText="priorty" SortExpression="priorty" />

                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        PRIORITY LEVEL: 
                                                        <asp:DropDownList ID="ddlCountry" runat="server" OnSelectedIndexChanged="CountryChanged"
                                                            AutoPostBack="true" AppendDataBoundItems="true">
                                                            <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                            <asp:ListItem Text="Top 10" Value="10"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </HeaderTemplate>
                                                     <ItemTemplate>
                                                    <%# Eval("priorty") %>
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                                               <%-- <asp:BoundField DataField="Postal" HeaderText="Postal" SortExpression="Postal" />--%>
                                            </Columns>

                                            <HeaderStyle BackColor="Green"></HeaderStyle>
                                        </asp:GridView>




                                        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WarmheartsDBConnectionString5 %>" SelectCommand="SELECT [ContactName], [County], [City], [Postal] FROM [Sample]"></asp:SqlDataSource>--%>




                                    </div>
                                </div>


                            </div>
                            <hr />








                            <br />
                            <br />
                            <br />



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>





















</asp:Content>
