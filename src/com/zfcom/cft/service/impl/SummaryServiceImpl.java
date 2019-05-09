package com.zfcom.cft.service.impl;

import com.zfcom.cft.dao.SummaryDao;
import com.zfcom.cft.entity.Mofang;
import com.zfcom.cft.bo.MofangStatistical;
import com.zfcom.cft.service.SummaryService;
import com.zfcom.cft.utils.PageModel;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("SummaryService")
public class SummaryServiceImpl implements SummaryService {
    private Log logger = LogFactory.getLog(SummaryServiceImpl.class);

    @Autowired
    private SummaryDao mofangDao;

    @Transactional(readOnly = true)
    @Override
    public List<Mofang> getMofangByChannel(Integer no) {
        return mofangDao.getMofangByChannel(no);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Mofang> getAllChannelLatest() {
        return mofangDao.getAllChannelLatest();
    }

    @Transactional(readOnly = true)
    @Override
    public List<Mofang> getMofangByChannelAndMonth(Integer month, String date_grab, Integer channel) {
        return mofangDao.getMofangByChannelAndMonth(month, date_grab, channel);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Mofang> getMofangByChannelAndDate(PageModel pageModel, Integer channel, String date_start, String date_end) {
        int count = mofangDao.count(channel, date_start, date_end);
        pageModel.setRecordCount(count);
        return mofangDao.getMofangByChannelAndDate(channel, date_start, date_end);
    }

    @Transactional(readOnly = true)
    @Override
    public List<MofangStatistical> statisticalList(String date_start, String date_end) {
        return mofangDao.statisticalList(date_start, date_end);
    }

    @Transactional(readOnly = true)
    @Override
    public List<MofangStatistical> monthLive(Integer month) {
        return mofangDao.monthLive(month);
    }

}
