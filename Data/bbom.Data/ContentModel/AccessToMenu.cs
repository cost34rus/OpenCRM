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
    
    public partial class AccessToMenu
    {
        public string RoleId { get; set; }
        public int MenuId { get; set; }
    
        public virtual Menu Menu { get; set; }
    }
}
