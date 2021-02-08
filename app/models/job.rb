class Job < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '会社員・役員'},
    { id: 3, name: '自営業'},
    { id: 4, name: '公務員'},
    { id: 5, name: '学生'},
    { id: 6, name: '専業主婦'},
    { id: 7, name: 'パート・アルバイト'},
    { id: 8, name: '無職'},
    { id: 9, name: 'その他'},
  ]
  include ActiveHash::Associations
  has_many :users
end