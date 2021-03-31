namespace DoAn2
{
    partial class gioHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txbTamTinh = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.btn_datHang = new System.Windows.Forms.Button();
            this.dtgv_gioHang = new System.Windows.Forms.DataGridView();
            this.btn_xoa = new System.Windows.Forms.Button();
            this.btn_sua = new System.Windows.Forms.Button();
            this.txbMaSP = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.nbSL = new System.Windows.Forms.NumericUpDown();
            this.panel1 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dtgv_gioHang)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nbSL)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txbTamTinh
            // 
            this.txbTamTinh.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbTamTinh.Location = new System.Drawing.Point(538, 86);
            this.txbTamTinh.Name = "txbTamTinh";
            this.txbTamTinh.ReadOnly = true;
            this.txbTamTinh.Size = new System.Drawing.Size(138, 26);
            this.txbTamTinh.TabIndex = 2;
            this.txbTamTinh.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txbTamTinh.TextChanged += new System.EventHandler(this.txb_tamTinh_TextChanged);
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.Red;
            this.button1.Location = new System.Drawing.Point(459, 83);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(73, 34);
            this.button1.TabIndex = 3;
            this.button1.Text = "Tạm tính";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btn_datHang
            // 
            this.btn_datHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_datHang.ForeColor = System.Drawing.Color.Black;
            this.btn_datHang.Location = new System.Drawing.Point(497, 158);
            this.btn_datHang.Name = "btn_datHang";
            this.btn_datHang.Size = new System.Drawing.Size(128, 45);
            this.btn_datHang.TabIndex = 6;
            this.btn_datHang.Text = "Tiến hành đặt hàng";
            this.btn_datHang.UseVisualStyleBackColor = true;
            this.btn_datHang.Click += new System.EventHandler(this.btn_datHang_Click);
            // 
            // dtgv_gioHang
            // 
            this.dtgv_gioHang.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgv_gioHang.Location = new System.Drawing.Point(12, 12);
            this.dtgv_gioHang.Name = "dtgv_gioHang";
            this.dtgv_gioHang.Size = new System.Drawing.Size(426, 253);
            this.dtgv_gioHang.TabIndex = 7;
            // 
            // btn_xoa
            // 
            this.btn_xoa.Location = new System.Drawing.Point(118, 40);
            this.btn_xoa.Name = "btn_xoa";
            this.btn_xoa.Size = new System.Drawing.Size(79, 37);
            this.btn_xoa.TabIndex = 8;
            this.btn_xoa.Text = "Xóa";
            this.btn_xoa.UseVisualStyleBackColor = true;
            this.btn_xoa.Click += new System.EventHandler(this.btn_xoa_Click);
            // 
            // btn_sua
            // 
            this.btn_sua.Location = new System.Drawing.Point(228, 42);
            this.btn_sua.Name = "btn_sua";
            this.btn_sua.Size = new System.Drawing.Size(79, 35);
            this.btn_sua.TabIndex = 9;
            this.btn_sua.Text = "Sửa";
            this.btn_sua.UseVisualStyleBackColor = true;
            this.btn_sua.Click += new System.EventHandler(this.btn_sua_Click);
            // 
            // txbMaSP
            // 
            this.txbMaSP.Location = new System.Drawing.Point(89, 11);
            this.txbMaSP.Name = "txbMaSP";
            this.txbMaSP.Size = new System.Drawing.Size(108, 20);
            this.txbMaSP.TabIndex = 10;
            this.txbMaSP.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 11;
            this.label1.Text = "Mã sản phẩm:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(225, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(52, 13);
            this.label2.TabIndex = 12;
            this.label2.Text = "Số lượng:";
            // 
            // nbSL
            // 
            this.nbSL.Location = new System.Drawing.Point(294, 12);
            this.nbSL.Name = "nbSL";
            this.nbSL.Size = new System.Drawing.Size(82, 20);
            this.nbSL.TabIndex = 14;
            this.nbSL.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.nbSL);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.txbMaSP);
            this.panel1.Controls.Add(this.btn_sua);
            this.panel1.Controls.Add(this.btn_xoa);
            this.panel1.Location = new System.Drawing.Point(12, 271);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(396, 86);
            this.panel1.TabIndex = 15;
            // 
            // gioHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(682, 364);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.dtgv_gioHang);
            this.Controls.Add(this.btn_datHang);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txbTamTinh);
            this.Name = "gioHang";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Giỏ hàng";
            ((System.ComponentModel.ISupportInitialize)(this.dtgv_gioHang)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nbSL)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox txbTamTinh;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btn_datHang;
        private System.Windows.Forms.DataGridView dtgv_gioHang;
        private System.Windows.Forms.Button btn_xoa;
        private System.Windows.Forms.Button btn_sua;
        private System.Windows.Forms.TextBox txbMaSP;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown nbSL;
        private System.Windows.Forms.Panel panel1;
    }
}