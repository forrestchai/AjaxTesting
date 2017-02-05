package WayfinderController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by User on 2/6/2017.
 */
@WebServlet(name = "FeedbackDismissServlet", urlPatterns = "/feedbackDismiss")
public class FeedbackDismissServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String delAll = request.getParameter("all");
        String delAllId = request.getParameter("delAllId");
        String delId = request.getParameter("delId");

        if(!delAll.equalsIgnoreCase("no"))
        {

        }
        else if (!delAllId.equalsIgnoreCase("no"))
        {

        }
        else
        {

        }

    }
}
