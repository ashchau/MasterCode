using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
public partial class ImportExport_GetpageUrl : System.Web.UI.Page
{
    string pyurl = "www.jaipurmc.org/homepage.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        GetUrl();
        //Showpageurl();
        //ReplaceUrl();
        PreparePOSTForm(pyurl);
        HastableMethod();
        Revercestr();
        //Revercewhile();
        Numberrev();
        Sumofnum();
        //Armstrongno();
        //if (!IsPostBack)
        //{
        //    SetUpTimer(new TimeSpan(17, 22, 20));
        //}
        SetUpTimer(new TimeSpan(17, 27, 00));
    }
    public void GetUrl()
    {
        //https://www.howtoasp.net/how-to-get-current-page-url-in-asp-net/
        string absoluteurl = HttpContext.Current.Request.Url.AbsoluteUri;
        Label1.Text = absoluteurl;
        // https://localhost:80/test/Default.aspx?test=1   //1. To get the full URL with query string (if any) you could use:
        string absolutepath = HttpContext.Current.Request.Url.AbsolutePath;
        Label2.Text = absolutepath;
        // /test/Default.aspx  //2. To get the path without the domain you could use:
        string host = HttpContext.Current.Request.Url.Host;
        Label3.Text = host;
        // localhost  //3. To get the Host:
    }
    public void Showpageurl()
    {
        Response.Write("<br/>Host: " + HttpContext.Current.Request.Url.Host);
        Response.Write("<br/>Authority: " + HttpContext.Current.Request.Url.Authority);
        Response.Write("<br/>Port: " + HttpContext.Current.Request.Url.Port);
        Response.Write("<br/>AbsolutePath: " + HttpContext.Current.Request.Url.AbsolutePath);
        Response.Write("<br/><b>RawUrl:</b>" + HttpContext.Current.Request.RawUrl);
        Response.Write("<br/>ApplicationPath: " + HttpContext.Current.Request.ApplicationPath);
        Response.Write("<br/>AbsoluteUri: " + HttpContext.Current.Request.Url.AbsoluteUri);
        Response.Write("<br/>PathAndQuery: " + HttpContext.Current.Request.Url.PathAndQuery);
        // Request.Url.AbsoluteUri.Split('?')[0]
        //It takes the url of the current web request, including the query string , and then extracts the part before the query string i.e.the part before the question mark(?).


    }
    public void ReplaceUrl()
    {
        String strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
        String strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/ImportExport/GetAllFolderFiles.aspx");
        Response.Write("<br/>strPathAndQuery: " + strPathAndQuery);
        Response.Write("<br/>RepstrUrl:" +strUrl);
        repurl.HRef = strUrl;
    }
    public void HastableMethod()
    {
        Hashtable numbers = new Hashtable();
        numbers.Add(1, "one");
        numbers.Add(2, "two");
        numbers.Add(3, "three");
        numbers.Add(4, "four");
        numbers.Add(5, "five");
        foreach (DictionaryEntry num in numbers)
        {
            Response.Write("<br/>" + num.Key + "   -   " + num.Value);
        }
        Response.Write("<br/>"+"Foreach loop without dictionary");
        foreach (var item in numbers.Keys)
        {
            Response.Write("<br/>"+ item + " : "+ numbers[item]);
        }
        Dictionary<int, string> dictionary = new Dictionary<int, string>();
        dictionary.Add(1, "one");
        dictionary.Add(2, "two");
        dictionary.Add(3, "three");
        dictionary.Add(4, "four");
        dictionary.Add(5, "five");
        foreach (KeyValuePair<int, string> pair in dictionary)
        {
            Response.Write("<br/>"+ pair.Key + "   -   " + pair.Value);
        }
    }
    private string PreparePOSTForm(string url)      // post form
    {
        Hashtable data = new Hashtable();
        data.Add("1", "Ashok");
        data.Add("2", "Santosh");
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    public void Revercestr()
    {
        string Myname = "Ashok chauhan";
        char[] name = Myname.ToArray();
        string reversedString = string.Empty;
        for (int i = name.Length - 1; i > -1; i--)
        {
            // Append each character to the reversedstring.
            reversedString += name[i];
        }
        lblresverce.Text=reversedString;
    }
    public void Revercewhile()
    {
        string Myname = "Ashok chauhan";
        string ReverseStr = string.Empty;
        int strlength = 0;
        strlength = Myname.Length - 1;
        while(strlength>=0)
        {
            ReverseStr = ReverseStr + Myname[strlength];
            strlength--;
        }
        lblresverce.Text = ReverseStr;
        
    }
    public void Numberrev()
    {
        int Number = 880046;
        int Reverse = 0;
        while (Number > 0)
        {
            int remainder = Number % 10;
            Reverse = (Reverse * 10) + remainder;
            Number = Number / 10;
        }
        lblresverce.Text =Convert.ToString(Reverse);
    }
    public void Sumofnum()
    {
       int n = 17463;
       int sum = 0;
        while (n != 0)
        {
            sum += n % 10;
            n /= 10;
         }
        lblsub.Text =sum.ToString();//out put is:21
    }
    public void Armstrongno()
    {
        //https://www.javatpoint.com/armstrong-number-in-c
        //https://www.geeksforgeeks.org/program-for-armstrong-numbers/
        //For example 0, 1, 153, 370, 371 and 407 are the Armstrong numbers.
        //Armstrong number is a number that is equal to the sum of cubes of its digits. For example 0, 1, 153, 370, 371 and 407 are the Armstrong numbers.
        //int n =153, r, sum = 0, temp;
        int n, r, sum = 0, temp;
        n =Convert.ToInt32(txtarms.Text);
        int digit = (int)Math.Log10(n) + 1;
        temp = n;
        while (n > 0)
        {
            r = n % 10;
            //sum = sum + (r * r * r);
            sum = sum + (int)Math.Pow(r, digit);
            n = n / 10;
        }
        if (temp == sum)
        {
            lblarms.Text = txtarms.Text + " is a Armstrong  number ";
            lblarmssum.Text = "Sum of Number" + sum.ToString();
            lblarms.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblarms.Text = txtarms.Text + "  is a not armstrong number";
            lblarmssum.Text ="Sum of Number" + sum.ToString();
            lblarms.ForeColor = System.Drawing.Color.Red;
        }
    }
    public void Palindromeno()
    {
        //A palindrome number is a number that is same after reverse. For example 121, 34543, 343, 131, 48984 are the palindrome numbers.
        int n, r, sum = 0, temp;
        n = int.Parse(txtarms.Text);
        temp = n;
        //while (n > 0)
        //{
        //    r = n % 10;
        //    sum = (sum * 10) + r;
        //    n = n / 10;
        ////     n /= 10; //you can also write like this , know as shorthand method.
        //}
        for (temp = n; n != 0; n = n / 10)
        {
            r = n % 10;
            sum = sum * 10 + r;
        }
        if (temp == sum)
        {
            lblarms.Text = txtarms.Text + "Number is Palindrome.";
            lblarmssum.Text = "Reverce of Number" + sum.ToString();
            lblarms.ForeColor = System.Drawing.Color.Green;
        }
           
        else
        {
            lblarms.Text = txtarms.Text + "Number is not Palindrome";
            lblarmssum.Text = "Reverce of Number" + sum.ToString();
            lblarms.ForeColor = System.Drawing.Color.Red;
        }
    }
    public void FibonacciExample()
    {
        int n1 = 0, n2 = 1, n3, i, number;
        string f1="", f2="";
        number = int.Parse(txtarms.Text);
        f1= n1 + ", " + n2 + ","; //printing 0 and 1    
        for (i = 2; i < number; ++i) //loop starts from 2 because 0 and 1 are already printed    
        {
            n3 = n1 + n2;
            f2=(n3 + ",");
            f1 += f2;
            n1 = n2;
            n2 = n3;
        }
        //https://www.c-sharpcorner.com/blogs/remove-last-character-from-string-in-c-sharp1
        lblarms.Text = f1.Remove(f1.Length-1,1);// Remove last character from a string
    }
    protected void btnarms_Click(object sender, EventArgs e)
    {
        // Armstrongno();
        //Palindromeno();
        FibonacciExample();
    }

    private System.Threading.Timer timer;
    private void SetUpTimer(TimeSpan alertTime)
    {
        DateTime current = DateTime.Now;
        TimeSpan timeToGo = alertTime - current.TimeOfDay;
        if (timeToGo < TimeSpan.Zero)
        {
            return;//time already passed
        }
        this.timer = new System.Threading.Timer(x =>
        {
            this.SomeMethodRunsAt1600();
        }, null, timeToGo, Timeout.InfiniteTimeSpan);
    }

    private void SomeMethodRunsAt1600()
    {
        lblarms.Text = "Hi..";
        //this runs at 16:00:00
    }
}