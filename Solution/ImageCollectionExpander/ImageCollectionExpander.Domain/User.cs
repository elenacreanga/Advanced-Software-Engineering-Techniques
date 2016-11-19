using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.Domain
{
    public class User
    {
        public int UserId { get; set; }
        public String FbUserName { get; set; }
        public virtual ICollection<ImageCollection> ImageCollections { get; set; }

        public User()
        {
            ImageCollections = new List<ImageCollection>();
        }
    }
}