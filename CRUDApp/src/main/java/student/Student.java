package student;

public class Student {

	private Integer id;
	private String name;
	private Integer age;
	private String gender;
	private String email;
	private String address;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Student(String name, Integer age, String gender, String email, String address) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.address = address;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender + ", email=" + email
				+ ", address=" + address + "]";
	}
	
}
