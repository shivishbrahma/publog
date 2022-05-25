require "date"

module Jekyll
    # load translations
    class I18nWrapper
        def initialize(locale = "en", _module = "number")
            @locale = locale
            @translations = {}
            self.load_translations(_module)
        end
        
        def load_translations(_module = "number")
            @translations[@locale] = YAML.load_file(File.join(File.dirname(__FILE__), "../_i18n/#{@locale}.yml"))[_module]
        end
    end

    class I18nNumber < I18nWrapper
        def initialize(number, locale = "en", _module = "number")
            super(locale, _module)
            @number = number
        end

        def number(number)
            @number = number
            self
        end
        

        def to_s
            @number.to_s.gsub(/[\d]/) do |match| 
                @translations[@locale]["digits"][match.to_i] 
            end
        end
    end

    class I18nDate < I18nWrapper

        def initialize(date, format, locale = 'en', _module = 'date')
            super(locale, _module)
            @date = date
            @format = format
        end

        def to_s
            i18no = I18nNumber.new('0', @locale)
            case @format
            when 'default'
                @format = @translations[@locale]['formats']['default']
            when 'short'
                @format = @translations[@locale]['formats']['short']
            when 'long'
                @format = @translations[@locale]['formats']['long']
            when 'full'
                @format = @translations[@locale]['formats']['full']
            when 'only_second'
                @format = @translations[@locale]['formats']['only_second']
            when 'only_minute'
                @format = @translations[@locale]['formats']['only_minute']
            when 'only_hour'
                @format = @translations[@locale]['formats']['only_hour']
            when 'only_day'
                @format = @translations[@locale]['formats']['only_day']
            when 'only_month'
                @format = @translations[@locale]['formats']['only_month']
            when 'only_year'
                @format = @translations[@locale]['formats']['only_year']
            end
            @format.gsub(/%[aAbBcdHIjmMpSUwWxXyY]/) do |match|
                case match
                when '%a'
                    @translations[@locale]["abbr_day_names"][@date.wday]
                when '%A'
                    @translations[@locale]["day_names"][@date.wday]
                when '%b'
                    @translations[@locale]["abbr_month_names"][@date.mon-1]
                when '%B'
                    @translations[@locale]["month_names"][@date.mon-1]
                when '%c'
                    @date.strftime('%a %b %e %H:%M:%S %Y')
                when '%d'
                    i18no.number(@date.day.to_s.rjust(2, '0')).to_s
                when '%H'
                    i18no.number(@date.hour.to_s.rjust(2, '0')).to_s
                when '%I'
                    hour = @date.hour
                    hour = 0 if hour == 12
                    hour = 12 if hour == 0
                    hour.to_s.rjust(2, '0')
                when '%j'
                    i18no.number(@date.yday.to_s.rjust(3, '0')).to_s
                when '%m'
                    i18no.number(@date.mon.to_s.rjust(2, '0')).to_s
                when '%M'
                    i18no.number(@date.min.to_s.rjust(2, '0')).to_s
                when '%p'
                    if @date.hour < 12
                        @translations[@locale]['am']
                    else
                        @translations[@locale]['pm']
                    end
                when '%S'
                    i18no.number(@date.sec.to_s.rjust(2, '0')).to_s
                when '%U'
                    week_number = @date.strftime('%U').to_i
                    if @date.mon < 4
                        week_number = 0
                    end
                    i18no.number(week_number.to_s.rjust(2, '0'))
                when '%w'
                    i18no.number(@date.wday).to_s
                when '%W'
                    week_number = @date.strftime('%W').to_i
                    if @date.mon < 4
                        week_number = 0
                    end
                    i18no.number(week_number.to_s.rjust(2, '0'))
                when '%x'
                    result = ""
                    result += i18no.number(@date.day.to_s.rjust(2, '0')).to_s + "/"
                    result += i18no.number(@date.mon.to_s.rjust(2, '0')).to_s + "/"
                    result += i18no.number(@date.year.to_s.rjust(4, '0')).to_s
                when '%X'
                    result= ""
                    result += i18no.number(@date.hour.to_s.rjust(2, '0')).to_s + ":"
                    result += i18no.number(@date.min.to_s.rjust(2, '0')).to_s + ":"
                    result += i18no.number(@date.sec.to_s.rjust(2, '0')).to_s
                    result
                when '%y'
                    i18no.number(@date.year.to_s[2..3]).to_s
                when '%Y'
                    i18no.number(@date.year).to_s
                end
            end
        end
    end

    class I18nTime < I18nWrapper
        def initialize(seconds, locale = 'en', _module = 'time')
            super(locale, _module)
            @seconds = seconds
        end

        def to_s
            @seconds
        end

        def to_minute_s
            min = @seconds / 60
            min_label = min > 1 ? 'minutes' : 'minute'
            I18nNumber.new(min, @locale).to_s + ' ' + @translations[@locale]["units"][min_label]
        end
    end


    


    module I18nFilter
        include Liquid::StandardFilters

        def get_plain_text(input)
            strip_html(strip_pre_tags(input))
        end
        
        def strip_pre_tags(input)
            empty = ''.freeze
            input.to_s.gsub(/<pre(?:(?!<\/pre).|\s)*<\/pre>/mi, empty)
        end
    
        def i18n_reading_time(input, locale=@context.registers[:site].config['lang'])
            config = @context.registers[:site].config['reading_time']
            total_words = get_plain_text(input).split.size
            if !config
                words_per_second = 200
            else
                words_per_second = config['words_per_minute'] ? config['words_per_minute'] : 200
            end
            words_per_second = words_per_second / 60
            total_time = (total_words / words_per_second).round
            I18nTime.new(total_time, locale, 'time').to_minute_s
        end

        # calculate date string with i18n support
        def i18n_date_to_string(date, locale = @context.registers[:site].config['lang'])
            I18nDate.new(Date.parse(date.to_s), '%d %B %Y', locale).to_s
        end

        # calculate date with format i18n support
        def i18n_date(date, format, locale = @context.registers[:site].config['lang'])
            I18nDate.new(Date.parse(date.to_s), format, locale).to_s
        end

        # calculate number with i18n support
        def i18n_number(number, locale = 'en')
            I18nNumber.new(number, locale).to_s
        end
    end
end

Liquid::Template.register_filter(Jekyll::I18nFilter)