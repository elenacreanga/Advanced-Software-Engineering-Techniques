using Autofac;
using ImageCollectionExpander.DAL.DAL.Contracts;

namespace ICE.Infrastructure
{
    public class AutofacConfig
    {
        public void RegisterDependencies(ContainerBuilder builder)
        {
            new Register("GenericRepository<>", typeof(IGenericRepository<>).Assembly).Bind(builder);
        }
    }
}
