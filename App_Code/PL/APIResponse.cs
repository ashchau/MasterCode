using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for APIResponse
/// </summary>
public class APIResponse
{
    public APIResponse()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string successcode { get; set; }
    public string msg { get; set; }
    public object data { get; set; }
    public object additionaldata { get; set; }
}