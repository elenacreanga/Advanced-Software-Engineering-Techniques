using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.DAL.Entities
{
    public class Tag
    {
        public int TagId { get; set; }
        public int GettyTagId { get; set; }
        public String TagPhrase { get; set; }

        public int ImageCollectionId { get; set; }
        //public virtual ICollection<ImageCollection> ImageCollectionMainTag;

        public virtual ICollection<Image> FoundInImages { get; set; }

        public Tag()
        {
            //ImageCollectionMainTag = new List<ImageCollection>();
            FoundInImages = new List<Image>();
        }
    }
}