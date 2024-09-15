<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SporvijinBlogWebApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="lv_makaleler" runat="server">
        <ItemTemplate>
            <div class="makale">
                <a href='MakaleDetay.aspx?makale=<%# Eval("ID") %>'>
                    <h2 style="margin: 10px 0;"><%# Eval("Baslik") %></h2>
                    <img src='Resimler/MakaleResimleri/<%# Eval("KapakResim") %>' style="width: 100%" /></a>
                <div class="ayrac"></div>
                <div class="altbilgi">
                    Yazar : <%# Eval("Yazar") %> | Kategori : <%# Eval("Kategori") %>
                    Yayınlama Tarihi: <%# Eval("EklemeTarihi") %> | Görüntüleme Sayısı :
                     <%# Eval("GoruntulemeSayisi") %>
                </div>
                <div class="ayrac"></div>
                <div style="margin: 10px 0;">
                    <%# Eval("Ozet") %>
                     &nbsp;&nbsp;&nbsp;
                    <a href="MakaleDetay.aspx?makale=<%# Eval("ID") %>'">Makalenin Devamı => </a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
