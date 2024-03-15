using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agecalculation_AgeCalculation : System.Web.UI.Page
{
   // int[] month;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.tutorialspoint.com/c-program-to-calculate-age
    }

    protected void txtdob_TextChanged(object sender, EventArgs e)
    {
        DateTime agecal;
        DateTime now;
        int year, mn, dd;
        now = DateTime.Now;
        agecal = Convert.ToDateTime(txtdob.Text);
        //mn = now.Month - agecal.Month;
        //dd = now.Day - agecal.Day;
        //year = now.Year - agecal.Year;
        //if (mn == 12)
        //{
        //    year = year + 1;
        //}
        //if (dd == 30 || dd == 31)
        //{
        //    mn = mn + 1;
        //}
        int pdate, pmonth, pyear;
        int bdate, bmonth, byear;
        pdate = now.Day;
        pmonth = now.Month;
        pyear = now.Year;
        bdate = agecal.Day;
        bmonth = agecal.Month;
        byear = agecal.Year;

        age(pdate,pmonth,pyear,bdate,bmonth,byear);




       // txtage.Text = Convert.ToString(year + "Year" + " " + mn + "Month");
    }
    void age(int present_date, int present_month, int present_year, int birth_date, int birth_month, int birth_year)
    {
        int [] month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        if (birth_date > present_date)
        {
            present_date = present_date + month[birth_month - 1];
            present_month = present_month - 1;
        }
        if (birth_month > present_month)
        {
            present_year = present_year - 1;
            present_month = present_month + 12;
        }
        int final_date = present_date - birth_date;
        int final_month = present_month - birth_month;
        int final_year = present_year - birth_year;
        //Response.Write("Present Age Years: %d Months: %d Days: %d", final_year, final_month, final_date);
        //Response.Write(final_year +" " + final_month + " " + final_date);
        txtage.Text = Convert.ToString(final_year + " Years " + " " + final_month + " Months " + final_date + " Days");
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        
       // DateTime dob =Convert.ToDateTime(txtdob.Text).Date;
       // string currentdatetime = DateTime.Now.ToString("dd'/'MM'/'yyyy");
       // DateTime dcurrent =Convert.ToDateTime( currentdatetime).Date;
       // //if ( System.DateTime.Now.Date > Convert.ToDateTime("2021-07-01").Date);
       // //{

       // //}
       // if (dcurrent > dob) 
       // {
       //     lblmsg.Text = "hello";
       // }
       // else
       // {
       //     lblmsg.Text = "hi";
       // }
       // DateTime date = Convert.ToDateTime(txtdob.Text).Date;//24/02/2022  mm/dd/yyyy
       // string date1 = date.ToString();
       // string dt = date1.Substring(3, 2) + "/" + date1.Substring(0, 2) + "/" + date1.Substring(6, 4);
       //// DateTime dobdate =Convert.ToDateTime( dt).Date;
       // DateTime sysdate = DateTime.Now;
       // if(1==1)
       // {
       //     lblmsg.Text = "hello";
       // }
       // else
       // {
       //     lblmsg.Text = "Hi";
       // }
       DateTime ld= Convert.ToDateTime("2022-03-31").Date;//show 31/03-2022
        DateTime now = System.DateTime.Now;
        DateTime getdate = DateTime.Now;
        string date2 = TextBox1.Text;//16/02/2022
        string convdate = date2.Substring(3, 2) + '/' + date2.Substring(0, 2) + '/' + date2.Substring(6, 4); //02/16/2022
        //DateTime DOB =Convert.ToDateTime(convdate).Date;
        //string currentdatetime = DateTime.Now.ToString("dd'/'MM'/'yyyy");
        //DateTime dcurrent = Convert.ToDateTime(currentdatetime).Date;
        DateTime birthdate =Convert.ToDateTime( TextBox1.Text).Date;
        if (now > birthdate)
        {
            lblmsg.Text = "Hello";
        }
       
    }
}