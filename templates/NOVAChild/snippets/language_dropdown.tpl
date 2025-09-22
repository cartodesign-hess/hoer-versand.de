{block name='snippets-language-dropdown'}
    {if isset($smarty.session.Sprachen) && $smarty.session.Sprachen|@count > 1}
        {navitemdropdown
        class="{$dropdownClass|default:''}"
        right=true
        text="
            {foreach $smarty.session.Sprachen as $language}
                {if $language->getId() == $smarty.session.kSprache}
                    {block name='snippets-language-dropdown-text'}
                        {if $language->getIso639()|lower === "de"}
                            {image src="/{$currentThemeDir}images/de.png" alt=$language->getIso639()|lower class="mr-1"}
                        {elseif $language->getIso639()|lower === "en"}
                            {image src="/{$currentThemeDir}images/en.png" alt=$language->getIso639()|lower class="mr-1"}
                        {/if}
                        {$language->getIso639()|upper}
                    {/block}
                {/if}
            {/foreach}"
        }
            {foreach $smarty.session.Sprachen as $language}
                {block name='snippets-language-dropdown-item'}
                    {dropdownitem href="{$language->getUrl()}"
                        class="link-lang"
                        data=["iso"=>$language->getIso()]
                        rel="nofollow"
                        active=($language->getId() == $smarty.session.kSprache)}
                        {image src="/{$currentThemeDir}images/{$language->getIso639()|lower}.png" alt=$language->getIso639()|lower class="mr-1"}{$language->getIso639()|upper}
                    {/dropdownitem}
                {/block}
            {/foreach}
        {/navitemdropdown}
    {/if}
{/block}