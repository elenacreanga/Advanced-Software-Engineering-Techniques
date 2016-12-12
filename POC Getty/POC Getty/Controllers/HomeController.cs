using GettyImages.Api;
using Newtonsoft.Json;
using POC_Getty.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace POC_Getty.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            var client = ApiClient.GetApiClientWithClientCredentials("8h7c3y6ertz2wff7tdravgjv", "8kPNbUNRxPNGsvYKF4Vgt8PDgdZPtrMcTQgbC2kGRHy8U");
            var searchResult = client.Search()
                .Images()
                .WithPhrase("autumn")
                .WithResponseFields(new List<string>() { "id", "keywords", "comp","title" })
                .WithPageSize(10).WithKeywordId(60027)
                .WithPage(1);
            


            Newtonsoft.Json.Linq.JObject i = await searchResult.ExecuteAsync();
            string json = Newtonsoft.Json.JsonConvert.SerializeObject(i);
            var imageResult = JsonConvert.DeserializeObject<ImagesResult>(json);
            
            ViewData["images"] = imageResult.images;

            return View();
        }
    }
}
