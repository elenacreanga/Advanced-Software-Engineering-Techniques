﻿using ImageCollectionExpander.DAL.Entities;

namespace ImageCollectionExpander.Business.Business.Contracts
{
    public interface IImageCollectionFacade
    {
        bool AddImageCollection(ImageCollection imageCollection, User user);
        bool RenameImageCollection(int imageCollectionId, string name);
    }
}
