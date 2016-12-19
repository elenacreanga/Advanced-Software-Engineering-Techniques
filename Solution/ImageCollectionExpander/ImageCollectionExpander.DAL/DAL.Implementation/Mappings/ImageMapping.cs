using System.Data.Entity.ModelConfiguration;
using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class ImageMapping : EntityTypeConfiguration<Image>
    {
        public ImageMapping()
        {
            ToTable("Image");

            this.HasKey<int>(x => x.ImageId);

            //Image-Tag - many to many
            this.HasMany<Tag>(x => x.Tags)
                .WithMany(x => x.FoundInImages)
                .Map(x =>
                {
                    x.MapLeftKey("Tag_Id");
                    x.MapRightKey("Image_Id");
                    x.ToTable("TagImages");
                });
        }
    }
}
