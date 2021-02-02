import matplotlib.pylab as plt
import pandas as pd
import netCDF4 as nc
import numpy as np

def plot(forcing, axis, region, param, title):

    if forcing == 'GSWP3':

        pathway_EP='../global_GSWP3_noleap_only_EP_anomaly/'
        pathway_CP='../global_GSWP3_noleap_only_CP_anomaly/'
        pathway_CTRL='../global_GSWP3_noleap/'

        EP = nc.Dataset(pathway_EP+'cflux_LPJ-GUESS_1901-2010_annual_'+region+
                        '.nc')
        CP = nc.Dataset(pathway_CP+'cflux_LPJ-GUESS_1901-2010_annual_'+region+
                        '.nc')
        CTRL = nc.Dataset(pathway_CTRL+'cflux_LPJ-GUESS_1901-2010_annual_'+
                          region+'.nc')

        time = np.arange(1901,2011)

    elif forcing == 'CRUNCEP anomaly':

        pathway_EP='../global_CRUNCEP_only_EP_anomaly/'
        pathway_CP='../global_CRUNCEP_only_CP_anomaly/'
        pathway_CTRL='../global_CRUNCEP/'

        EP = nc.Dataset(pathway_EP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+
                        '.nc')
        CP = nc.Dataset(pathway_CP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+
                        '.nc')
        CTRL = nc.Dataset(pathway_CTRL+'cflux_LPJ-GUESS_1901-2015_annual_'+
                          region+'.nc')

        time = np.arange(1901,2016)

    elif forcing == 'CRUNCEP nearest year':

        pathway_EP='../global_CRUNCEP_only_EP_nearest_year/'
        pathway_CP='../global_CRUNCEP_only_CP_nearest_year/'
        pathway_CTRL='../global_CRUNCEP/'

        EP = nc.Dataset(pathway_EP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+
                        '.nc')
        CP = nc.Dataset(pathway_CP+'cflux_LPJ-GUESS_1901-2015_annual_'+region+
                        '.nc')
        CTRL = nc.Dataset(pathway_CTRL+'cflux_LPJ-GUESS_1901-2015_annual_'+region+
                          '.nc')

        time = np.arange(1901,2016)

    else:
        pass

    df_ep = pd.DataFrame(EP.variables[param][:,0,0],columns=[param])
    df_cp = pd.DataFrame(CP.variables[param][:,0,0],columns=[param])
    df_ctrl = pd.DataFrame(CTRL.variables[param][:,0,0], columns=[param])

    if title == 'NBP':
        df_ep = df_ep * (-1)
        df_cp = df_cp * (-1)
        df_ctrl= df_ctrl * (-1)
    else:
        pass

    df_ctrl_smooth =  df_ctrl.cumsum()
    df_cp_smooth =  df_cp.cumsum()
    df_ep_smooth =  df_ep.cumsum()

    df_ep_ctrl = df_ep-df_ctrl
    df_cp_ctrl = df_cp-df_ctrl

    df_cp_ctrl_smooth =  df_cp_ctrl.cumsum()
    df_ep_ctrl_smooth =  df_ep_ctrl.cumsum()

    if axis in (ax1, ax2 ,ax3):
        if forcing == 'GSWP3':
            axis.plot(time, df_ctrl[param], lw=3.0, ls="--",
                      color = 'k', alpha=0.7, label = 'CTRL')
            axis.plot(time, df_ep[param], lw=3.0, ls="--",
                      color = 'tab:blue', label = 'Only EP')
            axis.plot(time, df_cp[param], lw=3.0, ls="--",
                      color = 'tab:orange', label = 'Only CP')

        elif forcing in ('CRUNCEP anomaly', 'CRUNCEP nearest year'):
            axis.plot(time, df_ctrl[param], lw=3.0, ls="--",
                      color = 'k', label = 'CTRL',
                      alpha=0.7)
            axis.plot(time, df_ep[param], lw=3.0, ls="--",
                      color = 'tab:blue', label = 'Only EP',
                      alpha=0.9)
            axis.plot(time, df_cp[param], lw=3.0, ls="--",
                      color = 'tab:orange', label = 'Only CP',
                      alpha=0.9)

        else:
            pass

        axis.axhline(linewidth=2, color='k', alpha = 0.5)

    elif axis in (ax5, ax6, ax7):
        if forcing == 'GSWP3':
            axis.plot(time, df_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'k',
                       alpha = 0.6,
                       label = 'CTRL (cumulative)',
                       zorder=0)
            axis.plot(time, df_ep_smooth[param], lw=3.0, ls="-",
                       color = 'tab:blue',
                       label = 'Only EP (cumulative)',
                       zorder=0)
            axis.plot(time, df_cp_smooth[param], lw=3.0, ls="-",
                       color = 'tab:orange',
                       label = 'Only CP (cumulative)',
                       zorder=0)

        elif forcing in ('CRUNCEP anomaly', 'CRUNCEP nearest year'):
            axis.plot(time, df_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'k',
                       alpha = 0.6,
                       label = 'CTRL (cumulative)',
                       zorder=0)
            axis.plot(time, df_ep_smooth[param], lw=3.0, ls="-",
                       color = 'tab:blue',
                       label = 'Only EP (cumulative)',
                       zorder=0)
            axis.plot(time, df_cp_smooth[param], lw=2.0, ls="-",
                       color = 'tab:orange',
                       label = 'Only CP (cumulative)',
                       zorder=0)

        else:
            pass

    else:
        if forcing == 'GSWP3':
            axis.plot(time, df_ep_ctrl[param], lw=3.0, ls="--",
                      color = 'tab:blue', label = 'Only EP vs CTRL')
            axis.plot(time, df_cp_ctrl[param], lw=3.0, ls="--",
                      color = 'tab:orange', label = 'Only CP vs CTRL')

            axis2 = axis.twinx()
            axis2.plot(time, df_ep_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'tab:blue',
                       label = 'Only EP vs CTRL (cumulative)',
                       zorder=0)
            axis2.plot(time, df_cp_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'tab:orange',
                       label = 'Only CP vs CTRL (cumulative)',
                       zorder=0)

        elif forcing in ('CRUNCEP anomaly', 'CRUNCEP nearest year'):
            axis.plot(time, df_ep_ctrl[param], lw=3.0, ls="--",
                      color = 'tab:blue', label = 'Only EP vs CTRL',
                      alpha=0.9)
            axis.plot(time, df_cp_ctrl[param], lw=3.0, ls="--",
                      color = 'tab:orange', label = 'Only CP vs CTRL',
                      alpha=0.9)

            axis2 = axis.twinx()
            axis2.plot(time, df_ep_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'tab:blue',
                       label = 'Only EP vs CTRL (cumulative)',
                       zorder=0)
            axis2.plot(time, df_cp_ctrl_smooth[param], lw=3.0, ls="-",
                       color = 'tab:orange',
                       label = 'Only CP vs CTRL (cumulative)',
                       zorder=0)

            axis.axhline(linewidth=2, color='k', alpha = 0.5)

        if axis == ax11:
            axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [PgC]')
        if axis in (ax1,ax2,ax3,ax5,ax6,ax7,ax9,ax10):
            axis2.set_yticklabels('')
        else:
            pass

        if axis == ax11:
            axis2.legend(loc='upper center', bbox_to_anchor=(0.51, 0.75), ncol=1,
                         fancybox=True, frameon=False)

        axis2.set_ylim(-8.2,20)

    axis.set_xlim(1966,2013)
    axis.xaxis.set_tick_params(labelsize=13)
    axis.yaxis.set_tick_params(labelsize=13)

    # if axis == ax9:
        # print('EP_cum')
        # print(df_ep_smooth[param][112])
        # print('CP_cum')
        # print(df_cp_smooth[param][112])
        # print('CTRL_cum')
        # print(df_ctrl_smooth[param][112])
        # print('EP_cum')
        # print(df_ep_ctrl_smooth[param][112])
        # print('CP_cum')
        # print(df_cp_ctrl_smooth[param][112])

    #-- call  function and plot data

