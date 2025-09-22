{extends file="{$parent_template_path}/productdetails/pushed_success.tpl"}

{block name='productdetails-pushed-success-cart-note-heading'}{/block}{* Carto: remove header *}

{block name='productdetails-pushed-success-product-cell-links'}
    {row class="pushed-success-buttons"}
    {col cols=12}{* Carto: remove 'md=6' *}
    {link href=$pushedArtikel->cURLFull
    class="btn btn-outline-primary btn-block continue-shopping"
    data=["dismiss"=>"{if !$card}modal{else}alert{/if}"]
    aria=["label"=>"Close"]}
        <i class="fa fa-arrow-circle-right"></i> {lang key='continueShopping' section='checkout'}
    {/link}
    {/col}
    {col cols=12}{* Carto: remove 'md=6' *}
    {link href="{get_static_route id='warenkorb.php'}"
    class="btn btn-primary btn-basket btn-block"}
        <i class="fas fa-shopping-cart"></i> {lang key='gotoBasket'}
    {/link}
    {/col}
    {/row}
{/block}

{block name='productdetails-pushed-success-include-product-slider'}{* Carto: Set slider type to 'box' *}
    {include file='snippets/product_slider.tpl' id='' productlist=$Xselling->Kauf->Artikel title='' tplscope='box'}
{/block}


{block name='productdetails-pushed-success-product-cell-content'}
    <div class="productbox-inner{if isset($class)} {$class}{/if}">
        {row}
        {col cols=12}
        {block name='productdetails-pushed-success-product-cell-subheading'}
            <div class="productbox-title subheadline">{$pushedArtikel->cName}</div>
        {/block}
        {/col}
        {col cols=12 class="pushed-success-image-wrapper"}{* Carto: remove 'md=4' *}
        {block name='productdetails-pushed-success-product-cell-image'}
            {include file='snippets/image.tpl'
            item=$pushedArtikel
            square=false
            class='image'
            srcSize='sm'}
        {/block}
        {/col}
        {col}
        {* Carto: Remove details *}
        {block name='productdetails-pushed-success-product-cell-details'}{/block}
        {/col}
        {/row}
    </div>
{/block}