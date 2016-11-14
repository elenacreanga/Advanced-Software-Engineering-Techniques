using ImageCollectionExpander.DAL.DAL.Implementation.Mappings;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace ImageCollectionExpander.DAL.DAL.Implementation
{
    public class ImageCollectionExpanderDbContext : DbContext
    {
        ImageCollectionExpanderDbContext() : base("name=ImageCollectionExpander") { }

        //DbSet<Image> Images{get;set;}

        //DbSet<ImageCollection> ImageCollections {get;set;}

        // DbSet<Tag> Tags {get;set;}

        //DbSet<User> {get;set;}

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Configurations.Add(new UserMapping());
        }
    }
}
