using Autofac;

namespace ICE.Infrastructure
{
    public class AutofacConfig
    {
        public void RegisterDependencies(ContainerBuilder builder)
        {
            //new Register("Repository", typeof(_DefaultRepository_).Assembly).Bind(builder);
        }
    }
}
