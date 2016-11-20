using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ICE.Infrastructure.Exceptions
{
    public class BusinessException : Exception
    {
        public BusinessException(string exceptionMessage) : base(exceptionMessage) { }

        public BusinessException(string exceptionMessage, Exception innerException) : base(exceptionMessage, innerException) { }
    }
}
