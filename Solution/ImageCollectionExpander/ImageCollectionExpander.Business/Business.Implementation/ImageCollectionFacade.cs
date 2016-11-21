using ICE.Infrastructure.Exceptions;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.DAL.DAL.Contracts;
using ImageCollectionExpander.Domain;
using System;
using System.Linq;

namespace ImageCollectionExpander.Business.Business.Implementation
{
    public class ImageCollectionFacade : IImageCollectionFacade
    {
        private readonly IGenericRepository<User> userRepository;

        public ImageCollectionFacade(IGenericRepository<User> userRepository)
        {
            if (userRepository == null)
                throw new ArgumentNullException();

            this.userRepository = userRepository;
        }

        public bool AddImageCollection(ImageCollection imageCollection, Domain.User user)
        {
            var userInRepo = this.userRepository.SelectByID(user.UserId);

            var collectionExists = userInRepo.ImageCollections.Any(imgColl => imgColl.Name == imageCollection.Name);
            if (collectionExists)
            {
                var exceptionMessage = string.Format("The user {0} already has an image collection named {1}.", user.FbUserName, imageCollection.Name);
                throw new BusinessException(exceptionMessage);
            }

            return true;
        }
    }
}
