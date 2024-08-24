using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SporvijinBlogWebApp.YoneticiPanel
{
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_girisYap_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_mail.Text))
            {
                if (!string.IsNullOrEmpty(tb_sifre.Text))
                {

                }
                else
                {
                    pnl_basarisiz.Visible = true;
                    lbl_mesaj.Text = "Şifre adresi boş bırakılamaz";
                }
            }
            else
            {
                pnl_basarisiz.Visible = true;
                lbl_mesaj.Text = "Mail adresi boş bırakılamaz";
            }
        }
    }
}