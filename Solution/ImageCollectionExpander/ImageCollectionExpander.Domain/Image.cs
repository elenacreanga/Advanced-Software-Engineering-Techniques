using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.Domain
{
    public class Image
    {
        public List<ImageCollection> BelongsTo { get; set; }
        public String Description { get; set; }
        public Location FlicrLocation { get; set; }
        public String FlickrSize { get; set; }
        public bool FromAPI { get; set; }
        public Location GettyLocation { get; set; }
        public String GettySize { get; set; }
        public String MainColor { get; set; }
        public List<Tag> Tags { get; set; }
        public String Title { get; set; }
        public String Uri { get; set; }

        public Image()
        {

        }
    }
}