class DogAge < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '推定1才未満'},
    { id: 3, name: '推定1~2才'},
    { id: 4, name: '推定2~3才'},
    { id: 5, name: '推定3~4才'},
    { id: 6, name: '推定5~6才'},
    { id: 7, name: '推定7~8才'},
    { id: 8, name: '推定8~9才'},
    { id: 9, name: '推定10~12才'},
    { id: 10, name: '推定12~14才'},
    { id: 11, name: '推定16才以上'}
  ]
  include ActiveHash::Associations
  has_many :dogs
end