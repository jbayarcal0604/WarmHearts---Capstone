<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="MoneyDonation.aspx.cs" Inherits="WarmHearts.User.MoneyDonation" %>
<%@ Import Namespace="WarmHearts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
        $(document).ready(function () {
            var table = $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                pageLength: 5,
            });
            //setInterval(function () {
            //    table.page('next').draw(false);
            //}, 10000);
        });
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />

     <section class="offer_section layout_padding-bottom" style="background-color: pink">
     <div class="container mt-5" >
        <div class="row" >
            <div class="col-md-8 mx-auto">
                <div class="card" style="border-radius: 2rem">
                    <div class="card-body">              

                        <ul class="nav nav-pills nav-justified">
                            <li class="nav-item"><a class="nav-link active" data-toggle="pill" href="#donateMoney">Donate Money</a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#donateSupplies">Donate Supplies</a></li>
                        </ul>

                        <div class="row">
                            <div class="col">
                                <div class="tab-content">
                                  <div class="tab-pane in active" id="donateMoney">
                 <br />
                <div class="row">
                    <div class="col">
                        <center><h2>Help A Child Today</h2></center>
                        <center><asp:Label runat ="server" ID="name_op"></asp:Label></center>
                    </div>
                </div>
                
              
                <div class="row">
                   <div class="col">
                       <center>                          
                             <hr>
                       </center>
                   </div>
                </div>

                     <%--<asp:Label runat ="server" ID="id_op"></asp:Label>
                     <asp:Label runat ="server" ID="name_op"></asp:Label>
                      <asp:Label runat ="server" ID="email_op"></asp:Label>--%>
                 <div class="row">
                    <div class="col-md-6">
                        <label>Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control"  ID="txtDonorName" runat="server" ReadOnly="true"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="OrphRFV" runat="server" ErrorMessage="Please Enter F" Forecolor="Red" Display="Dynamic" ControlToValidate="txtOrphanageName" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       --%> </div>
                    </div>        
                     <div class="col-md-6">
                        <label>Email</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control"  ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="OrphRFV" runat="server" ErrorMessage="Please Enter F" Forecolor="Red" Display="Dynamic" ControlToValidate="txtOrphanageName" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       --%> </div>
                    </div>             
                 </div>
                
                <br />
                
                   
                <div class="row">
                    
                    <div class="col">         
                        
                            <div class="form-group">
                                <center>
                                    <label>Amount:</label>  
                                    <asp:TextBox CssClass="form-control" placeholder="ex. $10" ID="txtamount" runat="server" TextMode="number" Width="50%"></asp:TextBox>
                                </center>
                              <%--  <asp:requiredfieldvalidator id="fnamerfv" runat="server" errormessage="please enter first name" forecolor="red" display="dynamic" controltovalidate="txtfname" setfocusonerror="true"></asp:requiredfieldvalidator>
                          --%>  </div>
                    </div>
                </div>
                        <hr />

                    
                <div class="row">
                    
                     <div class="col">                    
                            <div class="form-group">
                               <center>
                                   <label>Leave Message:</label>
                                   <asp:TextBox CssClass="form-control" ID="txtmessage"  placeholder="You can leave a message here." TextMode="Multiline" Rows="4" runat="server" Width="50%"></asp:TextBox>
                               </center>
                            </div>
                    </div>               
                
               </div>
           

                  <hr />     
                    
                  <div class="row" >                   
                      <div class="col">
                          <center>
                          <ul class="navbar-nav mr-auto">                        
                         
                         <center>
                             <label>Donate Via:</label>
                              <asp:DropDownList ID="don" runat="server" Width="30%">
                                    <asp:listitem value="PP">Process with PayPal</asp:listitem>
                              </asp:DropDownList>
                          </center>
                              <%--<asp:radiobuttonlist id="txtCCType" runat="server" width="176px" height="40px">
                        <asp:listitem value="PP">Process with PayPal</asp:listitem>
                        <asp:listitem value="CC">Process by Credit Card</asp:listitem>
                     </asp:radiobuttonlist>--%>
                             <%-- <asp:ImageButton ID="ImageButton1" src="../BootstrapFiles/images/paypal1.jpg" width="100px" Height="50px" runat="server" OnClick="ImageButton1_Click" />--%>
                             

