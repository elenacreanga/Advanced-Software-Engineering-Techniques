using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.DAL.DAL.Contracts;
using System;
using System.Linq;
using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.Business.Business.Implementation
{
    public class ImageCollectionFacade : IImageCollectionFacade
    {
        private readonly IGenericRepository<User> userRepository;
        private readonly IGenericRepository<ImageCollection> imageCollectionRepository;

        public ImageCollectionFacade(IGenericRepository<User> userRepository, IGenericRepository<ImageCollection> imageCollectionRepository)
        {
            if (userRepository == null)
                throw new ArgumentNullException();

            this.userRepository = userRepository;
            this.imageCollectionRepository = imageCollectionRepository;
        }

        public bool AddImageCollection(ImageCollection imageCollection, User user)
        {
            var userInRepo = userRepository.SelectByID(user.UserId);

            var collectionExists = userInRepo.ImageCollections.Any(imgColl => imgColl.Name == imageCollection.Name);
            if (collectionExists)
            {
                var exceptionMessage = string.Format("The user {0} already has an image collection named {1}.", user.FbUserName, imageCollection.Name);
                throw new Exception(exceptionMessage);
            }

            return true;
        }

        public bool RenameImageCollection(int imageCollectionId, string name)
        {
            var imageCollection = imageCollectionRepository.SelectByID(imageCollectionId);

            if (imageCollection == null)
            {
                var message = "Image collection was not found";
                throw new Exception(message);
            }

            if (name.Equals(string.Empty))
            {
                var message = "Name cannot be empty!";
                throw new Exception(message);
            }

            if (imageCollection.Name.Equals(name))
            {
                return false;
            }

            imageCollection.Name = name;
            imageCollectionRepository.Update(imageCollection);

            return true;
        }
    }
}
