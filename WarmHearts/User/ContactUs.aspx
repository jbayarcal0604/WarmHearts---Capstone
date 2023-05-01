<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WarmHearts.User.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



   
  <section class="about_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          Contact Us
        </h2>

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


              </div>
           
          </div>
        </div>
      
        </div>
      </div>
   
  </section>
 
 

  
  























</asp:Content>
