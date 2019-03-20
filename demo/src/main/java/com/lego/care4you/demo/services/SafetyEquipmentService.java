package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.SafetyEquipment;
import com.lego.care4you.demo.repository.SafetyEquipmentRepository;
import com.lego.care4you.demo.services.utils.ImagenUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class SafetyEquipmentService implements GenericService<SafetyEquipment> {

    private SafetyEquipmentRepository safetyEquipmentRepository;

    @Override
    public List<SafetyEquipment> getAll() {
        return safetyEquipmentRepository.findAll();
    }

    @Override
    public SafetyEquipment getById(String id) {
        return safetyEquipmentRepository.findTopById(id);
    }

    @Override
    public void delete(String id) {
        safetyEquipmentRepository.deleteById(id);
    }

    @Override
    public void insert(SafetyEquipment params) {

    }

    @Override
    public void update(SafetyEquipment params) {

    }

    public void saveImage(String id, InputStream file) {
        SafetyEquipment itemPersisted = getById(id);
        try {
            Byte[] bytes = ImagenUtils.inputStreamToByteArray(file);
            itemPersisted.setImage(bytes);
            safetyEquipmentRepository.insert(itemPersisted);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Byte[] getBytes(MultipartFile file) {
        try {
            Byte[] bytes = new Byte[file.getBytes().length];
            int i = 0;
            for (Byte aByte : file.getBytes()) {
                bytes[i++] = aByte;
            }
            return bytes;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new Byte[0];
    }
}
