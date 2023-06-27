o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client1 fname"
o.last_name="client1 lname"
o.email="client1@mail.com"
o.url="http://www.provider.com/client1"
o.uid="640376523216770"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.address="address1"
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save

m=Message.new
m.sender=c
m.receiver=Agent.find(1)
m.content="message 1"
m.save
m=Message.new
m.sender=Agent.find(1)
m.receiver=c
m.content="message 2"
m.save
m=Message.new
m.sender=c
m.receiver=Agent.find(1)
m.content="message 3"
m.save
m=Message.new
m.sender=Agent.find(1)
m.receiver=c
m.content="message 4"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(2)
m.content="message 2"
m.save


f=Favourite.new
f.agent=Agent.find(1)
f.client=c
f.save


o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client2 fname"
o.last_name="client2 lname"
o.email="client2@mail.com"
o.url="http://www.provider.com/client2"
o.uid="640376523336770"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.address="address1"
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save

f=Favourite.new
f.agent=Agent.find(3)
f.client=c
f.save

f=Favourite.new
f.agent=Agent.find(2)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(3)
m.content="message 3"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(4)
m.content="message 4"
m.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client3 fname"
o.last_name="client3 lname"
o.email="client3@mail.com"
o.url="http://www.provider.com/client3"
o.uid="640999923336770"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.address="address1"
c.gender=o.gender
c.omniauth_authentication=o
c.save

f=Favourite.new
f.agent=Agent.find(4)
f.client=c
f.save
f=Favourite.new
f.agent=Agent.find(2)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(1)
m.content="message"
m.save


o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client4 fname"
o.last_name="client4 lname"
o.email="client4@mail.com"
o.url="http://www.provider.com/client4"
o.uid="6409545923336770"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save

f=Favourite.new
f.agent=Agent.find(6)
f.client=c
f.save
f=Favourite.new
f.agent=Agent.find(7)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(5)
m.content="message"
m.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client5 fname"
o.last_name="client5 lname"
o.email="client5@mail.com"
o.url="http://www.provider.com/client5"
o.uid="640956663336770"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.address="address1"
c.save
f=Favourite.new
f.agent=Agent.find(3)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(6)
m.content="message"
m.save


o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client6 fname"
o.last_name="client6 lname"
o.email="client6@mail.com"
o.url="http://www.provider.com/client6"
o.uid="640956663338870"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.address="address1"
c.save

f=Favourite.new
f.agent=Agent.find(2)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(7)
m.content="message"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(1)
m.content="message"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(3)
m.content="message"
m.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client7 fname"
o.last_name="client7 lname"
o.email="client7@mail.com"
o.url="http://www.provider.com/client7"
o.uid="64095677338870"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.address="address1"
c.save

f=Favourite.new
f.agent=Agent.find(1)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(2)
m.content="message"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(4)
m.content="message"
m.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client8 fname"
o.last_name="client8 lname"
o.email="client8@mail.com"
o.url="http://www.provider.com/client8"
o.uid="640956776568870"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save

f=Favourite.new
f.agent=Agent.find(5)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(6)
m.content="message"
m.save


o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client9 fname"
o.last_name="client9 lname"
o.email="client9@mail.com"
o.url="http://www.provider.com/client9"
o.uid="640956776568899"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save

f=Favourite.new
f.agent=Agent.find(6)
f.client=c
f.save
f=Favourite.new
f.agent=Agent.find(4)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(7)
m.content="message"
m.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="client10 fname"
o.last_name="client10 lname"
o.email="client10@mail.com"
o.url="http://www.provider.com/client10"
o.uid="640956776568100"
o.omniauthable_type="Client"
o.gender="male"
o.signupdate=Time.now
o.save
c=Client.new
c.first_name=o.first_name
c.last_name=o.last_name
c.email=o.email
c.gender=o.gender
c.omniauth_authentication=o
c.save
f=Favourite.new
f.agent=Agent.find(1)
f.client=c
f.save
f=Favourite.new
f.agent=Agent.find(8)
f.client=c
f.save

m=Message.new
m.sender=c
m.receiver=Agent.find(3)
m.content="message"
m.save

m=Message.new
m.sender=c
m.receiver=Agent.find(2)
m.content="message"
m.save





r=Review.new
r.from_user=Client.find(1)
r.to_user=Agent.find(1)
r.location = Location.find(11)
r.purpose = "Electrical problem"
r.content="Background: The web has become a primary information resource about illnesses
and treatments for both medical and non-medical users. Standard
web search is by far the most common interface for such information. It is
therefore of interest to find out how well web search engines work for diagnostic
queries and what factors contribute to successes and failures. Among
diseases, rare (or orphan) diseases represent an especially challenging and
thus interesting class to diagnose as each is rare, diverse in symptoms and
usually has scattered resources associated with it."
r.overall=2
r.isreviewed=true
r.save

r=Review.new
r.from_user=Client.find(1)
r.to_user=Agent.find(1)
r.location = Location.find(7)
r.purpose = "Electrical problem"
r.content="dgfggfgfg rttt ered resources associated with it."
r.overall=2
r.save


r=Review.new
r.from_user=Client.find(2)
r.to_user=Agent.find(2)
r.location = Location.find(4)
r.purpose = "Electrical problem"
r.content="what factors contribute to successes and failures. Among
diseases, rare (or orphan) diseases represent an especially challenging and
thus interesting class to diagnose as each is rare, diverse in symptoms and
usually has scattered resources associated with it."
r.overall=3
r.isreviewed=true
r.save


r=Review.new
r.from_user=Client.find(3)
r.to_user=Agent.find(1)
r.location = Location.find(3)
r.purpose = "Electrical problem"
r.content="Background: The web has become a primary information resource about illnesses
and treatments for ed resources associated with it."
r.overall=4
r.isreviewed=true
r.save


r=Review.new
r.from_user=Client.find(3)
r.to_user=Agent.find(3)
r.location = Location.find(2)
r.purpose = "Electrical problem"
r.content="Background: The web has become a primary information resource about illnesses
and treatments for b to diagnose as each is rare, diverse in symptoms and
usually has scattered resources associated with it."
r.overall=3
r.save


r=Review.new
r.from_user=Client.find(3)
r.to_user=Agent.find(1)
r.location = Location.find(1)
r.purpose = "Electrical problem"
r.content="Background: The web has become a primary information resource about illnesses
and treatments for both men) diseases represent an especially challenging and
thus interesting class to diagnose as each is rare, diverse in symptoms and
usually has scattered resources associated with it."
r.overall=4
r.isreviewed=true
r.save