{block name='productlist-item-delivery-status'}
    <div class="item-delivery-status delivery-status">
        {$anzeige = $Einstellungen.artikeluebersicht.artikeluebersicht_lagerbestandsanzeige}
        {if $Artikel->inWarenkorbLegbar === $smarty.const.INWKNICHTLEGBAR_UNVERKAEUFLICH}
            <span class="status">{lang key='productUnsaleable' section='productDetails'}</span>
        {elseif $Artikel->nErscheinendesProdukt}
            <div class="availablefrom">
                {lang key='productAvailableFrom'}: {$Artikel->Erscheinungsdatum_de}
            </div>
            {if $Einstellungen.global.global_erscheinende_kaeuflich === 'Y' && $Artikel->inWarenkorbLegbar === 1}
                <div class="attr attr-preorder"><span class="value">{lang key='preorderPossible'}</span></div>
            {/if}
        {elseif $anzeige !== 'nichts'
        && $Einstellungen.artikeluebersicht.artikeluebersicht_lagerbestandanzeige_anzeigen !== 'N'
        && $Artikel->getBackorderString() !== ''
        && ($Artikel->cLagerKleinerNull === 'N'
        || $Einstellungen.artikeluebersicht.artikeluebersicht_lagerbestandanzeige_anzeigen === 'U')}
            <div class="signal_image status-1">{$Artikel->getBackorderString()}</div>
        {elseif $anzeige !== 'nichts'
        && $Einstellungen.artikeluebersicht.artikeluebersicht_lagerbestandanzeige_anzeigen !== 'N'
        && $Artikel->cLagerBeachten === 'Y'
        && $Artikel->fLagerbestand <= 0
        && $Artikel->fLieferantenlagerbestand > 0
        && $Artikel->fLieferzeit > 0
        && ($Artikel->cLagerKleinerNull === 'N'
        || $Einstellungen.artikeluebersicht.artikeluebersicht_lagerbestandanzeige_anzeigen === 'U')}
            <div class="signal_image status-1">{lang key='supplierStockNotice' printf=$Artikel->fLieferzeit}</div>
        {elseif $anzeige === 'verfuegbarkeit' || $anzeige === 'genau'}
            <div class="signal_image status-{$Artikel->Lageranzeige->nStatus}">{$Artikel->Lageranzeige->cLagerhinweis[$anzeige]}</div>
        {elseif $anzeige === 'ampel'}
            <div class="signal_image status-{$Artikel->Lageranzeige->nStatus}">{$Artikel->Lageranzeige->AmpelText}</div>
        {/if}
        {if $Artikel->cEstimatedDelivery}
            <div class="estimated_delivery">
                {lang key='shippingTime'}: {$Artikel->cEstimatedDelivery}
            </div>
        {/if}
    </div>
{/block}
