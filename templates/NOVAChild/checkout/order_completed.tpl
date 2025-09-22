{block name='checkout-order-completed'}
    {block name='checkout-order-completed-include-header'}
        {include file='layout/header.tpl'}
    {/block}
    {block name='checkout-order-completed-content'}
        {*block name='checkout-order-completed-heading'}
            {container fluid=$Link->getIsFluid()}
                {if isset($smarty.session.Zahlungsart->nWaehrendBestellung) && $smarty.session.Zahlungsart->nWaehrendBestellung == 1}
                    <h2>{lang key='orderCompletedPre' section='checkout'}</h2>
                {elseif $Bestellung->Zahlungsart->cModulId !== 'za_lastschrift_jtl'}
                    <h2>{lang key='orderCompletedPost' section='checkout'}</h2>
                {/if}
            {/container}
        {/block*}
        {block name='checkout-order-completed-include-extension'}
            {include file='snippets/extension.tpl'}
        {/block}
        {block name='checkout-order-completed-main'}
            {container fluid=$Link->getIsFluid()}
                {row}
                    {col cols=12 lg=6 class='mb-5'}
                        <div class="order-completed">
                            {block name='checkout-order-completed-include-inc-paymentmodules'}
                                {include file='checkout/inc_paymentmodules.tpl'}
                            {/block}
                            {block name='checkout-order-completed-order-completed'}
                                {if isset($abschlussseite)}
                                    {block name='checkout-order-completed-include-inc-order-completed'}
                                        {include file='checkout/inc_order_completed.tpl'}
                                    {/block}
                                {/if}
                            {/block}
                            {block name='checkout-order-completed-continue-shopping'}
                                {button block=false type="link" href={$ShopURL} variant="primary" class="mt-3"}
                                    {lang key='continueShopping' section='checkout'}
                                {/button}
                            {/block}
                        </div>
                    {/col}
                    {col cols=12 lg=6}
                        {row}
                            {col cols=12 xl=8 class='offset-xl-4 mb-4'}
                                <b>{lang key='rateUsNow' section='custom'}</b>
                            {/col}
                        {/row}
                        {row}
                            {col cols=6 xl=4 class='offset-xl-4 text-center'}
                                {image src="/{$currentThemeDir}images/google.svg" alt="Google" fluid=true width=140 style="margin-bottom:36px;margin-top:16px"}
                                {button block=true type="link" href="https://www.google.com/maps/place/data=!4m3!3m2!1s0x479c2c2262b1d521:0x9a83e9d6185155f7!12e1?source=g.page.m.ia._&laa=nmx-review-solicitation-ia2" variant="primary" target="_blank"}
                                {lang key='reviewNow' section='custom'}
                                {/button}
                            {/col}
                            {col cols=6 xl=4 class='text-center'}
                                {image src="/{$currentThemeDir}images/shopvote.png" alt="Shopvote" fluid=true width=80 style="margin-bottom:20px"}
                                {button block=true type="link" href="https://www.shopvote.de/bewerten.php?shopid=18601&sr=befb9b2e3593" variant="primary" target="_blank"}
                                {lang key='reviewNow' section='custom'}
                                {/button}
                            {/col}
                        {/row}
                    {/col}
                {/row}
            {/container}
        {/block}
    {/block}
    {block name='checkout-order-completed-include-footer'}
        {include file='layout/footer.tpl'}
    {/block}
{/block}
