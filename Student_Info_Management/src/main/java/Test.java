// import java.util.Scanner;

//public class Test{
//	public static void main(String args[]) {
//		int temp;
//		Scanner sc = new Scanner(System.in);
//		System.out.print("Enter Number element:");
//		int n=sc.nextInt();
//		sc.nextLine();
//		int a[] = new int[n];
//		for (int i=0; i<n; i++) {
//			System.out.print(i + "st Number is:");
//			a[i]=sc.nextInt();
//		}
//		for(int i=0; i<n; i++) {
//			for(int j=0; j<n; j++) {
//				if(a[i]<a[j] && j>i) {
//					temp = a[i];
//					a[i]=a[j];
//					a[j]=temp;
//				}
//			}
//
//		}
//		for(int z=0; z<n; z++) {
//			System.out.println(a[z]);
//		}
//	}
//}

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Test")
public class Test extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		System.out.println(req.getParameter("Sname"));
		System.out.println(req.getParameter("Rnumber"));
		System.out.println(req.getParameter("gender"));
		System.out.println(req.getParameter("DateofBirth"));
		System.out.println(req.getParameter("Department"));
		System.out.println(req.getParameter("Phnumber"));
		System.out.println(req.getParameter("Address"));

	}
}