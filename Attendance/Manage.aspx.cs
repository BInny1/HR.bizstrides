using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Attendance.BAL;
using Attendance.Entities;
using System.Data.SqlClient;

namespace Attendance
{
    public partial class Manage : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceConn"].ToString());
        Business business = new Business();
        string strIp = "";
        Attendance.Entities.Entities entities = new Attendance.Entities.Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                bool IsValid = false;
                //return result;
                String strHostName = Request.UserHostAddress.ToString();
                strIp = System.Net.Dns.GetHostAddresses(strHostName).GetValue(0).ToString();
                Session["Ipadd"] = strIp;
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                SqlCommand cmd = new SqlCommand("select IpAddress from Tbl_MasterIpAddress where IpAddress in ('" + strIp + "') ", cn);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    IsValid = true;
                    Session["IsValid"] = IsValid;
                }
                else
                    Session["IsValid"] = false;
                dr.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SqlDataReader dr;

            if (cn.State != ConnectionState.Open) cn.Open();
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
            cmd.Connection = cn;
            cmd1.Connection = cn;
            string str = " select a.FirstName,a.EMPID,b.LocationName,a.PassCode from Tbl_HrData as a left join Tbl_MasterLocation as b on " +
                       " a.locationId=b.LocationId where a.EMPID='" + txtEmpId.Text +
                       "' and b.LocationName='" + txtLocationNme.Text + "' and a.Password='" + txtPass.Text + "' and a.ismanage=1";
            cmd.CommandText = str;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                entities.EMPID = txtEmpId.Text;
                entities.LocationName = txtLocationNme.Text;
                string loc = txtLocationNme.Text;
                Session["LocationName"] = loc;
                entities.passcode = txtPass.Text;
                entities.IpAddress = Session["Ipadd"].ToString();

                string ischeck = Session["IsValid"].ToString();
                if (ischeck == "True")
                {
                    business.UpdateIP(entities);
                }
                else if (ischeck == "False")
                    business.SaveManagerDetails(entities);

                // txtUsername.Text = "";
                txtEmpId.Text = "";
                txtLocationNme.Text = "";
                txtPass.Text = "";
                Response.Redirect("Default.aspx");

                // Response.Redirect("Default.aspx?Locname="+loc);

            }
            else
            {
                lblmsg.Text = "Please Provide correct details.";
                // txtUsername.Text = "";
                txtEmpId.Text = "";
                txtLocationNme.Text = "";
                txtPass.Text = "";
                txtEmpId.Focus();

            }
            dr.Close();




            // if (dsManager.Tables.Count > 0)
            //{
            //    if (dsManager.Tables[0].Rows.Count > 0)
            //    {
            //        txtUsername.Text=dsManager.Tables
            //id = dsManager.Tables[0].Rows[0]["LogUserID"].ToString();

            // loginID.Text = ds.Tables[0].Rows[0]["LogUserID"].ToString();
            // logintin1.Text = ds.Tables[0].Rows[0]["Logindate"].ToString();
            // DataSet dsImages1 = new DataSet();
            // dsImages1 = business.BindLogin();
            // rpLogin.DataSource = dsImages1;
            // rpLogin.DataBind();
            // mdlLoginpopup.Hide();
            // bnew = 1;



        }
    }
}
