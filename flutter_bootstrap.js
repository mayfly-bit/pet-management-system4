// Flutter bootstrap script for Pet Management System
{{
  let serviceWorkerVersion = null;
  let scriptLoaded = false;

  async function downloadMain() {{
    serviceWorkerVersion = '4063725683';
    
    const entrypoint = './main.dart.js';
    
    if ('serviceWorker' in navigator) {{
      // Service workers are supported. Use them.
      window.addEventListener('load', function () {{
        // Wait for registration to finish before dropping the <script> tag.
        // Otherwise, the browser will load the script multiple times,
        // potentially different versions.
        const serviceWorkerUrl = 'flutter_service_worker.js?v=' + serviceWorkerVersion;
        navigator.serviceWorker.register(serviceWorkerUrl)
          .then((reg) => {{
            function waitForActivation(serviceWorker) {{
              serviceWorker.addEventListener('statechange', () => {{
                if (serviceWorker.state == 'activated') {{
                  console.log('Service worker activated.');
                  loadMainDartJs();
                }}
              }});
            }}
            if (!reg.active && (reg.installing || reg.waiting)) {{
              // No active web worker and we have installed or are installing
              // one for the first time. Simply wait for it to activate.
              waitForActivation(reg.installing || reg.waiting);
            }} else if (!reg.active.scriptURL.endsWith(serviceWorkerVersion)) {{
              // When the app updates the serviceWorkerVersion changes, so we
              // need to ask the service worker to update.
              console.log('New service worker available.');
              reg.update();
              waitForActivation(reg.installing);
            }} else {{
              // Existing service worker is still good.
              console.log('Loading main.dart.js');
              loadMainDartJs();
            }}
          }});
        
        // If service worker doesn't succeed in a reasonable amount of time,
        // fallback to plaint script loading.
        setTimeout(() => {{
          if (!scriptLoaded) {{
            console.warn('Failed to load app with service worker. Falling back to plain script loader.');
            loadMainDartJs();
          }}
        }}, 4000);
      }});
    }} else {{
      // Service workers not supported. Just drop the <script> tag.
      loadMainDartJs();
    }}
  }}

  function loadMainDartJs() {{
    if (scriptLoaded) {{
      return;
    }}
    scriptLoaded = true;
    
    const script = document.createElement('script');
    script.src = './main.dart.js';
    script.type = 'application/javascript';
    script.addEventListener('load', () => {{
      console.log('Pet Management System loaded successfully!');
      // Dispatch custom event when Flutter is ready
      window.dispatchEvent(new Event('flutter-first-frame'));
    }});
    script.addEventListener('error', (e) => {{
      console.error('Failed to load Pet Management System:', e);
    }});
    document.body.appendChild(script);
  }}

  downloadMain();
}})(); 