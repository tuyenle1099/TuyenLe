using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn2.DTO
{
    class SanPham
    {
        private string maSP;
        private string tenSP;
        private float giaSP;
        public SanPham(string maSP, string tenSP, float giaSP)
        {
            this.maSP = maSP;
            this.tenSP = tenSP;
            this.giaSP = giaSP;

        }
        public SanPham(DataRow row)
        {
            this.maSP = row["MaSP"].ToString();
            this.tenSP = row["TenSP"].ToString();
            this.giaSP = (float)row["DonGia"];
        }
        public float GiaSP
        {
            get { return giaSP; }
            set { giaSP = value; }
        }

        public string TenSP
        {
            get
            {
                return tenSP;
            }

            set
            {
                tenSP = value;
            }
        }

        public string MaSP
        {
            get
            {
                return maSP;
            }

            set
            {
                maSP = value;
            }
        }
    
    }
}
