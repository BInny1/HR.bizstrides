<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Attendance._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/reset.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/UI.css" />
    <link rel="stylesheet" href="css/inputs.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <!-- 
<link href='http://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Wallpoet' rel='stylesheet' type='text/css'>
-->

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

    <script type="text/javascript" src="js/jquery-ui.min.js"></script>

    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>

    <form id="form1" runat="server" class="h100p">
     <div class="dummyPopup">
        &nbsp;</div>
  <asp:ScriptManager ID="scp1" runat="server">
    </asp:ScriptManager>
    <!-- Headder Start  -->
    <div class="wid100p">
        <div class="headder">
            <a href="#" class="logo">Biz Strides:
                <asp:Label ID="lblLocation" runat="server"></asp:Label>
            </a>
            <div class="tDate">
                <span class="cDate" style="margin-bottom: 1px; margin-top: 2px;">Date: 9th Sept 2013
                </span>
                <div class="cTime">
                    <b>--:--:-- AM</b> <a href="javascript:location.reload();" class="btn btn-small btn-mini btn-success">
                        Refresh</a></div>
            </div>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
        </div>
    </div>
    <!-- Headder End  -->
    <!-- Content Start  -->
    <div class="wid100p" style="height: 92%; min-height: 92%;">
        <div style="margin: 1%; width: 98%; height: 98%; min-width: 98%;">
            <table class="totalHolder">
                <tr>
                    <td style="vertical-align: top;">
                        <!-- Left Total Users List Start  -->
                        <div class="bor boxC1" style="margin: 0 5px;">
                            <h2 class="one" style="background: #fff; color: #2286c1; border-bottom: #2286c1 1px solid;">
                                Scheduled In <span>(<b></b>)</span></h2>
                            <div class="inner ">
                                <asp:Repeater ID="rpEmp" runat="server" OnItemDataBound="rpEmp_ItemDataBound">
                                    <HeaderTemplate>
                                        <ul class="users" id="origin">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="user" rel="tooltip">
                                            <asp:Image ID="imgPicture" runat="server" ImageUrl='<%#Eval("PhotoLink") %>' />
                                            <asp:HiddenField ID="hdnFirstName" runat="server" Value='<%#String.Concat(Eval("FirstName"),"  ",Eval("LastName").ToString()) %>' />
                                            <asp:HiddenField ID="hdnUserID" runat="server" Value='<%#Eval("UserID") %>' />
                                            <asp:HiddenField ID="hdnStartTime1" runat="server" Value='<%#Eval("StartTime") %>' />
                                              <asp:HiddenField ID="hdnEndTime1" runat="server" Value='<%#Eval("EndTime") %>' />
                                            
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="clear">
                                &nbsp;</div>
                        </div>
                        <!-- Left Total Users List End  -->
                    </td>
                    <td style="vertical-align: top;">
                        <!-- Mid Users List Start  -->
                        <div class="bor boxC2" style="margin: 0 5px;">
                            <h2 class="two" style="background: #fff; color: #82c621; border-bottom: #82c621 1px solid;">
                                Signed in <span>(<b></b>)</span></h2>
                            <div class="inner ">
                                <asp:Repeater ID="rpLogin" runat="server" OnItemDataBound="rpLogin_ItemDataBound">
                                    <HeaderTemplate>
                                        <ul class="users" id="drop1">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="user" rel="tooltip">
                                            <%--login time--%>
                                             <asp:Image ID="imgPicture1" runat="server" ImageUrl='<%#Eval("PhotoLink") %>' />
                                            <asp:HiddenField ID="hdnFirstName1" runat="server" Value='<%#String.Concat(Eval("FirstName"),"  ",Eval("LastName").ToString()) %>' />
                                            <asp:HiddenField ID="hdnUserID1" runat="server" Value='<%#Eval("UserID") %>' />                                           
                                             <asp:HiddenField ID="hdnStartTime2" runat="server" Value='<%#Eval("StartTime") %>' />
                                              <asp:HiddenField ID="hdnEndTime2" runat="server" Value='<%#Eval("EndTime") %>' />
                                              <asp:HiddenField ID="hdnLogin" runat="server" Value='<%#Eval("LoginDate") %>' />
                                               <asp:HiddenField ID="hdnUserLogID" runat="server" Value='<%#Eval("LogUserID") %>' />
                                            
                                           
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="clear">
                                &nbsp;</div>
                        </div>
                        <!-- Mid Users List End  -->
                    </td>
                    <td style="vertical-align: top;">
                        <!-- Right Users List Start  -->
                        <div class="bor boxC3" style="margin: 0 5px;">
                            <h2 class="three" style="background: #fff; color: #ee8d1a; border-bottom: #ee8d1a 1px solid;">
                                Signed out <span>(<b></b>)</span></h2>
                            <div class="inner  ">
                                <asp:Repeater ID="rplogout" runat="server" OnItemDataBound="rplogout_ItemDataBound">
                                    <HeaderTemplate>
                                        <ul class="users" id="drop2">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="user" rel="tooltip">
                                        <asp:Image ID="imgPicture2" runat="server" ImageUrl='<%#Eval("PhotoLink") %>' />
                                            <asp:HiddenField ID="hdnFirstName2" runat="server" Value='<%#String.Concat(Eval("FirstName"),"  ",Eval("LastName").ToString()) %>' />
                                            <asp:HiddenField ID="hdnUserID2" runat="server" Value='<%#Eval("UserID") %>' />
                                            <asp:HiddenField ID="hdnStartTime3" runat="server" Value='<%#Eval("StartTime") %>' />
                                              <asp:HiddenField ID="hdnEndTime3" runat="server" Value='<%#Eval("EndTime") %>' />
                                            <asp:HiddenField ID="hdnLoginout" runat="server" Value='<%#Eval("LoginDate") %>' />
                                            <asp:HiddenField ID="hdnLogout" runat="server" Value='<%#Eval("LogoutDate") %>' />
                                            
                                            
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="clear">
                                &nbsp;</div>
                        </div>
                        <!-- Right Users List End  -->
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!-- Contrnt End -->
    <!-- Login Popup Start  -->
    <asp:UpdatePanel ID="Updt1" runat="server">
        <ContentTemplate>
            <div class="popupHolder" id="loginPopup">
                <div class="popContent" style="width: 400px; margin-top: 100px">
                    <h2>
                    </h2>
                    <div class="inner">
                        <table style="width: 97%; margin: 20px 5px; border-collapse: collapse;">
                            <tr>
                                <td style="width: 70px; vertical-align: top;">
                                    <img src="images/defaultUSer.jpg" class="userThumb" />
                                </td>
                                <td style="vertical-align: top">
                                    <table style="border-collapse: collapse;" class="loginForm">
                                        <tr>
                                            <td>
                                                Passcode <span class="must">*</span><br />
                                                <input type="password" id="userPass" runat="server"/>
                                                <div style="display: none">
                                                    <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Sign In Notes <i>(Optional)</i><br />
                                                <asp:TextBox ID="txtNpte" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="subm" runat="server" Text="Sign in" class="btn btn-danger" OnClick="subm_Click" />
                                                &nbsp;
                                                <input id="cancel" type="button" value="Cancel" class="btn" />
                                                
                                                
                                            </td>
                                        </tr>
                                         <div style="display:none">
                                        <asp:TextBox ID="ScLIStartTime" runat="server"> </asp:TextBox>
                                        <asp:TextBox ID="ScLIEndTime" runat="server"></asp:TextBox>
                                        </div>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="popupHolder" id="logoutPopup">
                <div class="popContent" style="width: 400px; margin-top: 100px">
                    <h2>
                    </h2>
                    <div class="inner">
                        <table style="width: 97%; margin: 20px 5px; border-collapse: collapse;">
                            <tr>
                                <td style="width: 70px; vertical-align: top;">
                                    <img src="images/defaultUSer.jpg" class="userThumb" />
                                </td>
                                <td style="vertical-align: top">
                                    <table style="border-collapse: collapse;" class="loginForm">
                                        <tr>
                                            <td>
                                                Passcode <span class="must">*</span><br />
                                                <input type="password" id="userPass2" runat="server" />
                                                <div style="display: none">
                                                    <asp:TextBox ID="txtUserID2" runat="server"></asp:TextBox></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Sign Out Notes <i>(Optional)</i><br />
                                                <asp:TextBox ID="txtNpte2" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="logout" runat="server" Text="Sign out" Enabled="true" class="btn btn-danger"
                                                    OnClick="logout_Click" />
                                                &nbsp;
                                                <input id="cancel2" type="button" value="Cancel" class="btn" />
                                            </td>
                                        </tr>
                                         <asp:HiddenField ID="hdnLogoutUserID" runat="server" />
                                       <div style="display:none"><asp:TextBox ID="loginID" runat="server" > </asp:TextBox>
                                        <asp:TextBox ID="logintin1" runat="server"> </asp:TextBox>
                                        <asp:TextBox ID="ScLOStartTime" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="ScLOEndTime" runat="server"></asp:TextBox>
                                        </div>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   

    <script type="text/javascript" language="javascript">
    
    var se = new Date($('#lblDate').text());
   
    var month=new Array();
    month[0]="Jan";
    month[1]="Feb";
    month[2]="Mar";
    month[3]="Apr";
    month[4]="May";
    month[5]="Jun";
    month[6]="Jul";
    month[7]="Aug";
    month[8]="Sep";
    month[9]="Oct";
    month[10]="Nov";
    month[11]="Dec";
    var mon = month[se.getMonth()];    
    var day = se.getDate();
    var year = se.getFullYear();
    bindDate();
    
    function bindDate(){
        $('.cDate').text('Date: '+day+' '+mon+' '+year);
    }
    
    
    var serverTime = <%= DateTime.Now.TimeOfDay.TotalSeconds %>;
    var serverOffset = serverTime - getClientTime();

    function getClientTime()
    {
        var time = new Date();
        //console.log((time.getHours() * 60 * 60) + (time.getMinutes() * 60) + (time.getSeconds()));
        return (time.getHours() * 60 * 60) + (time.getMinutes() * 60) + (time.getSeconds());
    }
    
    
    
    //console.log(serverTime)
    //console.log(serverOffset)
   
    
function updateClock ( )
    {
    // lblTime lblDate
    
    var serverTime = getClientTime() + serverOffset; 
    
    var currentHours = Math.floor(serverTime / 60 / 60);
    var currentMinutes = Math.floor(serverTime / 60 % (currentHours * 60));
    var currentSeconds = Math.floor(serverTime % 60);

    // Pad the minutes and seconds with leading zeros, if required
    currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
    currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;

    // Choose either "AM" or "PM" as appropriate
    var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";

    // Convert the hours component to 12-hour format if needed
    currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;

    // Convert an hours component of "0" to "12"
    currentHours = ( currentHours == 0 ) ? 12 : currentHours;

    // Compose the string for display
    var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;
    
    
    $(".cTime b").html(currentTimeString);
        
 }

$(function(){
   setInterval('updateClock()', 1000);
});

    </script>
    </form>
</body>
</html>
