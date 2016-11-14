﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Autofac;

using Autofac.Integration.Mvc;
using ICE.Infrastructure;

namespace ImageCollectionExpander.App_Start
{
    public class ContainerConfig
    {
        public static void RegisterContainer()
        {
            var builder = new ContainerBuilder();

            new AutofacConfig().RegisterDependencies(builder);

            builder.RegisterControllers(Assembly.GetExecutingAssembly());

            var container = builder.Build();

            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}