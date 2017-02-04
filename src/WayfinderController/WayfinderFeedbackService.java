package WayfinderController;
import WayfinderDBController.FeedbackDA;
import WayfinderModel.Feedback;
import com.google.gson.Gson;
import com.sun.net.httpserver.HttpServer;
import com.sun.jersey.api.container.httpserver.HttpServerFactory;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;


@Path("/wayfinderFeedback")
public class WayfinderFeedbackService{

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public String getAllFeedback() throws SQLException
    {
        Gson gson = new Gson();
        ArrayList<Feedback> fbList = FeedbackDA.getAllFeedback();


        return gson.toJson(fbList);
    }
}
