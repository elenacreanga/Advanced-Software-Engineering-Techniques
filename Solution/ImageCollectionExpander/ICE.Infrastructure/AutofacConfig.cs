using Autofac;
using ImageCollectionExpander.DAL.DAL.Implementation;

namespace ICE.Infrastructure
{
    public class AutofacConfig
    {
        public void RegisterDependencies(ContainerBuilder builder)
        {
            new Register("Repository", typeof(GenericRepository<>).Assembly).Bind(builder);
        }
    }
}