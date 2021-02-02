import matplotlib.pylab as plt
import pandas as pd
import netCDF4 as nc
import numpy as np
import matplotlib.ticker as ticker

def plot(forcing, axis, region, var, experiment, c):

    if forcing == 'GSWP3':
        pathway='../global_GSWP3_noleap'

        EXP = nc.Dataset(pathway+'_only_'+experiment+
                         '_anomaly/cpool_LPJ-GUESS_1901-2010_annual_'+
                         region+'.nc')

        CTRL = nc.Dataset(pathway+'/cpool_LPJ-GUESS_1901-2010_annual_'+
                          region+'.nc')

        time = np.arange(1901,2011)

    elif forcing == 'CRUNCEP anomaly':
        pathway='../global_CRUNCEP'

        EXP = nc.Dataset(pathway+'_only_'+experiment+
                         '_anomaly/cpool_LPJ-GUESS_1901-2015_annual_'+
                         region+'.nc')

        CTRL = nc.Dataset(pathway+'/cpool_LPJ-GUESS_1901-2015_annual_'+
                          region+'.nc')

        time = np.arange(1901,2016)

    elif forcing == 'CRUNCEP nearest year':
        pathway='../global_CRUNCEP'

        EXP = nc.Dataset(pathway+'_only_'+experiment+
                         '_nearest_year/cpool_LPJ-GUESS_1901-2015_annual_'+
                         region+'.nc')

        CTRL = nc.Dataset(pathway+'/cpool_LPJ-GUESS_1901-2015_annual_'+
                          region+'.nc')

        time = np.arange(1901,2016)

    else:
        pass

    df_exp = pd.DataFrame(EXP.variables[var][:,0,0], columns=[var])
    df_ctrl = pd.DataFrame(CTRL.variables[var][:,0,0], columns=[var])

    df_exp_anomaly_ctrl = df_exp-df_ctrl

    if forcing == 'GSWP3':
        axis.plot(time, df_exp_anomaly_ctrl[var], lw=2.5, ls="-", color = c,
                  label = var)
    else:
        axis.plot(time, df_exp_anomaly_ctrl[var], lw=2.5, ls="-",  color = c,
                  label = var)
    axis.set_xlim(1966,2013)
    axis.set_ylim(-3, 20)
    axis.axhline(linewidth=1, color='k', alpha = 0.5)

    # print(region)
    # print(var)
    # print(experiment)
    # print(df_exp_anomaly_ctrl[var][112])
    plt.xticks(fontsize=11)
    plt.yticks(fontsize=11)
    # print(experiment+var)
    # print(df_exp_anomaly_ctrl[var][112])

#-- call  function and plot data

params = ['Total', 'VegC', 'LitterC', 'SoilC']

title = ['$\Delta$ TotalC [PgC]',
         '$\Delta$ VegC [PgC]',
         '$\Delta$ LitterC [PgC]',
         '$\Delta$ SoilC [PgC]']

figure_number = [1,2,3]
# figure_title = ['carbon_pool_anomalies.pdf', 
#                 'carbon_pool_anomalies_nearest_year.pdf', 
#                 'carbon_pool_anomalies_gswp3.pdf']
figure_title_submission = ['Fig4.pdf', 'FigB7.pdf', 'FigB9.pdf']
experiment = ['CRUNCEP anomaly', 'CRUNCEP nearest year', 'GSWP3']

for fn, ft, e in zip(figure_number, figure_title_submission, experiment):
    fig = plt.figure(fn,figsize=(10,5))
    fig.subplots_adjust(hspace=0.25)
    fig.subplots_adjust(wspace=0.10)
    fig.subplots_adjust(top=0.85)
    fig.subplots_adjust(bottom=0.05)
    fig.subplots_adjust(right=0.99)
    fig.subplots_adjust(left=0.11)

    plt.rcParams['axes.labelsize'] = 11
    plt.rcParams['font.size'] = 11
    plt.rcParams['legend.fontsize'] = 11
    plt.rcParams['xtick.labelsize'] = 11
    plt.rcParams['ytick.labelsize'] = 11

    ax1 = fig.add_subplot(2,3,1)
    ax2 = fig.add_subplot(2,3,2)
    ax3 = fig.add_subplot(2,3,3)
    ax4 = fig.add_subplot(2,3,4)
    ax5 = fig.add_subplot(2,3,5)
    ax6 = fig.add_subplot(2,3,6)

    axes_cp = (ax1, ax2, ax3)
    axes_ep = (ax4, ax5, ax6)
    regions = ('global', 'tropical', 'australia')

    for a, r in zip(axes_cp, regions):
        plot(e, a, r, 'Total', 'CP', 'tab:blue')
        plot(e, a, r, 'VegC', 'CP', 'tab:green')
        plot(e, a, r, 'LitterC', 'CP', 'tab:orange')
        plot(e, a, r, 'SoilC', 'CP', 'tab:red')

    for a, r in zip(axes_ep, regions):
        plot(e, a, r, 'Total', 'EP', 'tab:blue')
        plot(e, a, r, 'VegC', 'EP', 'tab:green')
        plot(e, a, r, 'LitterC', 'EP', 'tab:orange')
        plot(e, a, r, 'SoilC', 'EP', 'tab:red')

    ax1.legend(loc='upper center', bbox_to_anchor=(1.7, 1.45), ncol=4,
               fancybox=True)

    ax1.set_title('a)                Global                ')
    ax2.set_title('b)               Tropical               ')
    ax3.set_title('c)               Australia              ')
    ax4.set_title('d)                                          ')
    ax5.set_title('e)                                          ')
    ax6.set_title('f)                                          ')

    for axes in (ax1,ax2,ax3):
        axes.set_xticklabels('')
    else:
        axes.tick_params(labelsize='medium')

    ax1.set_ylabel('CP-only-scenario \n \n $\Delta$ C [PgC]')
    ax2.set_yticklabels('')
    ax3.set_yticklabels('')
    ax4.set_ylabel('EP-only-scenario \n \n $\Delta$ C [PgC]')
    ax5.set_yticklabels('')
    ax6.set_yticklabels('')

    # plt.show()
    plt.savefig(ft)
