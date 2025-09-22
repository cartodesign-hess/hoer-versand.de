{extends file="{$parent_template_path}/snippets/product_slider.tpl"}

{block name='snippets-product-slider-other-title'}
    {* Carto: Remove class 'container' + div around *}
    <div class="h2">{* Carto: Remove class 'hr-sect' *}
        {if !empty($moreLink)}
            {link class="text-decoration-none-util" href=$moreLink title=$moreTitle data-toggle="tooltip" data=["placement"=>"auto right"] aria=["label"=>$moreTitle]}
            {$title}
            {/link}
        {else}
            {$title}
        {/if}
    </div>
{/block}