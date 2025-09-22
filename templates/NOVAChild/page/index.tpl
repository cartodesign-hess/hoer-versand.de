{extends file="{$parent_template_path}/page/index.tpl"}

{block name='page-index-additional-content'}
    {if isset($oNews_arr) && $oNews_arr|@count > 0}

        {opcMountPoint id='opc_before_news' inContainer=false}

        <div class="index-news-wrapper">
            {container fluid=true class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {block name='page-index-subheading-news'}
                <div class="blog-header">
                    <div class="h2">{* Carto: Remove class 'hr-sect' *}
                        {link href="{get_static_route id='news.php'}"}{lang key='news' section='news'}{/link}
                    </div>
                </div>
            {/block}
            {block name='page-index-news'}
                {row itemprop="about"
                itemscope=true
                itemtype="https://schema.org/Blog"
                class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy slick-type-news {if $oNews_arr|count < 3}slider-no-preview{/if}"
                data=["slick-type"=>"news-slider"]}
                    {include file='snippets/slider_items.tpl' items=$oNews_arr type='news'}
                {/row}
            {/block}
            {/container}
        </div>
    {/if}
{/block}

{block name='page-index-boxes'}

    {* Carto: Top offer *}
    {foreach $StartseiteBoxen as $Box}
        {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente) > 0 && isset($Box->cURL)}
            {if $Box->name === 'TopAngebot'}
                {lang key='topOffer' assign='title'}
                {block name='page-index-include-product-slider'}
                    {container class="product-slider-wrapper" fluid=true}
                        {include file='snippets/product_slider.tpl'
                        productlist=$Box->Artikel->elemente
                        title=$title
                        hideOverlays=true
                        titleContainer=true}
                    {/container}
                {/block}
            {/if}
        {/if}
    {/foreach}

    {opcMountPoint id='opc_between_boxes' inContainer=false}

    {* Carto: Bestseller *}
    {foreach $StartseiteBoxen as $Box}
        {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente) > 0 && isset($Box->cURL)}
            {if $Box->name === 'Bestseller'}
                {lang key='bestsellers' assign='title'}
                {block name='page-index-include-product-slider'}
                    {container class="product-slider-wrapper" fluid=true}
                        {include file='snippets/product_slider.tpl'
                        productlist=$Box->Artikel->elemente
                        title=$title
                        hideOverlays=true
                        titleContainer=true}
                    {/container}
                {/block}
            {/if}
        {/if}
    {/foreach}

    {* Carto: Special offers *}
    {foreach $StartseiteBoxen as $Box}
        {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente) > 0 && isset($Box->cURL)}
            {if $Box->name === 'Sonderangebote'}
                {lang key='specialOffer' assign='title'}
                {block name='page-index-include-product-slider'}
                    {container class="product-slider-wrapper" fluid=true}
                        {include file='snippets/product_slider.tpl'
                        productlist=$Box->Artikel->elemente
                        title=$title
                        hideOverlays=true
                        titleContainer=true}
                    {/container}
                {/block}
            {/if}
        {/if}
    {/foreach}

    {* Carto: New products *}
    {foreach $StartseiteBoxen as $Box}
        {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente) > 0 && isset($Box->cURL)}
            {if $Box->name === 'NeuImSortiment'}
                {lang key='newProducts' assign='title'}
                {block name='page-index-include-product-slider'}
                    {container class="product-slider-wrapper" fluid=true}
                        {include file='snippets/product_slider.tpl'
                        productlist=$Box->Artikel->elemente
                        title=$title
                        hideOverlays=true
                        titleContainer=true}
                    {/container}
                {/block}
            {/if}
        {/if}
    {/foreach}
{/block}