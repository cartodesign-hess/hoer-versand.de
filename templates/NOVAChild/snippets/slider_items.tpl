{extends file="{$parent_template_path}/snippets/slider_items.tpl"}

{block name='snippets-slider-items-product'}{* Carto: Remove class 'text-center-util' *}
    <div class="product-wrapper product-wrapper-product {*if $item@first && $item@last} m-auto{elseif $item@first} ml-auto-util {elseif $item@last} mr-auto {/if*}{if isset($style)} {$style}{/if}" {if $tplscope !== 'box'}{if isset($Link) && $Link->getLinkType() === $smarty.const.LINKTYP_STARTSEITE || $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE}itemprop="about"{else}itemprop="isRelatedTo"{/if} itemscope itemtype="https://schema.org/Product"{/if}>
        {include file='productlist/item_slider.tpl' Artikel=$item tplscope=$tplscope}
    </div>
{/block}