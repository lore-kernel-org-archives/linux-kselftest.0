Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830712;
	b=MOZz38D5NsAvPm8JCz2pePRIRYaViydoYjYcpNopg+eni2Xbm8AJN3xj7jW5yDQz0Hvx
	 oiJUcI3ZxrQ+lA/BYG2MGqsYgxlFlQoTjkV0Y+jQZ6IqyeCcCLiF4nwFTUSp8aJC+42yL
	 eBsOg+UFbGwuR033t3qRyeikhHesLAilgGIUIR3ge4relw3bzwNs4tZavR6rYSQMTC96P
	 tFLiIb1yTuj21/XdZi+SZfHzkMIF8iCjF/OLbcymF4Hvg1rdcIMZ1UsMChtO7dNlYex1P
	 uv9cnMiqjeWgZgXAZ7ae/0kitrrBBf5sxLU3RfvD0+m/dQEI/MgHhZCg0bjvn63xh4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VYUe/l4RIY9zH7+9afsTD0+fo46RXtszjVF6GN9zfxw=;
	b=Y6s5KAqGISR/ehucDbyfGIoh7fXDKfW/WBMnP/1HPFJRUw+11FUJdQceg8o9ArEGi8va
	 am58llX4BIlXYtihS9lLoYIkzqeFhXfiuCW+QawIfX/bPHDgusKjO7dv6d501iJyttgFd
	 YhO7doh0KqcUR5fRToP3k85ODzsKfNarKuCMBZTPwccZH9wkVRBvOk8sZeMhWzUPjcIyH
	 M5W29BGhS5uO9l3ba3MMvxi9R5SIysjVg42nHLXo7vltjuaXBL1LRMcBLsxHzR8QKZPn8
	 0y9cwymwo5nkPD6uiV14MBjxb9Ei3kGMRrsuJVe2LWn4OSAj8jg55Lls3CQenmz8Ifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6EeJ9Pa;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8A606A884
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E8A606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6EeJ9Pa
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4bc216e9dso10283957b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830710; x=1795435510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYUe/l4RIY9zH7+9afsTD0+fo46RXtszjVF6GN9zfxw=;
        b=T6EeJ9PaMBT3ukrD7L64i1bKMgYBRmIR5xyN69aImlgmZuYWirfkA2Oz6CXYKDQCRb
         pmHaRMgxKWbkhV8LLR3+gPYxNAFS/029N1y4ivsd8+NFgxre34Dw5z12rqreIllKDb+4
         wrncmykRr/dmk313uk8oxOSWoUTf2wINN3PN3PGCh7o0xIoxfekxEVsMUHzIrLF5kHCJ
         IVIB3026ZMQgE3lVnJfRRuvvs6OIIgsppqihUfEqubngiNp6vpLPlWjDaqn0a/n9idB/
         ORQkPHO3nzi8Ho0zUcrsmXNHZgkRgIKmbkjaT0ZnmMVqC0aUvtdvkhxqpVq+HhKU5G/1
         VmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830710; x=1795435510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYUe/l4RIY9zH7+9afsTD0+fo46RXtszjVF6GN9zfxw=;
        b=d1Himp56wonPrwzhJt91QxmdhzKQdVsR+JJL969jHxKlnB89LuPlo9y97wEzGkbb1l
         0adJKw8bog67AWJcA8VBUEDn8HoF9udZ09+x+sKXh06SamTQCb8RC36xzTmvpH6GCgF1
         AOOZu+HVxnYBx/WJDasQNGWcFfN10gC2oa1T8ScqkX29LoecQpem24Amon/k7uA//Tav
         bFyrLR7zDldgNYzrIz0BW8zsIU3JRvKPePGor1TqNBDpLUtfUM47tM8lYyVnipRaGYDQ
         TV1/p8F7MC5/i4O4ptSWUwJ2RfXdNn8XD2FB66kwba+uES3LTq3wqU+Zwgk6RocKucbE
         oLeA==
X-Forwarded-Encrypted: i=1; AL+hErEIUUPABOdAgIeixy9ZHvWafwxiBsr6y9hkqAaZXCEX5u8ui2/ALRqpvFJiXWMx8Y3LLEtzdpzO4pTwI+a4OGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ypxte69wV9DMCzHAZ5rXVbAR1J/sKEVguhTsRQywSaidGDOcM
	XYL0PNS1jiz5NUaBpEWvZ/f7ose85hNlGOOmP1U10sbUYBKUC+tx/V1Rdb71N6Kw
