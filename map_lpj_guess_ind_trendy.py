from mpl_toolkits.basemap import Basemap
from netCDF4 import Dataset as open_ncfile
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import BoundaryNorm
import os

home ='../../'
folderOUT =''

def plot(model, name, experiment, position, v):
    folderIN=home+'/TRENDY/S2/'+v+'/bootstrap/'
    folderlpj=home+'/lpj_guess/runs/global_monthly_CRUNCEP/bootstrap/'
    
    fname_cp = 'ensmean_annual_1960-2013_CP_detrend.nc'
    fname_ep = 'ensmean_annual_1960-2013_EP_detrend.nc'
    
    #-- open net-cdf and read in variables    
    if model == 'LPJ-GUESS':
        if experiment =='CP':
            trendy = open_ncfile(folderlpj+v+'_'+fname_cp)
        else:
            trendy = open_ncfile(folderlpj+v+'_'+fname_ep)

        lat = trendy.variables['Lat'][:]
        lon = trendy.variables['Lon'][:]
            
    elif model == 'TRENDY':
        if experiment =='CP':
            trendy = open_ncfile(folderIN+fname_cp)
        else:
            trendy = open_ncfile(folderIN+fname_ep)

        lat = trendy.variables['latitude'][:]
        lon = trendy.variables['longitude'][:]

    else:
        if experiment =='CP':
            trendy = open_ncfile(folderIN+model+'_'+fname_cp)
        else:
            trendy = open_ncfile(folderIN+model+'_'+fname_ep)

        lat = trendy.variables['latitude'][:]
        lon = trendy.variables['longitude'][:]
          
    var = trendy.variables[v][0,:,:]
    
    if v in ('mnee'):
        var = var * (-1000)
    else:
        var = var * 1000
    
    plt.subplot(5, 4, position)

    #-- create map
    map = Basemap(projection='cyl',llcrnrlat= -60.,urcrnrlat= 84.,
                  resolution='c',  llcrnrlon=0.,urcrnrlon=360.)
    
    #-- draw coastlines and edge of map
    map.drawcoastlines(linewidth=0.2)
    x, y = map(*np.meshgrid(lon, lat))
    cut_data = var[:-1, :-1]  

    #-- define the colormap
    if v in ('resp', 'ter'):
        cmap = plt.cm.BrBG_r
    else:
        cmap = plt.cm.BrBG   

    #-- extract all colors colormap
    cmaplist = [cmap(i) for i in range(cmap.N)]

    #-- create the new map
    cmap = cmap.from_list('Custom cmap', cmaplist, cmap.N)

    #-- define the bins and normalize
    levels = np.arange(-28,32,4)
    norm = BoundaryNorm(levels, ncolors=cmap.N, clip=True)

    #-- draw filled contours
    cnplot = map.pcolormesh(x, y, cut_data, cmap=cmap, norm=norm)

    #-- plot title for subplots
    plt.title(name+' '+experiment, fontsize=12)

    #-- add colourbar
    plt.subplots_adjust(top=0.95, left=0.02, right=0.98, bottom=0.11, 
                        wspace=0.05, hspace=0.1)
    cax = plt.axes([0.1, 0.08, 0.8, 0.02])
    cbar=fig.colorbar(cnplot, orientation='horizontal', cax=cax)
    cbar.ax.tick_params(labelsize=10)
    plt.colorbar(ticks = levels, cax=cax, orientation='horizontal')
    
    if v in ('resp', 'ter'):
        cbar.set_label('Composite anomaly TER [gC]',fontsize=13)
    elif v in ('dist'):
        cbar.set_label('Composite anomaly DIST [gC]',fontsize=13)
    elif v in ('nbp', 'mnee'):
        cbar.set_label('Composite anomaly NBP [gC]',fontsize=13)
    elif v in ('mgpp', 'gpp'):
        cbar.set_label('Composite anomaly GPP [gC]',fontsize=13)
    else:
        pass

models = ['CLM4.5', 'JSBACH', 'JULES', 'LPX', 'ORCHIDEE', 'VEGAS', 'VISIT', 
          'TRENDY', 'LPJ-GUESS']
titles = ['CLM4.5 composite', 'JSBACH composite', 'JULES composite', 
          'LPX composite', 'ORCHIDEE composite', 'VEGAS composite', 
          'VISIT composite', 'TRENDY composite', 'LPJ-GUESS composite']
position_cp = [1,2,5,6,9,10,13,14,18]
position_ep = [3,4,7,8,11,12,15,16,19,20]

figures = [1,2,3,4]
var_trendy = ['nbp', 'gpp', 'ter', 'dist']
var_lpj = ['mnee', 'mgpp', 'resp', 'dist']

for f, vt, vl in zip(figures,var_trendy,var_lpj):
    fig, ax = plt.subplots(f,figsize=(10.1, 8.1))    
    for m,t,p_c in zip(models,titles,position_cp):
        if m == 'LPJ-GUESS':
            plot(m,t,'CP', p_c, vl)
        else:
            plot(m,t,'CP', p_c, vt)
    for m,t,p_e in zip(models,titles,position_ep):
        if m == 'LPJ-GUESS':    
            plot(m,t,'EP', p_e, vl)
        else:
            plot(m,t,'EP', p_e, vt)
  
    plt.savefig(vt+'_composite_ind_trendy_lpj_guess.png', dpi=600)    

os.system("convert nbp_composite_ind_trendy_lpj_guess.png \
          gpp_composite_ind_trendy_lpj_guess.png \
          ter_composite_ind_trendy_lpj_guess.png \
          dist_composite_ind_trendy_lpj_guess.png \
          composite_ind_trendy_lpj_guess.pdf")


for v in ('nbp', 'gpp', 'ter', 'dist'):
    os.remove(v+'_composite_ind_trendy_lpj_guess.png') 
