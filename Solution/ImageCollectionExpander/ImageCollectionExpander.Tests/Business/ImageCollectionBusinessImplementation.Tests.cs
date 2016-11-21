using ImageCollectionExpander.Business.Business.Contracts;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using FluentAssertions;
using ImageCollectionExpander.Business.Business.Implementation;
using ImageCollectionExpander.Domain;
using ICE.Infrastructure.Exceptions;
using ImageCollectionExpander.DAL.DAL.Contracts;
using NSubstitute;

namespace ImageCollectionExpander.Tests.Business
{
    [TestClass]
    public class ImageCollectionBusinessImplementationTest
    {
        private IImageCollectionBusinessContracts imgCollectionBusinessImplem;
        private IGenericRepository<User> userRepository;

        [TestInitialize]
        public void TestInitialize()
        {
            this.userRepository = Substitute.For<IGenericRepository<User>>();
            this.imgCollectionBusinessImplem = new ImageCollectionBusinessImplementation(this.userRepository);
        }

        [TestMethod]
        public void Ctor_ShouldThrowArgumentNullException_WhenImgCollectionRepositoryParamInstanceIsNull()
        {
            //Arrange, Act
            Action action = () => this.imgCollectionBusinessImplem = new ImageCollectionBusinessImplementation(null);

            //Assert
            action.ShouldThrow<ArgumentNullException>();
        }

        [TestMethod]
        public void AddImageCollection_ShouldThrowBusinessException_WhenInRepoExistsParamImageCollectionWithSameNameForParamUser()
        {
            //Arrange
            var imageCollectionName = "WinterPhotos";

            ImageCollection imgCollection = new ImageCollection() { Name = imageCollectionName };
            User user = new User()
            {
                UserId = 1,
                ImageCollections = new List<ImageCollection> { new ImageCollection { Name = imageCollectionName } }
            };

            userRepository.SelectByID(Arg.Any<int>()).Returns(user);

            //Act
            Action action = () => this.imgCollectionBusinessImplem.AddImageCollection(imgCollection, user);

            //Assert
            action.ShouldThrow<BusinessException>();
        }
    }
}
