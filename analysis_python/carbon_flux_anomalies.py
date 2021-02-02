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

    df_ep_ctrl = df_ep-df_ctrl
    df_cp_ctrl = df_cp-df_ctrl

    df_cp_ctrl_smooth =  df_cp_ctrl.cumsum()
    df_ep_ctrl_smooth =  df_ep_ctrl.cumsum()

    if forcing == 'GSWP3':
        axis.plot(time, df_ep_ctrl[param], lw=3, ls="--",
                  color = 'tab:blue', label = 'Only EP vs CTRL')
        axis.plot(time, df_cp_ctrl[param], lw=3, ls="--",
                  color = 'tab:orange', label = 'Only CP vs CTRL')

        axis2 = axis.twinx()
        axis2.plot(time, df_ep_ctrl_smooth[param], lw=3, ls="-",
                   color = 'tab:blue',
                   label = 'Only EP vs CTRL (cumulative)',
                   zorder=0)
        axis2.plot(time, df_cp_ctrl_smooth[param], lw=3, ls="-",
                   color = 'tab:orange',
                   label = 'Only CP vs CTRL (cumulative)',
                   zorder=0)

        if axis in (ax1,ax2,ax3,ax5,ax6,ax7,ax9,ax10,ax11):
            axis2.set_yticklabels('')
        else:
            pass

    elif forcing in ('CRUNCEP anomaly', 'CRUNCEP nearest year'):
        axis.plot(time, df_ep_ctrl[param], lw=3, ls="--",
                  color = 'tab:blue', label = 'Only EP vs CTRL',
                  alpha=0.9)
        axis.plot(time, df_cp_ctrl[param], lw=3, ls="--",
                  color = 'tab:orange', label = 'Only CP vs CTRL',
                  alpha=0.9)

        axis2 = axis.twinx()
        axis2.plot(time, df_ep_ctrl_smooth[param], lw=3, ls="-",
                   color = 'tab:blue',
                   label = 'Only EP vs CTRL (cumulative)',
                   zorder=0)
        axis2.plot(time, df_cp_ctrl_smooth[param], lw=3, ls="-",
                   color = 'tab:orange',
                   label = 'Only CP vs CTRL (cumulative)',
                   zorder=0)

        if forcing == 'CRUNCEP nearest year':
            if axis in (ax1,ax2,ax3,ax5,ax6,ax7,ax9,ax10,ax11):
                axis2.set_yticklabels('')
            else:
                pass
        elif forcing == 'CRUNCEP anomaly':
            if axis in (ax1,ax2,ax5,ax6,ax9,ax10):
                axis2.set_yticklabels('')
            else:
                pass
    else:
        pass

    if forcing == 'CRUNCEP anomaly':
        if region == 'global':
            axis.set_ylim(-3.1,8.5)
            axis2.set_ylim(-22.6,62)
        elif region == 'tropical':
            axis.set_ylim(-1.9,3.8)
            axis2.set_ylim(-15.5,30)
        elif region == 'australia':
            axis.set_ylim(-1.4,2.1)
            axis2.set_ylim(-6.33,10)
        else:
            pass

    else:
        if region == 'global':
            axis.set_ylim(-3.1,8.5)
            axis2.set_ylim(-22.6,62)
        elif region == 'tropical':
            axis.set_ylim(-1.9,3.8)
            axis2.set_ylim(-12.5,25)
        elif region == 'australia':
            axis.set_ylim(-1.4,2.1)
            axis2.set_ylim(-5.33,8)
        else:
            pass

    axis.axhline(linewidth=2, color='k', alpha = 0.5)
    axis.set_xlim(1966,2013)
    axis2.set_ylabel('$\Delta$ '+title+'$_{\mathrm{cum}}$ [PgC]')

    if axis == ax1:
        axis2.legend(loc='upper center', bbox_to_anchor=(3.0, -2.55), ncol=1,
                     fancybox=True, frameon=False)

    # print(region+param)
    # print('EP anomaly')
    # print(df_ep_ctrl[param][60:].max())
    # print(df_ep_ctrl[param][60:].min())
    # print('CP anomaly')
    # print(df_cp_ctrl[param][60:].max())
    # print(df_cp_ctrl[param][60:].min())
    # print('EP_cum anomaly')
    # print(df_ep_ctrl_smooth[param][112])
    # print('CP_cum anomaly')
    # print(df_cp_ctrl_smooth[param][112])
    # print(time[112])
#-- call  function and plot data

experiments = ['GSWP3', 'CRUNCEP nearest year']
# figure_title = ['carbon_flux_anomalies_gswp3.pdf',
#                 'carbon_flux_anomalies_nearest_year.pdf']
figure_title_submission = ['FigB8.pdf', 'FigB6.pdf']
figure_number = [0,1]

