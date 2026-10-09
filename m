Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6A3DEADB
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578837; cv=none; b=tpAA61v+d8K+ai8Fv/138KtD68L2V83yeJKPO46dYXBKw3YiHs0PfrJ1GN03iLMbKHnvChKjfdoOKFhbnNXd9SyjOPT78zFs6nU68tgp3wLHJGgcP8CFtxMydTbR4dF7160+08nrQs/LhLcDjtObWnGuZR3D8tGSEJjnX3NUBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578837; c=relaxed/simple;
	bh=OePpKhBXmJC78+A1HXEYYCJqFBEywwH+gx8tEf8w0Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cP1asC9dS+qSAC/ooWw3NHj+r9ndvP5Ucgy0rqVNm1Mvj+IKQh0FUP3Utxw/vz8gtCGggcixX145OYAaLDBbysHDh6+ud05CIAFqAhQZFrvRRu8ZwagTM7HDQECSvbo5phjcD/SZYxrAVgznqY+4dUocR2/d3vMq8ZvW8jfL1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMns8kvU; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMns8kvU"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6cfed5dd083so187225eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 13:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578833; x=1792183633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ogejZwGA6axWkGqBQEcMQILJ70+KH5RvMyJjg3ijBI=;
        b=PMns8kvUpP91KVWP12TuRI744ZPKvqaFZhachOofwdpSC3iPzeXcLuqX2QUCShRn/Y
         8oMY33SzAh1zS3ZCdqtH1+z6xkleblvcfTpp3XZ6Ced3696zadS8htKWvYn0I8xhBcTl
         XYN3iBZeXQYrzQgklQOjBS4Vc/7V0C0TUr6WFB/U7Wm/6cHnRP+iqFQkacsXxm3HsYbN
         Kjc+XK8XWYRcTNofkOcwDQVSiNgFLOuLsMCvw9z+84AKi1UbyH+YuOqjmgIieVLODuw0
         8eDVivxOJK8Tcux8wgTv+tQZNwvdcTAWniat8JYN9s2JeUtopoTvGHa0kL8kzMvCsnMs
         9KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578833; x=1792183633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ogejZwGA6axWkGqBQEcMQILJ70+KH5RvMyJjg3ijBI=;
        b=BHtxo7CD6PTy+C3oSJMU53Jk88Cp3uKpktzQvzp5PBcDGIaPk1QST58q1iAjkTE224
         kuquLal0e2RbjETcLfOBEwHPGiDdnmtnwSRAn875oGgFsY6pJ5/tFLbmCLJZRJvCpUFr
         AWMEjVgCAYivMm2+gn6XDy2ub5xuS4QBL2MmPrbNsTK/yMV5enGgoTpFYuXTBRAHt/16
         GPlRzpcRaExaJ/mI6pUHKKvQTVNxGsDNV1D9GKlEFSXfBNuEwuj6klxZGZQRy6ya2rLU
         QbVuiZuAvm0sjG8VhsRLgUAt1A+FZKLEvFFhZ+1FUepcrWBzo/q682ScKPUhdvF+3thp
         XEcA==
X-Forwarded-Encrypted: i=1; AKwUvBxwxBeEcBan54t+G5j06hdk4dpWQOwUAFNs9r5dNjKnoeP+dI0HuFgrakopJZM7ft7VIH8pYca+X9bvmDbt+GA=@vger.kernel.org
X-Gm-Message-State: AFuF++kDd5ewAd+m/1L9CNxVDU067oGB2R96EjhvqG2i6koN6i6LEITG
	Js2dgqCu00QimOvWGO/XeXv5VUtacr3jjbDi+jy53GLbvFB7rDjLQjqE
