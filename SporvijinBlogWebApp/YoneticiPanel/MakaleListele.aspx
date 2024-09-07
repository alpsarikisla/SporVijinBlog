<%@ Page Title="" Language="C#" MasterPageFile="~/YoneticiPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="MakaleListele.aspx.cs" Inherits="SporvijinBlogWebApp.YoneticiPanel.MakaleListele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ListeSayfasi.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sayfaBaslik">
        <h3>Makaleler</h3>
    </div>
    <div class="tabloTasiyici">
     
        <asp:ListView ID="lv_Makaleler" runat="server" OnItemCommand="lv_Makaleler_ItemCommand">
            <LayoutTemplate>
                <table cellspacing="0" cellpadding="0" class="tablo">
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Başlık</th>
                        <th>Kategori</th>
                        <th>Yazar</th>
                        <th>Ekleme Tarih</th>
                        <th>Görüntüleme Sayısı</th>
                        <th>Durum</th>
                        <th>Seçenekler</th>
                    </tr>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <img src='../Resimler/MakaleResimleri/<%# Eval("KapakResim") %>' width="100" />
                    </td>
                    <td><%# Eval("ID") %></td>
                    <td><%# Eval("Baslik") %></td>
                    <td><%# Eval("Kategori") %></td>
                    <td><%# Eval("Yazar") %></td>
                    <td><%# Eval("EklemeTarihi") %></td>
                     <td><%# Eval("GoruntulemeSayisi") %></td>
                    <td><%# Eval("Durum") %></td>
                    <td>
                       
                       
                    </td>
                </tr>
            </ItemTemplate>
         
        </asp:ListView>
    </div>
</asp:Content>