for e,f,fn in zip(experiments, figure_title_submission, figure_number):

    fig = plt.figure(fn,figsize=(14.6,8.2))

    fig.subplots_adjust(hspace=0.2)
    fig.subplots_adjust(wspace=0.36)
    fig.subplots_adjust(right=0.94)
    fig.subplots_adjust(left=0.09)
    fig.subplots_adjust(bottom=0.12)
    fig.subplots_adjust(top=0.95)

    plt.rcParams['text.usetex'] = False
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

    plot(e, ax1, 'global', 'NEE', 'NBP')
    plot(e, ax2, 'global', 'GPP', 'GPP')
    plot(e, ax3, 'global', 'TER', 'TER')
    plot(e, ax4, 'global', 'Fire', 'Fire')

    plot(e, ax5, 'tropical', 'NEE', 'NBP')
    plot(e, ax6, 'tropical', 'GPP', 'GPP')
    plot(e, ax7, 'tropical', 'TER', 'TER')
    plot(e, ax8, 'tropical', 'Fire', 'Fire')

    plot(e, ax9, 'australia', 'NEE', 'NBP')
    plot(e, ax10, 'australia', 'GPP', 'GPP')
    plot(e, ax11, 'australia', 'TER', 'TER')
    plot(e, ax12, 'australia', 'Fire', 'Fire')

    ax1.legend(loc='upper center', bbox_to_anchor=(1.9, -2.55), ncol=1,
               fancybox=True, frameon=False)

    ax1.set_title('a)                 NBP                 ', fontsize=13)
    ax2.set_title('b)                 GPP                 ', fontsize=13)
    ax3.set_title('c)                 TER                 ', fontsize=13)
    ax4.set_title('d)                 Fire                 ', fontsize=13)

    ax5.set_title('e)                                        ', fontsize=13)
    ax6.set_title('f)                                        ', fontsize=13)
    ax7.set_title('g)                                        ', fontsize=13)
    ax8.set_title('h)                                        ', fontsize=13)

    ax9.set_title('i)                                        ', fontsize=13)
    ax10.set_title('j)                                        ', fontsize=13)
    ax11.set_title('k)                                        ', fontsize=13)
    ax12.set_title('l)                                        ', fontsize=13)

    ax1.set_ylabel('Global \n \n $\Delta$ NBP [PgC $\mathrm{yr^{-1}}$]',
                    fontsize=12)
    ax5.set_ylabel('Tropical \n \n $\Delta$ NBP [PgC $\mathrm{yr^{-1}}$]',
                    fontsize=12)
    ax9.set_ylabel('Australia \n \n $\Delta$ NBP [PgC $\mathrm{yr^{-1}}$]',
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
        axes.set_ylabel('$\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]', fontsize=12)
    for axes in (ax3,ax7,ax11):
        axes.set_ylabel('$\Delta$ TER [PgC $\mathrm{yr^{-1}}$]', fontsize=12)
    for axes in (ax4,ax8,ax12):
        axes.set_ylabel('$\Delta$ Fire [PgC $\mathrm{yr^{-1}}$]', fontsize=12)

    # plt.show()
    plt.savefig(f)

fig = plt.figure(3,figsize=(14.6,8.2))

fig.subplots_adjust(hspace=0.2)
fig.subplots_adjust(wspace=0.36)
fig.subplots_adjust(right=0.94)
fig.subplots_adjust(left=0.09)
fig.subplots_adjust(bottom=0.12)
fig.subplots_adjust(top=0.95)

plt.rcParams['text.usetex'] = False
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['font.size'] = 11
plt.rcParams['legend.fontsize'] = 12
plt.rcParams['xtick.labelsize'] = 11
plt.rcParams['ytick.labelsize'] = 11

ax1 = fig.add_subplot(3,4,1)
ax2 = fig.add_subplot(3,4,2)
ax3 = fig.add_subplot(3,4,3)
ax5 = fig.add_subplot(3,4,5)
ax6 = fig.add_subplot(3,4,6)
ax7 = fig.add_subplot(3,4,7)
ax9 = fig.add_subplot(3,4,9)
ax10 = fig.add_subplot(3,4,10)
ax11 = fig.add_subplot(3,4,11)

plot('CRUNCEP anomaly', ax1, 'global', 'GPP', 'GPP')
plot('CRUNCEP anomaly', ax2, 'global', 'TER', 'TER')
plot('CRUNCEP anomaly', ax3, 'global', 'Fire', 'Fire')

plot('CRUNCEP anomaly', ax5, 'tropical', 'GPP', 'GPP')
plot('CRUNCEP anomaly', ax6, 'tropical', 'TER', 'TER')
plot('CRUNCEP anomaly', ax7, 'tropical', 'Fire', 'Fire')

plot('CRUNCEP anomaly', ax9, 'australia', 'GPP', 'GPP')
plot('CRUNCEP anomaly', ax10, 'australia', 'TER', 'TER')
plot('CRUNCEP anomaly', ax11, 'australia', 'Fire', 'Fire')

ax1.legend(loc='upper center', bbox_to_anchor=(1.25, -2.55), ncol=1,
           fancybox=True, frameon=False)

ax1.set_title('a)                 GPP                 ', fontsize=13)
ax2.set_title('b)                 TER                 ', fontsize=13)
ax3.set_title('c)                 Fire                 ', fontsize=13)

ax5.set_title('d)                                        ', fontsize=13)
ax6.set_title('e)                                        ', fontsize=13)
ax7.set_title('f)                                        ', fontsize=13)

ax9.set_title('g)                                        ', fontsize=13)
ax10.set_title('h)                                        ', fontsize=13)
ax11.set_title('i)                                        ', fontsize=13)

ax1.set_ylabel('Global \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]',
                fontsize=12)
ax5.set_ylabel('Tropical \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]',
                fontsize=12)
ax9.set_ylabel('Australia \n \n $\Delta$ GPP [PgC $\mathrm{yr^{-1}}$]',
                fontsize=12)

for axes in (ax1,ax2,ax3,ax5,ax6,ax7):
    axes.set_xticklabels('')
else:
    pass

for axes in (ax2,ax3,ax6,ax7,ax10,ax11):
    axes.set_yticklabels('')
else:
    pass
for axes in (ax2,ax6,ax10):
    axes.set_ylabel('$\Delta$ TER [PgC $\mathrm{yr^{-1}}$]', fontsize=12)
for axes in (ax3,ax7,ax11):
    axes.set_ylabel('$\Delta$ Fire [PgC $\mathrm{yr^{-1}}$]', fontsize=12)

# plt.savefig('carbon_flux_anomalies_wo_nbp_cru.pdf')
plt.savefig('Fig3.pdf')
