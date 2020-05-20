import matplotlib.pylab as plt
import pandas as pd
import netCDF4 as nc
import numpy as np
from matplotlib.lines import Line2D
from pylab import text
from scipy.stats import pearsonr
import statsmodels.api as sm

folderIN = '/srv/ccrc/data02/z5227845/research/lpj_guess/runs/CP_EP_comp_TRENDY/'
def plot(axis, model, var, region, experiment):

    TRENDY = nc.Dataset(folderIN+'TRENDY/'+var+'/ensmean_'+var+experiment+
                        region+'.nc')
    CLM = nc.Dataset(folderIN+'TRENDY/'+var+'/CLM4.5_ensmean_'+var+experiment+
                     region+'.nc')
    JSBACH = nc.Dataset(folderIN+'TRENDY/'+var+'/JSBACH_ensmean_'+var+experiment+
                        region+'.nc')
    JULES = nc.Dataset(folderIN+'TRENDY/'+var+'/JULES_ensmean_'+var+experiment+
                       region+'.nc')
    LPX = nc.Dataset(folderIN+'TRENDY/'+var+'/LPX_ensmean_'+var+experiment+
                     region+'.nc')
    ORCHIDEE = nc.Dataset(folderIN+'TRENDY/'+var+'/ORCHIDEE_ensmean_'+var+
                          experiment+region+'.nc')
    VEGAS = nc.Dataset(folderIN+'TRENDY/'+var+'/VEGAS_ensmean_'+var+experiment+
                       region+'.nc')
    VISIT = nc.Dataset(folderIN+'TRENDY/'+var+'/VISIT_ensmean_'+var+experiment+
                       region+'.nc')

    LPJ_GUESS = nc.Dataset(folderIN+'LPJ-GUESS/'+var+'/ensmean_'+var+
                           experiment+region+'.nc')

    df = pd.DataFrame(TRENDY.variables[var][:,0,0],columns=[var])
    df_lpj = pd.DataFrame(LPJ_GUESS.variables[var][:,0,0],columns=[var])

    spread = pd.DataFrame(CLM.variables[var][:,0,0],columns=['clm'])
    spread['jsbach'] = JSBACH.variables[var][:,0,0]
    spread['jules'] = JULES.variables[var][:,0,0]
    spread['lpx'] = LPX.variables[var][:,0,0]
    spread['orchidee'] = ORCHIDEE.variables[var][:,0,0]
    spread['vegas'] = VEGAS.variables[var][:,0,0]
    spread['visit'] = VISIT.variables[var][:,0,0]

    spread['max'] = spread.max(axis=1)
    spread['min'] = spread.min(axis=1)

    month = np.arange(1,25)

    if var == 'gpp':
        axis.plot(month,df[var],lw=2.0, ls=":", label = 'TRENDY',
                  alpha = 1, color ='#2ca02c')

        axis.plot(month,df_lpj[var],lw=2.0, ls="-", label = 'LPJ-GUESS',
                  alpha = 1, color = '#2ca02c')

        axis.fill_between(month,spread['min'], spread['max'],
                          color = '#2ca02c', alpha = 0.15)
    else:
        axis.plot(month,df[var],lw=2.0, ls=":", label = 'TRENDY',
                  alpha = 1, color = '#d62728')

        axis.plot(month,df_lpj[var],lw=2.0, ls="-", label = 'LPJ-GUESS',
                  alpha = 1, color = '#d62728')

        axis.fill_between(month,spread['min'], spread['max'],
                          color = '#d62728', alpha = 0.15)

    axis.axhline(linewidth=2, color='k', alpha = 0.5)
    axis.axvline(x=13,linewidth=2, color='k', alpha = 0.5)

    a = np.arange(25)
    axis.set_xticks((a))
    axis.set_xticklabels(('','1', '', '3','',  '5','', '7', '','9', '', '11',
                          '', '1','', '3', '','5', '','7','', '9','', '11',''))

    if region == 'global':
    #    axis.set_ylim(-0.4,0.26)
        axis.set_ylim(-0.56,0.56)
    elif region == 'tropical':
        axis.set_ylim(-0.35, 0.45)
    elif region == 'australia':
        axis.set_ylim(-0.15,0.18)

    Y = df_lpj[var].iloc[:].values.reshape(-1, 1)
    X = df[var].iloc[:].values.reshape(-1, 1)
    results = sm.OLS(Y, X).fit()
    print(results.rsquared)
    corr, p_value = pearsonr(X.flatten(), Y.flatten())
    text(0.8, 0.05,'$\mathrm{R^2}$ = '+str("%.2f" % results.rsquared),
         ha='center', va='center',
         transform=axis.transAxes)
    text(0.82, 0.15,'$\mathrm{\\rho}$ = '+str("%.2f" % corr), ha='center',
         va='center', transform=axis.transAxes)

