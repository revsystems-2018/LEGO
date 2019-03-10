package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Position;

import java.util.Date;
import java.util.List;

public interface PositionRepositoryCustom {

    public List<Position> getAllPositions();

    public Position getPositionById(Long id);

    public Boolean deletePosition(Long id);

    public Boolean addPosition(String name, String description, Date dateStart, Date dateEnd);

    public Boolean updatePosition(Long id, String name, String description, Date dateStart, Date dateEnd);
}
