using System;
using System.Linq;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.DAL.Entities;
using ImageCollectionExpander.Domain.Getty;

namespace ImageCollectionExpander.Domain
{
    public class Image : IMapper<DAL.Entities.Image>
    {
        public void MapFromEntity(DAL.Entities.Image entity)
        {
            ImageId = entity.ImageId;
            Description = entity.Description;
            FlickrSize = entity.FlickrSize;
            FromAPI = entity.FromAPI;
            GettyLocation = entity.GettyLocation;
            GettySize = entity.GettySize;
            MainColor = entity.MainColor;
            Title = entity.Title;
            Uri = entity.Uri;
            FlickrLocation = entity.FlickrLocation;
            FlickrLocationId = entity.FlickrLocationId;
        }

        public void MapFromGettyImage(GettyImage gettyImage)
        {
            Title = gettyImage.title;
            GettySize = gettyImage.display_sizes.First().name;
            Uri = gettyImage.display_sizes.First().uri;
            Description = gettyImage.caption;
        }

        public int ImageId { get; set; }

        public String Description { get; set; }
        public String FlickrSize { get; set; }
        public bool FromAPI { get; set; }
        public string GettyLocation { get; set; }
        public String GettySize { get; set; }
        public String MainColor { get; set; }
        public String Title { get; set; }
        public String Uri { get; set; }
        public Location FlickrLocation { get; set; }
        public int? FlickrLocationId { get; set; }
    }
}
