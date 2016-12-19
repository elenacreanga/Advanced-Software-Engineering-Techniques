using System.Data.Entity.ModelConfiguration;
using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class ImageCollectionMapping : EntityTypeConfiguration<ImageCollection>
    {
        public ImageCollectionMapping()
        {
            this.ToTable("ImageCollection");

            this.HasKey<int>(imgColl => imgColl.ImageCollectionId);

            this.Property(imgColl => imgColl.Name).IsRequired();
            
            // Image - ImageCollection - many to many 
            this.HasMany<Image>(x=>x.Images)
                .WithMany(x => x.BelongsTo)
                .Map(x =>
                {
                    x.MapLeftKey("Image_Id");
                    x.MapRightKey("ImageCollection_Id");
                    x.ToTable("ImageCollectionImages");
                });
        }
    }
}
