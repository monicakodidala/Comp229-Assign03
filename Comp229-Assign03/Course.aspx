<%--Filename: Course.aspx
Authors Name: Venkata Kodithala
Student ID: 300920874
Creation Date: 2016-11-17--%>



<%@ Page Title="Course" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h3>List of Enrolled Students in the course</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="false" PageSize="10">
        <Columns>
            <asp:TemplateField ItemStyle-Width="200px" HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="lblStudentName" runat="server"
                        Text='<%# String.Format("{0} {1}", Eval("FirstMidName"), Eval("LastName")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" runat="server"
                        CommandArgument='<%# Eval("StudentID")%>'
                        Text="Delete" OnClick="lnkRemove_Click"></asp:LinkButton>
                </ItemTemplate>

            </asp:TemplateField>
        </Columns>
        <AlternatingRowStyle BackColor="#C2D69B" />
    </asp:GridView>
    <br />

    <table>
        <tr>
            <td>Enter Student ID:</td>
            <td>
                <asp:TextBox runat="server" ID="StudentID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valStudentID" runat="server" ValidationGroup="check"
                    ControlToValidate="StudentID"
                    ErrorMessage="Please Enter a Student ID"
                    SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
    </table>

    <asp:Button ID="EnrollStudent" Text="Enroll Student" runat="server" OnClick="EnrollStudent_Click" />
</asp:Content>
