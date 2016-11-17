<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <asp:Repeater ID="myRepeater" runat="server">
       <HeaderTemplate>
           <h3>Student Name</h3>
       </HeaderTemplate>
     <ItemTemplate>
         <%--<asp:HyperLink runat="server" NavigateUrl="~/Contact.aspx?id=(0)" Text='<%# Eval("StudentID") %>' ></asp:HyperLink>--%>
         <asp:HyperLink runat="server" NavigateUrl="~/Contact.aspx?id=(0)" Text='<%# String.Format("{0} {1}", Eval("FirstMidName"), Eval("LastName")) %>' ></asp:HyperLink>
         <br />
     </ItemTemplate>
   </asp:Repeater>

    <br />

    <h3>
        Please Enter New Student Details
    </h3>

   <table>        
       <tr>
            <td>Enter First and Middle Name:</td>
            <td><asp:TextBox runat="server" ID="FrstName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FrstName1" runat="server" ValidationGroup="check"
            ControlToValidate="FrstName"
            ErrorMessage="Please Enter a First and Middle Name"
            SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
       <tr>
            <td>Enter Last Name:</td>
            <td><asp:TextBox runat="server" ID="LstName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LstName1" runat="server" ValidationGroup="check"
            ControlToValidate="LstName"
            ErrorMessage="Please Enter a Last Name"
            SetFocusOnError="true" Display="Dynamic" ForeColor="Red" />
            </td>
        </tr>
       <tr>
            <td>Enter Enrollment Date:</td>
            <td><asp:TextBox runat="server" ID="EnrlDate"></asp:TextBox></td>
        </tr>              
        </table>

    <br />

    <asp:Button ID="AddStd" Text="Add Student" runat="server" OnClick="AddStd_Click"/>

    <asp:DataGrid ID="DataID" runat="server" AutoGenerateColumns="false" >        
        <Columns>
            <%--<asp:BoundColumn  DataField="LastName" HeaderText="LastName" ></asp:BoundColumn>
            <asp:BoundColumn DataField="StudentID" HeaderText="StudentID"></asp:BoundColumn>--%>
        </Columns>
        
    </asp:DataGrid>

</asp:Content>
