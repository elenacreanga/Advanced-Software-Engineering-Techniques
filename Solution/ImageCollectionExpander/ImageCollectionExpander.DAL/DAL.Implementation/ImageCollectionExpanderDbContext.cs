﻿using ImageCollectionExpander.DAL.DAL.Implementation.Mappings;
using ImageCollectionExpander.Domain;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace ImageCollectionExpander.DAL.DAL.Implementation
{
    public class ImageCollectionExpanderDbContext : DbContext
    {
        public ImageCollectionExpanderDbContext() : base("name=ImgCollectionExpander") { }

        DbSet<Image> Images { get; set; }

        DbSet<ImageCollection> ImageCollections { get; set; }

        DbSet<Tag> Tags { get; set; }

        DbSet<User> Users { get; set; }

        DbSet<Location> Locations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            this.AddMappings(modelBuilder);
        }

        private void AddMappings(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new UserMapping());
            modelBuilder.Configurations.Add(new ImageCollectionMapping());
            modelBuilder.Configurations.Add(new ImageMapping());
            modelBuilder.Configurations.Add(new TagMapping());
            modelBuilder.Configurations.Add(new LocationMapping());
        }
    }
}