# Shortify

*Shortify*
Is a URL shortening application built with Flutter. It uses the [URL Shortener Service API](https://rapidapi.com/BigLobster/api/url-shortener-service/) from Rapid API, developed by BigLobster, to shorten URLs input by the user.
It is free to use and provides unlimited URL shortening, Hence, it is used for this project as of now.

## Features

- **URL Shortening:** The app takes a URL input from the user and sends a request to the URL Shortener Service API to generate a shortened version of the URL.
- **QR Code Generation:** Once the shortened URL is received, the app generates a QR code based on the shortened URL. This QR code can be easily scanned to redirect to the original URL.
- **Share Functionality:** The app allows users to share the shortened URL with others via various platforms such as email, messaging, and social media.

## Usage

To use the app, Download and install .apk from release section and simply input the URL you want to shorten in the text field and press the 'Shorten' button. The app will then display the shortened URL and its corresponding QR code. Please note that this application requires an internet connection to function properly as it needs to communicate with the URL Shortener Service API.

## Limitations

The app currently only supports the URL Shortener Service API from Rapid API. In future versions, additional URL shortening services may be supported.

## Dependencies

This application uses the following packages:

- **flutter_riverpod** for state management
- **flutter_screenutil** for responsive UI
- **share_plus** for sharing the shortened URL
- **dio** for making HTTP requests
- **qr_flutter** for generating QR codes

## Future Improvements

Future versions of the app may include additional features such as URL history tracking, custom URL shortening, and more. Stay tuned for updates!
