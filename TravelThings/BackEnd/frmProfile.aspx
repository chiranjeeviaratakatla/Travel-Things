<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmProfile.aspx.cs" Inherits="TravelThings.BackEnd.frmProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 515px; overflow-y: scroll;">
        <div class="form-group col-sm-12">
            <h1>Profile</h1>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label>Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ToolTip="Enter your Name"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="usr">Phone No:</label>
            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" Enabled="false" CssClass="form-control" ToolTip="Enter Phone No"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Aternative Phone Number:</label>
            <asp:TextBox ID="txtAltPhNo" runat="server" MaxLength="10" CssClass="form-control" ToolTip="Optional"></asp:TextBox>
        </div>

        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Aadhar No:</label>
            <asp:TextBox ID="txtAahdar" runat="server" MaxLength="12" CssClass="form-control" ToolTip="Enter Aadhar No"></asp:TextBox>
        </div>

        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Area:</label>
            <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" ToolTip="Enter Your Area"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">City:</label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ToolTip="Enter Your City"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">State:</label>
            <asp:TextBox ID="txtState" runat="server" CssClass="form-control" ToolTip="Enter Your State"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Pin Code:</label>
            <asp:TextBox ID="txtPinCode" runat="server" MaxLength="6" CssClass="form-control" ToolTip="Enter Your Pincode"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" CssClass="form-control" ToolTip="Enter Your Pincode" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">Confirm Password:</label>
            <asp:TextBox ID="txtConPassword" runat="server" MaxLength="15" CssClass="form-control" ToolTip="Enter Your Pincode" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <label for="pwd">&nbsp;</label>
            <asp:CheckBox ID="chkShowPws" runat="server" Text="Show Password" CssClass="form-control" AutoPostBack="true" OnCheckedChanged="chkShowPws_CheckedChanged" />
        </div>
        <div class="form-group col-sm-4 col-md-3">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Save" />
            <span></span>
            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" OnClick="btnCancel_Click" Text="Cancel" />
        </div>
    </div>
</asp:Content>
