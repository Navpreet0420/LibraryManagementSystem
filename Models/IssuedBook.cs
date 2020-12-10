using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSystem.Models
{
    //Book Model class
    public class IssuedBook : IValidatableObject
    {
        //PK
        public int IssuedBookId { get; set; }
        [Display(Name = "Book Name")]
        public int BookId { get; set; }
        [Required]
        [Display(Name = "Customer Name")]
        public int CustomerId { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Date From")]
        public DateTime DateFrom { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Date To")]
        public DateTime DateTo { get; set; }
        [DataType(DataType.Date)]
        [Display(Name = "Return Date")]
        public DateTime? ReturnDate { get; set; }

        // Customer Associated with the Booking
        public Customer Customer { get; set; }

        // Book Associated with the Booking
        public Book Book { get; set; }

        //Custom Validation
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (DateTo <= DateFrom)
            {
                yield return new ValidationResult(
                    errorMessage: "Date To must be greater than Date From",
                    memberNames: new[] { "DateTo" }
               );
            }
            if (ReturnDate < DateFrom)
            {
                yield return new ValidationResult(
                    errorMessage: "Return Date must be greater than Date From",
                    memberNames: new[] { "ReturnDate" }
               );
            }
        }
    }
}
