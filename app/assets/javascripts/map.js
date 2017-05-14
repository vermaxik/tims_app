var map = L.map('map-tims').setView([51.505, -0.09], 12);
L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright" rel="nofollow">OpenStreetMap</a> contributors'
  }).addTo(map);