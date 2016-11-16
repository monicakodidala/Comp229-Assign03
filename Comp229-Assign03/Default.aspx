<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <asp:Repeater ID="myRepeater" runat="server">
       <HeaderTemplate>
           <h1>Employee Name</h1>
       </HeaderTemplate>
       <ItemTemplate>
           <asp:Label ID="lblID" runat="server" Text='<%# Eval("LastName") %>' ></asp:Label>
           <asp:HyperLink runat="server"
               NavigateUrl='<%# Eval("StudentID","~/SingleStudent.aspx?id=(0)")%>'>
                 </asp:HyperLink>
       </ItemTemplate>
   </asp:Repeater>

</asp:Content>
