using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.DAL.Entities
{
    public class ImageCollection
    {
        public int ImageCollectionId { get; set; }
        public ICollection<Image> Images { get; set; }
        public ICollection<Tag> MainTags { get; set; }

        public String Name { get; set; }

        public int UserId { get; set; }

        public virtual User User { get; set; }

        public ImageCollection()
        {
            Images = new List<Image>();
            MainTags = new List<Tag>();
        }
    }
}