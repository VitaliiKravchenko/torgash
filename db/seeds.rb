User.delete_all
Product.delete_all
Conversation.delete_all
Message.delete_all
Micropost.delete_all
User.connection.execute("DELETE from sqlite_sequence where name = 'users'") 
Product.connection.execute("DELETE from sqlite_sequence where name = 'products'")
Conversation.connection.execute("DELETE from sqlite_sequence where name = 'conversations'")
Message.connection.execute("DELETE from sqlite_sequence where name = 'messages'")
Micropost.connection.execute("DELETE from sqlite_sequence where name = 'microposts'")
#User.connection.execute('ALTER TABLE USERS AUTO_INCREMENT = 1')
#Products.connection.execute('ALTER SEQUENCE products_id_seq RESTART WITH 1')
#Conversation.connection.execute('ALTER SEQUENCE conversations_id_seq RESTART WITH 1')
#Message.connection.execute('ALTER SEQUENCE messages_id_seq RESTART WITH 1')
#Micropost.connection.execute('ALTER SEQUENCE microposts_id_seq RESTART WITH 1')
User.create!([
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin1@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin2@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin3@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin4@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin5@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "admin", full_name: "admin", birthday: "10.04.1988", email: "admin6@admin", country: "Ukraine", state: "Київська", city: "Бориспіль", zip: "08304", password: "admin", password_confirmation: "admin", latitude: 50.3482, longitude: 30.95615, provider: nil, uid: nil, name: "admin", oauth_token: nil, oauth_expires_at: nil, password_hash: "$2a$10$c9/HklBnSdKp8.JOrHCzY.VrSdYCG8LeE.4rRMc17I9SIPjSc.TSO", password_salt: "$2a$10$c9/HklBnSdKp8.JOrHCzY.", role: "admin", token: nil},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator1@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator2@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator3@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator4@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator5@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: "moderator", full_name: "moderator", birthday: "10.04.1988", email: "moderator6@moderator", country: "moderator", state: "moderator", city: "moderator", zip: "2333", password: "moderator", password_confirmation: "moderator", name: "moderator", role: "moderator"},
  {login: nil, full_name: nil, birthday: nil, email: nil, country: nil, state: nil, city: nil, zip: nil, password_digest: nil, latitude: nil, longitude: nil, provider: "facebook", uid: "1073948082692185", name: "Vitaliy  Kravchenko", oauth_token: "EAASGgQgo2w0BAHHENpzaMGZBWCbQPoBbEZAqmMXBAILwftCZA2faabnHQ9I57RHd0hGk6F669PTnDDZCpLD4HBsqgKpckcgZBgZBkAjvP2ADj4cx3Y0jjKgobiflhwKzHu39hvuZAsZCIpex3ZCUEVJR22dA07mrCgJYZD", oauth_expires_at: "2016-10-23 13:51:39", password_hash: nil, password_salt: nil, role: nil, token: nil}
])
Product.create!([
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "xcv", description: "very good choice for special people", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "tasty honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "bad", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "vosk", description: "honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "hok", description: "honey", image_url: "", price: "43.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "honey", description: "tasty honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "tasty honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "tasty honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "bad", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "vosk", description: "honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "hok", description: "honey", image_url: "", price: "43.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "honey", description: "bad", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "vosk", description: "honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "hok", description: "honey", image_url: "", price: "43.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "honey", description: "bad", image_url: "", price: "1.0", user_id: 1, description1: nil, image: nil},
  {title: "vosk", description: "honey", image_url: "", price: "54.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "honey", description: "vosk hop", image_url: "", price: "90.0", user_id: 1, description1: nil, image: nil},
  {title: "hok", description: "honey", image_url: "", price: "43.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil},
  {title: "1", description: "1", image_url: "", price: "1.0", user_id: 2, description1: nil, image: nil}
])
Conversation.create!([
  {sender_id: 2, recipient_id: 1},
  {sender_id: 2, recipient_id: 6},
  {sender_id: 6, recipient_id: 1}
])
Message.create!([
  {body: "hello world", conversation_id: 1, user_id: 2, read: false},
  {body: "hello world", conversation_id: 1, user_id: 2, read: false},
  {body: "hello world", conversation_id: 1, user_id: 2, read: false},
  {body: "hi", conversation_id: 1, user_id: 2, read: false},
  {body: "boo", conversation_id: 1, user_id: 2, read: false},
  {body: "hi!\r\n", conversation_id: 2, user_id: 2, read: false},
  {body: "how are you?", conversation_id: 2, user_id: 2, read: false},
  {body: "gdf\r\n", conversation_id: 1, user_id: 2, read: false},
  {body: "gdfg", conversation_id: 1, user_id: 2, read: false},
  {body: "sdgf", conversation_id: 1, user_id: 2, read: false},
  {body: "gsd", conversation_id: 1, user_id: 2, read: false},
  {body: "hfghf", conversation_id: 1, user_id: 2, read: false},
  {body: "asef", conversation_id: 1, user_id: 2, read: false},
  {body: "gsdfgds", conversation_id: 1, user_id: 2, read: false},
  {body: "gsgsdf", conversation_id: 1, user_id: 2, read: false},
  {body: "1", conversation_id: 1, user_id: 2, read: false},
  {body: "2", conversation_id: 1, user_id: 2, read: false},
  {body: "3", conversation_id: 1, user_id: 2, read: false},
  {body: "got up", conversation_id: 3, user_id: 6, read: false},
  {body: "fsdfas", conversation_id: 2, user_id: 6, read: false}
])
Micropost.create!([
  {content: "<p>vxcxcvxxvcxvc fdsfsd</p>", user_id: 1, product_id: 2, content1: "vxcxcvxxvcxvc fdsfsd"}
])
