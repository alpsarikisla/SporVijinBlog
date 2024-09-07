<%@ Page Title="" Language="C#" MasterPageFile="~/YoneticiPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="MakaleEkle.aspx.cs" Inherits="SporvijinBlogWebApp.YoneticiPanel.MakaleEkle" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/FormSayfasi.css" rel="stylesheet" />
    <script src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formTasiyici">
        <div class="formBaslik">
            <h3>Makale Ekle</h3>
        </div>
        <div class="formIcerik">
            <asp:Panel ID="pnl_basarili" runat="server" CssClass="basariliPanel" Visible="false">
                <strong>Başarılı!</strong> Makale Başarıyla Eklenmiştir
            </asp:Panel>
            <asp:Panel ID="pnl_basarisiz" runat="server" CssClass="basarisizPanel" Visible="false">
                <strong>Başarısız!</strong>
                <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
            </asp:Panel>
            <div style="float: left; width: 690px">
                <div class="satir">
                    <label>Makale Başlığı</label><br />
                    <asp:TextBox ID="tb_baslik" runat="server" CssClass="bolunmusmetinKutu"></asp:TextBox>
                </div>
                <div class="satir">
                    <label>Makale Kategorisi</label><br />
                    <asp:DropDownList ID="ddl_kategoriler" runat="server" CssClass="bolunmusmetinKutu" Style="width: 660px" DataTextField="Isim" DataValueField="ID">
                    </asp:DropDownList>
                </div>
                <div class="satir">
                    <label>Kapak Resim</label><br />
                    <asp:FileUpload ID="fu_resim" runat="server" CssClass="bolunmusmetinKutu" />
                </div>
                <div class="satir">
                    <asp:CheckBox ID="cb_yayinla" runat="server" Text="  Makaleyi Yayınla" />
                </div>
                <div class="satir">
                    <asp:LinkButton ID="lbtn_makaleEkle" runat="server" CssClass="islemButton" OnClick="lbtn_makaleEkle_Click">Makale Ekle</asp:LinkButton>
                </div>
            </div>
            <div style="float: left; width: 600px">
                <div class="satir">
                    <label>Makale Özet</label><br />
                    <asp:TextBox ID="tb_ozet" runat="server" TextMode="MultiLine" CssClass="metinKutu"></asp:TextBox>
                </div>
                <div class="satir">
                    <label>Makale İçerik</label><br />
                    <asp:TextBox ID="tb_icerik" runat="server" TextMode="MultiLine" CssClass="metinKutu"></asp:TextBox>
                    <script>

                        CKEDITOR.replace('ContentPlaceHolder1_tb_icerik');
                    </script>
                </div>

            </div>
            <div style="clear: both"></div>
        </div>
    </div>
</asp:Content>
