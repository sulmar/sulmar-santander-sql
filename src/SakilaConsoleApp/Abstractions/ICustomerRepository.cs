using SakilaConsoleApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SakilaConsoleApp.Abstractions
{
    public interface ICustomerRepository
    {
        List<Customer> GetCustomersAll();
        Customer GetCustomerById(int id);        
        void AddCustomer(Customer customer);
        void UpdateCustomer(Customer customer);
        void RemoveCustomer(int id);
    }
}
