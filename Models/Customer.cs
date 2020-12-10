using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSystem.Models
{
    //Customer Model class
    public class Customer
    {
        //PK
        public int CustomerId { get; set; }
        public char Gender { get; set; }
        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        [Required]
        public string Address { get; set; }
        
        public string Pincode { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string Country { get; set; }
        [Required]
        public string Phone { get; set; }
        
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        [Display(Name = "Creation Date")]
        public DateTime CreationDate { get; set; }

        //Issued Books associated with the Customer
        public ICollection<IssuedBook> IssuedBooks { get; set; }

        //Custom property to show Full name of Customer
        public string FullName { get { return FirstName + " " + LastName; } }
    }
}
