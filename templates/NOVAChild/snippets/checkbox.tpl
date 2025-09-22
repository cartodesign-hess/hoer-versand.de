{block name='snippets-checkbox'}
    {if empty($cPost_arr)}
        {assign var=cPost_arr value=null}
    {/if}
    {if empty($cPost_arr)}
        {assign var=cPost_arr value=$smarty.post}
    {/if}

    {getCheckBoxForLocation nAnzeigeOrt=$nAnzeigeOrt cPlausi_arr=$cPlausi_arr cPost_arr=$cPost_arr assign='checkboxes'}
    {if !empty($checkboxes)}
        {block name='snippets-checkbox-checkboxes'}
            {foreach $checkboxes as $cb}

                {* Carto: Hide newsletter checkbox if nSeitenTyp is registration or checkout *}
                {if ($nSeitenTyp === 10 || $nSeitenTyp === 11) && $cb->cID === "CheckBox_21"}
                    {formgroup class="d-none snippets-checkbox-wrapper exclude-from-label-slide" label-for=" " description="{if !empty($cb->cBeschreibung)}{$cb->cBeschreibung}{/if}"}
                    {block name='snippets-checkbox-checkbox'}
                        {checkbox
                        id="{if isset($cIDPrefix)}{$cIDPrefix}_{/if}{$cb->cID}"
                        name={$cb->cID}
                        required=$cb->nPflicht === 1
                        checked=true
                        }
                        {block name='snippets-checkbox-checkbox-name'}
                            {$cb->cName}
                        {/block}
                        {if !empty($cb->cLinkURL)}
                            {block name='snippets-checkbox-checkbox-more-link'}
                                <span class='moreinfo'>
                                        ({link href=$cb->cLinkURL class='popup checkbox-popup'}{lang key='read' section='account data'}{/link})
                                    </span>
                            {/block}
                        {/if}
                        {if empty($cb->nPflicht)}
                            {block name='snippets-checkbox-checkbox-optional'}
                                <span class='optional'> - {lang key='optional'}</span>
                            {/block}
                        {/if}
                        {/checkbox}
                    {/block}
                    {/formgroup}
                    {* Carto: Add newsletter text *}
                    <div class="checkout-newsletter-text">{lang key="checkoutNewsletterText" section="custom"}</div>
                {else}
                    {formgroup class="snippets-checkbox-wrapper exclude-from-label-slide" label-for=" " description="{if !empty($cb->cBeschreibung)}{$cb->cBeschreibung}{/if}"}
                    {block name='snippets-checkbox-checkbox'}
                        {checkbox
                        id="{if isset($cIDPrefix)}{$cIDPrefix}_{/if}{$cb->cID}"
                        name={$cb->cID}
                        required=$cb->nPflicht === 1
                        checked=$cb->isActive
                        }
                        {block name='snippets-checkbox-checkbox-name'}
                            {$cb->cName}
                        {/block}
                        {if !empty($cb->cLinkURL)}
                            {block name='snippets-checkbox-checkbox-more-link'}
                                <span class='moreinfo'>
                                        ({link href=$cb->cLinkURL class='popup checkbox-popup'}{lang key='read' section='account data'}{/link})
                                    </span>
                            {/block}
                        {/if}
                        {if empty($cb->nPflicht)}
                            {block name='snippets-checkbox-checkbox-optional'}
                                <span class='optional'> - {lang key='optional'}</span>
                            {/block}
                        {/if}
                        {/checkbox}
                    {/block}
                    {/formgroup}
                {/if}



            {/foreach}
        {/block}
    {/if}
{/block}