X-Gm-Gg: AZFdTZc7eUNDLir+xP5hjbZZDa+3oFPotP560JIOqudtB9g8hyxfRaeITxzGTRoHBDd
	ReOGRly4prs0lUc/bwXK6100n2b3vtw1rSsl905ZkLFCkJtIMD22SjXJx/xJj9z+YkzzAUIH3Ou
	443/+hhj3T+JRNsGtWC7tdBA6148giokIEyKfpGH9wF7N2AMJLpxCAOqybaMOSxg6MtJ/3u/dyp
	5muVXAR/yvPLpUZr4l2jJPWXUeIQ9k5UtyrXvMzYfDfNt3Mn7z+6qstgnKRkmtG9Y7w6XlBTRGs
	2N5y4O83dqQ50NhQU/+EA7sKu6PS7Et9rUrThBeOgpAaNNANY8pburUg0KOmY0OtNuNxaPuJ/mv
	y3pF670J4oumrY0hWX5j/fAhlEH+E68U+Ma+X8J9/p+OwfSR1ERUzWGOz7hRzTvfrzaCS/s39If
	npePdnGal1N6cg9fdSyXkqMb1DbocPBy5IJQF50nwCX54RShuhwL5Ng3aP236g0q1OCOciRPYDr
	2VFZCWXHBJKbw0H/aieksPFTbxbog262E4wFCL7xyYCcU0SnOhIMJl2y2SoR3AXPbNPJFBpT288
	4uuK5TVk3zViJH7ZvorPMoMwWD8=
X-Received: by 2002:a05:690c:e3c9:b0:8b0:a7d5:8595 with SMTP id 00721157ae682-8b4aa2f370cmr47484987b3.51.1794830709929;
        Mon, 16 Nov 2026 04:05:09 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:44::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7eeaf9sm83076217b3.4.2026.11.16.04.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:05:08 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:40 -0800
Subject: [PATCH net-next v4 5/5] selftests: drv-net: psp: add rekey tests
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-psp-v4-5-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Add testcases for rekeying psp connections.

Tests include coverage for different cases where rx-assoc and tx-assoc
should fail based on mismatched psp version and psp state.

Add rpc endpoints for tx-assoc, rx-assoc, and key-rotate netlink calls
to the psp_responder.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v4:
- reuse _recv_careful() and _req_echo() now in net-next instead of
  redefining them

v3:
- drop test for rx rekey rejected without a device key rotation
- fail fast in _recv_careful() if the peer closes the connection
- in the basic rekey tests, run traffic across a rotation before the
  rekey, and rotate again after it to verify the new key is in use
- drop unneeded key rotation from rekey_rx_version_mismatch()
- carry the key length in the responder's assoc message instead of
  deriving it from the version

v2:
- add tests for rekeys rejected due to psp state and version mismatch
- add test for rx rekey rejected without a device key rotation
- add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
---
 tools/testing/selftests/drivers/net/psp.py         | 237 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 119 +++++++++++
 2 files changed, 353 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index ce0ab6666603..bd0283f9c9c0 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -28,6 +28,10 @@ from lib.py import ip
 TCP_ULP = 31
 
 
+_PSP_MAX_KEY_LEN = 32
+_PSP_ASSOC_MSG = f'!IBB2x{_PSP_MAX_KEY_LEN}s'
+
+
 def _get_outq(s):
     one = b'\0' * 4
     outq = fcntl.ioctl(s.fileno(), termios.TIOCOUTQ, one)
@@ -80,6 +84,33 @@ def _close_psp_conn(cfg, s):
     _close_conn(cfg, s)
 
 
+def _recv_all(s, target):
+    data = b''
+    while len(data) < target:
+        chunk = s.recv(target - len(data))
+        if not chunk:
+            raise KsftFailEx(f"peer closed after {len(data)} of {target} bytes")
+        data += chunk
+    return data
+
+
+def _remote_rx_assoc(cfg):
+    _send_with_ack(cfg, b'rx assoc\0')
+    msg = _recv_all(cfg.comm_sock, struct.calcsize(_PSP_ASSOC_MSG))
+    spi, version, key_len, key = struct.unpack(_PSP_ASSOC_MSG, msg)
+    return version, {'spi': spi, 'key': key[:key_len]}
+
+
+def _remote_tx_assoc(cfg, version, rx):
+    msg = struct.pack(_PSP_ASSOC_MSG, rx['spi'], version, len(rx['key']),
+                      rx['key'])
+    _send_with_ack(cfg, b'tx assoc\0' + msg)
+
+
+def _remote_key_rotate(cfg):
+    _send_with_ack(cfg, b'key rotate\0')
+
+
 def _spi_xchg(s, rx):
     s.send(struct.pack('I', rx['spi']) + rx['key'])
     tx = s.recv(4 + len(rx['key']))
