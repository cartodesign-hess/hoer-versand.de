{block name='snippets-linkgroup-list'}
    {if isset($linkgroupIdentifier)}
    {strip}
        {assign var=checkLinkParents value=false}
        {assign var=activeId value=0}
        {if isset($Link) && $Link->getID() > 0}
            {assign var=activeId value=$Link->getID()}
        {elseif JTL\Shop::$kLink > 0}
            {assign var=activeId value=JTL\Shop::$kLink}
            {assign var=Link value=JTL\Shop::Container()->getLinkService()->getLinkByID($activeId)}
        {/if}
        {if !isset($activeParents) && $activeId > 0}
            {assign var=activeParents value=JTL\Shop::Container()->getLinkService()->getParentIDs($activeId)}
            {assign var=checkLinkParents value=true}
        {/if}
        {get_navigation linkgroupIdentifier=$linkgroupIdentifier assign='links'}
        {if !empty($links)}
            {block name='snippets-linkgroup-list-links'}
                {foreach $links as $li}
                    {if $li->getChildLinks()->count() > 0 && isset($dropdownSupport)}
                        {block name='snippets-linkgroup-list-links-dropdown'}
                            {* first level *}
                            <li class="link-group-item nav-item dropdown {if $activeId === $li->getId()} active{/if}">
                                {link href=$li->getURL() title=$li->getName() class="nav-link dropdown-toggle" target=$li->getTarget()}
                                    <span class="nav-mobile-heading">{$li->getName()}</span>
                                {/link}
                                <ul class="dropdown-menu">

                                                {foreach $li->getChildLinks() as $subli}
                                                        {block name='snippets-linkgroup-list-links-sublinks-include-linkgroups-recursive'}
                                                            {include file='snippets/linkgroup_recursive_nested.tpl'
                                                                linkgroupIdentifier='mega'
                                                                limit=100
                                                                tplscope='megamenu'
                                                                links=$subli->getChildLinks()
                                                                layout='megamenu'
                                                                firstChild=true
                                                                mainLink=$subli
                                                                subCategory=1}
                                                        {/block}
                                                {/foreach}


                                </ul>
                            </li>
                        {/block}
                    {else}
                        {block name='snippets-linkgroup-list-links-navitem'}
                            {navitem href=$li->getURL()
                                nofollow=$li->getNoFollow()
                                class="nav-scrollbar-item {if $activeId === $li->getId()}active{/if}"
                                router-class="{if $tplscope=='sitemap'}nice-deco{/if}"
                                target=$li->getTarget()}
                                {$li->getName()}
                            {/navitem}
                        {/block}
                    {/if}
                {/foreach}
            {/block}
        {/if}
    {/strip}
    {/if}
{/block}
