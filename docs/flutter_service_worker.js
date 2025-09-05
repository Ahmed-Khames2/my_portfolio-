'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "458b8f8536960d6acfdb7209e25d1505",
"assets/AssetManifest.bin": "76c2c6c7eb2c957b743094f5864a597e",
"assets/AssetManifest.bin.json": "d5628b218804dd3cfa26291edd05a85d",
"assets/AssetManifest.json": "23d178cbfdb33ff0efb485376641b2ca",
"assets/assets/CV_Ahmed_Khames.pdf": "348030593e679976396ba44855623ed9",
"assets/assets/images/ai.jpg": "8b879024f52eab4046d8bb3dfdeba8c8",
"assets/assets/images/alqudes1.jpg": "e3663a7c76a3a22da0abd8e94f859dd9",
"assets/assets/images/alqudes3.jpg": "8a8b5e3d959fce33aa7419e22df1e3fa",
"assets/assets/images/alqudes4.jpg": "faa5ec8abb45065c40ef73a304b36d4f",
"assets/assets/images/alqudes5.jpg": "44ac0fe09c2a3d605124ac677adb99b6",
"assets/assets/images/alquds.png": "74a6e3f62645869ec43df0e067091f17",
"assets/assets/images/alquds2.jpg": "e2a9664a7bbd12235df908806d3e7c1c",
"assets/assets/images/api.jpg": "9113e4ed045fd20dc6fa2b8ec0d9afd4",
"assets/assets/images/app.jpg": "f087dc124c84be51a8a9880d30f1a780",
"assets/assets/images/app2.png": "13a35def9a030d8ea400114352b6945b",
"assets/assets/images/assiut.png": "39e562655563a28763c129eec85b7afd",
"assets/assets/images/c1jpg.jpg": "c2a952da9d76f0d30b97051b297a0337",
"assets/assets/images/cp.png": "ba8fe8bfc18a36bf1be0b01fc35d19cd",
"assets/assets/images/DEPI.jpg": "49ef24d47bbc358d87adc375bf954576",
"assets/assets/images/e1.jpg": "8abc49697aeba6617d5a5276ea4a1d6e",
"assets/assets/images/e2.jpg": "9b6af3f4efd8d9b90613b3c8c7aef843",
"assets/assets/images/e3.jpg": "12af8cc8108b3c64160422428609313b",
"assets/assets/images/e4.jpg": "eb7c5f872bc4f84cd624e51c7eac5844",
"assets/assets/images/e5.jpg": "d1712d7f8d624b9c1ab0f69419cf0a2c",
"assets/assets/images/e6.jpg": "22feb5b0d40b3b0e53e779593ab82fc3",
"assets/assets/images/ec.jpeg": "6a94c514690ff310b43b90338675b520",
"assets/assets/images/ecommerce_logo.jpg": "9eef3535e90f06987231136fd4e33c79",
"assets/assets/images/fb.jpeg": "a18a6438b4f77220916e19e3991c71de",
"assets/assets/images/fb2.png": "94948833b5b5617ddc9880a059a6707b",
"assets/assets/images/image.png": "8d8d747b180c768e89193fc66ab98cb5",
"assets/assets/images/kafr.png": "769d847db83318d9db5306dc0d5603e2",
"assets/assets/images/Logo%2520(1).png": "ffcfebacd6e0332f4f4797573a372caa",
"assets/assets/images/Logo%2520(2).png": "d2c58eb58c904e635a4e884d3e07fe23",
"assets/assets/images/logo.webp": "6933dc5ced2c3fd03b305b1bd7f3603b",
"assets/assets/images/ot.jpeg": "4d3115718c4d728a1f632a3cffe9f732",
"assets/assets/images/portfolio.jpg": "cf050cd737e9deabcbeef2945747a7ee",
"assets/assets/images/profile.jpg": "6cb4cdf2e57b670c6ef6b894189b3118",
"assets/assets/images/ud.png": "c2f9b7f38fec92b4ca584eb59e37b978",
"assets/assets/images/udemy-transparent-logo-free-png.webp": "f23d5e24d86142479812682d1d3e45dd",
"assets/assets/images/ui.jpg": "814a19fb6195e759d7330db2fff64f04",
"assets/assets/lang/ar.json": "bff735fa32276fe495833d89f0b3c079",
"assets/assets/lang/en.json": "bdd8fa038a6c703b8d764159959fa22a",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "352abb41485ebf5ddbd9585c4a08148a",
"assets/NOTICES": "7bfc31055789a357d85e6243dff580f5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "15d54d142da2f2d6f2e90ed1d55121af",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "269f971cec0d5dc864fe9ae080b19e23",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "d92561191b43a8da8a0fc602315c96f5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "458b8f8536960d6acfdb7209e25d1505",
"/": "458b8f8536960d6acfdb7209e25d1505",
"main.dart.js": "a785e8c76d50411d6e76fe71a48097de",
"manifest.json": "1829d96080ea575041148a29096e7be8",
"version.json": "152e33754505e238bfa5460046912623"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
