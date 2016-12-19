using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using ImageCollectionExpander.Business.Business.Contracts;
using ImageCollectionExpander.Business.Business.Implementation;
using Newtonsoft.Json;

namespace ImageCollectionExpander.Controllers
{
    [RoutePrefix("searchimages")]
    public class SearchController : ApiController
    {
        public SearchController()
        {
            gettySearch = new GettySearch();
        }

        [Route("bytag")]
        [HttpGet]
        public async Task<HttpResponseMessage> GetImagesByTag([FromUri]List<string> tags)
        {
            HttpResponseMessage response;

            if (tags == null || !tags.Any())
            {
                response = new HttpResponseMessage()
                {
                    Content = new StringContent("You must provide some tags in the request body!"),
                    RequestMessage = Request,
                    StatusCode = HttpStatusCode.BadRequest
                };
            }
            else
            {
                var gettyResponse =await gettySearch.SearchByTags(tags);
                response = Request.CreateResponse(HttpStatusCode.OK, gettyResponse);
            }

            return response;
        }

        private readonly IGettySearch gettySearch;
    }
}
