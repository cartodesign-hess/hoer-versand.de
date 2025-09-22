{extends file="{$parent_template_path}/productdetails/basket.tpl"}

{* Carto [ch]: Add third party buttons *}
{block name='productdetails-basket-add-to-cart' append}
    {col cols=12}
        <div id="third-party-payment-buttons-detail" class="d-flex justify-content-between mt-3">
            <div class="paypal"></div>
            <div class="amazon"></div>
        </div>
    {/col}
{/block}