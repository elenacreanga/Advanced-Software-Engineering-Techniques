using System.Data.Entity.ModelConfiguration;
using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class TagMapping : EntityTypeConfiguration<Tag>
    {
        public TagMapping()
        {
            this.ToTable("Tag");
        }
    }
}
