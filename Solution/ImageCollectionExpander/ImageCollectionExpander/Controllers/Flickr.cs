using System.Collections.Generic;

namespace ImageCollectionExpander.Controllers
{
    public class Flickr
    {
        private string GetPhotoUri(string photoUri)
        {
            var flickr = "https://api.flickr.com/";
            var flickrApiKey = "api_key=94049170d6810a26619006597bc3c72e";
            var flickrAuthToken = "auth_token=72157676423658871-4f017f8555bcd644";
            var flickrUri =
                string.Format(
                    @"{0}services/rest/?method=flickr.photos.getContext&" +
                    @"{1}&photo_id={2}" +
                    @"&format=rest&{3}&" +
                    @"api_sig=a0dc82cc2dc99c1ceb9ec7e61834ed61",
                    flickr, flickrApiKey, photoUri, flickrAuthToken);
            return flickrUri;
        }

        private IList<string> GetPhotosFromFlickr(GeolocationModel model)
        {
            var endpointForFlickrGeolocation = string.Format(
                @"https://api.flickr.com/services/rest/?method=flickr.photos.search&" +
                @"api_key=94049170d6810a26619006597bc3c72e&" +
                @"accuracy=7&lat=41.883&lon=12.4785051&" +
                @"per_page=10&" +
                @"format=rest&" +
                @"auth_token=72157676423658871-4f017f8555bcd644& " +
                @"api_sig=78172c48be77eeabeeac3533590c039f");
            return null;
        }
    }
}