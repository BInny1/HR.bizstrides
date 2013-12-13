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
    public partial class _Default : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection("Data Source=66.23.236.151;Initial Catalog=EMPDB_Test;User ID=mahesh;Password=Mahesh@123;Connect Timeout=500000;pooling=true;Max Pool Size=500;packet size=8000");
        Business business = new Business();

        Attendance.Entities.Entities entities = new Attendance.Entities.Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

            String strHostName = Request.UserHostAddress.ToString();
            string strIp = System.Net.Dns.GetHostAddresses(strHostName).GetValue(0).ToString();
            DataSet dsLocation = new DataSet();

            dsLocation = business.GetLocationNameByIpAdress(strIp);
            if (dsLocation.Tables.Count > 0)
            {
                if (dsLocation.Tables[0].Rows.Count > 0)
                {
                    DataSet dsDateNow = business.GetUTCDatetime();
                    DateTime dtNow = Convert.ToDateTime(dsDateNow.Tables[0].Rows[0]["Datetime"].ToString());
                    TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById(dsLocation.Tables[0].Rows[0]["TimeZoneName"].ToString());
                    DateTime cstTime = TimeZoneInfo.ConvertTimeFromUtc(dtNow, cstZone);
                    lblLocation.Text = dsLocation.Tables[0].Rows[0]["LocationName"].ToString();

                    lblDate.Text = cstTime.ToString("dddd MMMM dd yyyy, hh:mm tt ");

                    string LocationName = lblLocation.Text;
                    DataSet dsImages = new DataSet();
                    dsImages = business.BindData(LocationName);
                    rpEmp.DataSource = dsImages;
                    rpEmp.DataBind();

                    DataSet dsImages1 = new DataSet();
                    dsImages1 = business.BindLogin();
                    rpLogin.DataSource = dsImages1;
                    rpLogin.DataBind();

                    DataSet dsImages2 = new DataSet();
                    dsImages2 = business.BindLogout();
                    rplogout.DataSource = dsImages2;
                    rplogout.DataBind();

                }
                else
                {
                    //  System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "alert('Your request has been received.we will get back to you soon');", true);
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "alert('Your Ipaddress is not registered');", true);
                }
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "alert('Your Ipaddress is not registered');", true);
            }

          

        }


        protected void rpLogin_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HiddenField hdnFirstName = (HiddenField)e.Item.FindControl("hdnFirstName1");
                HiddenField hdnUserID = (HiddenField)e.Item.FindControl("hdnUserID1");
                HiddenField hdnliStartTime = (HiddenField)e.Item.FindControl("hdnStartTime2");
                HiddenField hdnliEndTime = (HiddenField)e.Item.FindControl("hdnEndTime2");
                HiddenField hdnLogin = (HiddenField)e.Item.FindControl("hdnLogin");


                Image imgAgent = (Image)e.Item.FindControl("imgPicture1");
                if (imgAgent.ImageUrl == "")
                {
                    imgAgent.AlternateText = hdnFirstName.Value.ToString();

                }
                else
                {

                    imgAgent.ImageUrl = @"Photos/" + imgAgent.ImageUrl;

                }

            }
        }
        protected void rplogout_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HiddenField hdnFirstName = (HiddenField)e.Item.FindControl("hdnFirstName2");
                HiddenField hdnUserID = (HiddenField)e.Item.FindControl("hdnUserID2");
                HiddenField hdnLoginout = (HiddenField)e.Item.FindControl("hdnLoginout");
                HiddenField hdnLogout = (HiddenField)e.Item.FindControl("hdnLogout");
                HiddenField hdnloStartTime = (HiddenField)e.Item.FindControl("hdnStartTime3");
                HiddenField hdnloEndTime = (HiddenField)e.Item.FindControl("hdnEndTime3");
                Image imgAgent = (Image)e.Item.FindControl("imgPicture2");
                if (imgAgent.ImageUrl == "")
                {
                    imgAgent.AlternateText = hdnFirstName.Value.ToString();

                }
                else
                {
                    imgAgent.ImageUrl = @"Photos/" + imgAgent.ImageUrl;
                }


            }
        }
        public void subm_Click(object sender, EventArgs e)
        {

            string logintin = ""; //, scdliStartTime = "", scdliEndTime = "";
            string id = "";
            int bnew = 0;
            entities.UserID = Convert.ToInt32(txtUserID.Text);
            entities.LoginDate = DateTime.Now;
            entities.LoginNotes = txtNpte.Text;
            entities.LocationName = lblLocation.Text;
            entities.passcode = userPass.Value.ToString().Trim();

            DataSet ds = business.SaveLogDetails(entities);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //logintin1.Text = ds.Tables[0].Rows[0]["Logindate"].ToString();
                    //  logintin = ds.Tables[0].Rows[0]["Logindate"].ToString();
                    // ScLIStartTime.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
                    // ScLIEndTime.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
                    id = ds.Tables[0].Rows[0]["LogUserID"].ToString();

                    loginID.Text = ds.Tables[0].Rows[0]["LogUserID"].ToString();
                    logintin1.Text = ds.Tables[0].Rows[0]["Logindate"].ToString();
                    bnew = 1;
                }
                
            }

            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "changeSuccess1(" + bnew + ");", true);

        }

        public void logout_Click(object sender, EventArgs e)
        {

            logout.Enabled = false;
            string logintin = "", logouttime = "", scdloStartTime = "", scdloEndTime = "";
            int bnew = 0;
            entities.UserID = Convert.ToInt32(txtUserID2.Text);
            entities.LogOutDate = DateTime.Now;
            entities.LogOutNotes = txtNpte2.Text;
            entities.passcode =  userPass2.Value.ToString().Trim();
            int UserLogId = Convert.ToInt32(hdnLogoutUserID.Value);
            DataSet ds = business.SaveLogDetails1(entities, UserLogId);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    logintin = ds.Tables[0].Rows[0]["Logindate"].ToString();
                    //   logouttime = ds.Tables[0].Rows[0]["logoutdate"].ToString();
                    logintin1.Text = ds.Tables[0].Rows[0]["logoutdate"].ToString();
                   // ScLOStartTime.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
                   // ScLOEndTime.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
                    bnew = 1;
                }

            }

            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "changeSuccess2(" + bnew + ");", true);
        }


        protected void rpEmp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HiddenField hdnFirstName = (HiddenField)e.Item.FindControl("hdnFirstName");
                HiddenField hdnUserID = (HiddenField)e.Item.FindControl("hdnUserID");
                HiddenField hdnscStartTime = (HiddenField)e.Item.FindControl("hdnStartTime1");
                HiddenField hdnscEndTime = (HiddenField)e.Item.FindControl("hdnEndTime1");

                Image imgAgent = (Image)e.Item.FindControl("imgPicture");
                if (imgAgent.ImageUrl == "")
                {
                    imgAgent.AlternateText = hdnFirstName.Value.ToString();

                }
                else
                {
                    imgAgent.ImageUrl = @"Photos/" + imgAgent.ImageUrl;
                }
            }
        }
    }
}
