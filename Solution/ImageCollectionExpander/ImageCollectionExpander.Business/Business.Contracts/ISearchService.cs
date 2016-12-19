using System.Collections.Generic;
using System.Threading.Tasks;
using ImageCollectionExpander.Domain;

namespace ImageCollectionExpander.Business.Business.Contracts
{
    public interface ISearchService
    {
        Task<IEnumerable<Image>> SearchByTags(List<string> tags);
    }
}
