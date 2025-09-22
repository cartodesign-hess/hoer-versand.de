{block name='snippets-search-form'}
    <div class="search-wrapper w-100-util">
        {form action="{get_static_route id='index.php'}" method='get' class='main-search flex-grow-1' slide=true}
            {inputgroup}{* Carto: Change lang keys *}
                {input id="{$id}" name="qs" type="text" class="ac_input" placeholder="{lang key='findProduct' section='custom'}" autocomplete="off" aria=["label"=>"{lang key='search'}"]}
                {inputgroupaddon append=true}
                    {button type="submit" name="search" variant="secondary" aria=["label"=>{lang key='findProduct' section='custom'}]}
                        <span class="fa-light fa-chevron-right"></span>{* Carto: Change icon *}
                    {/button}
                {/inputgroupaddon}
                {* Carto: Rremove clearer *}
            {/inputgroup}
        {/form}
    </div>
{/block}