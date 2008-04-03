/*
 * Copyright 2008 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.google.zxing.client.result;

import com.google.zxing.Result;

/**
 * Recognizes an NDEF message that encodes a URI according to the
 * "URI Record Type Definition" specification.
 * 
 * @author srowen@google.com (Sean Owen)
 */
public final class NDEFURIParsedResult extends AbstractNDEFParsedResult {

  private static final String[] URI_PREFIXES = new String[] {
      null,
      "http://www.",
      "https://www.",
      "http://",
      "https://",
      "tel:",
      "mailto:",
      "ftp://anonymous:anonymous@",
      "ftp://ftp.",
      "ftps://",
      "sftp://",
      "smb://",
      "nfs://",
      "ftp://",
      "dav://",
      "news:",
      "telnet://",
      "imap:",
      "rtsp://",
      "urn:",
      "pop:",
      "sip:",
      "sips:",
      "tftp:",
      "btspp://",
      "btl2cap://",
      "btgoep://",
      "tcpobex://",
      "irdaobex://",
      "file://",
      "urn:epc:id:",
      "urn:epc:tag:",
      "urn:epc:pat:",
      "urn:epc:raw:",
      "urn:epc:",
      "urn:nfc:",
  };

  private final String uri;

  private NDEFURIParsedResult(String uri) {
    super(ParsedReaderResultType.NDEF_URI);
    this.uri = uri;
  }

  public static NDEFURIParsedResult parse(Result result) {
    byte[] bytes = result.getRawBytes();
    if (bytes == null) {
      return null;
    }
    NDEFRecord ndefRecord = NDEFRecord.readRecord(bytes, 0);
    if (ndefRecord == null || !ndefRecord.isMessageBegin() || !ndefRecord.isMessageEnd()) {
      return null;
    }
    if (!ndefRecord.getType().equals(NDEFRecord.URI_WELL_KNOWN_TYPE)) {
      return null;
    }
    String fullURI = decodeURIPayload(ndefRecord.getPayload());
    return new NDEFURIParsedResult(fullURI);
  }

  static String decodeURIPayload(byte[] payload) {
    int identifierCode = payload[0] & 0xFF;
    String prefix = null;
    if (identifierCode < URI_PREFIXES.length) {
      prefix = URI_PREFIXES[identifierCode];
    }
    String restOfURI = bytesToString(payload, 1, payload.length - 1, "UTF-8");
    return prefix == null ? restOfURI : prefix + restOfURI;
  }

  public String getURI() {
    return uri;
  }

  public String getDisplayResult() {
    return uri;
  }

}