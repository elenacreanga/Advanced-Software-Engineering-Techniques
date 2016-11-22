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
    public class ImageCollectionFacadeTest
    {
        private IImageCollectionFacade sut;
        private IGenericRepository<User> userRepository;
        private IGenericRepository<ImageCollection> imageCollectionRepository;

        [TestInitialize]
        public void TestInitialize()
        {
            userRepository = Substitute.For<IGenericRepository<User>>();
            imageCollectionRepository = Substitute.For<IGenericRepository<ImageCollection>>();
            sut = new ImageCollectionFacade(userRepository, imageCollectionRepository);
        }

        [TestMethod]
        public void Ctor_ShouldThrowArgumentNullException_WhenImgCollectionRepositoryParamInstanceIsNull()
        {
            //Arrange, Act
            Action action = () => sut = new ImageCollectionFacade(null, null);

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
            Action action = () => sut.AddImageCollection(imgCollection, user);

            //Assert
            action.ShouldThrow<BusinessException>();
        }

        [TestMethod]
        public void RenameImageCollection_WhenInexistentImageCollectionId_ShouldThrowError()
        {
            imageCollectionRepository.SelectByID(Arg.Any<int>()).Returns((ImageCollection) null);
            Action action = () => sut.RenameImageCollection(123, "Thailand trip");

            action.ShouldThrow<BusinessException>();
        }

        [TestMethod]
        public void RenameImageCollection_WhenNewNameEmpty_ShouldThrowBusinessException()
        {
            var imageCollectionName = "Thailand";
            var imageCollection = new ImageCollection { ImageCollectionId = 123, Name = imageCollectionName };
            imageCollectionRepository.SelectByID(Arg.Any<int>()).Returns(imageCollection);

            Action action = () => sut.RenameImageCollection(123, string.Empty);
            action.ShouldThrow<BusinessException>();
        }

        [TestMethod]
        public void RenameImageCollection_WhenNameIsTheSame_ShouldReturnFalse()
        {
            var imageCollectionName = "Thailand";
            var imageCollection = new ImageCollection { ImageCollectionId = 123, Name = imageCollectionName };
            imageCollectionRepository.SelectByID(Arg.Any<int>()).Returns(imageCollection);

            var result = sut.RenameImageCollection(123, imageCollectionName);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void RenameImageCollection_WhenNameAndImageCollectionIdAreValid_ShouldReturnTrue()
        {
            var imageCollectionName = "Thailand";
            var imageCollection = new ImageCollection { ImageCollectionId = 123, Name = imageCollectionName };
            imageCollectionRepository.SelectByID(Arg.Any<int>()).Returns(imageCollection);

            var result = sut.RenameImageCollection(123, "Thailand trip");
            Assert.IsTrue(result);
        }

    }
}
