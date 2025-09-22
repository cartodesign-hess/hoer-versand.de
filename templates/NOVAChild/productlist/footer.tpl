{extends file="{$parent_template_path}/productlist/footer.tpl"}

{* Carto: Add desc at bottom *}
{block name='productlist-footer' append}
    {if $Einstellungen.navigationsfilter.kategorie_beschreibung_anzeigen === 'Y'
    && $oNavigationsinfo->getCategory() !== null
    && $oNavigationsinfo->getCategory()->cBeschreibung|strlen > 0}
        {block name='productlist-header-description-category'}
            <div class="desc">
                <p>{$oNavigationsinfo->getCategory()->cBeschreibung}</p>
            </div>
        {/block}
    {/if}
    {if $Einstellungen.navigationsfilter.hersteller_beschreibung_anzeigen === 'Y'
    && $oNavigationsinfo->getManufacturer() !== null
    && $oNavigationsinfo->getManufacturer()->cBeschreibung|strlen > 0}
        {block name='productlist-header-description-manufacturers'}
            <div class="desc">
                <p>{$oNavigationsinfo->getManufacturer()->cBeschreibung}</p>
            </div>
        {/block}
    {/if}
    {if $Einstellungen.navigationsfilter.merkmalwert_beschreibung_anzeigen === 'Y'
    && $oNavigationsinfo->getCharacteristicValue() !== null
    && $oNavigationsinfo->getCharacteristicValue()->cBeschreibung|strlen > 0}
        {block name='productlist-header-description-attributes'}
            <div class="desc">
                <p>{$oNavigationsinfo->getCharacteristicValue()->cBeschreibung}</p>
            </div>
        {/block}
    {/if}
{/block}