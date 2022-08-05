mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuY2hhbmd5dSIsImEiOiJjbDZmb3h4d2Iwa2VnM2pvcjh3ZWI0c3h5In0.3sdZR_Tj6t5ZHWJgOinBdQ';
    const map = new mapboxgl.Map({
        container: 'map', // container ID
        style: 'mapbox://styles/hanchangyu/cl6fpva2p000214qh27uu2yfx', // style URL
        center: [139.7, 35.7], // starting position [lng, lat]
        zoom: 10, // starting zoom
        projection: 'globe' // display the map as a 3D globe
    });

    map.on('style.load', () => {
        map.setFog({}); // Set the default atmosphere style
    });