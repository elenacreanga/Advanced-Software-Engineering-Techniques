using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POC_Getty.Models
{
    public class Image
    {
        public string id;
        public List<Display_size> display_sizes;
        public List<Keyword> keywords;
        public string title;
    }
}