using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stringprog_CheckVowels : System.Web.UI.Page
{
    //string str;
    int vowels = 0, consonants = 0;
    string constring =string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Switchcasecharcount();
        binddata();
        bindlist();
    }
    public static bool Isvowels(string str)
    {
        str = str.ToLower();
        char[] character = str.ToCharArray();
        for(int i=0;i<character.Length;i++)
        {
            if(character[i]=='a' || character[i]=='i' || character[i]=='o' || character[i]=='u')
            //{ when a for loop contain only one line under body then no need to write  the {} brases
                return true;
            //}   ------------------------------------
        }
        return false;
    }

    protected void btnvowel_Click(object sender, EventArgs e)
    {
      bool result=  Isvowels(TextBox1.Text.Trim().ToString());
        if (result)
            lblvowels.Text = "Contain Vowels";
        else
            lblvowels.Text = "Does not contain Vowels";

        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Pop", "$(document).ready(function(){$('#processed-modal').modal('show'); });", true);

    }
    public  void vowelscount()
    {
        //https://www.geeksforgeeks.org/c-sharp-program-to-count-number-of-vowels-and-consonants-in-a-given-string/
        //int vowels=0, consonants=0;
        string str = TextBox2.Text.ToLower();
        char[] character =str.ToCharArray();
        for (int i = 0; i < character.Length; i++)
        {
            if (character[i] == 'a' || character[i]=='e' || character[i] == 'i' || character[i] == 'o' || character[i] == 'u')
            {
                vowels++;
            }   
            else
            {
                
               // constring = character[i].ToString();
               if(character[i].ToString()==" ")
               {
                    //use for left blank count of string
               }
                    else
                    {
                        consonants++;
                        constring += character[i].ToString() + ",";
                    }
                    
            }
        }
    }

    protected void btnVCCount_Click(object sender, EventArgs e)
    {
        vowelscount();
        lblconsonantcount.Text =Convert.ToInt32( consonants).ToString();
        lblvowelcount.Text = Convert.ToInt32(vowels).ToString();
        lblvowels.Text = constring;
    }
    public void Switchcasecharcount()
    {
        var total = 0;
        var sentence = "Hello, I'm Chris";
        foreach (char c in sentence.ToLower())
        {
            switch (c)
            {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                    total++;
                    break;
                default: continue;
            }

        }
        lblvowels.Text =Convert.ToInt32( total).ToString();
    }
    public void binddata()
    {
        //https://www.c-sharpcorner.com/UploadFile/mahesh/add-items-to-a-C-Sharp-list/
        List<object> list = new List<object>();
        list.Add("kamal");
        list.Add("Ramesh");
        list.Add("Suresh chauhan");
        ddlname.DataSource = list;
        //ddlname.DataTextField = "";
        //ddlname.DataValueField = "";
        ddlname.DataBind();
        ddlname.Items.Insert(0, new ListItem("<--select name-->", "0"));
    }
    public class ddllist
    {
        public int id { get; set; }
        public string name { get; set; }
    }
    public void bindlist()
    {
        //https://www.c-sharpcorner.com/UploadFile/mahesh/insert-item-into-a-C-Sharp-list/
        List<ddllist> list = new List<ddllist>
        {
             new ddllist{id=1,name="Ashok Chauhan"},
             new ddllist{id=2,name="Santosh singh"},
             new ddllist{id=3,name="Kamal singh"},
             new ddllist{id=5,name="Priya rao"}
        };
        ddlid.DataSource = list;
        ddlid.DataTextField = "name";
        ddlid.DataValueField = "id";
        ddlid.DataBind();
        ddlid.Items.Insert(0, new ListItem("<--select id-->", "0"));
    }
}