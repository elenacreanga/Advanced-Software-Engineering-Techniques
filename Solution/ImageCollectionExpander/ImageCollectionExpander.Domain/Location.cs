using System.Collections.Generic;
namespace ImageCollectionExpander.Domain
{
    public class Location
    {
        public int? LocationId { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }

        public virtual ICollection<Image> FoundInImages { get; set; }

        public Location()
        {
            FoundInImages = new List<Image>();
        }
    }
}