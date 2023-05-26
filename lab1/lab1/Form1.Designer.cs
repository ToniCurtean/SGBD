using System.Windows.Forms;

namespace lab1
{
    partial class Form1
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
            this.dataGridViewParent = new System.Windows.Forms.DataGridView();
            this.dataGridViewChild = new System.Windows.Forms.DataGridView();
            this.labelParent = new System.Windows.Forms.Label();
            this.labelChild = new System.Windows.Forms.Label();
            this.parentComboBox = new System.Windows.Forms.ComboBox();
            this.childComboBox = new System.Windows.Forms.ComboBox();
            this.codCatText = new System.Windows.Forms.TextBox();
            this.updateButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.numeLBox = new System.Windows.Forms.TextBox();
            this.descLBox = new System.Windows.Forms.TextBox();
            this.codLupBox = new System.Windows.Forms.TextBox();
            this.codSalBox = new System.Windows.Forms.TextBox();
            this.codManBox = new System.Windows.Forms.TextBox();
            this.addButton = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewParent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewChild)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewParent
            // 
            this.dataGridViewParent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewParent.Location = new System.Drawing.Point(50, 66);
            this.dataGridViewParent.Name = "dataGridViewParent";
            this.dataGridViewParent.RowHeadersWidth = 51;
            this.dataGridViewParent.RowTemplate.Height = 24;
            this.dataGridViewParent.Size = new System.Drawing.Size(491, 508);
            this.dataGridViewParent.TabIndex = 0;
            this.dataGridViewParent.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewParent_CellContentClick);
            this.dataGridViewParent.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewParent_CellContentClick);
            this.dataGridViewParent.MouseClick += new System.Windows.Forms.MouseEventHandler(this.dataGridViewParent_CellContentClick);
            // 
            // dataGridViewChild
            // 
            this.dataGridViewChild.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewChild.Location = new System.Drawing.Point(593, 66);
            this.dataGridViewChild.Name = "dataGridViewChild";
            this.dataGridViewChild.RowHeadersWidth = 51;
            this.dataGridViewChild.RowTemplate.Height = 24;
            this.dataGridViewChild.Size = new System.Drawing.Size(919, 508);
            this.dataGridViewChild.TabIndex = 1;
            // 
            // labelParent
            // 
            this.labelParent.AutoSize = true;
            this.labelParent.Location = new System.Drawing.Point(590, 36);
            this.labelParent.Name = "labelParent";
            this.labelParent.Size = new System.Drawing.Size(58, 16);
            this.labelParent.TabIndex = 2;
            this.labelParent.Text = "Luptatori";
            // 
            // labelChild
            // 
            this.labelChild.AutoSize = true;
            this.labelChild.Location = new System.Drawing.Point(47, 36);
            this.labelChild.Name = "labelChild";
            this.labelChild.Size = new System.Drawing.Size(61, 16);
            this.labelChild.TabIndex = 3;
            this.labelChild.Text = "Categorii";
            // 
            // parentComboBox
            // 
            this.parentComboBox.FormattingEnabled = true;
            this.parentComboBox.Location = new System.Drawing.Point(50, 592);
            this.parentComboBox.Name = "parentComboBox";
            this.parentComboBox.Size = new System.Drawing.Size(121, 24);
            this.parentComboBox.TabIndex = 4;
            // 
            // childComboBox
            // 
            this.childComboBox.FormattingEnabled = true;
            this.childComboBox.Location = new System.Drawing.Point(593, 592);
            this.childComboBox.Name = "childComboBox";
            this.childComboBox.Size = new System.Drawing.Size(121, 24);
            this.childComboBox.TabIndex = 5;
            // 
            // codCatText
            // 
            this.codCatText.Location = new System.Drawing.Point(865, 692);
            this.codCatText.Name = "codCatText";
            this.codCatText.Size = new System.Drawing.Size(91, 22);
            this.codCatText.TabIndex = 6;
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(734, 592);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(163, 23);
            this.updateButton.TabIndex = 7;
            this.updateButton.Text = "Update Categorie";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.onUpdateButtonClick);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(734, 621);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(163, 23);
            this.deleteButton.TabIndex = 8;
            this.deleteButton.Text = "Delete Luptator";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.onDeleteButtonClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(590, 656);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 16);
            this.label1.TabIndex = 9;
            this.label1.Text = "Nume Luptator";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(710, 655);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(117, 16);
            this.label2.TabIndex = 10;
            this.label2.Text = "Descriere Luptator";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(862, 654);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 16);
            this.label3.TabIndex = 11;
            this.label3.Text = "Cod Categorie";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(988, 654);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(89, 16);
            this.label4.TabIndex = 12;
            this.label4.Text = "Cod Stil Lupta";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(1103, 651);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(63, 16);
            this.label5.TabIndex = 13;
            this.label5.Text = "Cod Sala";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(1173, 653);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 16);
            this.label6.TabIndex = 14;
            this.label6.Text = "Cod Manager";
            // 
            // numeLBox
            // 
            this.numeLBox.Location = new System.Drawing.Point(593, 691);
            this.numeLBox.Name = "numeLBox";
            this.numeLBox.Size = new System.Drawing.Size(100, 22);
            this.numeLBox.TabIndex = 15;
            // 
            // descLBox
            // 
            this.descLBox.Location = new System.Drawing.Point(727, 691);
            this.descLBox.Name = "descLBox";
            this.descLBox.Size = new System.Drawing.Size(100, 22);
            this.descLBox.TabIndex = 16;
            // 
            // codLupBox
            // 
            this.codLupBox.Location = new System.Drawing.Point(991, 691);
            this.codLupBox.Name = "codLupBox";
            this.codLupBox.Size = new System.Drawing.Size(100, 22);
            this.codLupBox.TabIndex = 17;
            // 
            // codSalBox
            // 
            this.codSalBox.Location = new System.Drawing.Point(1106, 691);
            this.codSalBox.Name = "codSalBox";
            this.codSalBox.Size = new System.Drawing.Size(100, 22);
            this.codSalBox.TabIndex = 18;
            // 
            // codManBox
            // 
            this.codManBox.Location = new System.Drawing.Point(1230, 691);
            this.codManBox.Name = "codManBox";
            this.codManBox.Size = new System.Drawing.Size(100, 22);
            this.codManBox.TabIndex = 19;
            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(1230, 768);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(100, 23);
            this.addButton.TabIndex = 20;
            this.addButton.Text = "Add Luptator";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.onAddButtonClick);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(593, 753);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 22);
            this.textBox1.TabIndex = 21;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1583, 813);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.codManBox);
            this.Controls.Add(this.codSalBox);
            this.Controls.Add(this.codLupBox);
            this.Controls.Add(this.descLBox);
            this.Controls.Add(this.numeLBox);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.codCatText);
            this.Controls.Add(this.childComboBox);
            this.Controls.Add(this.parentComboBox);
            this.Controls.Add(this.labelChild);
            this.Controls.Add(this.labelParent);
            this.Controls.Add(this.dataGridViewChild);
            this.Controls.Add(this.dataGridViewParent);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewParent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewChild)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private DataGridView dataGridViewParent;
        private DataGridView dataGridViewChild;
        private Label labelParent;
        private Label labelChild;
        private ComboBox parentComboBox;
        private ComboBox childComboBox;
        private TextBox codCatText;
        private Button updateButton;
        private Button deleteButton;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private TextBox numeLBox;
        private TextBox descLBox;
        private TextBox codLupBox;
        private TextBox codSalBox;
        private TextBox codManBox;
        private Button addButton;
        private TextBox textBox1;
    }
}

