package com.zfcom.cft.dao;

import com.zfcom.cft.entity.po.User;
import com.zfcom.cft.utils.Constants;
import org.apache.ibatis.annotations.Select;

public interface UserDao {

    @Select("select * from " + Constants.TABLE_USER +
            " where name = #{name} and password = #{password} and project='MFGrab'")
    User selectByNameAndPassword(User user);



}
