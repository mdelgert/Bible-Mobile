<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBible.ascx.cs" Inherits="B.MOBILE.Controls.SearchBible" %>

<fieldset>
    <legend>Search</legend>
    <form id="frmSearch" method="post" action="#">
    <dl>
        <dt>Enter the Bible keyword</dt>
        <dd>
            <input type="text" size="30" name="TxtSearch" class="input-text" /></dd>
    </dl>
    <p class="nomb">
        <input type="submit" value="Search" class="input-submit" /></p>
    </form>
    <div runat="server" id="SearchResults"></div>
</fieldset>

