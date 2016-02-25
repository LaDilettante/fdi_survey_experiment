# -*- coding: utf-8 -*-
"""
Created on Wed Feb 24 14:07:46 2016

@author: anh
"""

import pandas as pd
from pandas_datareader import wb
from ggplot import *

dat = wb.download(
    indicator=['BX.KLT.DINV.CD.WD', 'BX.KLT.DINV.WD.GD.ZS'],
    country='CN', start=2005, end=2011)
dat.reset_index(inplace=True)

print ggplot(aes(x='year', y='BX.KLT.DINV.CD.WD'),
       data=dat) + \
    geom_line() + theme_bw()

cdat

ggplot(dat.loc["China"], aes(x='year', y='BX.KLT.DINV.CD.WD')) + \
    geom_point()

