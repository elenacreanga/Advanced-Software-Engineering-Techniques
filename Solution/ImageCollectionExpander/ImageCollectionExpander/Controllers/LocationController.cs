using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.Http;

namespace ImageCollectionExpander.Controllers
{
    [RoutePrefix("api/Location")]
    public class LocationController : ApiController
    {
        private readonly Flickr flickr = new Flickr();

        [HttpGet]
        [Route("GetImageAsString")]
        public string GetImage()
        {
            var fullPath = System.Web.Hosting.HostingEnvironment.MapPath(@"~/ImageUploads/IMG_1657.JPG");
            using (Image image = Image.FromFile(fullPath))
            {
                using (MemoryStream m = new MemoryStream())
                {
                    image.Save(m, image.RawFormat);
                    byte[] imageBytes = m.ToArray();

                    // Convert byte[] to Base64 String
                    string base64String = Convert.ToBase64String(imageBytes);
                    return base64String;
                }
            }
        }

        [Route("GetByImage")]
        [HttpPost]
        public IHttpActionResult GetByImage([FromBody]string targetImg)
        {
            var coordinates = GetCoordinates(targetImg);
            return Ok(coordinates);
        }

        static GeolocationModel GetCoordinates(string imageString)
        {
            var image = GetImageFromString(imageString);

            var coordinates = new GeolocationModel();
            coordinates.Latitude = GetLatitude(image);
            coordinates.Longitude = GetLongitude(image);
            return coordinates;
        }

        public static float GetLatitude(Image targetImg)
        {
                //Property Item 0x0001 - PropertyTagGpsLatitudeRef
                PropertyItem propItemRef = targetImg.GetPropertyItem(1);
                //Property Item 0x0002 - PropertyTagGpsLatitude
                PropertyItem propItemLat = targetImg.GetPropertyItem(2);
                return ExifGpsToFloat(propItemRef, propItemLat);
        }
        public static float GetLongitude(Image targetImg)
        {
                ///Property Item 0x0003 - PropertyTagGpsLongitudeRef
                PropertyItem propItemRef = targetImg.GetPropertyItem(3);
                //Property Item 0x0004 - PropertyTagGpsLongitude
                PropertyItem propItemLong = targetImg.GetPropertyItem(4);
                return ExifGpsToFloat(propItemRef, propItemLong);
        }

        private static Image GetImageFromString(string inputString)
        {
            var imageBytes = Convert.FromBase64String(inputString);

            // Don't need to use the constructor that takes the starting offset and length
            // as we're using the whole byte array.
            MemoryStream ms = new MemoryStream(imageBytes);

            Image image = Image.FromStream(ms, true, true);

            return image;
        }

        private static float ExifGpsToFloat(PropertyItem propItemRef, PropertyItem propItem)
        {
            uint degreesNumerator = BitConverter.ToUInt32(propItem.Value, 0);
            uint degreesDenominator = BitConverter.ToUInt32(propItem.Value, 4);
            float degrees = degreesNumerator / (float)degreesDenominator;

            uint minutesNumerator = BitConverter.ToUInt32(propItem.Value, 8);
            uint minutesDenominator = BitConverter.ToUInt32(propItem.Value, 12);
            float minutes = minutesNumerator / (float)minutesDenominator;

            uint secondsNumerator = BitConverter.ToUInt32(propItem.Value, 16);
            uint secondsDenominator = BitConverter.ToUInt32(propItem.Value, 20);
            float seconds = secondsNumerator / (float)secondsDenominator;

            float coorditate = degrees + (minutes / 60f) + (seconds / 3600f);
            string gpsRef = System.Text.Encoding.ASCII.GetString(new byte[1] { propItemRef.Value[0] }); //N, S, E, or W
            if (gpsRef == "S" || gpsRef == "W")
                coorditate = 0 - coorditate;
            return coorditate;
        }
    }
}