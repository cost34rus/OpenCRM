//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace bbom.Data.IdentityModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public System.DateTime Date { get; set; }
        public int Status { get; set; }
        public decimal Amount { get; set; }
        public Nullable<int> PaymentPlanId { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<int> DiscountId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Discount Discount { get; set; }
        public virtual PaymentPlan PaymentPlan { get; set; }
    }
}
