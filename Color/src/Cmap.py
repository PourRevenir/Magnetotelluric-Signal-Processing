"""
The python code to generate the colormaps in txt format.

coding: utf-8
created on Thu Dec 10 19:29 2024
programme written by Yaokun Yang
"""

import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

cmarray = ['viridis', 'plasma', 'inferno', 'magma', 'cividis','Greys', 'Purples', 'Blues', 'Greens', 'Oranges', 'Reds','YlOrBr', 'YlOrRd', 'OrRd', 'PuRd', 'RdPu', 'BuPu','GnBu', 'PuBu', 'YlGnBu', 'PuBuGn', 'BuGn', 'YlGn','binary', 'gist_yarg', 'gist_gray', 'gray', 'bone','pink', 'spring', 'summer', 'autumn', 'winter', 'cool','Wistia', 'hot', 'afmhot', 'gist_heat', 'copper','PiYG', 'PRGn', 'BrBG', 'PuOr', 'RdGy', 'RdBu', 'RdYlBu','RdYlGn', 'Spectral', 'coolwarm', 'bwr', 'seismic','twilight', 'twilight_shifted', 'hsv','flag', 'prism', 'ocean', 'gist_earth', 'terrain','gist_stern', 'gnuplot', 'gnuplot2', 'CMRmap','cubehelix', 'brg', 'gist_rainbow', 'rainbow', 'jet','turbo', 'nipy_spectral', 'gist_ncar']

for i in range(len(cmarray)):
    cmap = mpl.cm.get_cmap(cmarray[i],256)
    np.savetxt(cmarray[i]+".txt", cmap(range(256)))
