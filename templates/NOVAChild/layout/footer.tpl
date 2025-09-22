{extends file="{$parent_template_path}/layout/footer.tpl"}

{block name='layout-footer-content'}
    {if !$bExclusive}
        {$newsletterActive = $Einstellungen.template.footer.newsletter_footer === 'Y'
        && $Einstellungen.newsletter.newsletter_active === 'Y'}
        {container fluid=true id="advantages" class="pt-5 pb-5"}
            {container}
                {row}
                    {col cols=12 md=4 class="mt-2 mb-2"}
                        <div class="d-flex align-items-center">{lang key="advantageDesc1" section="custom"}</div>
                    {/col}
                    {col cols=12 md=4 class="mt-2 mb-2"}
                        <div class="d-flex align-items-center justify-content-md-center">{lang key="advantageDesc2" section="custom"}</div>
                    {/col}
                    {col cols=12 md=4 class="mt-2 mb-2"}
                        <div class="d-flex align-items-center justify-content-md-end">{lang key="advantageDesc3" section="custom"}</div>
                    {/col}
                {/row}
            {/container}
        {/container}
        <footer id="footer" {if $newsletterActive}class="newsletter-active"{/if}>
            {container fluid=false class="d-print-none"}
            {if $newsletterActive}
                {block name='layout-footer-newsletter'}
                    {row class="newsletter-footer"}
                    {col cols=12 lg=6}
                    {block name='layout-footer-newsletter-heading'}
                        <div class="h2 newsletter-footer-heading">
                            {lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}
                        </div>
                    {/block}
                    {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ])}
                        {block name='layout-footer-newsletter-info'}
                            <p class="info">
                                {lang key='newsletterInformedConsent' section='newsletter' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ]->getURL()}
                            </p>
                        {/block}
                    {/if}
                    {/col}
                    {col cols=12 lg=6}
                    {block name='layout-footer-form'}
                        {form methopd="post" action="{get_static_route id='newsletter.php'}"}
                        {block name='layout-footer-form-content'}
                            {input type="hidden" name="abonnieren" value="2"}
                            {formgroup label-sr-only="{lang key='emailadress'}" class="newsletter-email-wrapper"}
                            {inputgroup}
                            {input type="email" name="cEmail" id="newsletter_email" placeholder="{lang key='emailadress'}" aria=['label' => {lang key='emailadress'}]}
                            {inputgroupaddon append=true}
                            {button type='submit' variant='primary' class='min-w-sm'}
                            {lang key='newsletterSendSubscribe' section='newsletter'}
                            {/button}
                            {/inputgroupaddon}
                            {/inputgroup}
                            {/formgroup}
                        {/block}
                        {block name='layout-footer-form-captcha'}
                            <div class="{if !empty($plausiArr.captcha) && $plausiArr.captcha === true} has-error{/if}">
                                {captchaMarkup getBody=true}
                            </div>
                        {/block}
                        {/form}
                    {/block}
                    {/col}
                    {/row}
                    <hr>
                {/block}
            {/if}
            {block name='layout-footer-boxes'}
                {getBoxesByPosition position='bottom' assign='footerBoxes'}
                {if isset($footerBoxes) && count($footerBoxes) > 0}
                    {row id='footer-boxes'}
                    {foreach $footerBoxes as $box}
                        {if $box->isActive() && !empty($box->getRenderedContent())}
                            {if $box@iteration <= 4}
                                {col cols=6 md=3 xl=2}
                                    {$box->getRenderedContent()}
                                {/col}
                            {elseif $box@iteration === 6}
                                {get_manufacturers assign='manufacturers'}
                                {if !empty($manufacturers)}
                                    {col cols=12}
                                        <hr class="mt-0">
                                        {row class="mb-5"}
                                        {foreach $manufacturers as $mft}
                                            {col cols=6 md=3 xl=2 class='mb-1'}
                                                {link href=$mft->cURLFull title=$mft->cSeo class='nav-link '}
                                                    {$mft->getName()}
                                                {/link}
                                            {/col}
                                        {/foreach}
                                        {/row}
                                    {/col}
                                {/if}
                                {col cols=12}
                                    {$box->getRenderedContent()}
                                {/col}
                            {else}
                                {col cols=12 xl=4}
                                    {$box->getRenderedContent()}
                                {/col}
                            {/if}
                        {/if}
                    {/foreach}
                    {/row}
                {/if}
            {/block}

            {block name='layout-footer-additional'}
                {if $Einstellungen.template.footer.socialmedia_footer === 'Y'}
                    {row class="footer-social-media"}
                    {block name='layout-footer-socialmedia'}
                        {col cols=12 class="footer-additional-wrapper col-auto mx-auto"}
                            <ul class="list-unstyled">
                                {if !empty($Einstellungen.template.footer.facebook)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.facebook|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.facebook}"
                                        class="btn-icon-secondary btn-facebook btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Facebook'}"] title="Facebook" target="_blank" rel="noopener"}
                                            <span class="fab fa-facebook-f fa-fw fa-lg"></span>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.twitter)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.twitter|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.twitter}"
                                        class="btn-icon-secondary btn-twitter btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Twitter'}"] title="Twitter" target="_blank" rel="noopener"}
                                            <i class="fab fa-twitter fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.youtube)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.youtube|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.youtube}"
                                        class="btn-icon-secondary btn-youtube btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='YouTube'}"] title="YouTube" target="_blank" rel="noopener"}
                                            <i class="fab fa-youtube fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.vimeo)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.vimeo|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.vimeo}"
                                        class="btn-icon-secondary btn-vimeo btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Vimeo'}"]  title="Vimeo" target="_blank" rel="noopener"}
                                            <i class="fab fa-vimeo-v fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.pinterest)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.pinterest|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.pinterest}"
                                        class="btn-icon-secondary btn-pinterest btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Pinterest'}"]  title="Pinterest" target="_blank" rel="noopener"}
                                            <i class="fab fa-pinterest-p fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.instagram)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.instagram|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.instagram}"
                                        class="btn-icon-secondary btn-instagram btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Instagram'}"]  title="Instagram" target="_blank" rel="noopener"}
                                            <i class="fab fa-instagram fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.skype)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.skype|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.skype}"
                                        class="btn-icon-secondary btn-skype btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Skype'}"]  title="Skype" target="_blank" rel="noopener"}
                                            <i class="fab fa-skype fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.xing)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.xing|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.xing}"
                                        class="btn-icon-secondary btn-xing btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Xing'}"]  title="Xing" target="_blank" rel="noopener"}
                                            <i class="fab fa-xing fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.linkedin)}
                                    <li>
                                        {link href="{if $Einstellungen.template.footer.linkedin|strpos:'http' !== 0}https://{/if}{$Einstellungen.template.footer.linkedin}"
                                        class="btn-icon-secondary btn-linkedin btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Linkedin'}"]  title="Linkedin" target="_blank" rel="noopener"}
                                            <i class="fab fa-linkedin-in fa-fw fa-lg"></i>
                                        {/link}
                                    </li>
                                {/if}
                            </ul>
                        {/col}
                    {/block}
                    {/row}{* /row footer-additional *}
                {/if}
            {/block}{* /footer-additional *}
                <div class="footnote-vat">
                    {if $NettoPreise == 1}
                        {lang key='footnoteExclusiveVat' assign='footnoteVat'}
                    {else}
                        {lang key='footnoteInclusiveVat' assign='footnoteVat'}
                    {/if}
                    {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND])}
                        {if $Einstellungen.global.global_versandhinweis === 'zzgl'}
                            {lang key='footnoteExclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                        {elseif $Einstellungen.global.global_versandhinweis === 'inkl'}
                            {lang key='footnoteInclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                        {/if}
                    {/if}
                    {block name='footer-vat-notice'}{/block}{* Carto: Remove vat notice *}
                </div>
            {/container}
            {block name='layout-footer-copyright'}
                <div id="copyright">
                    {block name='layout-footer-copyright'}
                            {container fluid=false}
                            {row}
                                {* Carto: Place copyright and vat notice *}
                            {block name='layout-footer-copyright-copyright'}
                                {col class='col-12 footnote'}
                                    <span class="mr-5">* {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}</span>
                                    <span>{lang key="authenticityReviewsLink" section="custom"}</span>
                                {/col}
                                {col class='col-12 copyright'}
                                    <span itemprop="copyrightHolder">{lang key='footerCopyright' section='custom'}</span>
                                {/col}
                            {/block}
                            {/row}
                            {/container}
                    {/block}
                    {* Carto: Remove system credits *}
                </div>
            {/block}
            {block name='layout-footer-scroll-top'}
                {if $Einstellungen.template.theme.button_scroll_top === 'Y'}
                    {include file='snippets/scroll_top.tpl'}
                {/if}
            {/block}
        </footer>
    {/if}
{/block}

{block name='layout-footer-consent-manager'}
    {if $Einstellungen.consentmanager.consent_manager_active === 'Y' && !$isAjax && $consentItems->isNotEmpty()}
        <input id="consent-manager-show-banner" type="hidden" value="{$Einstellungen.consentmanager.consent_manager_show_banner}">
        {include file='snippets/consent_manager.tpl'}
        {inline_script}
            <script>
                setTimeout(function() {
                    $('#consent-manager, #consent-settings-btn').removeClass('d-none');
                }, 100)
                document.addEventListener('consent.updated', function(e) {
                    $.post('{$ShopURLSSL}/_updateconsent', {
                            'action': 'updateconsent',
                            'jtl_token': '{$smarty.session.jtl_token}',
                            'data': e.detail
                        }
                    );
                });
                {if !isset($smarty.session.consents)}
                document.addEventListener('consent.ready', function(e) {
                    document.dispatchEvent(new CustomEvent('consent.updated', { detail: e.detail }));
                });
                {/if}

                //window.CM = new ConsentManager({
                    //version: {$smarty.session.consentVersion|default:1}
                //});
                var trigger = document.querySelectorAll('.trigger')
                var triggerCall = function(e) {
                    e.preventDefault();
                    let type = e.target.dataset.consent;
                    if (CM.getSettings(type) === false) {
                        CM.openConfirmationModal(type, function() {
                            let data = CM._getLocalData();
                            if (data === null ) {
                                data = { settings: {} };
                            }
                            data.settings[type] = true;
                            document.dispatchEvent(new CustomEvent('consent.updated', { detail: data.settings }));
                        });
                    }
                }
                for (let i = 0; i < trigger.length; ++i) {
                    trigger[i].addEventListener('click', triggerCall)
                }
            </script>
        {/inline_script}
    {/if}
{/block}