X-Gm-Gg: AYBFou12l1kZzr6rZeOsJCGNI8S/BBO1ur3JPTLF3HokTUj7jde9TjZ1aloEUhWW4hR
	RsaZRF9TDeamtLZkXLfVTaIKolV83m6OCo5w9431lrODxzjGEBeSFEiWokXBH+eAeYnvsb6RB7A
	ufUOqURrBKQqh58dSGAzvWqSCnB9m4Hd7UJgtur80jHWxzfOkBMryHtuRIzulE1HiXuEMSLfVpm
	IQqmXWShyFaA+LaLenLlAUfxgVRpLf3ZvDdR0EGBRlrQuGEzkIfuyp5KjiodWZvk+K9Z9abDZjy
	wjZjq8Yj7luV2V3rEvyNIKmhcdGwbUpzrIKNk72p/Ut2EkFRemGw+/9qVsjpV2UdmoSRmbPiE2x
	fAdWRks/1XpIny5wLAUItzrtJUwG+Egp+VW69FcPLBc2WotVX5Hh1QPrdeAPwQI1i3o1qDqiXbN
	kaFpyy0KRFyGHYDNG3WcIKC7f+m3hKpIFSk2NUeqf8CyEK167Y1OLN6EZBJWbE2JlMFUU=
X-Received: by 2002:a05:6820:4de8:b0:6c4:6699:53b7 with SMTP id 006d021491bc7-6ef10e74e14mr2264921eaf.52.1791578832624;
        Fri, 09 Oct 2026 13:47:12 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-830385ba23csm2799808a34.7.2026.10.09.13.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:47:11 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:46 -0700
Subject: [PATCH net-next v2 6/7] selftests: drv-net: psp: add rekey tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-6-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Add testcases for rekeying psp connections.

Tests include coverage for different cases where rx-assoc and tx-assoc
should fail based on mismatched psp version and psp state.

Add rpc endpoints for tx-assoc, rx-assoc, and key-rotate netlink calls
to the psp_responder.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- add tests for rekeys rejected due to psp state and version mismatch
- add test for rx rekey rejected without a device key rotation
- add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
---
 tools/testing/selftests/drivers/net/psp.py         | 273 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 111 +++++++++
 2 files changed, 382 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 71eeade62ad2..af67c9e8c40f 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -28,6 +28,10 @@ from lib.py import ip
 TCP_ULP = 31
 
 
+_PSP_MAX_KEY_LEN = 32
+_PSP_ASSOC_MSG = f'!IB3x{_PSP_MAX_KEY_LEN}s'
+
+
 def _get_outq(s):
     one = b'\0' * 4
     outq = fcntl.ioctl(s.fileno(), termios.TIOCOUTQ, one)
@@ -80,6 +84,36 @@ def _close_psp_conn(cfg, s):
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
+def _psp_key_len(version):
+    return 16 if version in (0, 2) else 32
+
+
+def _remote_rx_assoc(cfg):
+    _send_with_ack(cfg, b'rx assoc\0')
+    msg = _recv_all(cfg.comm_sock, struct.calcsize(_PSP_ASSOC_MSG))
+    spi, version, key = struct.unpack(_PSP_ASSOC_MSG, msg)
+    return version, {'spi': spi, 'key': key[:_psp_key_len(version)]}
+
+
+def _remote_tx_assoc(cfg, version, rx):
+    msg = struct.pack(_PSP_ASSOC_MSG, rx['spi'], version, rx['key'])
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
@@ -130,6 +164,41 @@ def _check_data_outq(s, exp_len, force_wait=False):
     ksft_eq(outq, exp_len)
 
 
+def _recv_careful(s, target, timeout=2):
+    """Read exactly target bytes, tolerating short reads"""
+    data = b''
+    end = time.monotonic() + timeout
+    while time.monotonic() < end:
+        try:
+            data += s.recv(target - len(data), socket.MSG_DONTWAIT)
+            if len(data) == target:
+                return data
+        except BlockingIOError:
+            time.sleep(0.001)
+    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
+
+
+def _req_echo(cfg, s):
+    """Ask the peer to echo, and check the reply arrives intact"""
+    _send_with_ack(cfg, b'data echo\0')
+    ksft_eq(_recv_careful(s, 5), b'echo\0')
+
+
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
 
