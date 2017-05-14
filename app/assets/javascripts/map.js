var map = L.map('map-tims').setView([51.505, -0.09], 11);
L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright" rel="nofollow">OpenStreetMap</a> contributors'
  }).addTo(map);



$.ajax({
  url: "/api/v1/disruptions.json",
  type: "GET",
  success: function(data){
    console.log(data);
      $.each(data, function(index, item){
                L.marker([item.coordinates[0], item.coordinates[1]]).addTo(map).bindPopup(item.comments);
      });
  },
  error: function(error){
      alert(JSON.stringify(error));
  }
});
