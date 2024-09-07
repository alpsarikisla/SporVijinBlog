using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class Makale
    {
		public int ID { get; set; }
        public int KategoriID { get; set; }
        public string Kategori { get; set; }
        public int YazarID { get; set; }
        public string Yazar { get; set; }
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string Ozet { get; set; }
        public DateTime EklemeTarihi { get; set; }
        public long GoruntulemeSayisi { get; set; }
        public string KapakResim { get; set; }
        public bool Durum { get; set; }
    }
}
