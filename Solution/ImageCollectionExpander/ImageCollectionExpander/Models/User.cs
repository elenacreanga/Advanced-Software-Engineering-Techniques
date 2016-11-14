using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageCollectionExpander.Models
{
    public class User
    {
        public String FbUserName { get; set; }
        public List<ImageCollection> ImageCollections { get; set; }

        public User()
        {

        }
    }
}