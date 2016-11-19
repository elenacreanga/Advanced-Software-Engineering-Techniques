using ImageCollectionExpander.Domain;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class LocationMapping : EntityTypeConfiguration<Location>
    {
        public LocationMapping()
        {
            ToTable("Location");

            this.HasKey<int?>(x => x.LocationId);

            // Location-Image - one to many optional
            this.HasMany<Image>(x => x.FoundInImages)
                .WithOptional(x => x.FlickrLocation)
                .HasForeignKey<int?>(x => x.FlickrLocationId);
        }
    }
}
