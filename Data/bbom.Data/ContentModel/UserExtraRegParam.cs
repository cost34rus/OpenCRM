//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace bbom.Data.ContentModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserExtraRegParam
    {
        public string UserId { get; set; }
        public int ExtraRegParamId { get; set; }
        public string Value { get; set; }
    
        public virtual ExtraRegParam ExtraRegParam { get; set; }
    }
}
