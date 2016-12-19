using System.Collections.Generic;
using System.Threading.Tasks;
using GettyImages.Api;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.Domain;
using ImageCollectionExpander.Domain.Getty;
using Newtonsoft.Json;

namespace ImageCollectionExpander.Business.Business.Implementation
{
    public class GettySearch : IGettySearch
    {
        public GettySearch()
        {
            client = ApiClient.GetApiClientWithClientCredentials("8h7c3y6ertz2wff7tdravgjv", "8kPNbUNRxPNGsvYKF4Vgt8PDgdZPtrMcTQgbC2kGRHy8U");
        }

        public async Task<IEnumerable<Image>> SearchByTags(List<string> tags)
        {
            var results = new List<Image>();
            foreach (var tag in tags)
            {
                var searchResult = client.Search()
                    .Images()
                    .WithPhrase(tag)
                    .WithResponseFields(new List<string> { "comp", "title", "caption" })
                    .WithPageSize(10)
                    .WithPage(1);

                Newtonsoft.Json.Linq.JObject images = await searchResult.ExecuteAsync();

                var imageResult =
                    JsonConvert.DeserializeObject<GettyImagesResult>(JsonConvert.SerializeObject(images));
                foreach (var gettyImage in imageResult.Images)
                {
                    var mappedImage = new Image();
                    mappedImage.MapFromGettyImage(gettyImage);
                    results.Add(mappedImage);
                }
            }

            return results;
        }

        private readonly ApiClient client;
    }
}
