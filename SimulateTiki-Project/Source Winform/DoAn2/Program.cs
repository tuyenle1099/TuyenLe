using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace DoAn2
{
    public class bientoancuc
    {
        public static string giatri;
    }
    public class tongTienGH
    {
        public static string tongTien;
    }

    
     static class Program
    {
        //string user;
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Login());
           
        }
    }
}
