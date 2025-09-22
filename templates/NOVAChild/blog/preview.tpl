{extends file="{$parent_template_path}/blog/preview.tpl"}

{* Carto: Remove infos *}
{block name='blog-preview-author'}{/block}

{* Carto: Remove footer *}
{block name='blog-preview-news-footer'}{/block}

{block name='blog-preview-description'}
    <p itemprop="description">
        {$newsItem->getContent()|strip_tags|truncate:250:'...'}
    </p>
{/block}