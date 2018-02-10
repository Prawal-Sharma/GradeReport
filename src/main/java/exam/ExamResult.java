package exam;

import java.io.Serializable;


public class ExamResult implements Serializable {
	private String Id_Number;
	private String name;
	private String exam1_score;
	private String exam2_score;
	
	private String hw1; 
	private String hw2; 
	private String project1; 
	private String project2; 
	private String finalexam; 


public ExamResult() {

}

public ExamResult(String ID, String name1, String exam1, String exam2, String hw1, String hw2, String project1, String project2, String finalexam) {
	Id_Number = ID;
	name = name1;
	exam1_score = exam1;
	exam2_score = exam2;
	this.hw1 = hw1; 
	this.hw2 = hw2; 
	this.project1 = project1; 
	this.project2 = project2; 
	this.finalexam = finalexam; 
}


public void sethw1(String homework1) {
	hw1 = homework1;
}

public String gethw1() {
	return hw1;
}

public void sethw2(String homework2) {
	hw2 = homework2;
}

public String gethw2() {
	return hw2; 
}

public void setproject1(String proj1) {
	project1 = proj1;
}

public String getproject1() {
	return project1; 
}

public void setproject2(String proj2) {
	project2 = proj2;
}

public String getproject2() {
	return project2; 
}

public void setfinalexam(String fexam) {
	finalexam = fexam;
}

public String getfinalexam() {
	return finalexam; 
}





public void setId(String id) {
	Id_Number = id;
}

public String getId(){
	return Id_Number;
}

public void setName(String name1) {
	name = name1;
}

public String getName() {
	return name;
}

public void setExam1(String Exam1) {
	exam1_score = Exam1;
}

public String getExam1() {
	return exam1_score;
}

public void setExam2(String Exam2) {
	exam2_score = Exam2;
}

public String getExam2() {
	return exam2_score;
}





}