using DoAn2.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn2.DAO
{
    class DonHangDAO
    {
/*
        private static DonHangDAO instance;

        public static DonHangDAO Instance
        {
            get { if (instance == null) instance = new DonHangDAO(); return instance; }
            private set { instance = value; }
        }
        public static int TableWidth = 150;
        public static int TableHeight = 50;
        private DonHangDAO() { }
        public List<DonHang> LoadTableList()
        {
            List<DonHang> donHangList = new List<DonHang>();

            string query = "EXEC dbo.USP_DonHangList @userName";
            DataTable data = DataProvider.Instance.ExecuteQuery(query,new object[]{bientoancuc.giatri});
            
            foreach (DataRow item in data.Rows)
            {
                DonHang donhang = new DonHang(item);
                donHangList.Add(donhang);
            }
            return donHangList;
        }
        */
    }
}