fig = plt.figure(figsize=(12.0,8.2))

fig.subplots_adjust(hspace=0.25)
fig.subplots_adjust(wspace=0.50)
fig.subplots_adjust(right=0.98)
fig.subplots_adjust(left=0.11)
fig.subplots_adjust(bottom=0.15)
fig.subplots_adjust(top=0.93)

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

plot(ax1,'ensmean', 'gpp', 'global', '_CP_anomaly_')
plot(ax2,'ensmean', 'ter', 'global', '_CP_anomaly_')
plot(ax3,'ensmean', 'gpp', 'global', '_EP_anomaly_')
plot(ax4,'ensmean', 'ter', 'global', '_EP_anomaly_')
plot(ax5,'ensmean', 'gpp', 'tropical', '_CP_anomaly_')
plot(ax6,'ensmean', 'ter', 'tropical', '_CP_anomaly_')
plot(ax7,'ensmean', 'gpp', 'tropical', '_EP_anomaly_')
plot(ax8,'ensmean', 'ter', 'tropical', '_EP_anomaly_')
plot(ax9,'ensmean', 'gpp', 'australia', '_CP_anomaly_')
plot(ax10,'ensmean', 'ter', 'australia', '_CP_anomaly_')
plot(ax11,'ensmean', 'gpp', 'australia', '_EP_anomaly_')
plot(ax12,'ensmean', 'ter', 'australia', '_EP_anomaly_')

legend_elements = [Line2D([0], [0], color='k', lw=2.0, ls=":",
                   label = 'TRENDY'),
                   Line2D([0], [0], color='k', lw=2.0, ls="-",
                   label = 'LPJ-GUESS')]

ax1.legend(handles=legend_elements, loc='upper center',
           bbox_to_anchor=(2.65, -2.85), ncol=2, fancybox=True)

plt.text(-85.0, 10.0, 'CP anomaly', fontsize=14)
plt.text(-13.0, 10.0, 'EP anomaly', fontsize=14)

plt.text(-103.0, -2.8, 'y0', fontsize=12)
plt.text(-91.0, -2.8, 'y1', fontsize=12)

plt.text(-67.0, -2.8, 'y0', fontsize=12)
plt.text(-55.0, -2.8, 'y1', fontsize=12)

plt.text(-31.0, -2.8, 'y0', fontsize=12)
plt.text(-19.0, -2.8, 'y1', fontsize=12)

plt.text(5, -2.8, 'y0', fontsize=12)
plt.text(17.0, -2.8, 'y1', fontsize=12)

ax1.set_ylabel('Global \n \n GPP anomaly [PgC $\mathrm{mth^{-1}}$]',
                fontsize=12)
ax5.set_ylabel('Tropical \n \n GPP anomaly [PgC $\mathrm{mth^{-1}}$]',
                fontsize=12)
ax9.set_ylabel('Australia \n \n GPP anomaly [PgC $\mathrm{mth^{-1}}$]',
                fontsize=12)

for axes in (ax3,ax7,ax11):
    axes.set_ylabel('GPP anomaly [PgC $\mathrm{mth^{-1}}$]', fontsize=12)
for axes in (ax2,ax4,ax6,ax8,ax10,ax12):
    axes.set_ylabel('TER anomaly [PgC $\mathrm{mth^{-1}}$]', fontsize=12)

#plt.subplot_tool()
plt.show()
#plt.savefig('trendy_lpj_guess_comparison.pdf')
