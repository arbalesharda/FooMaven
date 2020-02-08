public class Employee {
    int CompanyId;
    String fName;
    String lName;
    int Age;

    double Salary;
     static int counter=0;

    public Employee(String f_Name,String l_Name,int emp_Age,double Sal ){
        counter = counter+1;
        fName =f_Name;
        lName = l_Name;
        Age = emp_Age;
        Salary = Sal;
        CompanyId = counter;
    }
    public String getFName(){
        return this.fName;
    }
    public void setFName(String fName) {
        this.fName = fName;
    }
    public String getLName (){
        return this.lName;
    }
    public void setLName(String lName){
        this.lName = lName;
    }
    public int getAge(){
        return this.Age;
    }
    public void setAge(int emp_Age){
        this.Age = emp_Age;
    }
    public double getSalary(){
        return this.Salary;
    }
    public void setSalary(double salary){
        this.Salary=Salary;
    }
}