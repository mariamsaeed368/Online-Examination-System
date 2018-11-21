using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Online_Examination_Systems
{
    public partial class Courses : System.Web.UI.Page
    {
       SqlConnection sqlCon =new  SqlConnection(@"Data Source=SAIRA-PC SQLEXPRESS;Initial Catalog=Add;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();

            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfCourseNo.Value = "";
            txtCourseName.Text = txtCourseId.Text = "";
            lblErrormessage.Text = lblSuccessMessage.Text = "";
            btnAdd.Text = "ADD";
            btnDelete.Enabled = false;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("CourseCreateOrUpdate",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CourseNo", (hfCourseNo.Value==""?0:Convert.ToInt32(hfCourseNo.Value)));
            sqlCmd.Parameters.AddWithValue("@CourseName",txtCourseName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CourseId",txtCourseId.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            string courseNO = hfCourseNo.Value;
            Clear();
            if (courseNO == "")
                lblSuccessMessage.Text = "Added Successfully";
            else
                lblSuccessMessage.Text = "Updated Succesfully";

            FillGridView();
        }
        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("CourseViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();

        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int courseNo = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("CourseViewById", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@CourseNo", courseNo);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfCourseNo.Value = courseNo.ToString();
            txtCourseName.Text = dtbl.Rows[0]["CourseName"].ToString();
            txtCourseId.Text = dtbl.Rows[0]["CourseId"].ToString();
            btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("CourseDeleteById", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CourseNo",Convert.ToInt32(hfCourseNo.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";

        }

        
    }
}