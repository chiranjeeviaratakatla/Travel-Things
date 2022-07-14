<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="TravelThings.BackEnd.WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto">
        <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false"
            Style="max-width: 1500px">
            <Columns>
                <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                <asp:BoundField HeaderText="Item Name" DataField="I_Item_Name" />
                <asp:BoundField HeaderText="Description" DataField="I_Item_Desc" />
                <asp:BoundField HeaderText="Weight" DataField="I_Weight" />
                <asp:BoundField HeaderText="Type" DataField="I_Item_Type" />
                <asp:BoundField HeaderText="Remarks" DataField="I_Remarks" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:ImageButton ID="gvBtnSelect" runat="server" ImageUrl="~/Images/Icons/edit.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:ImageButton ID="gvBtnSelect1" runat="server" ImageUrl="~/Images/Icons/delete.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