<%--                        <div id="donate-button-container">
<div id="donate-button"></div>
<script src="https://www.paypalobjects.com/donate/sdk/donate-sdk.js" charset="UTF-8"></script>
<script>
    PayPal.Donation.Button({
        env: 'sandbox',
        hosted_button_id: 'VHMS2QFXH3H82',        
        image: {
            src: 'https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif',
            alt: 'Donate with PayPal button',
            title: 'PayPal - The safer, easier way to pay online!',
        }
    }).render('#donate-button');
</script>
</div>
    --%>



                              <%--<asp:ImageButton ID="ImageButton3" src="../BootstrapFiles/images/gcash.jpg"  width="100px" Height="50px" runat="server" />--%>
                            
                      </ul>
                      </center>
                       </div>          
                  
               </div>     

 
               
               <hr />

                                      <br />

              

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <center>
                            <asp:Button class="btn btn-success btn-block btn-lg" ID="DonMon" runat="server" Text="Donate Now" width="40%"   />
                         <%--   <asp:Button class="btn btn-success btn-block btn-lg" ID="btnUpdate" runat="server" Text="Update" width="50%" OnClick="btnUpdate_Click" />--%>
                                </center>
                        </div>
                    </div>
                </div>

                        <div class="pcoded-inner-content pt-0">
                                    <div class="align-align-self-end">
                                        <center>
                                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                                        </center>
                                    </div>
                                </div>

                        <asp:label id="lblErrorMessage" runat="server" width="487px" cssclass="ErrorMessage"></asp:label>

                                  </div>

                                  <div class="tab-pane fade" id="donateSupplies">
                                      <br />
                                      <div class="row">
                                          <div class="col">
                                              <center><h2>List of Most Needed Items</h2>
                                                  
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
                                            <p style="text-align: justify;">Please check this list before you schedule your appointment. We update this list frequently based on current inventory and whether items can be safely stocked in our warehouse. We are unable to accept items that are not suitable for a classroom, or that are broken, damaged, dirty, or in poor condition.</p>
                                        </div>
                                    </div>

       
                                    <br />

                                    <div class="row">
                                        <div class="col">
                                            <center><h2>Needs</h2></center>                                           
                                        </div>
                                    </div>

                                      <div class="row">
                                          <div class="col">
                                              <hr />
                                          </div>
                                      </div>
     

                                      <div class="col">
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">

                                        <asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>

                                        <asp:Repeater ID="rPostNeeds" runat="server" >
                                            <HeaderTemplate>
                                                <table class="table data-table-export table-hover nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="table-plus">Needs</th>
                                                            <th>Images</th>
                                                            <th class="datatable-nosort">Action</th>
                                                        </tr>
                                                    </thead>                                              
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="table-plus">
                                                        <asp:Label ID="lblpostNds" runat="server" Text='<%# Eval("post_needs") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <img alt="" src="<%# Connection.Utils.GetImageUrl3( Eval("post_img")) %>" Width="100px" Height="100px" />
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkDonate" Text="Donate" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("post_ID") +";"+ Eval("OP_ID")%>' CommandName="Donate" OnClick="lnkDonate_Click">Donate</asp:LinkButton>
                                                        <%--<asp:LinkButton ID="lnkSpEduc" Text="Sponsor Education" runat="server" CssClass="badge badge-info"  CommandArgument='<%# Eval("orphan_ID") +";"+ Eval("OP_ID")%>' CommandName="Education" OnClick="lnkSpEduc_Click"> Sponsor Education</asp:LinkButton>--%>
                                                        <%--<asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("post_ID") %>' CommandName="delete" OnClientClick="return confirm('Do you want to delete this Post?');"><%--<i class="ti-trash">Delete</i></asp:LinkButton>--%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>

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