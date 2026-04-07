Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ECE3D091F
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580601; cv=none; b=GvhRty+to+jJ1kNEn2N7WdK9iufqXtdBJlbdu/d2kNNEjJF8JZdUkO+7I+x2CN6FD87hS7AWyGDvxg0RSRte42+kVnU05t3hZTPs4Rw6+SvQ3D6Bhsbwinq5wS6hIa7XCWeNcWC3kBiosk8HCbJHNloltvhG3P/bkh1i8S6ib/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580601; c=relaxed/simple;
	bh=Zlm9voLeiLWhjmzCyGej3cquzSds89Q/FUS6f0Ubl64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJqH9EkzM2qliwhcW0LZ6g8mbSyRhNTTIXmU6r/jQxfX3RVcC80J/vLRY5hABeDaMACcfU2/ONRVzXfxhPB59tuPEm7cOETZiFQ5BmFfYaGTNuOHQ3H4PDFb8dKKGCOX+HfNDJY2SowrSwmV0mK90ejmBplR1U4+qbjLN4DpL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffRCahlM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffRCahlM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad617d5b80so28423385ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775580599; x=1776185399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOiko0erydel4neRoDYS/JnVnuCjbJBbPKLpvok65oM=;
        b=ffRCahlMlv270/VtfWey66Ak1fCyGhaUo722ggHSYtqSpRYjIz5M10EcKyuvo9+cQP
         HH2hR5dHD/YkU8lzdvHc5FfqDMZA/9LhMQZSc8uc4jGMV7LT+epb+uebi83+/OMP8aB9
         tpjnjLZIDR+k9WSXkgZh7GNwnT7FIf8L8uW+UtCqfzNLD3htvKGxI/KTfkiFhE41ltlS
         NwCnMKQHZeNUbYduyPG+tCqOVYuV7w6kNt/N94ieXox0d7wpj5YNxFSS1shTqtoIisCX
         oFwwxRstaHakkmxqfSGqA3DPD3paZZvB77KZB6hPEDxijeM6l950LZJnenkXuf7l2Gxu
         B7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775580599; x=1776185399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOiko0erydel4neRoDYS/JnVnuCjbJBbPKLpvok65oM=;
        b=bLIkZgDTCIBSSKUy5d4lQgKLRcnJAM394omvX1Q1JD6xi/RGFQysk9OgeyKgRJ+1Hh
         mOu127/0ZX6M68W47eA6aB6Eri5Y/WnSViA+YULd0CV0JNj+9ewzONh+RzprZZypJuoo
         oOPLH3FFqN8ZOVH/jKr+SCgFleUFy494uwMP/+IC53VWDZtj5HC62aUMK5nScHw6htPy
         GbQ2V2HZ4wABnYH//xCTFP9IOcqaCxw0B3DT94xTzTRWFTdRrQy0sakZ5AaHxgrLkHoM
         Og6LfNy4dqhhzQDzfMrPCbvL8jFPnUBSZ5X5OThEwqedqzbxevwd/uobdv9zPQ5AqJZk
         Euyw==
X-Forwarded-Encrypted: i=1; AJvYcCUbba0q0w27kd/fNggrQ/xfKVScGBWsVCAUc81aqzglkZLJceep4kDPQEGDmP8p4p9KSsX5xB8jKgWmDuk6aho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYlBgJPmm8tyG5MnC28t1SxwX7GXwWlWl8fib19f85x78cHzZ
	prvxAKi8gkqP7zivcJM7Uv9yNt3IutLe3HdP2qOMULBjdt9ti0A6WTTD
X-Gm-Gg: AeBDietpgubFm+SMeJWXczHmVkkOq3FSNYzkzmEiMhChSuB7VlAXTnU0QigDi5puEcS
	sXjP2vCEOI8r2Uh6YVjRuykDAEfMOd799O7aPB2TVtsDx3e1q3Y8SheyvAU8cNzPqkw+SfEgMLn
	leD1U9x5jdIBjZjzjM5EHHnm7UQ02M2/yZPKq6vSTr52qHs4x7Up5MMZ1bOn53M+UadMq7qnBKk
	bZP8ErgHm++Vgy/xfahuUNZoeJ5XIOKOO0dXaS9t7GAG24Y5rxKAHu/xXL2cmdDzoiLKYHWCZ7C
	YQyjS6fuQCvkGatAGpBaH78bupBfN+PQeZaw/YKPQ+2kGPJlsZ3BZNhuinJ7CYZY3JzWDlcweOn
	woLGxsyLifIvxAjt8q2XZbDB+++Z6J8Sw2EvCXdlQI92b8Oaorai2xczve9vWatdEwA7Ydd7X6u
	J0erDoCEyh0SQwdgASFyAtc2o+2aZD
X-Received: by 2002:a17:902:e790:b0:2b2:5840:80c4 with SMTP id d9443c01a7336-2b28176a79cmr199525645ad.25.1775580599252;
        Tue, 07 Apr 2026 09:49:59 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:43::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm173288085ad.52.2026.04.07.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:49:58 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	David Wei <dw@davidwei.uk>,
	Chris J Arges <carges@cloudflare.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: drv-net: ntuple: Add dst-ip, src-port, dst-port fields
Date: Tue,  7 Apr 2026 09:49:54 -0700
Message-ID: <20260407164954.2977820-3-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
References: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

Extend the ntuple flow steering test to cover dst-ip, src-port, and
dst-port fields. The test supports arbitrary combinations of the fields,
for now we test src_ip/dst_ip, and src_ip/dst_ip/src_port/dst_port.

