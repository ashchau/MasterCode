using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Http;
using System.Web.Script.Serialization;
public partial class CallmvcApi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.PopulateGridView();
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.PopulateGridView();
    }
    private void PopulateGridView()
    {
        string apiUrl = "http://localhost:54462/api/CustomerAPI"; // this api call from MVCApiwithAsp.net project
        var input = new
        {
            Name = txtName.Text.Trim(),
        };
        string inputJson = (new JavaScriptSerializer()).Serialize(input);
        HttpClient client = new HttpClient();
        HttpContent inputContent = new StringContent(inputJson, Encoding.UTF8, "application/json");
        HttpResponseMessage response = client.PostAsync(apiUrl + "/GetCustomers", inputContent).Result;
        if (response.IsSuccessStatusCode)
        {
            List<Customer> customers = (new JavaScriptSerializer()).Deserialize<List<Customer>>(response.Content.ReadAsStringAsync().Result);
            gvCustomers.DataSource = customers;
            gvCustomers.DataBind();
        }
    }
    public class Customer
    {
        public string CustomerID { get; set; }
        //public string ContactName { get; set; }
        public string CompanyName { get; set; }
        public string City { get; set; }
    }
}