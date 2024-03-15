using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for CommonCallApi
/// </summary>
public class CommonCallApi
{
    APIResponse res;
    DataTable dt;
    public CommonCallApi()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public APIResponse CallPostApi(string URL, PlLogin plLogin)
    {
        try
        {
            //res = new APIResponse();
            //res.data = plLogin;
            //var json = JsonConvert.SerializeObject(res.data);
            //HttpClient HClient = new HttpClient();
            //HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            //HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //HClient.Timeout = TimeSpan.FromMinutes(10);
            //var content = new StringContent(json, Encoding.UTF8, "application/json");
            //var response = HClient.PostAsync(URL, content).Result;
            //var a = response.Content.ReadAsStringAsync().Result.ToString();
            //res = JsonConvert.DeserializeObject<APIResponse>(a);
            //return res;

            //this code also run ,direct without convert pl class into SerializeObject res  this code not use res object
            res = new APIResponse();
            HttpClient HClient = new HttpClient();
            HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HClient.Timeout = TimeSpan.FromMinutes(10);
            var json = JsonConvert.SerializeObject(plLogin);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = HClient.PostAsync(URL, content).Result;
            var a = response.Content.ReadAsStringAsync().Result.ToString();
            res = JsonConvert.DeserializeObject<APIResponse>(a);
            return res;
        }
        catch
        {

            return res = null;

        }
    }
    public APIResponse CallPostApires(string URL, PlLogin plLogin)
    {
        try
        {
            res = new APIResponse();
            res.data = plLogin;
            HttpClient HClient = new HttpClient();
            HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HClient.Timeout = TimeSpan.FromMinutes(10);
            var json = JsonConvert.SerializeObject(res);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = HClient.PostAsync(URL, content).Result;
            var a = response.Content.ReadAsStringAsync().Result.ToString();
            res = JsonConvert.DeserializeObject<APIResponse>(a);
            return res;
        }
        catch
        {

            return res = null;

        }
    }
    public DataTable CallPostApiDt(string URL, PlLogin plLogin)
    {
        try
        {
            HttpClient HClient = new HttpClient();
            HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HClient.Timeout = TimeSpan.FromMinutes(10);
            var json = JsonConvert.SerializeObject(plLogin);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = HClient.PostAsync(URL, content).Result;
            var a = response.Content.ReadAsStringAsync().Result.ToString();
            dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(a);
            return dt;
        }
        catch
        {

           // return res = null;

        }
        return dt;
    }
    public static DataTable CallApiGetDt(string Url)
    {
        try
        {
            HttpClient HClient = new HttpClient();
            HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            var Response = HClient.GetAsync(Url).Result;
            var a = Response.Content.ReadAsStringAsync().Result.ToString();
            DataTable dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(a);
            return dt;
        }
        catch (Exception ex)
        {
            DataTable dt;
            return dt = null;
        }

    }
    public static DataTable CallApiPostDt(string URL, Pl_lotterydoc pl_Lotterydoc)
    {
        DataTable dt;
        try
        {
            HttpClient HClient = new HttpClient();
            HClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["BaseUrl"].ToString());
            HClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            var uri = URL;
            var json = JsonConvert.SerializeObject(pl_Lotterydoc);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = HClient.PostAsync(uri, content).Result;
            var resData = response.Content.ReadAsStringAsync().Result.ToString();
            dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(resData);
            return dt;
        }

        catch
        {
            dt = new DataTable();
            return dt;
        }
    }
}