using System;
using System.Collections.Generic;

namespace ImageCollectionExpander.Domain
{
    public class ImageCollection
    {
        public int ImageCollectionId { get; set; }
        public List<Image> Images { get; set; }
        public List<Tag> MainTags { get; set; }
        public String Name { get; set; }

        public ImageCollection()
        {

        }
    }
}