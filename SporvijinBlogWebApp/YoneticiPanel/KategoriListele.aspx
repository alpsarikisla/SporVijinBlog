<%@ Page Title="" Language="C#" MasterPageFile="~/YoneticiPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="KategoriListele.aspx.cs" Inherits="SporvijinBlogWebApp.YoneticiPanel.KategoriListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ListeSayfasi.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sayfaBaslik">
        <h3>Kategoriler</h3>
    </div>
    <div class="tabloTasiyici">
        <%-- <asp:GridView ID="gv_kategoriler" runat="server"></asp:GridView>--%>
        <asp:ListView ID="lv_Kategoriler" runat="server" OnItemCommand="lv_Kategoriler_ItemCommand">
            <LayoutTemplate>
                <table cellspacing="0" cellpadding="0" class="tablo">
                    <tr>
                        <th>ID</th>
                        <th>İsim</th>
                        <th>Açıklama</th>
                        <th>Durum</th>
                        <th>Seçenekler</th>
                    </tr>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("ID") %></td>
                    <td><%# Eval("Isim") %></td>
                    <td><%# Eval("Aciklama") %></td>
                    <td><%# Eval("Durum") %></td>
                    <td>
                        <a href='KategoriDuzenle.aspx?kategoriId=<%# Eval("ID") %>' class="tablobutton duzenle">
                            <img src="resimler/edit.png" /></a>
                        <asp:LinkButton ID="lbtn_durum" runat="server" class="tablobutton durum" CommandArgument='<%# Eval("ID") %>' CommandName="durum">
                            <img src="resimler/recycle.png" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtn_sil" runat="server" class="tablobutton sil" CommandArgument='<%# Eval("ID") %>' CommandName="sil"> 
                            <img src="resimler/delete.png" />
                        </asp:LinkButton>
                       
                    </td>
                </tr>
            </ItemTemplate>
           <%-- <AlternatingItemTemplate>
                <tr class="alternate">
                    <td><%# Eval("ID") %></td>
                    <td><%# Eval("Isim") %></td>
                    <td><%# Eval("Aciklama") %></td>
                    <td>Durum</td>
                    <td></td>
                </tr>
            </AlternatingItemTemplate>--%>
        </asp:ListView>
    </div>
</asp:Content>
