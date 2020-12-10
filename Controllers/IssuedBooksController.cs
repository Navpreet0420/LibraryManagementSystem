using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryManagementSystem.Data;
using LibraryManagementSystem.Models;
using Microsoft.AspNetCore.Authorization;

namespace LibraryManagementSystem.Controllers
{
    // Handler for Books
    public class IssuedBooksController : Controller
    {
        private readonly ApplicationDbContext _context;

        public IssuedBooksController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: IssuedBooks
        // Default Handler for listing of Issued Books
        [Authorize]
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.IssuedBooks.Include(i => i.Book).Include(i => i.Customer);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: IssuedBooks/Details/5
        [Authorize]
        // Handler for showing Detail of an issued Book
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issuedBook = await _context.IssuedBooks
                .Include(i => i.Book)
                .Include(i => i.Customer)
                .FirstOrDefaultAsync(m => m.IssuedBookId == id);
            if (issuedBook == null)
            {
                return NotFound();
            }

            return View(issuedBook);
        }

        // GET: IssuedBooks/Create
        // Get Handler for Creating a New Issued Book entry
        [Authorize]
        public IActionResult Create()
        {
            var query = (from x in _context.Books
                         join y in _context.IssuedBooks on
                         new
                         {
                             Key1 = x.BookId,
                             Key2 = true
                         }
                         equals
                         new
                         {
                             Key1 = y.BookId,
                             Key2 = !y.ReturnDate.HasValue
                         }
                         into result
                         from r in result.DefaultIfEmpty()
                         select new { x.BookId, x.Name, r.IssuedBookId }
                         ).ToList().Where(x => x.IssuedBookId == 0);

            ViewData["BookId"] = new SelectList(query, "BookId", "Name");
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName");
            return View();
        }

        // POST: IssuedBooks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        // Post Handler for Creating a New Issued Book entry
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IssuedBookId,BookId,CustomerId,DateFrom,DateTo,ReturnDate")] IssuedBook issuedBook)
        {
            if (ModelState.IsValid)
            {
                _context.Add(issuedBook);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            var query = (from x in _context.Books
                         join y in _context.IssuedBooks on
                         new
                         {
                             Key1 = x.BookId,
                             Key2 = true
                         }
                         equals
                         new
                         {
                             Key1 = y.BookId,
                             Key2 = !y.ReturnDate.HasValue
                         }
                         into result
                         from r in result.DefaultIfEmpty()
                         select new { x.BookId, x.Name, r.IssuedBookId }
                         ).ToList().Where(x => x.IssuedBookId == 0);

            ViewData["BookId"] = new SelectList(query, "BookId", "Name", issuedBook.BookId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName", issuedBook.CustomerId);
            return View(issuedBook);
        }

        // GET: IssuedBooks/Edit/5
        // Get Handler for Editing an Issued Book entry
        [Authorize]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issuedBook = await _context.IssuedBooks.FindAsync(id);
            if (issuedBook == null)
            {
                return NotFound();
            }
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Name", issuedBook.BookId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName", issuedBook.CustomerId);
            return View(issuedBook);
        }

        // POST: IssuedBooks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        // Post Handler for Editing an issued Book entry
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IssuedBookId,BookId,CustomerId,DateFrom,DateTo,ReturnDate")] IssuedBook issuedBook)
        {
            if (id != issuedBook.IssuedBookId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(issuedBook);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!IssuedBookExists(issuedBook.IssuedBookId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Name", issuedBook.BookId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName", issuedBook.CustomerId);
            return View(issuedBook);
        }

        // GET: IssuedBooks/Delete/5
        // Get Handler for Deleting an Issued Book entry
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issuedBook = await _context.IssuedBooks
                .Include(i => i.Book)
                .Include(i => i.Customer)
                .FirstOrDefaultAsync(m => m.IssuedBookId == id);
            if (issuedBook == null)
            {
                return NotFound();
            }

            return View(issuedBook);
        }

        // POST: IssuedBooks/Delete/5
        // Post Handler for Deleting an Issued Book entry
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var issuedBook = await _context.IssuedBooks.FindAsync(id);
            _context.IssuedBooks.Remove(issuedBook);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool IssuedBookExists(int id)
        {
            return _context.IssuedBooks.Any(e => e.IssuedBookId == id);
        }
    }
}
