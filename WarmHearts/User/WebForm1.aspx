<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WarmHearts.User.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Google Maps Api</title>
    
  

    <link rel="stylesheet" type="text/css" href="style.css" />
  </head>
  <body style="height: 100%; margin: 0; padding: 0;">
      <form runat="server" id="pas">
    <h3>My Google Maps Demo</h3>
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
      <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
          <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click1" />
          <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1" />
   <%-- <div id="map" style="height: 80%;"></div>
    <script src="../BootstrapFiles/js/script.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0&callback=initMap" async defer></script>--%>
          </form>
  </body>
</html>