using ImageCollectionExpander.Domain;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageCollectionExpander.DAL.DAL.Implementation.Mappings
{
    public class UserMapping : EntityTypeConfiguration<User>
    {
        UserMapping()
        {
            this.ToTable("User");

        }
    }
}
