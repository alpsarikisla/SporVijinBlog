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
    public partial class MakaleDuzenle : System.Web.UI.Page
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString.Count != 0)
            {
                if (!IsPostBack)
                {
                    ddl_kategoriler.DataSource = vm.KategoriListele(false, true);
                    ddl_kategoriler.DataBind();

                    int id = Convert.ToInt32(Request.QueryString["makaleId"]);
                    Makale mak = vm.MakaleGetir(id);
                    tb_baslik.Text = mak.Baslik;
                    ddl_kategoriler.SelectedValue = Convert.ToString(mak.KategoriID);
                    tb_icerik.Text = mak.Icerik;
                    tb_ozet.Text = mak.Ozet;
                    cb_yayinla.Checked = mak.Durum;
                    img_resim.ImageUrl = "../Resimler/MakaleResimleri/" + mak.KapakResim;
                }
            }
            else
            {
                Response.Redirect("MakaleListele.aspx");
            }
           
        }

        protected void lbtn_makaleduzenle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["makaleId"]);
            Makale mak = vm.MakaleGetir(id);
            mak.Baslik = tb_baslik.Text;
            mak.Icerik = tb_icerik.Text;
            mak.Ozet = tb_ozet.Text;
            mak.Durum = cb_yayinla.Checked;
            mak.KategoriID = Convert.ToInt32(ddl_kategoriler.SelectedItem.Value);
            if (fu_resim.HasFile)
            {
                FileInfo fi = new FileInfo(fu_resim.FileName);
                string uzanti = fi.Extension;
                string dosyaisim =Convert.ToString(Guid.NewGuid());
                fu_resim.SaveAs(Server.MapPath("../Resimler/MakaleResimleri/" + dosyaisim + uzanti));
                mak.KapakResim = dosyaisim + uzanti;
            }
            if (vm.MakaleDuzenle(mak))
            {
                pnl_basarili.Visible = true;
                pnl_basarisiz.Visible = false;
            }
            else
            {
                pnl_basarili.Visible = false;
                pnl_basarisiz.Visible = true;
                lbl_mesaj.Text = "Makale düzenleme başarısız";
            }
        }
    }
}