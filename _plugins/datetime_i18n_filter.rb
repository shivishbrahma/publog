require "date"

module Jekyll
    # load translations
    class I18nWrapper
        def initialize(locale = "en")
            @locale = locale
            @translations = {}
            @translations[locale] = YAML.load_file(File.join(File.dirname(__FILE__), "../_i18n/#{locale}.yml"))
        end
    end

    class I18nNumber < I18nWrapper
        def initialize(number, locale = "en")
            super(locale)
            @number = number
        end

        def number(number)
            @number = number
            self
        end
        

        def to_s
            @number.to_s.gsub(/[\d]/) do |match| 
                @translations[@locale]["number"]["digits"][match.to_i] 
            end
        end
    end

    class I18nDate < I18nWrapper

        def initialize(date, format, locale = 'en')
            super(locale)
            @date = date
            @format = format
            # puts @translations[@locale]["date"]['month_names']
        end

        def to_s
            i18no = I18nNumber.new('0', @locale)
            @format.gsub(/%[aAbBcdHIjmMpSUwWxXyY]/) do |match|
                case match
                when '%a'
                    @translations[@locale]["date"]["abbr_day_names"][@date.wday]
                when '%A'
                    @translations[@locale]["date"]["day_names"][@date.wday]
                when '%b'
                    @translations[@locale]["date"]["abbr_month_names"][@date.mon-1]
                when '%B'
                    @translations[@locale]["date"]["month_names"][@date.mon-1]
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
                        @translations[@locale]["date"]['am']
                    else
                        @translations[@locale]["date"]['pm']
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

    module I18nFilter
        def i18n_date_to_string(date, locale = 'en')
            I18nDate.new(Date.parse(date.to_s), '%d %B %Y', locale).to_s
        end
        def i18n_date(date, format, locale = 'en')
            I18nDate.new(Date.parse(date.to_s), format, locale).to_s
        end
        def i18n_number(number, locale = 'en')
            I18nNumber.new(number, locale).to_s
        end
    end
end

Liquid::Template.register_filter(Jekyll::I18nFilter)