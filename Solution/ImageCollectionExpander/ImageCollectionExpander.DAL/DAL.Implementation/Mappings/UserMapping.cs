using System.Data.Entity.ModelConfiguration;
using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class UserMapping : EntityTypeConfiguration<User>
    {
        public UserMapping()
        {
            this.ToTable("User");

            this.HasKey<int>(user => user.UserId);
            this.Property(user => user.FbUserName).HasColumnName("FbUserName").HasMaxLength(150).IsRequired();

            //User - ImageCollection - one to many required
            this.HasMany<ImageCollection>(user => user.ImageCollections)
                .WithRequired(imgCollection => imgCollection.User)
                .HasForeignKey(imgCollection => imgCollection.UserId);
        }
    }
}
