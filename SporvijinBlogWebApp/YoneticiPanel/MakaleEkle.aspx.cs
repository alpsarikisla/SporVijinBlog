using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace SporvijinBlogWebApp.YoneticiPanel
{
    public partial class MakaleEkle : System.Web.UI.Page
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_kategoriler.DataSource = vm.KategoriListele(false, true);
                ddl_kategoriler.DataBind();
            }
        }

        protected void lbtn_makaleEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_baslik.Text))
            {
                Makale mak = new Makale();
                mak.Baslik = tb_baslik.Text;
                mak.KategoriID = Convert.ToInt32(ddl_kategoriler.SelectedItem.Value);
                Yonetici girisyapanyonetici = (Yonetici)Session["GirisYapanYonetici"];
                mak.YazarID = girisyapanyonetici.ID;
                mak.Ozet = tb_ozet.Text;
                mak.Icerik = tb_icerik.Text;
                mak.EklemeTarihi = DateTime.Now;
                mak.GoruntulemeSayisi = 0;
                if (fu_resim.HasFile)//Resim seçilmiş ise
                {
                    string isim = Guid.NewGuid().ToString();
                    string yol = fu_resim.FileName;
                    FileInfo fi = new FileInfo(yol);
                    string uzanti = fi.Extension;//Dosyanın Uzantısını alır. .jpg, .jpeg, .png
                    string dosyatamisim = isim + uzanti;
                    fu_resim.SaveAs(Server.MapPath("../Resimler/MakaleResimleri/" + dosyatamisim));
                    mak.KapakResim = dosyatamisim;
                }
                else
                {
                    mak.KapakResim = "none.png";
                }
                mak.Durum = cb_yayinla.Checked;
                if (vm.MakaleEkle(mak))
                {
                    pnl_basarili.Visible = true;
                    pnl_basarisiz.Visible = false;
                }
                else
                {
                    lbl_mesaj.Text = "Makale Eklenirken bir hata oluştu";
                    pnl_basarili.Visible = false;
                    pnl_basarisiz.Visible = true;
                }
            }
            else
            {
                lbl_mesaj.Text = "Başlıksız makale olmaz.";
                pnl_basarili.Visible = false;
                pnl_basarisiz.Visible = true;
            }
        }
    }
}