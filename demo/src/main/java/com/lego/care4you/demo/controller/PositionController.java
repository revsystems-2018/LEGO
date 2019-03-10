package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class PositionController {

    @Autowired
    PositionRepository positionRepository;

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
            value = "/allPositions",
            method = RequestMethod.GET)
    public ResponseEntity<Boolean> createPositionProcedure() {

        return new ResponseEntity<>(true, HttpStatus.CREATED);
    }
}
