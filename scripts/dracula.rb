module Rouge
    module Themes
        class Dracula < CSSTheme
            name 'dracula'
            background '#282a36'
            foreground '#f8f8f2'
            selection '#44475a'
            comment '#6272a4'
            red '#ff5555'
            orange '#ffb86c'
            yellow '#f1fa8c'
            green '#50fa7b'
            purple '#bd93f9'
            cyan '#8be9fd'
            pink '#ff79c6'

            style Text, :fg => foreground, :bg => background, :default => true
            # style Text::Whitespace, :fg => '#6272a4'
            
            style Error, :fg => red

            # style Other, :fg => '#6272a4'

            # style Keyword, :fg => green
            # style Keyword::Constant, :fg => green
            # style Keyword::Declaration, :fg => green
            # style Keyword::Namespace, :fg => green
            # style Keyword::Pseudo, :fg => green
            # style Keyword::Reserved, :fg => green
            # style Keyword::Type, :fg => green

            # style Name, :fg => yellow
            # style Name::Attribute, :fg => yellow
            # style Name::Builtin, :fg => yellow
            # style Name::Builtin::Pseudo, :fg => yellow
            # style Name::Class, :fg => yellow
            # style Name::Constant, :fg => yellow
            # style Name::Decorator, :fg => yellow
            # style Name::Entity, :fg => yellow
            # style Name::Exception, :fg => yellow
            # style Name::Function, :fg => yellow
            # style Name::Property, :fg => yellow
            # style Name::Label, :fg => yellow
            # style Name::Namespace, :fg => yellow
            # style Name::Other, :fg => yellow
            # style Name::Tag, :fg => yellow
            # style Name::Variable, :fg => yellow
            # style Name::Variable::Class, :fg => yellow
            # style Name::Variable::Global, :fg => yellow
            # style Name::Variable::Instance, :fg => yellow

            # style Literal, :fg => cyan
            # style Literal::Date, :fg => cyan
            # style Literal::String, :fg => cyan
            # style Literal::String::Backtick, :fg => cyan
            # style Literal::String::Char, :fg => cyan
            # style Literal::String::Doc, :fg => cyan
            # style Literal::String::Double, :fg => cyan
            # style Literal::String::Escape, :fg => cyan
            # style Literal::String::Heredoc, :fg => cyan
            # style Literal::String::Interpol, :fg => cyan
            # style Literal::String::Other, :fg => cyan
            # style Literal::String::Regex, :fg => cyan
            # style Literal::String::Single, :fg => cyan
            # style Literal::String::Symbol, :fg => cyan
            # style Literal::Number, :fg => cyan
            # style Literal::Number::Float, :fg => cyan
            # style Literal::Number::Hex, :fg => cyan
            # style Literal::Number::Integer, :fg => cyan
            # style Literal::Number::Integer::Long, :fg => cyan
            # style Literal::Number::Oct, :fg => cyan
            # style Literal::Number::Hex, :fg => cyan
            # style Literal::Number::Bin, :fg => cyan

            # style Operator, :fg => yellow
            # style Operator::Word, :fg => yellow

            # style Punctuation, :fg => yellow

            # style Comment, :fg => comment
            # style Comment::Multiline, :fg => comment
            # style Comment::Preproc, :fg => comment
            # style Comment::Single, :fg => comment
            # style Comment::Special, :fg => comment

            # style Generic, :fg => yellow
            # style Generic::Deleted, :fg => red
            # style Generic::Emph, :fg => yellow
            # style Generic::Error, :fg => red
            # style Generic::Heading, :fg => yellow
            # style Generic::Inserted, :fg => green
            # style Generic::Output, :fg => yellow
            # style Generic::Prompt, :fg => yellow
            # style Generic::Strong, :fg => yellow
            # style Generic::Subheading, :fg => yellow
            # style Generic::Traceback, :fg => red
            # style Generic::Lineno, :fg => yellow
        end
    end
end