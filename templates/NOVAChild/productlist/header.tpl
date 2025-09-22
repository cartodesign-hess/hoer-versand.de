{extends file="{$parent_template_path}/productlist/header.tpl"}

{block name='productlist-header-description'}
    {$showTitle = true}
    {$showImage = true}
    {$navData = null}
    {if $oNavigationsinfo->getCategory() !== null}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['Y', 'BT'])}
        {$showImage = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['B', 'BT'])}
        {$navData = $oNavigationsinfo->getCategory()}
    {elseif $oNavigationsinfo->getManufacturer() !== null}
        {$showImage = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['B', 'BT'])}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['Y', 'BT'])}
        {$navData = $oNavigationsinfo->getManufacturer()}
    {elseif $oNavigationsinfo->getCharacteristicValue() !== null}
        {$showImage = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['B', 'BT'])}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['Y', 'BT'])}
        {$navData = $oNavigationsinfo->getCharacteristicValue()}
    {/if}

    {if $oNavigationsinfo->getImageURL() !== $smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
    && $oNavigationsinfo->getImageURL() !== 'gfx/keinBild_kl.gif'
    && $oNavigationsinfo->getImageURL() !== $imageBaseURL|cat:$smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
    && $showImage}
        {if $oNavigationsinfo->getManufacturer() !== null}
            <div class="manufacturer-header-wrapper">
        {/if}
        {include file='snippets/image.tpl'
        class='productlist-header-description-image'
        item=$navData
        square=false
        width="100px"
        alt="{if $oNavigationsinfo->getCategory() !== null && !empty($navData->getImageAlt())}{$navData->getImageAlt()}{else}{$navData->cBeschreibung|strip_tags|truncate:50}{/if}"}
    {/if}
    {if $oNavigationsinfo->getName() && $showTitle}
        <div class="title">
            {opcMountPoint id='opc_before_heading'}
            {block name='productlist-header-description-heading'}
                <h1 class="h2">{$oNavigationsinfo->getName()}</h1>
            {/block}
        </div>
        {if $oNavigationsinfo->getManufacturer() !== null}
            </div>
        {/if}
    {/if}

    {* Carto: Remove desc on top *}

{/block}