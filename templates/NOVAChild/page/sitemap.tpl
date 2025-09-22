{block name='page-sitemap'}
    {if $Einstellungen.sitemap.sitemap_seiten_anzeigen === 'Y'}
        {block name='page-sitemap-pages'}
            {opcMountPoint id='opc_before_pages' inContainer=false}
            {container fluid=$Link->getIsFluid() class="sitemap-wrapper-linkgroup {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {card header={lang key='sitemapSites'} class="sitemap-group"}
            {block name='page-sitemap-pages-content'}
                {row}
                    <ul class="list-unstyled sitemap-list">
                        {foreach $linkgroups as $linkgroup}
                            {if !empty($linkgroup->getName()) && $linkgroup->getName() !== 'hidden' && !empty($linkgroup->getLinks())}
                                {block name='page-sitemap-include-linkgroup-list'}
                                    {include file='snippets/linkgroup_list.tpl' linkgroupIdentifier=$linkgroup->getTemplate() tplscope='sitemap'}
                                {/block}
                            {/if}
                        {/foreach}
                    </ul>
                {/row}
            {/block}
            {/card}
            {/container}
        {/block}
    {/if}
    {if $Einstellungen.sitemap.sitemap_kategorien_anzeigen === 'Y' && isset($oKategorieliste->elemente) && $oKategorieliste->elemente|@count > 0}
        {block name='page-sitemap-categories'}
            {opcMountPoint id='opc_before_categories' inContainer=false}
            {container fluid=$Link->getIsFluid() class="sitemap-wrapper-categories {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {card header={lang key='sitemapKats'} class="sitemap-group"}
            {block name='page-sitemap-categories-content'}
                {row}
                    <ul class="list-unstyled sitemap-list">
                        {foreach $oKategorieliste->elemente as $oKategorie}
                            {if $oKategorie->getChildren()|@count > 0}
                                <li>
                                    {link href=$oKategorie->getURL() title=$oKategorie->getName()|escape:'html' class="nice-deco"}
                                    {$oKategorie->getShortName()}
                                    {/link}
                                </li>
                                {foreach $oKategorie->getChildren() as $oSubKategorie}
                                    <li>
                                        {link href=$oSubKategorie->getURL() title=$oKategorie->getName()|escape:'html' class="nice-deco"}
                                        {$oSubKategorie->getShortName()}
                                        {/link}
                                    </li>
                                    {if $oSubKategorie->getChildren()|@count > 0}
                                        <li>
                                        {foreach $oSubKategorie->getChildren() as $oSubSubKategorie}
                                            <li>
                                                {link href=$oSubSubKategorie->getURL()
                                                title=$oKategorie->getName()|escape:'html' class="nice-deco"}
                                                {$oSubKategorie->getShortName()} / {$oSubSubKategorie->getShortName()}
                                                {/link}
                                            </li>
                                        {/foreach}
                                        </li>
                                    {/if}
                                {/foreach}
                            {/if}
                        {/foreach}

                        {foreach $oKategorieliste->elemente as $oKategorie}
                            {if $oKategorie->getChildren()|@count == 0}
                                <li>
                                    {link href=$oKategorie->getURL() title=$oKategorie->getName()|escape:'html' class="nice-deco"}
                                    {$oKategorie->getShortName()}
                                    {/link}
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/row}
            {/block}
            {/card}
            {/container}
        {/block}
    {/if}
    {if $Einstellungen.sitemap.sitemap_hersteller_anzeigen === 'Y' && $oHersteller_arr|@count > 0}
        {block name='page-sitemap-manufacturer'}
            {opcMountPoint id='opc_before_manufacturers' inContainer=false}
            {container fluid=$Link->getIsFluid() class="sitemap-wrapper-manufacturer {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {card header={lang key='sitemapNanufacturer'} class="sitemap-group"}
            {block name='page-sitemap-manufacturer-content'}
                {row}
                    <ul class="list-unstyled sitemap-list">
                        {foreach $oHersteller_arr as $oHersteller}
                            <li>{link href=$oHersteller->cURL  class="nice-deco"}{$oHersteller->cName}{/link}</li>
                        {/foreach}
                    </ul>
                {/row}
            {/block}
            {/card}
            {/container}
        {/block}
    {/if}
    {if $Einstellungen.news.news_benutzen === 'Y' && $Einstellungen.sitemap.sitemap_news_anzeigen === 'Y' && !empty($oNewsMonatsUebersicht_arr) && $oNewsMonatsUebersicht_arr|@count > 0}
        {block name='page-sitemap-news'}
            {opcMountPoint id='opc_before_news' inContainer=false}
            {container fluid=$Link->getIsFluid() class="sitemap-wrapper-news {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {card header={lang key='sitemapNews'} class="sitemap-group"}
            {block name='page-sitemap-news-content'}
                {row}
                {foreach $oNewsMonatsUebersicht_arr as $oNewsMonatsUebersicht}
                    {if $oNewsMonatsUebersicht->oNews_arr|@count > 0}
                        {math equation='x-y' x=$oNewsMonatsUebersicht@iteration y=1 assign='i'}
                        {*col cols=12 md=4 lg=3*}
                            <strong>{link href=$oNewsMonatsUebersicht->cURLFull class="nice-deco"}{$oNewsMonatsUebersicht->cName}{/link}</strong>
                            <ul class="list-unstyled sitemap-list">
                                {foreach $oNewsMonatsUebersicht->oNews_arr as $oNews}
                                    <li>{link href=$oNews->cURLFull class="nice-deco"}{$oNews->cBetreff}{/link}</li>
                                {/foreach}
                            </ul>
                        {*/col*}
                    {/if}
                {/foreach}
                {/row}
            {/block}
            {/card}
            {/container}
        {/block}
    {/if}
    {if $Einstellungen.news.news_benutzen === 'Y'
    && $Einstellungen.sitemap.sitemap_newskategorien_anzeigen === 'Y'
    && !empty($oNewsKategorie_arr)
    && $oNewsKategorie_arr|@count > 0
    }
        {block name='page-sitemap-news-categories'}
            {opcMountPoint id='opc_before_news_categories' inContainer=false}
            {container fluid=$Link->getIsFluid() class="sitemap-wrapper-news-categories {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {card header={lang key='sitemapNewsCats'} class="sitemap-group"}
            {block name='page-sitemap-news-categories-content'}
                {row}
                {foreach $oNewsKategorie_arr as $oNewsKategorie}
                    {if $oNewsKategorie->oNews_arr|@count > 0}
                        {*col cols=12 md=4 lg=3*}
                            <strong>{link href=$oNewsKategorie->cURLFull}{$oNewsKategorie->cName}{/link}</strong>
                            <ul class="list-unstyled sitemap-list">
                                {foreach $oNewsKategorie->oNews_arr as $oNews}
                                    <li>
                                        {link href=$oNews->cURLFull class="nice-deco"}{$oNews->cBetreff}{/link}
                                    </li>
                                {/foreach}
                            </ul>
                        {*/col*}
                    {/if}
                {/foreach}
                {/row}
            {/block}
            {/card}
            {/container}
        {/block}
    {/if}
{/block}
