{block name='layout-header-nav-icons'}
    {navitem class='d-lg-none'}
        <button id="burger-menu" class="burger-menu-wrapper navbar-toggler collapsed {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}d-none{/if}" type="button" data-toggle="collapse" data-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="label">
            Navigation
        </div>
    {/navitem}
    {block name='layout-header-nav-icons-include-header-nav-search'}
        {include file='layout/header_nav_search.tpl'}
    {/block}
    {block name='layout-header-nav-icons-include-header-shop-nav-account'}
        {include file='layout/header_shop_nav_account.tpl'}
    {/block}
    {if !($isMobile)}
        {if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
            {block name='layout-header-nav-icons-include-header-shop-nav-compare'}
                {include file='layout/header_shop_nav_compare.tpl'}
            {/block}
        {/if}
        {block name='layout-header-nav-icons-include-header-shop-nav-wish'}
            {include file='layout/header_shop_nav_wish.tpl'}
        {/block}
    {/if}
    {block name='layout-header-nav-icons-include-cart-dropdown-label'}
        {include file='basket/cart_dropdown_label.tpl'}
    {/block}
{/block}
