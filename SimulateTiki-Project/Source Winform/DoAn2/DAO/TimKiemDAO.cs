using DoAn2.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn2.DAO
{
    public class TimKiemDAO
    {
        private static TimKiemDAO instance;

        public static TimKiemDAO Instance
        {
            get { if (instance == null) instance = new TimKiemDAO(); return instance; }
            private set { instance = value; }
        }
        public static int TimKiemWidth = 80;
        public static int TimKiemHeight = 80;
        private TimKiemDAO() { }
      
        public void LoadTimKiemList()
        {
            
            List<SanPham> spList = new List<SanPham>();

            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC USP_TIMKIEMSP @tenSP",new object[] {bientoancuc.giatri});

            foreach (DataRow item in data.Rows)
            {
                SanPham sp = new SanPham(item);
                spList.Add(sp);
            }
           // return spList;
        }
        
    }
}
