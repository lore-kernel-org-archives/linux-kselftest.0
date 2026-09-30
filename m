Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848664BD353
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812016; cv=none; b=HnBGu3Wyn86zXK4rHQDn5mWdoumeZNIBzVDFtDwnWKkGWyNTaUX94G+ovsi+akOlZj+9laQKQTyLD60GNRLbiwJgO/kbUAg9DXewSAHPqO1XSeaouFMSnnLAaivN+aVrrt8hGyW2+Cv4h09w9zyG9R7VRIK4/FRQlYYMXi0t0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812016; c=relaxed/simple;
	bh=a9J7Nq5XTvk1euwH9fxE45YMOouwsgX6YBiYDC+ciAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfRyon/acVZPemYvFY4UmbkYYqh/BduDBt0HkdUUeuHh+QsdTAnIkv472gqi2VZJkV+MkrIS6T0QC6Js4KfjPMRZygmvsbSRv3rCld4S6mjl2rZMrwaDPvd+jmxCQTqOnjNOJTOY4jI6ZgiRp0uZbppEplebFC3NkcpUCOEq5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXrxBxIB; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXrxBxIB"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d83e283445so614468eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 16:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812013; x=1791416813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62tiuAR0kBMOsxzPYH5jLWDtv5hJHdhsb8KVBwgGC5c=;
        b=nXrxBxIBeqohdMk0Gj7ZjSC/FfoHacnkHj1WH9W6oZnGaAY7vMwfkFeZuw/65ijAsl
         7m18bOktucXyuHpvrRkHbYFI/34EoGRcneCrM9azAPf90Fi1oSvyjhnPO7mKRBFzJfwh
         ZmSDthON3QjrJjYGpUEUHtwmJguoj3KbEiQEjP0DTzgKdSvfTjsmN7vM2hfVbx0wOgTV
         V/i566gqDWIeHYfojL+PNp0vgIWdaT16AhCxnsdVRxyN94JqGu9dTcox8FTNRe4mYLft
         O40DExXf4NszRemjUjtTt/S+VOSp6MEctwdKelHF/MUeeL8EZu34xkKGWQvEu6dFIdpj
         lqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812013; x=1791416813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62tiuAR0kBMOsxzPYH5jLWDtv5hJHdhsb8KVBwgGC5c=;
        b=F+dY5sXDk/eypYiqhU1bJuw8MQdGDSovR8pmpBBd8XwPOrb/iCpe1HEnRAbhA5X4Rs
         VvvFiWQ5HPQ7HuzXPqvFA6/9xp6b0eVyxmOuYuKmSVo11rC+2yGJRKRowv5/yCvFYVuD
         ILQSg2jFFmgeV0GcwPEXBKIrEeaLN0GWcTeW21Orbk3NXhKirxTcDxAmqio5C2xjLMgZ
         O7FwFe3VvDoEv3T5R5wK9elmgoua+T0i4EX8fBiM5lb2AfdrkqO0LKG2D6JnNRihYwJ5
         jQlhQTeER3Bsk+60d42fNvi3+To70jZvBq6RZjyeP/x36no4HE3h2PvAPHjhhGlvTCxw
         zqTw==
X-Forwarded-Encrypted: i=1; AKwUvBw25M3lYcs45rhKlzzV/IlalUyqZuN6VyJqgqLMLmSzMt5F6ENgE1cHtXwxJPf7b5wdNlZ+BFXmwRRmMxPuqCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mU1rLvH5uTM9snQlXN766iMgjrTz7YiehEEgmTH8DY5prrhL9G
	F68TOLJHvTbtdRhKIo824ITdi23QaYRALYuzXl5uPEn7T6HRret0vd3C
X-Gm-Gg: AYBFou27a0UGHahYKDygcatSmPDuAQWCnxxHhlfQ+boPoI+P15MltJokuJIDsBMdzSI
	4W7kqutKUvsbT7yQHGui6As1RS0Ltx5U+m1/EyygXSo1V4tFMZEPqPLaQFhSu+DeqoMQP5+pG2r
	bavRqgV8gmzBfUucYimpOKUgcwUxbejVX/ZVIGRVOeq37gY65tN0khmtfmzyLaLmmv89aMOaEz1
	qx3OUzEefnXkSp+ixH5NgnrvHlPmrIkn736dLe3R7yf68yCfvaQZSa0DGxEjATslCWEI04z3dgA
	hN7InhFhVqMoCoZivA5YTuh4rctDse825ZZHuvmSaebH1uMgtk983I3mPYXy+9zBM4P8ZAqugO5
	j56/o9qIMUvG9RnLruSGiKe5pPj6McKPvVR0BQECVIHkMMQh8A0YPJABokS87cEF2lLV7+SrqJ4
	krYwnBf+Cha+CQvOFFZ+7udzJVIFowKpJujbIKKS79K7rS8ThKy8EoQ7vCVKKUiwPHczwy
