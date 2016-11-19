using ImageCollectionExpander.DAL.DAL.Implementation;
using ImageCollectionExpander.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ImageCollectionExpander.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public HttpResponseMessage Get()
        {
            ImageCollectionExpanderDbContext context = new ImageCollectionExpanderDbContext();
            GenericRepository<User> userRepo = new GenericRepository<User>(context);
            userRepo.Insert(new User()
            {
                FbUserName = "Adi",
                UserId = 1
            });
            context.SaveChanges();
            return new HttpResponseMessage(HttpStatusCode.OK);
            //return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
