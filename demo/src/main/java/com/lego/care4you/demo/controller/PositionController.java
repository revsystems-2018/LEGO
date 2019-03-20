package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.dto.PositionDTO;
import com.lego.care4you.demo.repository.PositionRepository;
import com.lego.care4you.demo.services.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;

@RestController
public class PositionController {

    @Autowired
    PositionRepository positionRepository;

    @Autowired
    PositionService positionService;

    @RequestMapping(
            value = "/allPositions",
            method = RequestMethod.GET)
    public ResponseEntity<List<Position>> getAllPositions() {

        Iterable<Position> positions = positionRepository.findAll();

        List<Position> target = new ArrayList<>();
        positions.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/Positions/{id}",
            method = RequestMethod.GET)
    public ResponseEntity<Position> getPositionById(@PathParam("id") String id) {
        Position position = positionRepository.findTopById(id);

        return new ResponseEntity<>(position, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/Positions/{id}",
            method = RequestMethod.DELETE)
    public void deletePositionById(@PathParam("id") String id) {
        positionRepository.deleteById(id);

        new ResponseEntity<>(true, HttpStatus.NO_CONTENT);
    }

    @RequestMapping(
            value = "/positions",
            method = RequestMethod.POST)
    public ResponseEntity<Boolean> createPositionProcedure(@RequestBody PositionDTO positionDTO) {

        return new ResponseEntity<>(true, HttpStatus.CREATED);
    }

    @RequestMapping(
            value = "/positions/{id}",
            method = RequestMethod.PUT)
    public ResponseEntity<Boolean> updatePositionProcedure(@PathParam("id") Long id, @RequestBody PositionDTO positionDTO) {

        return new ResponseEntity<>(false, HttpStatus.ACCEPTED);
    }

    @RequestMapping(
            value = "/Positions",
            method = RequestMethod.POST)
    public ResponseEntity<Position> createPosition(@RequestBody PositionDTO positionDTO) {
        Position createPosition = positionService.createPosition(positionDTO);

        return new ResponseEntity<>(createPosition, HttpStatus.CREATED);
    }
}
