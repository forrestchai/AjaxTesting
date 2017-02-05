package WayfinderController;

import WayfinderDBController.FeedbackDA;
import WayfinderDBController.WaypointDA;
import WayfinderModel.Feedback;
import WayfinderModel.Waypoint;
import com.google.gson.Gson;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by User on 2/5/2017.
 */
public class WaypointFeedbackService {

    @Path("/waypointFeedback/{id}")
    public class WayfinderFeedbackService{

        @GET
        //@Path("waypointFeedback/{id}")
        @Produces({MediaType.APPLICATION_JSON})
        public String getAllFeedbackWaypoints(@PathParam("id") String id) throws SQLException
        {
            Gson gson = new Gson();
            ArrayList<Feedback> fbList = FeedbackDA.getAllFeedback(id);

            return gson.toJson(fbList);
        }
    }

}
