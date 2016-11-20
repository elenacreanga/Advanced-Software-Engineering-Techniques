using ICE.Infrastructure.Exceptions;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.DAL.DAL.Contracts;
using ImageCollectionExpander.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageCollectionExpander.Business.Business.Implementation
{
    public class ImageCollectionBusinessImplementation : IImageCollectionBusinessContracts
    {
        private readonly IGenericRepository<User> userRepository;

        public ImageCollectionBusinessImplementation(IGenericRepository<User> userRepository)
        {
            if (userRepository == null)
                throw new ArgumentNullException();

            this.userRepository = userRepository;
        }

        public bool AddImageCollection(Domain.ImageCollection imageCollection, Domain.User user)
        {
            var userInRepo = this.userRepository.SelectByID(user.UserId);

            if (userInRepo.ImageCollections.Where(imgColl => imgColl.Name == imageCollection.Name).Any())
            {
                var exceptionMessage = string.Format("The user {0} already has an image collection named {1}.", user.FbUserName, imageCollection.Name);
                throw new BusinessException(exceptionMessage);
            }

            return true;
        }
    }
}
