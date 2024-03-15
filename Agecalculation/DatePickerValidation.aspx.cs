using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agecalculation_DatePickerValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        my_date_picker1.Value =Convert.ToDateTime( System.DateTime.Now.Date).ToString("MM/dd/yyyy");
        //if ((System.DateTime.Now.Date > Convert.ToDateTime("2022-03-31").Date))
        // https://www.geeksforgeeks.org/how-to-check-the-input-date-is-equal-to-todays-date-or-not-using-javascript/
        // https://www.c-sharpcorner.com/UploadFile/8911c4/how-to-compare-two-dates-using-javascript/
    }
}