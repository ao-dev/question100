require 'kconv'

title = Title.find(params[:no])  rescue nil
questions = Question.where(title_id:params[:no]).order('id desc')

#CSV出力
result = ''
result << title.attribute_names.join(',')
result << "\r"
result << title.attributes.values.join(',')
result << "\r"
result << questions.attribute_names.join(',')
result << "\r"
questions.each do |b|
    result << b.attributes.values.join(',')
    result << "\r"
end
result.kconv(Kconv::SJIS,Kconv::UTF8)
