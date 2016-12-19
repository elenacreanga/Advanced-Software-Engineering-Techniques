using System.Collections.Generic;

namespace ImageCollectionExpander.Domain.Getty
{
    public class GettyImagesResult
    {
        public int Result_count { get; set; }
        public List<GettyImage> Images { get; set; }
    }
}