@@ -489,6 +558,204 @@ def _data_basic_send(cfg, version, ipver):
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
+def rekey_rx_same_gen(cfg):
+    """Test rejecting an Rx rekey without an intervening key rotation"""
+    _init_psp_dev(cfg)
+
+    s = _establish_psp_conn(cfg, 0)
+    try:
+        _psp_txrx(cfg, s, 1)
+
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.EINVAL)
+
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        cfg.pspnl.rx_assoc({"version": 0,
+                            "dev-id": cfg.psp_dev_id,
+                            "sock-fd": s.fileno()})
+    finally:
+        _close_psp_conn(cfg, s)
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
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
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
+        data_len = _psp_txrx(cfg, s, 10)
+        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
+        _rekey_rx(cfg, s, version, data_len)
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
+        data_len = _psp_txrx(cfg, s, 10)
+        _remote_key_rotate(cfg)
+        _rekey_tx(cfg, s, data_len)
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
@@ -1181,7 +1448,8 @@ def main() -> None:
                                                           cfg.comm_port),
                                                          timeout=1)
 
-                cases = [data_basic_send, data_mss_adjust]
+                cases = [data_basic_send, data_mss_adjust,
+                         rekey_rx_basic, rekey_tx_basic, rekey_both_sides]
 
                 if has_cont:
                     cases += [
@@ -1197,7 +1465,8 @@ def main() -> None:
                     ]
 
                 ksft_run(cases=cases, globs=globals(),
-                         case_pfx={"dev_", "data_", "assoc_", "removal_"},
+                         case_pfx={"dev_", "data_", "assoc_", "rekey_",
+                                   "removal_"},
                          args=(cfg, ))
 
                 cfg.comm_sock.send(b"exit\0")
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index 57425ecb9561..b3e0fe6d6975 100644
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
 
@@ -155,6 +157,100 @@ static void send_str(int sock, int value)
 	send(sock, buf, ret + 1, MSG_WAITALL);
 }
 
+#define PSP_MAX_KEY_LEN		32
+
+struct assoc_msg {
+	__be32 spi;
+	__u8 version;
+	__u8 pad[3];
+	char key[PSP_MAX_KEY_LEN];
+};
+
+static void
+handle_rx_assoc(struct ynl_sock *ys, int data_sock, int comm_sock)
+{
+	struct assoc_msg msg = {};
+	__u32 spi;
+
+	if (data_sock < 0) {
+		fprintf(stderr, "WARN: rx assoc but no data sock\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	if (rx_assoc(ys, &spi, msg.key, data_sock)) {
+		fprintf(stderr, "ERROR: rx_assoc() failed\n");
+		send_err(comm_sock);
+		return;
+	}
+
+	msg.spi = htonl(spi);
+	msg.version = psp_vers.rx;
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
+	if (tx_assoc(ys, msg.version, ntohl(msg.spi), msg.key, data_sock)) {
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
@@ -247,6 +343,9 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 			match;						\
 		})
 
+#define cmd_w_msg(_name, _type)						\
+		(off >= sizeof(_name) + sizeof(_type) && cmd(_name))
+
 			do {
 				consumed = false;
 
@@ -261,6 +360,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
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
@@ -291,6 +400,7 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 				}
 				if (cmd("exit"))
 					should_quit = true;
+#undef cmd_w_msg
 #undef cmd
 
 				if (!consumed) {
@@ -486,6 +596,7 @@ int main(int argc, char **argv)
 		}
 	}
 	psp_dev_get_list_free(dev_list);
+	opts.devid = devid;
 
 	if (opts.ifindex && devid < 0)
 		fprintf(stderr,

-- 
2.52.0

