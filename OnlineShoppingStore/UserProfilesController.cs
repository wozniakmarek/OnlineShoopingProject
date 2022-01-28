using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using OnlineShoppingStore.DAL;

namespace OnlineShoppingStore
{
    public class UserProfilesController : ApiController
    {
        private dbMyOnlineShoppingEntities db = new dbMyOnlineShoppingEntities();

        // GET: api/UserProfiles
        public IQueryable<UserProfile> GetUserProfiles()
        {
            return db.UserProfiles;
        }

        // GET: api/UserProfiles/5
        [ResponseType(typeof(UserProfile))]
        public IHttpActionResult GetUserProfile(int id)
        {
            UserProfile userProfile = db.UserProfiles.Find(id);
            if (userProfile == null)
            {
                return NotFound();
            }

            return Ok(userProfile);
        }

        // PUT: api/UserProfiles/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUserProfile(int id, UserProfile userProfile)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userProfile.UserId)
            {
                return BadRequest();
            }

            db.Entry(userProfile).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserProfileExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/UserProfiles
        [ResponseType(typeof(UserProfile))]
        public IHttpActionResult PostUserProfile(UserProfile userProfile)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.UserProfiles.Add(userProfile);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = userProfile.UserId }, userProfile);
        }

        // DELETE: api/UserProfiles/5
        [ResponseType(typeof(UserProfile))]
        public IHttpActionResult DeleteUserProfile(int id)
        {
            UserProfile userProfile = db.UserProfiles.Find(id);
            if (userProfile == null)
            {
                return NotFound();
            }

            db.UserProfiles.Remove(userProfile);
            db.SaveChanges();

            return Ok(userProfile);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserProfileExists(int id)
        {
            return db.UserProfiles.Count(e => e.UserId == id) > 0;
        }
    }
}