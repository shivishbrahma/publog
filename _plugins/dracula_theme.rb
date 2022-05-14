require 'rouge'

module Rouge
    module Themes
        class Dracula < CSSTheme
            name 'dracula'
            # Colors
            palette :background => '#282a36'
            palette :foreground => '#f8f8f2'
            palette :selection => '#44475a'
            palette :comment => '#6272a4'
            palette :red => '#ff5555'
            palette :orange => '#ffb86c'
            palette :yellow => '#f1fa8c'
            palette :green => '#50fa7b'
            palette :purple => '#bd93f9'
            palette :cyan => '#8be9fd'
            palette :pink => '#ff79c6'
            # ANSI Colors
            palette :ansi_black => '#21222c'
            palette :ansi_red => '#ff5555'
            palette :ansi_green => '#50fa7b'
            palette :ansi_yellow => '#f1fa8c'
            palette :ansi_blue => '#bd93f9'
            palette :ansi_magenta => '#ff79c6'
            palette :ansi_cyan => '#8be9fd'
            palette :ansi_white => '#f8f8f2'
            palette :ansi_bright_black => '#6272a4'
            palette :ansi_bright_red => '#ff6e6e'
            palette :ansi_bright_green => '#69ff94'
            palette :ansi_bright_yellow => '#ffffa5'
            palette :ansi_bright_blue => '#d6acff'
            palette :ansi_bright_magenta => '#ff92df'
            palette :ansi_bright_cyan => '#a4ffff'
            palette :ansi_bright_white => '#ffffff'

            
            style Error, :fg => :red

            # style Other, :fg => '#6272a4'

            style Keyword, :fg => :pink
            style Keyword::Constant, :fg => :pink
            # style Keyword::Declaration, :fg => green
            # style Keyword::Namespace, :fg => green
            # style Keyword::Pseudo, :fg => green
            # style Keyword::Reserved, :fg => green
            style Keyword::Type, :fg => :cyan, :italic => true

            style Name, :fg => :foreground, :italic => true
            # style Name::Attribute, :fg => yellow
            style Name::Builtin, :fg => :purple, :bold => true
            style Name::Builtin::Pseudo, :fg => :purple, :italic => true
            style Name::Class, :fg => :cyan, :bold => true
            style Name::Constant, :fg => :purple
            style Name::Decorator, :fg => :green, :italic => true
            # style Name::Entity, :fg => :pink
            # style Name::Exception, :fg => yellow
            style Name::Function, :fg => :green
            # style Name::Property, :fg => yellow
            # style Name::Label, :fg => yellow
            # style Name::Namespace, :fg => yellow
            # style Name::Other, :fg => yellow
            style Name::Tag, :fg => :pink
            style Name::Variable, :fg => :purple, :bold => true
            style Name::Variable::Class, :fg => :purple, :italic => true
            # style Name::Variable::Global, :fg => yellow
            # style Name::Variable::Instance, :fg => yellow

            # style Literal, :fg => cyan
            style Literal::Date, :fg => :orange
            style Literal::String, :fg => :yellow
            # style Literal::String::Backtick, :fg => cyan
            # style Literal::String::Char, :fg => cyan
            # style Literal::String::Doc, :fg => cyan
            # style Literal::String::Double, :fg => cyan
            style Literal::String::Escape, :fg => :pink, :italic => true
            # style Literal::String::Heredoc, :fg => cyan
            style Literal::String::Interpol, :fg => :pink
            # style Literal::String::Other, :fg => cyan
            style Literal::String::Regex, :fg => :red
            # style Literal::String::Single, :fg => cyan
            # style Literal::String::Symbol, :fg => cyan
            style Literal::Number, :fg => :cyan
            # style Literal::Number::Float, :fg => cyan
            # style Literal::Number::Hex, :fg => cyan
            # style Literal::Number::Integer, :fg => cyan
            # style Literal::Number::Integer::Long, :fg => cyan
            # style Literal::Number::Oct, :fg => cyan
            # style Literal::Number::Hex, :fg => cyan
            # style Literal::Number::Bin, :fg => cyan

            style Operator, :fg => :yellow
            # style Operator::Word, :fg => yellow

            style Punctuation, :fg => :pink

            style Comment, :fg => :comment
            style Comment::Multiline, :fg => :comment, :italic => true
            style Comment::Preproc, :fg => :cyan, :bold => true
            # style Comment::Single, :fg => :comment
            style Comment::Special, :fg => :pink, :italic => true, :bold => true

            # style Generic, :fg => :yellow
            style Generic::Deleted, :fg => :red
            style Generic::Emph, :fg => :yellow, :italic => true
            style Generic::Error, :fg => :red
            style Generic::Heading, :fg => :purple, :bold => true
            style Generic::Inserted, :fg => :green
            # style Generic::Output, :fg => :yellow
            # style Generic::Prompt, :fg => :yellow
            style Generic::Strong, :fg=> :orange, :bold => true
            # style Generic::Subheading, :fg => :yellow
            # style Generic::Traceback, :fg => :red
            # style Generic::Lineno, :fg => :yellow

            style Text, :bg => :background, :fg => :foreground, :default => true
            style Text::Whitespace, :fg => :background
        end
    end
end

theme = Rouge::Themes::Dracula

# writing into the CSS Theme file
File.open(File.join(File.expand_path('..', File.dirname(__FILE__)), 'public', 'css' ,'dracula.css'), 'w') do |f|
    f.write(theme.render(scope: '.highlight'))
end