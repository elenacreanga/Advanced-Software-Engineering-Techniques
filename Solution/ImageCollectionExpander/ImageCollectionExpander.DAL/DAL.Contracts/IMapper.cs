namespace ImageCollectionExpander.Business.Business.Contracts
{
    public interface IMapper<TSource> where TSource : class
    {
        void MapFromEntity(TSource entity);
    }
}
