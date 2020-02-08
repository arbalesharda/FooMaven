import org.junit.Test;

import static org.junit.jupiter.api.Assertions.*;

public class EmployeeTest {
    @Test
    public void TestEmp(){
        Employee emp =  new Employee("Sharda","Arbale",30,40000);
        assertEquals("Sharda",emp.getFName());
        assertEquals("Arbale", emp.getLName());
        assertEquals(30,emp.getAge());
        assertEquals(40000,emp.getSalary());

    }
}