using System.Reflection;
using Autofac;

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
            builder.RegisterAssemblyTypes(assembly)
                .Where(type => type.Name.EndsWith(ending) && !type.IsGenericType)
                .AsImplementedInterfaces()
                .InstancePerRequest();
        }
    }
}
