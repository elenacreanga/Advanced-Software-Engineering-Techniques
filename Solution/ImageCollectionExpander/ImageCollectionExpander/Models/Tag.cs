using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageCollectionExpander.Models
{
    public class Tag
    {
        public int TagId { get; set; }
        public int GettyTagId { get; set; }
        public String TagPhrase { get; set; }

        public Tag()
        {

        }
    }
}