import java.util.ArrayList;

public class PersonalSystem {
    ArrayList<Employee> arrEmp = new ArrayList<Employee>();
    static int TotalIncrement = 0;

    public void AddEmployee(Employee emp) {
        arrEmp.add(emp);
    }

    public void RemoveEmployee(Employee emp) {
        arrEmp.remove(emp);
    }

    public void RaiseSalary(int CompanyId, int increment) throws Exception {

        for (Employee emp : arrEmp) {

            if (emp.CompanyId == CompanyId) {

                if (increment <= 100 && ((TotalIncrement + increment) <= 100)) {

                    emp.Salary= emp.Salary + (emp.Salary / 100) * increment;
                    TotalIncrement = TotalIncrement + increment;

                }

            }

        }
    }

}






