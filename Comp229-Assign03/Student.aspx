<%--Filename: Student.aspx
Authors Name: Venkata Kodithala
Student ID: 300920874
Creation Date: 2016-11-17--%>



<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Student Details Page</h3>
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
    
    <br />

    <asp:Repeater ID="myRepeater1" runat="server">
        <HeaderTemplate>
            <h3>Courses Enrolled:</h3>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:HyperLink runat="server"
                NavigateUrl='<%# Eval("CourseID","~/Course.aspx?CourseID={0}") %>'
                Text='<%# Eval("Title") %>'></asp:HyperLink>

            <br />

        </ItemTemplate>
    </asp:Repeater>
   <br />

    <asp:HyperLink ID="UpdateLink" runat="server" Text="Update"></asp:HyperLink>

    <asp:Button ID="BtnDelete" Text="Delete" runat="server" OnClick="BtnDelete_Click" />

</asp:Content>
