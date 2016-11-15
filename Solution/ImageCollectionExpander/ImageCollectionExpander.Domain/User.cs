using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.Domain
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