using ImageCollectionExpander.DAL.DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageCollectionExpander.DAL.DAL.Implementation
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        private ImageCollectionExpanderDbContext dbContext = null;
        private DbSet<T> dbSet = null;

        public GenericRepository()
        {
            this.dbContext = new ImageCollectionExpanderDbContext();
            dbSet = dbContext.Set<T>();
        }

        public GenericRepository(ImageCollectionExpanderDbContext dbContext)
        {
            this.dbContext = dbContext;
            dbSet = dbContext.Set<T>();
        }

        public IEnumerable<T> SelectAll()
        {
            return dbSet.ToList();
        }

        public T SelectByID(object id)
        {
            return dbSet.Find(id);
        }

        public void Insert(T obj)
        {
            dbSet.Add(obj);
        }

        public void Update(T obj)
        {
            dbSet.Attach(obj);
            dbContext.Entry(obj).State = EntityState.Modified;
        }

        public void Delete(object id)
        {
            T existing = dbSet.Find(id);
            dbSet.Remove(existing);
        }

        public void Save()
        {
            dbContext.SaveChanges();
        }
    }
}
