{block name='snippets-slider'}
    {if isset($oSlider) && count($oSlider->getSlides()) > 0}
        {container fluid=$isFluid class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {opcMountPoint id='opc_before_slider'}
            <div class="slider-wrapper theme-{$oSlider->getTheme()}{if $oSlider->getControlNav()} control-nav{/if}{if $oSlider->getDirectionNav()} direction-nav{/if}{if $oSlider->getThumbnail()} thumbnail-nav{/if}">
                <div id="slider-{$oSlider->getID()}" class="nivoSlider">
                    {block name='snippets-slider-slides'}
                        {foreach $oSlider->getSlides() as $oSlide}
                            {assign var=slideTitle value=$oSlide->getTitle()}
                            {if !empty($oSlide->getText())}
                                {assign var=slideTitle value="#slide_caption_{$oSlide->getID()}"}
                            {/if}
                            {if !empty($oSlide->getLink())}
                                <a href="{$oSlide->getLink()}"{if !empty($oSlide->getText())} title="{$oSlide->getText()|strip_tags}"{/if} class="slide">
                            {else}
                                <div class="slide">
                            {/if}
                            {block name='snippets-slider-slide-image'}
                                {image alt=$oSlide->getTitle()|escape:'html'
                                    title=$slideTitle
                                    src=$oSlide->getAbsoluteImage()
                                    data=["thumb" => "{if !empty($oSlide->getAbsoluteThumbnail())}{$oSlide->getAbsoluteThumbnail()}{/if}"]}
                            {/block}
                            {if !empty($oSlide->getLink())}
                                </a>
                            {else}
                                </div>
                            {/if}
                        {/foreach}
                    {/block}
                </div>
                {* slide captions outside of .nivoSlider *}
                {block name='snippets-slider-slide-captions'}
                    {foreach $oSlider->getSlides() as $oSlide}
                        {if !empty($oSlide->getText())}
                            <div id="slide_caption_{$oSlide->getID()}" class="htmlcaption d-none">
                                {if isset($oSlide->getTitle())}
                                    {block name='snippets-slider-slide-captions-title'}
                                        <strong class="title">{$oSlide->getTitle()}</strong>
                                    {/block}
                                {/if}
                                {block name='snippets-slider-slide-captions-desc'}
                                    <p class="desc">{$oSlide->getText()}</p>
                                {/block}
                            </div>
                        {/if}
                    {/foreach}
                {/block}
            </div>
        {/container}
        {block name='snippets-slider-script'}
            {inline_script}<script>
                function addPauseButton(slider)
                {
                    let pauseButton = $('<button tabindex="0" class="btn-pause" title="{lang key='pause' section='aria'}"><i class="fas fa-pause"></i></button>');
                    slider.parent().find('.nivo-controlNav').prepend(pauseButton);
                    pauseButton.on('click', function () {
                        let sliderInstance = slider.data('nivoslider');
                        let fa = pauseButton.find('i');

                        if (fa.hasClass('fa-pause')) {
                            sliderInstance.stop();
                            fa.removeClass('fa-pause').addClass('fa-play');
                        } else {
                            sliderInstance.start();
                            fa.addClass('fa-pause').removeClass('fa-play');
                        }
                    });
                }

                function restoreSliderAltAttributes(slider) {
                    // Store original alt attributes from slide data
                    let slideData = [
                        {foreach $oSlider->getSlides() as $oSlide}
                            {
                                title: "{$oSlide->getTitle()|escape:'javascript'}",
                                image: "{$oSlide->getAbsoluteImage()|escape:'javascript'}"
                            }{if !$oSlide@last},{/if}
                        {/foreach}
                    ];

                    // Function to update nivo-main-image alt attribute
                    function updateNivoMainImageAlt() {
                        slider.parent().find('.nivo-main-image').each(function() {
                            let img = $(this);
                            let src = img.attr('src');
                            for (let i = 0; i < slideData.length; i++) {
                                if (src.endsWith(slideData[i].image)) {
                                    img.attr('alt', slideData[i].title);
                                    $('.nivo-slice img, .nivo-box img').attr('alt', slideData[i].title);
                                    break;
                                }
                            }
                        });
                    }

                    // Initial update of nivo-main-image
                    updateNivoMainImageAlt();

                    // Also update on slider navigation clicks
                    slider.parent().find('.nivo-prevNav, .nivo-nextNav, .nivo-control a').on('click', function() {
                        setTimeout(updateNivoMainImageAlt, 100);
                    });
                }

                {if $oSlider->getUseKB() === false}
                    $(function () {
                        var slider = $('#slider-{$oSlider->getID()}');
                        $('a.slide').on('click', function () {
                            if (!this.href.match(new RegExp('^' + location.protocol + '\\/\\/' + location.host))) {
                                this.target = '_blank';
                                }
                            });
                        slider.nivoSlider({
                            effect: '{$oSlider->getEffects()|replace:';':','}',
                            animSpeed: {$oSlider->getAnimationSpeed()},
                            pauseTime: {$oSlider->getPauseTime()},
                            directionNav: {if $oSlider->getDirectionNav()}true{else}false{/if},
                            controlNav: {if $oSlider->getControlNav()}true{else}false{/if},
                            controlNavThumbs: {if $oSlider->getThumbnail()}true{else}false{/if},
                            pauseOnHover: {if $oSlider->getPauseOnHover()}true{else}false{/if},
                            prevText: '{lang key='sliderPrev' section='media' addslashes=true}',
                            nextText: '{lang key='sliderNext' section='media' addslashes=true}',
                            randomStart: {if $oSlider->getRandomStart()}true{else}false{/if},
                            afterLoad: function () {
                                addPauseButton(slider);
                                slider.addClass('loaded');
                                restoreSliderAltAttributes(slider);
                            },
                            afterChange: function () {
                                restoreSliderAltAttributes(slider);
                            }
                        });
                    });
                {else}
                    var pauseTime = {$oSlider->getPauseTime()},
                        animSpeed = {$oSlider->getAnimationSpeed()},
                        zoomFactor = 30,
                        durationFactor = 1.25;

                    function KBInit () {
                        $('.nivoSlider img').css('visibility', 'hidden');
                        $('.nivoSlider .nivo-nextNav').trigger('click');
                        $('.nivoSlider, .nivo-control').css('opacity',1);
                        setTimeout (function(){
                            $('.nivoSlider, .nivo-control').animate({ opacity: 1 },animSpeed);
                        },0);
                        $('.nivo-control').on('click', function() {
                            setTimeout (function(){
                                $('.nivo-main-image').css('opacity',0);
                            },0);
                            durationFactor = 1.25;
                        });
                        $('.nivo-prevNav, .nivo-nextNav').on('click', function() {
                            setTimeout (function(){
                                $('.nivo-main-image').css('opacity',0);
                            },20);
                            durationFactor = 1.25;
                        });
                    }

                    function NivoKenBurns () {
                        $('.nivo-main-image').css('opacity',1);
                        setTimeout (function(){
                            $('.nivoSlider .nivo-slice img').css('width',100+zoomFactor+'%');
                        },10);
                        setTimeout (function(){
                            var nivoWidth=$('.nivoSlider').width(), nivoHeight=$('.nivoSlider').height();
                            var xScope=nivoWidth*zoomFactor/100, yScope=nivoHeight*zoomFactor/105;
                            var xStart=-xScope*Math.floor(Math.random()*2);
                            var yStart=-yScope*Math.floor(Math.random()*2);
                            $('.nivoSlider .nivo-slice img')
                                .css('left',xStart)
                                .css('top',yStart)
                                .animate({ width:'100%', left:0, top:0 },pauseTime*durationFactor);
                            durationFactor=1.02;
                            $('.nivo-main-image').css('cssText','left:0 !important;top:0 !important;');
                        },10);
                    }

                    $(function () {
                        var slider = $('#slider-{$oSlider->getID()}');
                        var endSlide=$('.nivoSlider img').length-1;
                        $('a.slide').click(function() {
                            if (!this.href.match(new RegExp('^'+location.protocol+'\\/\\/'+location.host))) {
                                this.target = '_blank';
                            }
                        });
                        slider.nivoSlider( {
                            effect: 'fade',
                            animSpeed: animSpeed,
                            pauseTime: pauseTime,
                            directionNav: true,
                            controlNav: false,
                            controlNavThumbs: false,
                            pauseOnHover: false,
                            prevText: '{lang key='sliderPrev' section='media' addslashes=true}',
                            nextText: '{lang key='sliderNext' section='media' addslashes=true}',
                            manualAdvance: false,
                            randomStart: false,
                            startSlide: endSlide,
                            slices: 1,
                            beforeChange: function (){ NivoKenBurns(); },
                            afterLoad: function (){
                                KBInit();
                                addPauseButton(slider);
                                slider.addClass('loaded');
                                restoreSliderAltAttributes(slider);
                            },
                            afterChange: function (){
                                restoreSliderAltAttributes(slider);
                            }
                        });
                    });
                {/if}
            </script>{/inline_script}
        {/block}
    {/if}
{/block}
