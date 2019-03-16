package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Employees;
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

        Iterable<Position> positions = positionRepository.getAllPositions();

        List<Position> target = new ArrayList<>();
        positions.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/Positions/{id}",
            method = RequestMethod.GET)
    public ResponseEntity<Position> getPositionById(@PathParam("id") Long id) {
        Position position = positionRepository.getPositionById(id);

        return new ResponseEntity<>(position, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/Positions/{id}",
            method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> deletePositionById(@PathParam("id") Long id) {
        Boolean positionStatus = positionRepository.deletePosition(id);

        return new ResponseEntity<>(positionStatus, HttpStatus.NO_CONTENT);
    }

    @RequestMapping(
            value = "/positions",
            method = RequestMethod.POST)
    public ResponseEntity<Boolean> createPositionProcedure(@RequestBody PositionDTO positionDTO) {
        Boolean createStatus = positionRepository.addPosition(positionDTO.getName(),
                positionDTO.getDescriptions(),
                positionDTO.getDateStart(),
                positionDTO.getDateEnd());

        return new ResponseEntity<>(createStatus, HttpStatus.CREATED);
    }

    @RequestMapping(
            value = "/positions/{id}",
            method = RequestMethod.PUT)
    public ResponseEntity<Boolean> updatePositionProcedure(@PathParam("id") Long id, @RequestBody PositionDTO positionDTO) {
        Boolean updateStatus = positionRepository.updatePosition(id,
                positionDTO.getName(),
                positionDTO.getDescriptions(),
                positionDTO.getDateStart(),
                positionDTO.getDateEnd());

        return new ResponseEntity<>(updateStatus, HttpStatus.ACCEPTED);
    }

    @RequestMapping(
            value = "/Positions",
            method = RequestMethod.POST)
    public ResponseEntity<Position> createPosition(@RequestBody PositionDTO positionDTO) {
        Position createPosition = positionService.createPosition(positionDTO);

        return new ResponseEntity<>(createPosition, HttpStatus.CREATED);
    }
}
