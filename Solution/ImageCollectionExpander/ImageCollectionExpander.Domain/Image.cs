using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.Domain
{
    public class Image
    {
        public int ImageId { get; set; }
      
        public String Description { get; set; }
        public String FlickrSize { get; set; }
        public bool FromAPI { get; set; }
        public string GettyLocation { get; set; }
        public String GettySize { get; set; }
        
        public String MainColor { get; set; }
        public String Title { get; set; }
        public String Uri { get; set; }
        public String Uris { get; set; };
        public virtual Location FlickrLocation { get; set; }

        public int? FlickrLocationId { get; set; }

        public virtual ICollection<ImageCollection> BelongsTo { get; set; }

        public virtual ICollection<Tag> Tags { get; set; }

        public Image()
        {
            BelongsTo = new List<ImageCollection>();
            Tags = new List<Tag>();
        }
    }
}