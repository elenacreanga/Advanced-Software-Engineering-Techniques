using ImageCollectionExpander.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageCollectionExpander.Business.Business.Contracts
{
    public interface IImageCollectionBusinessContracts
    {
        bool AddImageCollection(ImageCollection imageCollection, User user);
    }
}
