using System.Collections.Generic;

namespace ImageCollectionExpander.Domain.Getty
{
    public class GettyImage
    {
        public string id;
        public List<Display_size> display_sizes;
        public List<Keyword> keywords;
        public string title;
        public string caption;
    }
}
