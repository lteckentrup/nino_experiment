import matplotlib.pylab as plt
import pandas as pd
import netCDF4 as nc
from pandas.plotting import register_matplotlib_converters
import numpy as np
from matplotlib.backends.backend_pdf import PdfPages

def plot(axis, region, param, title):

    pathway='../climate_paper/'

    #-- open net-cdf and read in variables
    EP = nc.Dataset(pathway+param+'_1901-2015_CRUNCEP_EP_anomaly_annual_' \
                    +region+'.nc')
    CP = nc.Dataset(pathway+param+'_1901-2015_CRUNCEP_CP_anomaly_annual_' \
                    +region+'.nc')
    CTRL = nc.Dataset(pathway+param+'_1901-2015_CRUNCEP_annual_'+region+'.nc')

    df_ep = pd.DataFrame(EP.variables[param][:,0,0],columns=[param])
    df_cp = pd.DataFrame(CP.variables[param][:,0,0],columns=[param])
    df_ctrl = pd.DataFrame(CTRL.variables[param][:,0,0],columns=[param])

    df_ep_ctrl = df_ep-df_ctrl
    df_cp_ctrl = df_cp-df_ctrl

    if param == 'prec':
        df_cp_ctrl_smooth =  df_cp_ctrl.cumsum()
        df_ep_ctrl_smooth =  df_ep_ctrl.cumsum()
    else:
        df_cp_ctrl_smooth =  df_cp_ctrl.rolling(window=30).mean()
        df_ep_ctrl_smooth =  df_ep_ctrl.rolling(window=30).mean()

    time = np.arange(1901,2016)

    axis.plot(time, df_ep_ctrl[param], lw=2.0, ls=":", color = '#1f77b4', 
              label = 'Only EP vs control climate', alpha=0.9)
    axis.plot(time, df_cp_ctrl[param], lw=2.0, ls=":", color = '#ff7f0e', 
              label = 'Only CP vs control climate', alpha=0.9)

    axis2 = axis.twinx()
    
    axis2.plot(time, df_ep_ctrl_smooth[param], lw=2.0, ls="-", 
               color = '#1f77b4', 
               label = 'Only EP vs control climate (cumulative)', zorder=0)
    axis2.plot(time, df_cp_ctrl_smooth[param], lw=2.0, ls="-",
               color = '#ff7f0e', 
               label = 'Only CP vs control climate (cumulative)', zorder=0)

    if param == 'temp':
        axis.set_ylim(-0.4,0.4)
        axis2.set_ylim(-0.04,0.04)
    elif param == 'prec':
        axis.set_ylim(-120,120)
        axis2.set_ylim(-540,540)
    elif param == 'insol':
        axis.set_ylim(-6.5,6.5)
        axis2.set_ylim(-0.42,0.42)
    else:
        pass

    axis.axhline(linewidth=2, color='k', alpha = 0.5)
    axis.set_xlim(1966,2014)

    if param == 'temp':
        axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [K]')
    elif param == 'prec':
        axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [mm]')
    elif param == 'insol':
        axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [W m-2]')
    if axis == ax1:
        axis2.legend(loc='upper center', bbox_to_anchor=(3.4, -2.70), ncol=1,
                     fancybox=True, frameon=False)

#-- call  function and plot data

fig = plt.figure(1,figsize=(10.95,8.2))

fig.subplots_adjust(hspace=0.25)
fig.subplots_adjust(wspace=0.81)
fig.subplots_adjust(right=0.93)
fig.subplots_adjust(left=0.11)
fig.subplots_adjust(bottom=0.15)
fig.subplots_adjust(top=0.95)

plt.rcParams['text.usetex'] = False
plt.rcParams['font.family'] = "sans-serif"
plt.rcParams['font.sans-serif'] = "Helvetica"
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['font.size'] = 11
plt.rcParams['legend.fontsize'] = 12
plt.rcParams['xtick.labelsize'] = 11
plt.rcParams['ytick.labelsize'] = 11

ax1 = fig.add_subplot(3,3,1)
ax2 = fig.add_subplot(3,3,2)
ax3 = fig.add_subplot(3,3,3)
ax4 = fig.add_subplot(3,3,4)
ax5 = fig.add_subplot(3,3,5)
ax6 = fig.add_subplot(3,3,6)
ax7 = fig.add_subplot(3,3,7)
ax8 = fig.add_subplot(3,3,8)
ax9 = fig.add_subplot(3,3,9)

plot(ax1, 'global', 'temp', 'T')
plot(ax2, 'global', 'prec', 'P')
plot(ax3, 'global', 'insol', 'Rad')

plot(ax4, 'tropical', 'temp', 'T')
plot(ax5, 'tropical', 'prec', 'P')
plot(ax6, 'tropical', 'insol', 'Rad')

plot(ax7, 'australia', 'temp', 'T')
plot(ax8, 'australia', 'prec', 'P')
plot(ax9, 'australia', 'insol', 'Rad')

ax1.legend(loc='upper center', bbox_to_anchor=(1.4, -2.70), ncol=1,
           fancybox=True, frameon=False)

ax1.set_title('Temperature', fontsize=13)
ax2.set_title('Precipitation', fontsize=13)
ax3.set_title('Incoming SW radiation', fontsize=13)

ax1.set_ylabel('Global \n \n  $\Delta$ T [K $\mathrm{yr^{-1}}$]', fontsize=12)
ax4.set_ylabel('Tropical \n \n $\Delta$ T [K $\mathrm{yr^{-1}}$]', fontsize=12)
ax7.set_ylabel('Australia \n \n $\Delta$ T [K $\mathrm{yr^{-1}}$]', fontsize=12)

for axes in (ax2,ax5,ax8):
    axes.set_ylabel('$\Delta$ P [mm $\mathrm{yr^{-1}}$]', fontsize=12)
for axes in (ax3,ax6,ax9):
    axes.set_ylabel('$\Delta$ Rad [W $\mathrm{m^{-2}}$ $\mathrm{yr^{-1}}$]',
                    fontsize=12)

#plt.show()
plt.savefig('climate_anomalies.pdf')
