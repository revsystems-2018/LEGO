package edu.lego.care4you.rest;

import edu.lego.care4you.data.domain.User;
import edu.lego.care4you.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.Map;

@Controller
@Path("/employees")
@Produces(MediaType.APPLICATION_JSON)
public class AddUsersController {

    private UserService userService;

    @GET
    public Response getAll(@PathVariable String userId,
                           @RequestParam String emailUser) {
        Map<String, User> userMap = userService.loadAllUsersMap(emailUser);

        return Response.ok(userMap).build();
    }

}