@@ -126,7 +157,10 @@ def _recv_careful(s, target, timeout=2):
     end = time.monotonic() + timeout
     while time.monotonic() < end:
         try:
-            data += s.recv(target - len(data), socket.MSG_DONTWAIT)
+            chunk = s.recv(target - len(data), socket.MSG_DONTWAIT)
+            if not chunk:
+                raise KsftFailEx(f"peer closed after {len(data)} of {target} bytes")
+            data += chunk
             if len(data) == target:
                 return data
         except BlockingIOError:
@@ -150,6 +184,21 @@ def _check_data_outq(s, exp_len, force_wait=False):
     ksft_eq(outq, exp_len)
 
 
+def _psp_txrx(cfg, s, rounds, sent=0):
+    """Send data both ways, and return the total bytes sent to the peer"""
+    sent += _send_careful(cfg, s, rounds)
+    _check_data_rx(cfg, sent)
+    _req_echo(cfg, s)
+    return sent
+
+
+def _require_version(cfg, version):
+    """Skip the test unless the device supports the given PSP version"""
+    name = cfg.pspnl.consts["version"].entries_by_val[version].name
+    if name not in cfg.psp_info['psp-versions-cap']:
+        raise KsftSkipEx("PSP version not supported", name)
+
+
 def _get_stat(cfg, key):
     return cfg.pspnl.get_stats({'dev-id': cfg.psp_dev_id})[key]
 
@@ -510,6 +559,186 @@ def _data_basic_send(cfg, version, ipver):
     _close_psp_conn(cfg, s)
 
 