fig = plt.figure(1,figsize=(15.6,8.2))

fig.subplots_adjust(hspace=0.15)
fig.subplots_adjust(wspace=0.10)
fig.subplots_adjust(right=0.94)
fig.subplots_adjust(left=0.06)
fig.subplots_adjust(bottom=0.05)
fig.subplots_adjust(top=0.95)

plt.rcParams['text.usetex'] = False
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['font.size'] = 11
plt.rcParams['legend.fontsize'] = 12
plt.rcParams['xtick.labelsize'] = 11
plt.rcParams['ytick.labelsize'] = 12

ax1 = fig.add_subplot(3,4,1)
ax2 = fig.add_subplot(3,4,2)
ax3 = fig.add_subplot(3,4,3)

ax5 = fig.add_subplot(3,4,5)
ax6 = fig.add_subplot(3,4,6)
ax7 = fig.add_subplot(3,4,7)

ax9 = fig.add_subplot(3,4,9)
ax10 = fig.add_subplot(3,4,10)
ax11 = fig.add_subplot(3,4,11)


plot('CRUNCEP anomaly', ax1, 'global', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax2, 'tropical', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax3, 'australia', 'NEE', 'NBP')

plot('CRUNCEP anomaly', ax5, 'global', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax6, 'tropical', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax7, 'australia', 'NEE', 'NBP')

plot('CRUNCEP anomaly', ax9, 'global', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax10, 'tropical', 'NEE', 'NBP')
plot('CRUNCEP anomaly', ax11, 'australia', 'NEE', 'NBP')

ax3.legend(loc='upper left', ncol=1, fancybox=True, frameon=False)
ax7.legend(loc='upper left', ncol=1, fancybox=True, frameon=False)
ax11.legend(loc='upper left', ncol=1, fancybox=True, frameon=False)

ax1.set_title('a)                    Global                    ', fontsize=13)
ax2.set_title('b)                   Tropical                   ', fontsize=13)
ax3.set_title('c)                  Australia                  ', fontsize=13)

ax5.set_title('d)                                                  ', fontsize=13)
ax6.set_title('e)                                                  ', fontsize=13)
ax7.set_title('f)                                                  ', fontsize=13)

ax9.set_title('g)                                                  ', fontsize=13)
ax10.set_title('h)                                                  ', fontsize=13)
ax11.set_title('i)                                                  ', fontsize=13)

ax1.set_ylabel('NBP [PgC $\mathrm{yr^{-1}}$]',
                fontsize=12)
ax5.set_ylabel('Cumulative NBP [PgC]',
                fontsize=12)
ax9.set_ylabel('$\Delta$ NBP [PgC $\mathrm{yr^{-1}}$]',
                fontsize=12)

for axes in (ax1,ax2,ax3,ax5,ax6,ax7):
    axes.set_xticklabels('')
else:
    pass

for axes in (ax2,ax3,ax6,ax7,ax10,ax11):
    axes.set_yticklabels('')
else:
    pass

for axes in (ax1, ax2, ax3, ax9, ax10, ax11):
    axes.set_ylim([-3.5,8.3])
for axes in (ax5, ax6, ax7):
    axes.set_ylim([0,125])

#plt.subplot_tool()
# plt.show()
# plt.savefig('nbp_cru.pdf')
plt.savefig('Fig2.pdf')
