package com.zfcom.cft.service.impl;

import com.zfcom.cft.dao.UserDao;
import com.zfcom.cft.entity.User;
import com.zfcom.cft.service.IndexService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("IndexService")
public class IndexServiceImpl implements IndexService {
    private Log logger = LogFactory.getLog(IndexServiceImpl.class);

    @Autowired
    private UserDao userDao;

    @Transactional(readOnly = true)
    @Override
    public User login(User user) {
        return userDao.selectByNameAndPassword(user);
    }


}
