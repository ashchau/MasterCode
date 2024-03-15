using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.SqlClient;
public partial class Popupbootstrap_PopupGrid_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDummyGridrow();
            //https://www.c-sharpcorner.com/blogs/get-data-from-sql-server-and-bind-gridview-using-jquery-json-and-ajax
        }
    }
    public void BindDummyGridrow()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Customer ID");
        dt.Columns.Add("Name");
        dt.Columns.Add("Mobile");
        dt.Columns.Add("City");
        gvData.DataSource = dt;
        gvData.DataBind();
    }
    [WebMethod]
    public static Customer[] BindCustomers()
    {
        string connectionString = @"Data Source=DILSHAD; database=demo;Integrated Security=true";
        DataTable dt = new DataTable();
        List<Customer> custList = new List<Customer>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand("select * from Customers", con))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
                foreach (DataRow dtrow in dt.Rows)
                {
                    Customer cust = new Customer();
                    cust.CustomerID = dtrow["CustomerID"].ToString();
                    cust.Name = dtrow["Name"].ToString();
                    cust.Mobile = dtrow["Mobile"].ToString();
                    cust.City = dtrow["City"].ToString();
                    custList.Add(cust);
                }
            }
        }
        return custList.ToArray();
    }
    public class Customer
    {
        public string CustomerID
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Mobile
        {
            get;
            set;
        }
        public string City
        {
            get;
            set;
        }
    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string name)
    {
        return "Hello " + name + Environment.NewLine + "The Current Time is: " +
            DateTime.Now.ToString();
    }
    //https://www.c-sharpcorner.com/UploadFile/0cefc4/introduction-to-jquery-ajax-call-in-Asp-Net/
    //[System.Web.Script.Services.ScriptService]
    //public class TempratureConverter : System.Web.Services.WebService
    //{

    [WebMethod]
        public static string FahrenheitToCelsius(string fahrenheit)
        {
            return (((Convert.ToDouble(fahrenheit) - 32) / 9) * 5).ToString();
        }

        [WebMethod]
        public static string CelsiusToFahrenheit(string celsius)
        {
            return (((Convert.ToDouble(celsius) * 9) / 5) + 32).ToString();
        }
    //}
  
}