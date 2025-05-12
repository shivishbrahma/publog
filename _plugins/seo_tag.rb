
module Jekyll
    class SeoTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end

        def translate(key)
            lang = @site.config['lang']
            TranslatedString.translate(key, lang, @site)
        end

        def relative_url(url)
            site_url = @context.registers[:site].config['url']
            @context.registers[:site].config['baseurl'] + url.sub(site_url, '')
        end

        def absolute_url(url)
            @context.registers[:site].config['url'] + relative_url(url)
        end

        def load_image_tag()
            image = {}
            
            if @page['image']
                image['path'] = relative_url(@page['image'])
                image['alt'] = @page['title'] + " cover image"
            elsif @page['type'] == "post"
                image['path'] = "https://placehold.co/940x540/161925/ffffff/webp?text=" + @page['title']
                image['alt'] = @page['title'] + " cover image"
            else
                image['path'] = relative_url('/public/android-chrome-512x512.png')
                image['alt'] = @page['title'] + " cover image"
            end
            image
        end


        def render(context)
            @context = context
            @site = context.registers[:site]
            @page = context.registers[:page]

            # Use seo_tag.jekyll template and pass variables
            seo = {}
            if @page['title'] == "Home"
                seo['title'] =  site.config['title'] + " &middot; " + site.config['tagline']
            elsif (@page['path'].include? "_posts") || (@page['path'].include? "_tags")
                seo['title'] = @page['title'] + " &middot; " + translate("title")
            else
                seo['title'] = translate(@page['title']) + " &middot; " + translate("title")
            end
            seo['page_locale'] = @site.config['lang']

            if @page['description']
                seo['description'] = translate(@page['description'])
            else
                seo['description'] = translate("description")
            end

            if @page['author']
                seo['author'] = @page['author']
            else
                seo['author'] = translate("author")
            end
            seo['image'] = load_image_tag()
            seo['canonical_url'] = absolute_url(@page['url'])
            
            template_content = File.read(File.join(@site.source, '_includes', 'seo_tag.jekyll'))
            Liquid::Template.parse(template_content).render!('page' => @page.to_liquid, 'site' => @site.to_liquid, 'seo_tag' => seo.to_liquid)
        end
    end

end

Liquid::Template.register_tag('seo_tag', Jekyll::SeoTag)
