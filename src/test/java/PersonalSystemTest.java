import org.junit.Test;
import org.junit.jupiter.api.DisplayName;
import org.mockito.Mock;

import static org.junit.jupiter.api.Assertions.*;

public class PersonalSystemTest {

    PersonalSystem ps = new PersonalSystem();
    @Mock
    Employee emp1;
    Employee emp2;
    Employee emp3;
    Employee emp4;
    Employee emp5;

    @Test
    @DisplayName("Testing by adding the employees list")
    public void AddEmployee() {
        Employee emp1 = new Employee("Radhika", "Chandramohan", 34, 37000);
        ps.AddEmployee(emp1);
        Employee emp2 = new Employee("Rishi", "Natarajan", 40, 40000);
        ps.AddEmployee(emp2);
        Employee emp3 = new Employee("Saravana", "Chandramohan", 37, 38000);
        ps.AddEmployee(emp3);
        Employee emp4 = new Employee("Niranjani", "Rajmohan", 34, 34000);
        ps.AddEmployee(emp4);
        Employee emp5 = new Employee("Radhika", "Chandramohan", 43, 41000);
        ps.AddEmployee(emp5);
        assertEquals(5, ps.arrEmp.size());
        int size = ps.arrEmp.size();
        ps.RemoveEmployee(emp5);
        //assertEquals(size - 1,ps.arrEmp.size());

        assertEquals(4, ps.arrEmp.size());
    }

    @Test
    @DisplayName("Testing the increment of all employees")
    public void RaiseSalary() throws Exception {
        Employee employee= new Employee("Radhika","Chandramohan",34,37000);
        ps.AddEmployee(employee);

        employee= new Employee("Rishi","Natarajan",40,40000);
        ps.AddEmployee(employee);


        employee= new Employee("Saravana","Chandramohan",37,38000);
        ps.AddEmployee(employee);
        employee= new Employee("Niranjani","Rajmohan",34,34000);
        ps.AddEmployee(employee);
        employee= new Employee("Amutha","Chandramohan",43,41000);
        ps.AddEmployee(employee);

        ps.RaiseSalary(1,10);
        assertEquals(40700,ps.arrEmp.get(0).getSalary());

        ps.RaiseSalary(2,20);
        assertEquals(48000,ps.arrEmp.get(1).getSalary());

        ps.RaiseSalary(3,20);
        assertEquals(45600,ps.arrEmp.get(2).getSalary());

        ps.RaiseSalary(4,50);
        assertEquals(51000,ps.arrEmp.get(3).getSalary());

        ps.RaiseSalary(5,10);
        assertEquals(41000,ps.arrEmp.get(4).getSalary());
    }

}

