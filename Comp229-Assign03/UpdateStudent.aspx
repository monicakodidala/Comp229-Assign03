<%--Filename: UpdateStudent.aspx
Authors Name: Venkata Kodithala
Student ID: 300920874
Creation Date: 2016-11-17--%>


<%@ Page Title="Update" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateStudent.aspx.cs" Inherits="Comp229_Assign03.UpdateStudent" %>


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
            <td>First and Middle Name*:</td>
            <td>
                <asp:TextBox ID="FrstNme" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FrstNme2" runat="server" ValidationGroup="check"
                    ControlToValidate="FrstNme"
                    ErrorMessage="Please Enter a First Name"
                    SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
         <tr>
            <td>Last Name*:</td>
            <td>
                <asp:TextBox ID="LstNme" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LstNme1" runat="server" ValidationGroup="check"
                    ControlToValidate="LstNme"
                    ErrorMessage="Please Enter a Last Name"
                    SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
                
            </td>
        </tr>
         <tr>
            <td>Enrolment Date*(MM/DD/YYYY):</td>
            <td>
                <asp:TextBox ID="EnrlDte1" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="EnrlDte2" runat="server"
                    ControlToValidate="EnrlDte1" ValidationExpression="^(([1-9])|(0[1-9])|(1[0-2]))\/((0[1-9])|([1-31]))\/((19|20)\d\d)$"
                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Enter a Valid Date" ForeColor="Red"> 
                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator ID="EnrlDate3" runat="server" ValidationGroup="check"
                    ControlToValidate="EnrlDte1" ErrorMessage="Please Enter a Date" SetFocusOnError="false"
                    Dispaly="Dynamic" ForeColor="Red" />
                
            </td>
        </tr>
        
    </table>
    <br />
    <h6>Note: Fields marked * are mandatory</h6>
    <br />
    <asp:Button ID="BtnSave" Text="Save" runat="server" OnClick="BtnSave_Click" />
    
</asp:Content>
