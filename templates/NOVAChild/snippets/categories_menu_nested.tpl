{navbarnav class="nested-menu"}

{strip}
    {if !isset($i)}
        {assign var=i value=0}
    {/if}
    {if !isset($activeId)}
        {if $NaviFilter->hasCategory()}
            {$activeId = $NaviFilter->getCategory()->getValue()}
        {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($Artikel)}
            {$activeId = $Artikel->gibKategorie()}
        {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($smarty.session.LetzteKategorie)}
            {$activeId = $smarty.session.LetzteKategorie}
        {else}
            {$activeId = 0}
        {/if}
    {/if}

    {if $Einstellungen.template.megamenu.show_categories !== 'N'
        && ($Einstellungen.global.global_sichtbarkeit != 3 || \JTL\Session\Frontend::getCustomer()->getID() > 0)}
        {get_category_array categoryId=0 assign='categories'}
        {if !empty($categories)}
            {if !isset($activeParents)
            && ($nSeitenTyp === $smarty.const.PAGE_ARTIKEL || $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE)}
                {get_category_parents categoryId=$activeId assign='activeParents'}
            {/if}

            {foreach $categories as $category}
                {if isset($activeParents) && is_array($activeParents) && isset($activeParents[$i])}
                    {assign var=activeParent value=$activeParents[$i]}
                {/if}
                {if $category->isOrphaned() === false}
                    {if $category->hasChildren()}
                        {* first level *}
                        <li class="nav-item dropdown
                            {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                            {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                            {if $category->getID() === $activeId
                            || ((isset($activeParent)
                            && isset($activeParent->kKategorie))
                            && $activeParent->kKategorie == $category->getID())} active{/if}">

                            {link href=$category->getURL() title=$category->getName()|escape:'html' class="nav-link dropdown-toggle" target="_self"}
                                <span class="nav-mobile-heading">{$category->getShortName()}</span>
                            {/link}

                            {if $category->hasChildren()}
                                <ul class="dropdown-menu">
                                    {* second level *}
                                    {if !empty($category->getChildren())}
                                        {assign var=sub_categories value=$category->getChildren()}
                                    {else}
                                        {get_category_array categoryId=$category->getID() assign='sub_categories'}
                                    {/if}
                                    {foreach $sub_categories as $sub}
                                        <li>
                                            {link href=$sub->getURL() class="dropdown-item"}
                                                {$sub->getShortName()}
                                                {if $sub->hasChildren()}
                                                    <span class="fa fa-chevron-right"></span>
                                                {/if}
                                            {/link}
                                            {* third level *}
                                            {if $sub->hasChildren()}
                                                <ul class="dropdown-menu dropdown-submenu">
                                                    {foreach $sub->getChildren() as $category}
                                                        {link href=$category->getURL() class="dropdown-item"}
                                                            {$category->getShortName()}
                                                        {/link}
                                                    {/foreach}
                                                </ul>
                                            {/if}
                                        </li>
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                        
                    {else}

                        {navitem href=$category->getURL() title=$category->getName()|escape:'html'
                        class="{if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                                    {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                                    {if $category->getID() === $activeId}active{/if}"}
                        <span class="text-truncate d-block">{$category->getShortName()}</span>
                        {/navitem}
                        
                    {/if}
                {/if}
            {/foreach}

            {if $Einstellungen.template.megamenu.show_pages !== 'N'}
                {block name='snippets-categories-mega-include-linkgroup-list'}
                    {include file='snippets/linkgroup_list_nested.tpl' linkgroupIdentifier='megamenu' dropdownSupport=true tplscope='megamenu'}
                {/block}
            {/if} {* /megamenu-pages*}

        {/if}
    {/if}
    {* /megamenu-categories*}



    {/strip}

{/navbarnav}