using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace SporvijinBlogWebApp
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            rp_kategoriler.DataSource = vm.KategoriListele(false, true);
            rp_kategoriler.DataBind();
        }
    }
}