The tests currently match full fields, but we can consider adding
support for masked fields in the future.

 TAP version 13
 1..24
 ok 1 ntuple.queue.tcp4.src_ip
 ok 2 ntuple.queue.tcp4.dst_ip
 ok 3 ntuple.queue.tcp4.src_port
 ok 4 ntuple.queue.tcp4.dst_port
 ok 5 ntuple.queue.tcp4.src_ip.dst_ip
 ok 6 ntuple.queue.tcp4.src_ip.dst_ip.src_port.dst_port
 ok 7 ntuple.queue.udp4.src_ip
 ok 8 ntuple.queue.udp4.dst_ip
 ok 9 ntuple.queue.udp4.src_port
 ok 10 ntuple.queue.udp4.dst_port
 ok 11 ntuple.queue.udp4.src_ip.dst_ip
 ok 12 ntuple.queue.udp4.src_ip.dst_ip.src_port.dst_port
 ok 13 ntuple.queue.tcp6.src_ip
 ok 14 ntuple.queue.tcp6.dst_ip
 ok 15 ntuple.queue.tcp6.src_port
 ok 16 ntuple.queue.tcp6.dst_port
 ok 17 ntuple.queue.tcp6.src_ip.dst_ip
 ok 18 ntuple.queue.tcp6.src_ip.dst_ip.src_port.dst_port
 ok 19 ntuple.queue.udp6.src_ip
 ok 20 ntuple.queue.udp6.dst_ip
 ok 21 ntuple.queue.udp6.src_port
 ok 22 ntuple.queue.udp6.dst_port
 ok 23 ntuple.queue.udp6.src_ip.dst_ip
 ok 24 ntuple.queue.udp6.src_ip.dst_ip.src_port.dst_port
 # Totals: pass:24 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../selftests/drivers/net/hw/ntuple.py        | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ntuple.py b/tools/testing/selftests/drivers/net/hw/ntuple.py
index c50b76198fba..12f0d395f825 100755
--- a/tools/testing/selftests/drivers/net/hw/ntuple.py
+++ b/tools/testing/selftests/drivers/net/hw/ntuple.py
@@ -9,11 +9,14 @@ from lib.py import ksft_eq, ksft_ge
 from lib.py import ksft_variants, KsftNamedVariant
 from lib.py import EthtoolFamily, NetDrvEpEnv, NetdevFamily
 from lib.py import KsftSkipEx
-from lib.py import cmd, ethtool, defer, rand_port, bkg, wait_port_listen
+from lib.py import cmd, ethtool, defer, rand_ports, bkg, wait_port_listen
 
 
 class NtupleField(Enum):
     SRC_IP = auto()
+    DST_IP = auto()
+    SRC_PORT = auto()
+    DST_PORT = auto()
 
 
 def _require_ntuple(cfg):
@@ -69,7 +72,7 @@ def _setup_isolated_queue(cfg):
     return random.randint(1, desired_queues - 1)
 
 
-def _send_traffic(cfg, ipver, proto, dst_port, pkt_cnt=40):
+def _send_traffic(cfg, ipver, proto, dst_port, src_port, pkt_cnt=40):
     """Generate traffic with the desired flow signature."""
 
     cfg.require_cmd("socat", remote=True)
@@ -86,28 +89,42 @@ def _send_traffic(cfg, ipver, proto, dst_port, pkt_cnt=40):
         send_cmd = f"""
         bash -c 'for i in $(seq {pkt_cnt}); do echo msg; sleep 0.02; done' |
         socat -{ipver} -u - \
-            {socat_proto}:{dst_addr}:{dst_port},reuseaddr{extra_opts}
+            {socat_proto}:{dst_addr}:{dst_port},sourceport={src_port},reuseaddr{extra_opts}
         """
         cmd(send_cmd, shell=True, host=cfg.remote)
 
 
 def _add_ntuple_rule_and_send_traffic(cfg, ipver, proto, fields, test_queue):
-    dst_port = rand_port()
+    ports = rand_ports(2)
+    src_port = ports[0]
+    dst_port = ports[1]
     flow_parts = [f"flow-type {proto}{ipver}"]
 
     for field in fields:
         if field == NtupleField.SRC_IP:
             flow_parts.append(f"src-ip {cfg.remote_addr_v[ipver]}")
+        elif field == NtupleField.DST_IP:
+            flow_parts.append(f"dst-ip {cfg.addr_v[ipver]}")
+        elif field == NtupleField.SRC_PORT:
+            flow_parts.append(f"src-port {src_port}")
+        elif field == NtupleField.DST_PORT:
+            flow_parts.append(f"dst-port {dst_port}")
 
     flow_parts.append(f"action {test_queue}")
     _ntuple_rule_add(cfg, " ".join(flow_parts))
-    _send_traffic(cfg, ipver, proto, dst_port=dst_port)
+    _send_traffic(cfg, ipver, proto, dst_port=dst_port, src_port=src_port)
 
 
 def _ntuple_variants():
     for ipver in ["4", "6"]:
         for proto in ["tcp", "udp"]:
-            for fields in [[NtupleField.SRC_IP]]:
+            for fields in [[NtupleField.SRC_IP],
+                           [NtupleField.DST_IP],
+                           [NtupleField.SRC_PORT],
+                           [NtupleField.DST_PORT],
+                           [NtupleField.SRC_IP, NtupleField.DST_IP],
+                           [NtupleField.SRC_IP, NtupleField.DST_IP,
+                            NtupleField.SRC_PORT, NtupleField.DST_PORT]]:
                 name = ".".join(f.name.lower() for f in fields)
                 yield KsftNamedVariant(f"{proto}{ipver}.{name}",
                                       ipver, proto, fields)
-- 
2.52.0

