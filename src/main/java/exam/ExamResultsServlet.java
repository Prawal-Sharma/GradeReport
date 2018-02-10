package exam;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import java.io.IOException;

public class ExamResultsServlet extends HttpServlet{

	private static final Logger _logger = Logger.getLogger(ExamResultsServlet.class.getName());

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		//extract the input parameters
		populateData();
		String idNumber = req.getParameter("idnumber");
		_logger.info("Received a requst for id number: " + idNumber);
		try{
			if(idNumber == null) throw new Exception("Must provide id number!");
			if(!idNumber.isEmpty()){
				//retrieve the results (currently just chuck back some dummy results)
				ExamResult Result = getResult(idNumber);
				req.getSession().setAttribute("result", Result);
				resp.sendRedirect("results.jsp");
			}
			else throw new Exception("Must provide id number!");
		}
		catch (Exception e) {
			String logMsg = "Exception in processing request: " + e.getMessage();
			_logger.log(Level.INFO, logMsg);
			throw new IOException(logMsg);
		}
	}
	
	private ExamResult getResult(String idNumber) throws Exception{
		   Key studentKey = KeyFactory.createKey("ExamResult", idNumber);
		   DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		   Entity result = datastore.get(studentKey);
		   ExamResult toReturn = new ExamResult();
		   toReturn.setId(idNumber);
		   toReturn.setName((String)result.getProperty("studentName"));
		   // new add 
		   toReturn.sethw1((String)result.getProperty("hw1"));
		   toReturn.sethw2((String)result.getProperty("hw2"));
		   toReturn.setproject1((String)result.getProperty("project1"));
		   toReturn.setproject2((String)result.getProperty("project2"));
		   toReturn.setfinalexam((String)result.getProperty("finalexam"));
		   
		   toReturn.setExam1((String)result.getProperty("exam1Grade"));
		   toReturn.setExam2((String)result.getProperty("exam2Grade"));
		   return toReturn;
		}


	private void populateData() {
		   DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		   Entity result1 = new Entity("ExamResult", "ps27933");
		  
		  
		   result1.setProperty("studentName", "Prawal Sharma");
		   result1.setProperty("exam1Grade", "98");
		   result1.setProperty("exam2Grade", "95");
		   
		   result1.setProperty("hw1", "100");
		   result1.setProperty("hw2", "100");
		   result1.setProperty("project1", "100");
		   result1.setProperty("project2", "93");
		   result1.setProperty("finalexam", "94"); 
		  
		   datastore.put(result1);
		  
		}


	
}
 	