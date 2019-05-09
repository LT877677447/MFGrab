package com.zfcom.cft.service;

import com.zfcom.cft.entity.Mofang;
import com.zfcom.cft.bo.MofangStatistical;
import com.zfcom.cft.utils.PageModel;

import java.util.List;

public interface SummaryService {

    List<Mofang> getMofangByChannel(Integer no);

    List<Mofang> getAllChannelLatest();

    List<Mofang> getMofangByChannelAndMonth(Integer month,String date_grab,Integer channel);

    public List<Mofang> getMofangByChannelAndDate(PageModel pageModel, Integer channel, String date_start, String date_end);

    List<MofangStatistical> statisticalList(String date_start, String date_end);

    List<MofangStatistical> monthLive(Integer month);
}