+def _rekey_rx(cfg, s, version, sent):
+    """Rekey the Rx direction, running traffic after each step"""
+    rx_assoc = cfg.pspnl.rx_assoc({"version": version,
+                                   "dev-id": cfg.psp_dev_id,
+                                   "sock-fd": s.fileno()})
+    sent = _psp_txrx(cfg, s, 1, sent)
+
+    _remote_tx_assoc(cfg, version, rx_assoc['rx-key'])
+    return _psp_txrx(cfg, s, 1, sent)
+
+
+def _rekey_tx(cfg, s, sent):
+    """Rekey the Tx direction, running traffic after each step"""
+    version, tx = _remote_rx_assoc(cfg)
+    sent = _psp_txrx(cfg, s, 1, sent)
+
+    cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                        "version": version,
+                        "tx-key": tx,
+                        "sock-fd": s.fileno()})
+    return _psp_txrx(cfg, s, 1, sent)
+
+
+def rekey_rx_incomplete(cfg):
+    """Test rejecting Rx rekey until the PSP connection is established"""
+    psp_ver = 0
+    _init_psp_dev(cfg)
+
+    with _make_lo_conn() as s:
+        assoc = cfg.pspnl.rx_assoc({"version": psp_ver,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+
+        # Reject rekey before Tx state is configured.
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": psp_ver,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EBUSY)
+
+        cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                            "version": psp_ver,
+                            "tx-key": assoc['rx-key'],
+                            "sock-fd": s.fileno()})
+
+        # Reject rekey until authenticated PSP traffic has been received.
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": psp_ver,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EBUSY)
+
+
+def rekey_tx_incomplete(cfg):
+    """Test rejecting Tx rekey until the PSP connection is established"""
+    psp_ver = 0
+    _init_psp_dev(cfg)
+
+    with _make_lo_conn() as s:
+        assoc = cfg.pspnl.rx_assoc({"version": psp_ver,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+
+        cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                            "version": psp_ver,
+                            "tx-key": assoc['rx-key'],
+                            "sock-fd": s.fileno()})
+
+        # Reject rekey until authenticated PSP traffic has been received.
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": psp_ver,
+                                "tx-key": assoc['rx-key'],
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EBUSY)
+
+
+def rekey_rx_version_mismatch(cfg):
+    """Test rejecting an Rx rekey whose version does not match socket state"""
+    _init_psp_dev(cfg)
+    _require_version(cfg, 1)
+
+    s = _establish_psp_conn(cfg, 0)
+    try:
+        _psp_txrx(cfg, s, 1)
+
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": 1,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EINVAL)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
+def rekey_tx_version_mismatch(cfg):
+    """Test rejecting a Tx rekey whose version does not match socket state"""
+    _init_psp_dev(cfg)
+    _require_version(cfg, 1)
+
+    s = _establish_psp_conn(cfg, 0)
+    try:
+        _psp_txrx(cfg, s, 1)
+
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": 1,
+                                "tx-key": {'spi': 0x12345678,
+                                           'key': b'\xa5' * 32},
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EINVAL)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
+def _get_psp_ver_variants():
+    for ver in range(4):
+        yield KsftNamedVariant(f"v{ver}", ver)
+
+
+@ksft_variants(_get_psp_ver_variants())
+def rekey_rx_basic(cfg, version):
+    """Test rekeying the Rx key of an established connection"""
+    _init_psp_dev(cfg)
+
+    s = _establish_psp_conn(cfg, version)
+    try:
+        data_len = _psp_txrx(cfg, s, 1)
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        data_len = _psp_txrx(cfg, s, 1, data_len)
+        data_len = _rekey_rx(cfg, s, version, data_len)
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        _psp_txrx(cfg, s, 1, data_len)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
+@ksft_variants(_get_psp_ver_variants())
+def rekey_tx_basic(cfg, version):
+    """Test rekeying the Tx key of an established connection"""
+    _init_psp_dev(cfg)
+
+    s = _establish_psp_conn(cfg, version)
+    try:
+        data_len = _psp_txrx(cfg, s, 1)
+        _remote_key_rotate(cfg)
+        data_len = _psp_txrx(cfg, s, 1, data_len)
+        data_len = _rekey_tx(cfg, s, data_len)
+        _remote_key_rotate(cfg)
+        _psp_txrx(cfg, s, 1, data_len)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
+@ksft_variants(_get_psp_ver_variants())
+def rekey_both_sides(cfg, version):
+    """Test rekeying both directions"""
+    _init_psp_dev(cfg)
+
+    s = _establish_psp_conn(cfg, version)
+    try:
+        data_len = _psp_txrx(cfg, s, 10)
+
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        _remote_key_rotate(cfg)
+
+        # first, rx then tx
+        data_len = _rekey_rx(cfg, s, version, data_len)
+        data_len = _rekey_tx(cfg, s, data_len)
+
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        _remote_key_rotate(cfg)
+
+        # now, tx then rx
+        data_len = _rekey_tx(cfg, s, data_len)
+        _rekey_rx(cfg, s, version, data_len)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
 def __bad_xfer_do(cfg, s, tx, version='hdr0-aes-gcm-128'):
     # Make sure we accept the ACK for the SPI before we seal with the bad assoc
     _check_data_outq(s, 0)
@@ -1203,7 +1432,8 @@ def main() -> None:
                                                           cfg.comm_port),
                                                          timeout=1)
 
-                cases = [data_basic_send, data_mss_adjust]
+                cases = [data_basic_send, data_mss_adjust,
+                         rekey_rx_basic, rekey_tx_basic, rekey_both_sides]
 
                 if has_cont:
                     cases += [
@@ -1219,7 +1449,8 @@ def main() -> None:
                     ]
 
                 ksft_run(cases=cases, globs=globals(),
-                         case_pfx={"dev_", "data_", "assoc_", "removal_"},
+                         case_pfx={"dev_", "data_", "assoc_", "rekey_",
+                                   "removal_"},
                          args=(cfg, ))
 
                 cfg.comm_sock.send(b"exit\0")
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index 411a23be78d5..669956e0d7a4 100644
--- a/tools/testing/selftests/drivers/net/psp_responder.c
+++ b/tools/testing/selftests/drivers/net/psp_responder.c
@@ -5,6 +5,7 @@
 #include <sys/poll.h>
 #include <sys/socket.h>
 #include <sys/time.h>
+#include <arpa/inet.h>
 #include <netinet/in.h>
 #include <unistd.h>
 
