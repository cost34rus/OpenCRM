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
    
    public partial class EventSpiker
    {
        public int EventId { get; set; }
        public string SpikerId { get; set; }
    
        public virtual Event Event { get; set; }
    }
}