X-Received: by 2002:a4a:ee0c:0:b0:6d9:aea6:8bc0 with SMTP id 006d021491bc7-6ddbab9434fmr1139254eaf.43.1790812013284;
        Wed, 30 Sep 2026 16:46:53 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd9751595csm1466682eaf.3.2026.09.30.16.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:52 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 30 Sep 2026 16:46:46 -0700
Subject: [PATCH net-next v2 1/4] selftests: drv-net: psp: swap closed for
 connected sockets in assoc tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Future work will only allow rx-assoc and tx-assoc to be performed when
the sock is in TCP_ESTABLISHED state.

Several assoc_ tests, as well as dev_rotate_spi, test using the rx-assoc
and tx-assoc uapi calls against sockets in TCP_CLOSE state.
These tests don't involve sending or receiving data, nor involve looking
up psp device by dst entry, so using a disposable disconnected socket
was just a convenience. These can be replaced by a disposable loopback
socket.

The loopback sockets are IPv4, where the sockets they replace were
AF_INET6. This doesn't reduce coverage, since the assoc handlers accept
any TCP socket and don't look at the address family.

Some users of rx-assoc and tx-assoc on closed sockets are left if they
validate errors that are returned before the kernel will check the
socket for TCP_ESTABLISHED.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 5a81f40cac7d..0a2329f41431 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -11,6 +11,8 @@ import struct
 import termios
 import time
 
+from contextlib import contextmanager
+
 from lib.py import defer
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_gt, ksft_raises
@@ -58,6 +60,17 @@ def _make_psp_conn(cfg, version=0, ipver=None):
     return s
 
 
+@contextmanager
+def _make_lo_conn():
+    # After tx-assoc, the client's egress is dropped, since lo has no
+    # psp_dev, so its FIN never reaches the server. Closing the server
+    # resets the unaccepted child, and the client accepts the cleartext
+    # RST because it hasn't received any PSP traffic yet.
+    with socket.create_server(("localhost", 0)) as srv, \
+         socket.create_connection(srv.getsockname()[:2]) as s:
+        yield s
+
+
 def _close_conn(cfg, s):
     _send_with_ack(cfg, b'data close\0')
     s.close()
@@ -200,20 +213,18 @@ def dev_rotate_spi(cfg):
     _init_psp_dev(cfg)
 
     top_a = top_b = 0
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc_a = cfg.pspnl.rx_assoc({"version": 0,
                                      "dev-id": cfg.psp_dev_id,
                                      "sock-fd": s.fileno()})
         top_a = assoc_a['rx-key']['spi'] >> 31
-        s.close()
     rot = cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         ksft_eq(rot['id'], cfg.psp_dev_id)
         assoc_b = cfg.pspnl.rx_assoc({"version": 0,
                                     "dev-id": cfg.psp_dev_id,
                                     "sock-fd": s.fileno()})
         top_b = assoc_b['rx-key']['spi'] >> 31
-        s.close()
     ksft_ne(top_a, top_b)
 
 
@@ -221,7 +232,7 @@ def assoc_basic(cfg):
     """ Test creating associations """
     _init_psp_dev(cfg)
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc = cfg.pspnl.rx_assoc({"version": 0,
                                   "dev-id": cfg.psp_dev_id,
                                   "sock-fd": s.fileno()})
@@ -234,7 +245,6 @@ def assoc_basic(cfg):
                                   "tx-key": assoc['rx-key'],
                                   "sock-fd": s.fileno()})
         ksft_eq(len(assoc), 0)
-        s.close()
 
 
 def assoc_bad_dev(cfg):
@@ -320,7 +330,7 @@ def assoc_version_mismatch(cfg):
     # Translate versions to integers
     versions = [cfg.pspnl.consts["version"].entries[v].value for v in versions]
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         rx = cfg.pspnl.rx_assoc({"version": versions[0],
                                  "dev-id": cfg.psp_dev_id,
                                  "sock-fd": s.fileno()})
@@ -393,7 +403,7 @@ def assoc_twice(cfg):
 
         return assoc
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc = rx_assoc_check(s)
         tx = cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
                                "version": 0,
@@ -402,7 +412,7 @@ def assoc_twice(cfg):
         ksft_eq(len(tx), 0)
 
         # Use the same Tx assoc second time
-        with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s2:
+        with _make_lo_conn() as s2:
             rx_assoc_check(s2)
             tx = cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
                                    "version": 0,
@@ -410,8 +420,6 @@ def assoc_twice(cfg):
                                    "sock-fd": s2.fileno()})
             ksft_eq(len(tx), 0)
 
-        s.close()
-
 
 def _data_basic_send(cfg, version, ipver):
     """ Test basic data send """

-- 
2.52.0

