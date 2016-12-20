namespace ImageCollectionExpander.Controllers
{
    public class Flickr
    {
        public static readonly string FlickrEndpoint = "https://api.flickr.com/";
        private const string FlickrApiKey = "api_key=94049170d6810a26619006597bc3c72e";
        private const string FlickrAuthToken = "auth_token=72157676423658871-4f017f8555bcd644";

        private string GetPhotoUri(string photoUri)
        {
            
            var flickrUri =
                string.Format(
                    @"{0}services/rest/?method=flickr.photos.getContext&" +
                    @"{1}&photo_id={2}" +
                    @"&format=rest&{3}&" +
                    @"api_sig=a0dc82cc2dc99c1ceb9ec7e61834ed61",
                    FlickrEndpoint, FlickrApiKey, photoUri, FlickrAuthToken);
            return flickrUri;
        }

        private string GetPhotosFromFlickr(float latitude, float longitude)
        {
            var endpointForFlickrGeolocation = string.Format(
                @"{0}services/rest/?method=flickr.photos.search&" +
                @"{1}&" +
                @"accuracy=7&lat={2}&lon={3}&" +
                @"per_page=10&" +
                @"format=rest&" +
                @"{4}& " +
                @"api_sig=78172c48be77eeabeeac3533590c039f",
                FlickrEndpoint, FlickrApiKey, latitude, longitude, FlickrAuthToken);
            return endpointForFlickrGeolocation;
        }
    }
}