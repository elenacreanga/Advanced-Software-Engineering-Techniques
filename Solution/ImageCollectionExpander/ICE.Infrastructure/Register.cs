using System.Reflection;
using Autofac;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.Business.Business.Implementation;
using ImageCollectionExpander.DAL.DAL.Contracts;
using ImageCollectionExpander.DAL.DAL.Implementation;

namespace ICE.Infrastructure
{
    public class Register : IRegister
    {
        private readonly string ending;
        private readonly Assembly assembly;

        public Register(string ending, Assembly assembly)
        {
            this.ending = ending;
            this.assembly = assembly;
        }

        public void Bind(ContainerBuilder builder)
        {
            builder.RegisterGeneric(typeof(GenericRepository<>)).As(typeof(IGenericRepository<>));
            builder.RegisterType<GettySearch>().As<IGettySearch>();

            builder.RegisterAssemblyTypes(assembly)
                .Where(type => type.Name.EndsWith(ending) && !type.IsGenericType)
                .AsImplementedInterfaces()
                .InstancePerRequest();
        }
    }
}
