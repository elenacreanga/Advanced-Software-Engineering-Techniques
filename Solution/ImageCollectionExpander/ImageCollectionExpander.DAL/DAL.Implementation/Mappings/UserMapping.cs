using ImageCollectionExpander.Domain;
using System.Data.Entity.ModelConfiguration;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class UserMapping : EntityTypeConfiguration<User>
    {
        public UserMapping()
        {
            this.ToTable("User");

        }
    }
}
