﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TravelThings.DAL.Interfaces
{
    interface IHelper
    {
        bool CheckAddressExists(string strArea, string City);
    }
}
