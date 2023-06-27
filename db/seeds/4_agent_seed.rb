o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent1 fname"
o.last_name="agent1 lname"
o.email="agent1@mail.com"
o.url="http://www.provider.com/agent1"
o.uid="640376522956770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."
a.omniauth_authentication=o
a.save
a.locations<<Location.find(1)
a.locations<<Location.find(2)
a.locations<<Location.find(3)
a.locations<<Location.find(4)
a.languages<<Language.find(1)
a.languages<<Language.find(2)
a.languages<<Language.find(3)
a.properties<<Property.find(1)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent2 fname"
o.last_name="agent2 lname"
o.email="agent2@mail.com"
o.url="http://www.provider.com/agent2"
o.uid="640376522353770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."
a.omniauth_authentication=o
a.locations<<Location.find(5)
a.locations<<Location.find(6)
a.locations<<Location.find(7)
a.locations<<Location.find(8)
a.languages<<Language.find(1)
a.languages<<Language.find(2)
a.languages<<Language.find(3)
a.properties<<Property.find(2)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent3 fname"
o.last_name="agent3 lname"
o.email="agent3@mail.com"
o.url="http://www.provider.com/agent3"
o.uid="640376532333770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."
a.omniauth_authentication=o
a.save
a.locations<<Location.find(9)
a.locations<<Location.find(10)
a.locations<<Location.find(11)
a.locations<<Location.find(12)
a.languages<<Language.find(1)
a.languages<<Language.find(2)
a.properties<<Property.find(1)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent4 fname"
o.last_name="agent4 lname"
o.email="agent4@mail.com"
o.url="http://www.provider.com/agent4"
o.uid="640476422353770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."
a.omniauth_authentication=o
a.locations<<Location.find(21)
a.locations<<Location.find(22)
a.locations<<Location.find(23)
a.locations<<Location.find(24)
a.languages<<Language.find(2)
a.languages<<Language.find(3)
a.properties<<Property.find(1)
a.properties<<Property.find(2)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent5 fname"
o.last_name="agent5 lname"
o.email="agent5@mail.com"
o.url="http://www.provider.com/agent5"
o.uid="640476422555770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(1)
a.locations<<Location.find(2)
a.locations<<Location.find(3)
a.locations<<Location.find(4)
a.languages<<Language.find(1)
a.languages<<Language.find(3)
a.properties<<Property.find(1)
a.properties<<Property.find(2)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent6 fname"
o.last_name="agent6 lname"
o.email="agent6@mail.com"
o.url="http://www.provider.com/agent6"
o.uid="640476662555770"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(5)
a.locations<<Location.find(6)
a.locations<<Location.find(7)
a.locations<<Location.find(8)
a.languages<<Language.find(1)
a.languages<<Language.find(2)
a.properties<<Property.find(1)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent7 fname"
o.last_name="agent7 lname"
o.email="agent7@mail.com"
o.url="http://www.provider.com/agent7"
o.uid="640476662575777"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(11)
a.locations<<Location.find(12)
a.locations<<Location.find(13)
a.locations<<Location.find(14)
a.languages<<Language.find(2)
a.languages<<Language.find(3)
a.properties<<Property.find(2)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent8 fname"
o.last_name="agent8 lname"
o.email="agent8@mail.com"
o.url="http://www.provider.com/agent8"
o.uid="640476662575788"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(21)
a.locations<<Location.find(22)
a.locations<<Location.find(23)
a.locations<<Location.find(24)
a.languages<<Language.find(1)
a.languages<<Language.find(3)
a.properties<<Property.find(2)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent9 fname"
o.last_name="agent9 lname"
o.email="agent9@mail.com"
o.url="http://www.provider.com/agent9"
o.uid="640476662575799"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(31)
a.locations<<Location.find(32)
a.locations<<Location.find(33)
a.locations<<Location.find(34)
a.languages<<Language.find(1)
a.properties<<Property.find(1)
a.save

o=OmniauthAuthentication.new
o.provider="facebook"
o.first_name="agent10 fname"
o.last_name="agent10 lname"
o.email="agent10@mail.com"
o.url="http://www.provider.com/agent10"
o.uid="640476662510799"
o.omniauthable_type="Agent"
o.gender="male"
o.signupdate=Time.now
o.save
a=Agent.new
a.first_name=o.first_name
a.last_name=o.last_name
a.email=o.email
a.address="Bernauer Straße, #122"
a.phone="1234567890"
a.gender=o.gender
a.fb_link="https://www.facebook.com/"
a.twitter_link="https://twitter.com/"
a.googleplus_link="https://plus.google.com"
a.description="Ich ging im Walde\nSo für mich hin,\nUnd nichts zu suchen,\nDas war mein Sinn. \nIm Schatten sah ich\nEin Blümchen stehn,\nWie Sterne leuchtend\nWie Äuglein schön.\nIch wollt es brechen,\nDa sagt' es fein:\nSoll ich zum Welken,\nGebrochen sein?\nIch grubs mit allen\nDen Würzeln aus,\nZum Garten trug ichs\nAm hübschen Haus.\nUnd pflanzt es wieder\nAm stillen Ort;\nNun zweigt es immer\nUnd blüht so fort."

a.omniauth_authentication=o
a.locations<<Location.find(5)
a.locations<<Location.find(6)
a.locations<<Location.find(7)
a.locations<<Location.find(8)
a.languages<<Language.find(3)
a.properties<<Property.find(1)
a.properties<<Property.find(2)
a.save
