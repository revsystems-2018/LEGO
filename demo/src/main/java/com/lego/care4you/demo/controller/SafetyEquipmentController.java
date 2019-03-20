package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.SafetyEquipment;
import com.lego.care4you.demo.repository.SafetyEquipmentRepository;
import com.lego.care4you.demo.services.SafetyEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.InputStream;
import java.util.List;

@RestController
public class SafetyEquipmentController {

    @Autowired
    private SafetyEquipmentService safetyEquipmentService;

    @GET
    public List<SafetyEquipment> getAll() {
        return safetyEquipmentService.getAll();
    }

    @Path("/{id}/image")
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response uploadFile(@PathParam("id") String id,
                               @FormDataParam("file") InputStream file,
                               @FormDataParam("file") FormDataContentDisposition fileDisposition) {
        safetyEquipmentService.saveImage(id, file);
        return Response.ok("Data uploaded successfully !!").build();
    }
}
