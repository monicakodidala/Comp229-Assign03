<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Repeater ID="myRepeater" runat="server">
        <HeaderTemplate>
            <h3>Student Name <span style="color:yellow"></span> </h3>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:HyperLink runat="server" 
                NavigateUrl='<%# Eval("StudentID","~/Student.aspx?ID={0}") %>'                 
                Text='<%# String.Format("{0} {1}", Eval("FirstMidName"), Eval("LastName")) %>'></asp:HyperLink>
            
            <br />
            
        </ItemTemplate>
    </asp:Repeater>

    <br />

    <h3>Please Enter New Student Details
    </h3>

    <table>
        <tr>
            <td>Enter First and Middle Name:</td>
            <td>
                <asp:TextBox runat="server" ID="FrstName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FrstName1" runat="server" ValidationGroup="check"
                    ControlToValidate="FrstName"
                    ErrorMessage="Please Enter a First and Middle Name"
                    SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>Enter Last Name:</td>
            <td>
                <asp:TextBox runat="server" ID="LstName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LstName1" runat="server" ValidationGroup="check"
                    ControlToValidate="LstName"
                    ErrorMessage="Please Enter a Last Name"
                    SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>Enter Enrollment Date:</td>
            <td>
                <asp:TextBox runat="server" ID="EnrlDate"></asp:TextBox>

                <asp:RegularExpressionValidator ID="Dte" runat="server"
                    ControlToValidate="EnrlDate" ValidationExpression="^(([1-9])|(0[1-9])|(1[0-2]))\/((0[1-9])|([1-31]))\/((19|20)\d\d)$"
                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Enter a Valid Date" ForeColor="Red"> 

                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator ID="EnrlDte1" runat="server" ValidationGroup="check"
                    ControlToValidate="EnrlDate" ErrorMessage="Please Enter a Date" SetFocusOnError="false"
                    Dispaly="Dynamic" ForeColor="Red" />
            </td>

        </tr>
    </table>

    <br />

    <asp:Button ID="AddStd" Text="Add Student" runat="server" OnClick="AddStd_Click" />

    <asp:DataGrid ID="DataID" runat="server" AutoGenerateColumns="false">
        <Columns>
            <%--<asp:BoundColumn  DataField="LastName" HeaderText="LastName" ></asp:BoundColumn>
            <asp:BoundColumn DataField="StudentID" HeaderText="StudentID"></asp:BoundColumn>--%>
        </Columns>

    </asp:DataGrid>

</asp:Content>
