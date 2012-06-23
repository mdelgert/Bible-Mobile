<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BibleSelector.ascx.cs"
    Inherits="B.MOBILE.Controls.BibleSelector" %>

<div id="contentSelector">
    <asp:DropDownList ID="DropDownListBible" runat="server" Width="100%" DataSourceID="SqlDataSourceBibleType"
        DataTextField="BibleName" DataValueField="RecID" AutoPostBack="True" 
        onselectedindexchanged="DropDownListBible_SelectedIndexChanged">
    </asp:DropDownList>
</div>

<asp:SqlDataSource ID="SqlDataSourceBibleType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
    SelectCommand="SELECT [RecID], [BibleName] FROM [BibleType]"></asp:SqlDataSource>
