using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace SporvijinBlogWebApp.YoneticiPanel
{
    public partial class KategoriListele : System.Web.UI.Page
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            //gv_kategoriler.DataSource = vm.KategoriListele();
            //gv_kategoriler.DataBind();
            lv_Kategoriler.DataSource = vm.KategoriListele(false);
            lv_Kategoriler.DataBind();
        }

        protected void lv_Kategoriler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "sil")
            {
                vm.KategoriSil(id);
            }
            if (e.CommandName == "durum")
            {
                vm.KategoriDurumDegistir(id);
            }

            lv_Kategoriler.DataSource = vm.KategoriListele(false);
            lv_Kategoriler.DataBind();
        }
    }
}