@@ -23,6 +24,7 @@ static bool should_quit;
 struct opts {
 	int port;
 	int ifindex;
+	int devid;
 	bool verbose;
 };
 
@@ -141,6 +143,108 @@ static void send_str(int sock, int value)
 	send(sock, buf, ret + 1, MSG_WAITALL);
 }
 
+struct assoc_msg {
+	__be32 spi;
+	__u8 version;
+	__u8 key_len;
+	__u8 pad[2];
+	char key[PSP_MAX_KEY_LEN];
+};
+
+static void
+handle_rx_assoc(struct ynl_sock *ys, int data_sock, int comm_sock)
+{
+	struct assoc_msg msg = {};
+	unsigned int key_len;
+	__u32 spi;
+
+	if (data_sock < 0) {
+		fprintf(stderr, "WARN: rx assoc but no data sock\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	if (rx_assoc(ys, &spi, msg.key, &key_len, data_sock)) {
+		fprintf(stderr, "ERROR: rx_assoc() failed\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	msg.spi = htonl(spi);
+	msg.version = psp_vers.rx;
+	msg.key_len = key_len;
+	send_ack(comm_sock);
+	send(comm_sock, &msg, sizeof(msg), MSG_WAITALL);
+}
+
+static void
+handle_tx_assoc(struct ynl_sock *ys, char *data, int data_sock, int comm_sock)
+{
+	struct assoc_msg msg;
+
+	if (data_sock < 0) {
+		fprintf(stderr, "WARN: tx assoc but no data sock\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	memcpy(&msg, data, sizeof(msg));
+	if (msg.key_len > PSP_MAX_KEY_LEN) {
+		fprintf(stderr, "ERROR: tx assoc key too long\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	if (tx_assoc(ys, msg.version, ntohl(msg.spi), msg.key, msg.key_len,
+		     data_sock)) {
+		fprintf(stderr, "ERROR: tx_assoc() failed!\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	send_ack(comm_sock);
+}
+
+static int rotate_key(struct ynl_sock *ys, int devid)
+{
+	struct psp_key_rotate_rsp *rsp;
+	struct psp_key_rotate_req *req;
+
+	req = psp_key_rotate_req_alloc();
+
+	psp_key_rotate_req_set_id(req, devid);
+
+	rsp = psp_key_rotate(ys, req);
+	psp_key_rotate_req_free(req);
+
+	if (!rsp) {
+		perror("ERROR: failed to rotate key");
+		return -1;
+	}
+
+	psp_key_rotate_rsp_free(rsp);
+
+	return 0;
+}
+
+static void
+handle_key_rotate(struct ynl_sock *ys, struct opts *opts, int comm_sock)
+{
+	if (opts->devid < 0) {
+		fprintf(stderr, "WARN: key rotate but no PSP device\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	if (rotate_key(ys, opts->devid)) {
+		fprintf(stderr, "ERROR: rotate_key() failed\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	send_ack(comm_sock);
+}
+
 static void
 run_session(struct ynl_sock *ys, struct opts *opts,
 	    int server_sock, int comm_sock)
@@ -233,6 +337,9 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 			match;						\
 		})
 
+#define cmd_w_msg(_name, _type)						\
+		(off >= sizeof(_name) + sizeof(_type) && cmd(_name))
+
 			do {
 				consumed = false;
 
@@ -247,6 +354,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 						fprintf(stderr, "WARN: echo but no data sock\n");
 					send_ack(comm_sock);
 				}
+				if (cmd("rx assoc"))
+					handle_rx_assoc(ys, data_sock,
+							comm_sock);
+				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
+					handle_tx_assoc(ys, buf, data_sock,
+							comm_sock);
+					__consume(sizeof(struct assoc_msg));
+				}
+				if (cmd("key rotate"))
+					handle_key_rotate(ys, opts, comm_sock);
 				if (cmd("data close")) {
 					if (data_sock >= 0) {
 						close(data_sock);
@@ -277,6 +394,7 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 				}
 				if (cmd("exit"))
 					should_quit = true;
+#undef cmd_w_msg
 #undef cmd
 
 				if (!consumed) {
@@ -472,6 +590,7 @@ int main(int argc, char **argv)
 		}
 	}
 	psp_dev_get_list_free(dev_list);
+	opts.devid = devid;
 
 	if (opts.ifindex && devid < 0)
 		fprintf(stderr,

-- 
2.52.1

