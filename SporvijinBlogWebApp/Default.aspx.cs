using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace SporvijinBlogWebApp
{
    public partial class Default : System.Web.UI.Page
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count == 0)
            {
                lv_makaleler.DataSource = vm.MakaleListele();
                lv_makaleler.DataBind();
            }
           else
            {
                int kid = Convert.ToInt32(Request.QueryString["kid"]);
                lv_makaleler.DataSource = vm.MakaleListele(kid);
                lv_makaleler.DataBind();
            }
        }
    }
}