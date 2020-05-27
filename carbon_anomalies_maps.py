from mpl_toolkits.basemap import Basemap
from netCDF4 import Dataset as open_ncfile
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import BoundaryNorm

def plot(experiment, position, month_count, var):

    folderIN = '/srv/ccrc/data02/z5227845/research/lpj_guess/runs/'

    if var in ('NEE', 'GPP', 'TER', 'Fire', 'NEE_cum', 'GPP_cum', 'TER_cum',
               'Fire_cum'):
        # if position in (1,3,5):
        #     model = open_ncfile(folderIN+
        #                         'global_CRUNCEP_no_fire_no_dist_only_CP_anomaly/'
        #                         'cflux_all_anomaly_LPJ-GUESS_1901-2015.nc')
        # else:
        #     model = open_ncfile(folderIN+
        #                         'global_CRUNCEP_no_fire_no_dist_only_EP_anomaly/'
        #                         'cflux_all_anomaly_LPJ-GUESS_1901-2015.nc')

        if position in (1,3,5):
            model = open_ncfile(folderIN+
                                'global_CRUNCEP_only_CP_anomaly/'
                                'cflux_all_anomaly_LPJ-GUESS_1901-2015.nc')
        else:
            model = open_ncfile(folderIN+
                                'global_CRUNCEP_only_EP_anomaly/'
                                'cflux_all_anomaly_LPJ-GUESS_1901-2015.nc')
    elif var in ('Total', 'VegC', 'LitterC', 'SoilC'):

        if position in (1,3,5):
            model = open_ncfile(folderIN+
                                'global_CRUNCEP_only_CP_anomaly/'
                                'cpool_anomaly_LPJ-GUESS_1901-2015.nc')
        else:
            model = open_ncfile(folderIN+
                                'global_CRUNCEP_only_EP_anomaly/'
                                'cpool_anomaly_LPJ-GUESS_1901-2015.nc')

    else:
        pass

    lat = model.variables['Lat'][:]
    lon = model.variables['Lon'][:]
    data = model.variables[var][month_count,:,:]

    plt.subplot(4, 2, position)

    #-- create map
    map = Basemap(projection='cyl',llcrnrlat= -60.,urcrnrlat= 90.,\
                  resolution='c',  llcrnrlon=0.,urcrnrlon=360.)

    #-- draw coastlines and edge of map
    map.drawcoastlines()
    x, y = map(*np.meshgrid(lon, lat))

    cut_data = data[:-1, :-1]
    cmap = plt.cm.BrBG
    if var in ('NEE', 'NEE_cum'):
        cut_data = cut_data * (-1000)
    else:
        cut_data = cut_data * 1000

    cmaplist = [cmap(i) for i in range(cmap.N)]
    cmap = cmap.from_list('Custom cmap', cmaplist, cmap.N)
    cut_data = np.ma.array(cut_data, mask=(cut_data == 0))
    cmap.set_bad('white',1.)

    #-- add colourbar
    plt.subplots_adjust(top=0.92, left=0.02, right=0.98, bottom=0.11,
                        wspace=0.00, hspace=0.2)

    if var in ('NEE', 'GPP', 'TER', 'Fire'):
        levels = np.arange(-120,140,20)
        if position in (1,2):
            plt.title(experiment + '-only-scenario \n \n' + 'NBP', fontsize=13)
        else:
            plt.title(var, fontsize=12)

    elif var in ('NEE_cum', 'GPP_cum', 'TER_cum', 'Fire_cum'):
        levels = [-8000,-4000,-2000,-1000,-500,-250,-50,
                  50,250,500,1000,2000,4000,8000]
        if position in (1,2):
            plt.title(experiment + '-only-scenario \n \n' + 'NBP', fontsize=13)
        else:
            plt.title(var.replace('_cum', ''), fontsize=12)

    elif var in ('Total', 'VegC', 'LitterC', 'SoilC'):
        levels = [-8000,-4000,-2000,-1000,-500,-250,-50,
                  50,250,500,1000,2000,4000,8000]
        if position in (1,2):
            plt.title(experiment + '-only-scenario \n \n' + var, fontsize=13)
        else:
            plt.title(var, fontsize=12)


    norm = BoundaryNorm(levels, ncolors=cmap.N, clip=True)
    cnplot = map.pcolormesh(x, y, cut_data, cmap=cmap, norm=norm)
    cax = plt.axes([0.1, 0.08, 0.8, 0.02])
    cbar=fig.colorbar(cnplot, orientation='horizontal', cax=cax)
    cbar.ax.tick_params(labelsize=10)
    plt.colorbar(ticks = levels, cax=cax, orientation='horizontal')
    if var in ('NEE', 'GPP', 'TER', 'Fire'):
        cbar.set_label('Carbon flux anomaly [gC]',fontsize=10)
    elif var in ('Total', 'VegC', 'LitterC', 'SoilC'):
        cbar.set_label('Carbon pool anomaly [gC yr-1]',fontsize=10)
    elif var in ('NEE_cum', 'GPP_cum', 'TER_cum', 'Fire_cum'):
        cbar.set_label('Carbon flux anomaly (cumulative) [gC]',fontsize=10)

#-- call  function and plot figure
fig, ax = plt.subplots(1,figsize=(8.1, 8.7))
# plot('Only CP', 1, 112, 'NEE')
# plot('Only EP', 2, 112, 'NEE')
# plot('Only CP', 3, 112, 'GPP')
# plot('Only EP', 4, 112, 'GPP')
# plot('Only CP', 5, 112, 'TER')
# plot('Only EP', 6, 112, 'TER')
# plot('Only CP', 7, 112, 'Fire')
# plot('Only EP', 8, 112, 'Fire')

# plot('Only CP', 1, 112, 'NEE_cum')
# plot('Only EP', 2, 112, 'NEE_cum')
# plot('Only CP', 3, 112, 'GPP_cum')
# plot('Only EP', 4, 112, 'GPP_cum')
# plot('Only CP', 5, 112, 'TER_cum')
# plot('Only EP', 6, 112, 'TER_cum')
# plot('Only CP', 7, 112, 'Fire_cum')
# plot('Only EP', 8, 112, 'Fire_cum')

plot('Only CP', 1, 112, 'Total')
plot('Only EP', 2, 112, 'Total')
plot('Only CP', 3, 112, 'VegC')
plot('Only EP', 4, 112, 'VegC')
plot('Only CP', 5, 112, 'LitterC')
plot('Only EP', 6, 112, 'LitterC')
plot('Only CP', 7, 112, 'SoilC')
plot('Only EP', 8, 112, 'SoilC')
plt.show()
#plt.savefig('carbon_flux_cum_anomalies_map.png', dpi = 600)
