<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table>
        <tr>
            <td>Student ID</td>
            <td>
                <asp:Label ID="StudID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>First and Middle Name</td>
            <td>
                <asp:Label ID="FrstNme" runat="server"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>Last Name</td>
            <td>
                <asp:Label ID="LstNme" runat="server"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>Enrolment Date</td>
            <td>
                <asp:Label ID="EnrlDte1" runat="server"></asp:Label>
            </td>
        </tr>
        
    </table>

    <asp:HyperLink ID="UpdateLink" runat="server"                   
                Text="Update"></asp:HyperLink>
    
 
</asp:Content>
