using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSystem.Models
{
    //Book Model class
    public class Book
    {
        //PK
        public int BookId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Author { get; set; }

        public string ISBN { get; set; }

        public string Publisher { get; set; }
        [Required]
        public string Language { get; set; }

        //Issued Bookings associated with the Book
        public ICollection<IssuedBook> IssuedBooks { get; set; }
    }
}
