{* Carto: Remove collapse function *}
{block name='boxes-box-linkgroups'}
    <div class="box box-linkgroup box-normal" id="box{$oBox->getID()}">
        {block name='boxes-box-linkgroups-title'}{/block}{* Carto: Remove title *}
        {block name='boxes-box-linkgroups-content'}
            <div class="nav-panel box-nav-item">
                {nav vertical=true}
                {block name='boxes-box-linkgroups-include-linkgroups-recursive'}
                    {include file='snippets/linkgroup_recursive.tpl' linkgroupIdentifier=$oBox->getLinkGroupTemplate() dropdownSupport=true  tplscope='box'}
                {/block}
                {/nav}
            </div>
        {/block}
    </div>
{/block}