{block name='layout-header-nav-search'}
    {block name='layout-header-nav-search-search'}
    {/block}
    {block name='layout-header-nav-search-search-dropdown'}
        {if $Einstellungen.template.theme.mobile_search_type === 'dropdown'}{* Carto: Change icon *}
            {navitemdropdown class='search-wrapper-dropdown dropdown-full'
                text='<i id="mobile-search-dropdown" class="fa-light fa-magnifying-glass"></i><div class="label">Suche</div>'
                right=true
                no-caret=true
                router-aria=['label'=>{lang key='findProduct'}]}
                <div class="dropdown-body">
                    {container fluid=true}{* Carto: Add container *}
                        {include file='snippets/search_form.tpl' id='search-header-desktop'}
                    {/container}
                </div>
            {/navitemdropdown}
        {/if}
    {/block}
{/block}