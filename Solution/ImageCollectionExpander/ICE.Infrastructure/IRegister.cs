using Autofac;

namespace ICE.Infrastructure
{
    public interface IRegister
    {
        void Bind(ContainerBuilder builder);
    }
}
