package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.dto.PositionDTO;
import com.lego.care4you.demo.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PositionService {

    @Autowired
    PositionRepository positionRepository;

    public Position createPosition(PositionDTO positionDTO) {
        return positionRepository.save(BuildPosition(positionDTO));
    }

    private Position BuildPosition(PositionDTO positionDTO) {
        Position position = new Position();

        position.setName(positionDTO.getName());
        position.setDescription(positionDTO.getDescriptions());
        position.setDateStart(positionDTO.getDateStart());
        position.setDateEnd(positionDTO.getDateEnd());

        return position;
    }

}
