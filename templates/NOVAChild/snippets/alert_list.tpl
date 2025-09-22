{block name='snippets-alert-list'}
    {if count($alertList->getAlertlist()) > 0}
        <div id="alert-list" class="{if $container|default:true}container {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}{/if}">
            {foreach $alertList->getAlertlist() as $alert}
                {if $alert->getShowInAlertListTemplate()}
                    {* Carto [ch]: Remove alerts: newsletterAdd and optinSucceededMailSent *}
                    {if $alert->getKey() === "newsletterAdd" || $alert->getKey() === "optinSucceededMailSent"}
                        {* Do nothing *}
                    {else}
                        {$alert->display()}
                    {/if}
                {/if}
            {/foreach}
        </div>
    {/if}
{/block}
