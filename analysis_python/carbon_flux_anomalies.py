import matplotlib.pylab as plt
import pandas as pd
import netCDF4 as nc
import numpy as np

def plot(axis, region, param, title):

    pathway_EP='../global_CRUNCEP_only_EP_anomaly/'
    pathway_CP='../global_CRUNCEP_only_CP_anomaly/'
    pathway_CTRL='../global_CRUNCEP/'

    EP = nc.Dataset(pathway_EP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+'.nc')
    CP = nc.Dataset(pathway_CP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+'.nc')
    CTRL = nc.Dataset(pathway_CTRL+'cflux_LPJ-GUESS_1901-2015_annual_'+region+'.nc')

    df_ep = pd.DataFrame(EP.variables[param][:,0,0],columns=[param])
    df_cp = pd.DataFrame(CP.variables[param][:,0,0],columns=[param])
    df_ctrl = pd.DataFrame(CTRL.variables[param][:,0,0], columns=[param])

    if title == 'NBP':
        df_ep = df_ep * (-1)
        df_cp = df_cp * (-1)
        df_ctrl= df_ctrl * (-1)
    else:
        pass

    df_ep_ctrl = df_ep-df_ctrl
    df_cp_ctrl = df_cp-df_ctrl

    df_cp_ctrl_smooth =  df_cp_ctrl.cumsum()
    df_ep_ctrl_smooth =  df_ep_ctrl.cumsum()

    time = np.arange(1901,2016)

    axis.plot(time, df_ep_ctrl[param], lw=2.0, ls=":",
              color = '#1f77b4', label = 'Only EP vs control climate',
              alpha=0.9)
    axis.plot(time, df_cp_ctrl[param], lw=2.0, ls=":",
              color = '#ff7f0e', label = 'Only CP vs control climate',
              alpha=0.9)

    axis2 = axis.twinx()
    axis2.plot(time, df_ep_ctrl_smooth[param], lw=2.0, ls="-",
               color = '#1f77b4', 
               label = 'Only EP vs control climate (cumulative)',
               zorder=0)
    axis2.plot(time, df_cp_ctrl_smooth[param], lw=2.0, ls="-",
               color = '#ff7f0e', 
               label = 'Only CP vs control climate (cumulative)',
               zorder=0)

    if region == 'global':
        axis.set_ylim(-3.3,5.8)
        axis2.set_ylim(-19.5,34)
    elif region == 'tropical':
        axis.set_ylim(-3.3,5.8)
        axis2.set_ylim(-11,19)
    elif region == 'australia':
        axis.set_ylim(-1.4,1.4)
        axis2.set_ylim(-7,7)

    axis.axhline(linewidth=2, color='k', alpha = 0.5)
    axis.set_xlim(1966,2013)
    axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [PgC]')
    if axis in (ax1,ax2,ax3,ax5,ax6,ax7,ax9,ax10,ax11):
        axis2.set_yticklabels('')
    else:
        pass

    if axis == ax1:
        axis2.legend(loc='upper center', bbox_to_anchor=(3.2, -2.55), ncol=1,
                     fancybox=True, frameon=False)

#-- call  function and plot data

fig = plt.figure(1,figsize=(14.6,8.2))

fig.subplots_adjust(hspace=0.2)
fig.subplots_adjust(wspace=0.36)
fig.subplots_adjust(right=0.94)
fig.subplots_adjust(left=0.09)
fig.subplots_adjust(bottom=0.12)
fig.subplots_adjust(top=0.95)

plt.rcParams['text.usetex'] = False
plt.rcParams['font.family'] = "sans-serif"
plt.rcParams['font.sans-serif'] = "Helvetica"
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['font.size'] = 11
plt.rcParams['legend.fontsize'] = 12
plt.rcParams['xtick.labelsize'] = 11
plt.rcParams['ytick.labelsize'] = 11

ax1 = fig.add_subplot(3,4,1)
ax2 = fig.add_subplot(3,4,2)
ax3 = fig.add_subplot(3,4,3)
ax4 = fig.add_subplot(3,4,4)
ax5 = fig.add_subplot(3,4,5)
ax6 = fig.add_subplot(3,4,6)
ax7 = fig.add_subplot(3,4,7)
ax8 = fig.add_subplot(3,4,8)
ax9 = fig.add_subplot(3,4,9)
ax10 = fig.add_subplot(3,4,10)
ax11 = fig.add_subplot(3,4,11)
ax12 = fig.add_subplot(3,4,12)

plot(ax1, 'global', 'GPP', 'GPP')
plot(ax2, 'global', 'TER', 'TER')
plot(ax3, 'global', 'Fire', 'Fire')
plot(ax4, 'global', 'NEE', 'NBP')

plot(ax5, 'tropical', 'GPP', 'GPP')
plot(ax6, 'tropical', 'TER', 'TER')
plot(ax7, 'tropical', 'Fire', 'Fire')
plot(ax8, 'tropical', 'NEE', 'NBP')

plot(ax9, 'australia', 'GPP', 'GPP')
plot(ax10, 'australia', 'TER', 'TER')
plot(ax11, 'australia', 'Fire', 'Fire')
plot(ax12, 'australia', 'NEE', 'NBP')

ax1.legend(loc='upper center', bbox_to_anchor=(1.7, -2.55), ncol=1,
           fancybox=True, frameon=False)

ax1.set_title('a)                 GPP                 ', fontsize=13)
ax2.set_title('b)                 TER                 ', fontsize=13)
ax3.set_title('c)                 Fire                 ', fontsize=13)
ax4.set_title('d)                 NBP                 ', fontsize=13)

ax5.set_title('e)                                        ', fontsize=13)
ax6.set_title('f)                                        ', fontsize=13)
ax7.set_title('g)                                        ', fontsize=13)
ax8.set_title('h)                                        ', fontsize=13)

ax9.set_title('i)                                        ', fontsize=13)
ax10.set_title('j)                                        ', fontsize=13)
ax11.set_title('k)                                        ', fontsize=13)
ax12.set_title('l)                                        ', fontsize=13)

ax1.set_ylabel('Global \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]', 
                fontsize=12)
ax5.set_ylabel('Tropical \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]',  
                fontsize=12)
ax9.set_ylabel('Australia \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]', 
                fontsize=12)

for axes in (ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8):
    axes.set_xticklabels('')
else:
    pass

for axes in (ax2,ax3,ax4,ax6,ax7,ax8,ax10,ax11,ax12):
    axes.set_yticklabels('')
else:
    pass
for axes in (ax2,ax6,ax10):
    axes.set_ylabel('$\Delta$ TER [PgC $\mathrm{yr^{-1}}$]', fontsize=12)
for axes in (ax3,ax7,ax11):
    axes.set_ylabel('$\Delta$ Fire [PgC $\mathrm{yr^{-1}}$]', fontsize=12)
for axes in (ax4,ax8,ax12):
    axes.set_ylabel('$\Delta$ NBP [PgC $\mathrm{yr^{-1}}$]', fontsize=12)

# plt.subplot_tool()
# plt.show()
plt.savefig('carbon_flux_anomalies.pdf')
