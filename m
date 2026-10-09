Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2383EEAC2
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526020; cv=none; b=AtCIZ7JmiI7j8VB56NWVwGBm66xNdX/9tR+A5lCskM61M55ebZZNT/mkHqPx1jdfwJBEwvBq6yoSsUk38M/SvTKa+vuYUEG3QHsKnaNZYD8MqascFkSXtrmIrmMNq89+QnJmFiiV/WMKpyuZDbReDw5bYg8PAUtVc9of4IiUsec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526020; c=relaxed/simple;
	bh=GnOnI8itiHFTc/AF4CXuTEtHAqBbGfRR4lLxX2VMwqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mcqKQCdljFW99Go5AjpXLOeDRveaplf38njK3t0lWipn2H5/yANobF4WpQQeUgoiAobSY4SQrtec+0UHmjjGPiH+ddkaEIRFBS71slwsn5BQ+CWNfq5tK/iJ/Nca3KBpAgmDGdCNcUeQKwrObL6IDzL6hJ6Jv3PDKvPv04nwf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guPVBrOd; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guPVBrOd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-354ba08cfd1so20197eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791526017; x=1792130817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrREWdiBwmodcHO5OMb9pfY4Vnn/1b6zElBdvtWj87U=;
        b=guPVBrOdMb6fd8hhT8lB8MXpDaNmrxodHcqawCSK406quGKteSKbdXWIbLx8/7B22v
         u9JgvWxn/iuoz5dKda6bLadXJKoEAf6Df/ha98gCgl+olU4SqZ3o/CGvt8tXrOKmNlgZ
         atFJzwtUqflgyyT4v/6rysg77E3sSyPptuIfBDqrom6/cwuN/MOjeLJuQlaYPOLRAgui
         3DOWeofO89qalIxi0KWYwQ0f7OpV6OnvNEF3Fd/JGkDl5fdGk1f2DD43Jo9JCmsUQvhj
         buTN9u7ZdnmEOgKmR9ZiUch3VhYCbh6i6hA6kV6Kx7xWlMWaC8R6RqyKfuhDRBfGwbEy
         BlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526017; x=1792130817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrREWdiBwmodcHO5OMb9pfY4Vnn/1b6zElBdvtWj87U=;
        b=nsljAy+HBY5sa4RrSDOQLMQ0Rsp1qzvY8waiBMqCvsyP1KPNcmS7jqHAJIeChTWsvs
         IPpp18EnL0D5Y4ajosT7fh4UQD27vMCb0Ujo8bGHq/Gz5eZ7tAdsED301o3PYRNYnGDV
         1eoL8C31w2FNwACoKsioPDTdaw1C/Fu7iTNZAnYiPy3SPw6PhuFA8r/SHGuS28pcHjl3
         VdoD79jYI7z/OadT5XRWGJKnIiOq0oUbcqMEQ6xm/JQn3fz6qDu6FlR9iky6rm84nB7C
         gf/fQZ8jKJlnZXCtqzLjZ0IbeMx+eJLJSn4gFJdrJUZOMwVp5YpwUwBS9GY89O84S3d/
         d6sg==
X-Forwarded-Encrypted: i=1; AKwUvByD+M+BLK5o9L2bHOpAlChmKbsi4drXbQr0eOZb7SU4QUEUEaG9f88lM7lGtFRxdyzhdL7syiZsw1PzWzBOeIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/QO1z5qm8tWf9/kDmsXLfM1qKizi+4zw26+Lc4rtxlMIHiAZ2
	CJVvzGWsho8S4xgzsjK5HCO34dcaDLU3KQEQnNARV8gi0M9Fqt3uicJ0
X-Gm-Gg: AYBFou3nIcT68M8coVja6NS3vcMuKGkLCRGAVopD0gl95h0e56NKI8ZCceUTIk5W22l
	w08o6/DoyEr985Rb0HB5P1hbL4zk8nHSXFsFZ5jLEffapYqLPJKoOJAbsIzn5LYqXYm0xfBPvIL
	rGO1qBkbcxi+Gb1c20N9OC0go4++ARe19IEE9lgVC0K2GHVJ9OgaLvq/1OBzrUYwo9bQInS4H00
	PsS45kuvMR8sZrZU+e45VLqQyLtAETbZ2d+TaWh1MPrrcKUriKvZwyN0rZy4ggrfrWCi+xjugUe
	ewpAddB9SSuL10OTnCyGNgmB8hET9DiTDabLDI6TpYNlUMEfkfJu7mYBJeco2FciWe97RDQEMjt
	BTqIfKqMOxjM361bNhArEz1Ts5/nYzyAe1+hV/H2AEAZAsnoNI2kRWWHMoE58ZKFvn711OWAP6O
	kdWg++ZWUMi3cbUaY2R0hB1iNkDSSxo2QBmNyKLsAUbs+52W0FjoBP/GJ96G2Vpe8Ze0+yN1dUo
	xysDUqncQPjUUiEt1t1Wy+t7vYTnv1thqa0PrWmFw5acmd4q3Nrhbef3FmQnA3yKFGfe+sNUd69
	CdSyCdBfldGpCIwLEiG5/3dmJ+WUuEpXWzPJCsHutX0=
X-Received: by 2002:a05:7300:8246:b0:351:36e1:8a14 with SMTP id 5a478bee46e88-3537e2412bemr1448137eec.30.1791526017043;
        Thu, 08 Oct 2026 23:06:57 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:56 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 3/3] selftests: net: add a test for the gtp netlink family
Date: Fri,  9 Oct 2026 06:06:15 +0000
Message-Id: <20261009060615.4177402-4-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the gtp generic netlink family through its ynl spec: create a
gtp device, add a PDP context with newpdp, check getpdp lists it and
delpdp removes it. Two more cases check that two contexts are dumped and
that deleting an unknown context fails.

Add a GtpFamily ynl wrapper and register the test.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 MAINTAINERS                                   |  1 +
 tools/testing/selftests/net/Makefile          |  1 +
 tools/testing/selftests/net/config            |  1 +
 tools/testing/selftests/net/gtp.py            | 85 +++++++++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |  5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |  8 +-
 6 files changed, 98 insertions(+), 3 deletions(-)
 create mode 100755 tools/testing/selftests/net/gtp.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a6e43995ea58..8ac817a78bb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11423,6 +11423,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
 F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
+F:	tools/testing/selftests/net/gtp.py
 
 GUID PARTITION TABLE (GPT)
 M:	Davidlohr Bueso <dave@stgolabs.net>
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index d4ca82fec0b4..6b54e04a6430 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -46,6 +46,7 @@ TEST_PROGS := \
 	fq_band_pktlimit.sh \
 	gre_gso.sh \
 	gre_ipv6_lladdr.sh \
+	gtp.py \
 	icmp.sh \
 	icmp_redirect.sh \
 	io_uring_zerocopy_tx.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 737e7e6327b3..c4534e15fb7a 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -15,6 +15,7 @@ CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_DUMMY=y
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_IFB=y
 CONFIG_INET_DIAG=y
 CONFIG_INET_ESP=y
diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
new file mode 100755
index 000000000000..fcc9bf57a663
--- /dev/null
+++ b/tools/testing/selftests/net/gtp.py
@@ -0,0 +1,85 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for the gtp netlink family."""
+
+from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_eq, ksft_in, ksft_not_in, ksft_raises
+from lib.py import KsftSkipEx
+from lib.py import NetNS, NetNSEnter
+from lib.py import GtpFamily, NlError
+from lib.py import CmdExitFailure
+from lib.py import ip, defer
+
+
+def _add_gtp_dev(ns):
+    try:
+        ip("link add gtp0 type gtp role ggsn", ns=str(ns))
+    except CmdExitFailure:
+        raise KsftSkipEx("no gtp support (CONFIG_GTP, iproute2)")
+    defer(ip, "link del gtp0", ns=str(ns))
+    ip("link set gtp0 up", ns=str(ns))
+    return ip("-d link show gtp0", ns=str(ns), json=True)[0]["ifindex"]
+
+
+def _iteis(contexts):
+    return [c.get("i-tei") for c in contexts]
+
+
+def add_del_pdp(gtp, ns) -> None:
+    """Add a PDP context, query it, then delete it.
+
+    The query must return the context with the TEIDs and addresses
+    it was created with, and it must be gone after the delete.
+    """
+    link = _add_gtp_dev(ns)
+
+    gtp.newpdp({"link": link, "version": 1,
+                "i-tei": 0x100, "o-tei": 0x200,
+                "ms-address": "10.0.0.1", "peer-address": "192.0.2.1"})
+
+    pdp = [c for c in gtp.getpdp({}, dump=True) if c.get("i-tei") == 0x100]
+    ksft_eq(len(pdp), 1)
+    ksft_eq(pdp[0]["o-tei"], 0x200)
+    ksft_eq(pdp[0]["ms-address"], "10.0.0.1")
+    ksft_eq(pdp[0]["peer-address"], "192.0.2.1")
+
+    gtp.delpdp({"link": link, "version": 1,
+                "i-tei": 0x100, "ms-address": "10.0.0.1"})
+    ksft_not_in(0x100, _iteis(gtp.getpdp({}, dump=True)))
+
+
+def add_two_pdp(gtp, ns) -> None:
+    """Add two PDP contexts and check both are returned."""
+    link = _add_gtp_dev(ns)
+
+    for i_tei, o_tei, ms in ((0x111, 0x211, "10.0.1.1"),
+                             (0x112, 0x212, "10.0.1.2")):
+        gtp.newpdp({"link": link, "version": 1,
+                    "i-tei": i_tei, "o-tei": o_tei,
+                    "ms-address": ms, "peer-address": "192.0.2.5"})
+
+    iteis = _iteis(gtp.getpdp({}, dump=True))
+    ksft_in(0x111, iteis)
+    ksft_in(0x112, iteis)
+
+
+def del_unknown_pdp(gtp, ns) -> None:
+    """Deleting a context that was never added must fail."""
+    link = _add_gtp_dev(ns)
+    with ksft_raises(NlError):
+        gtp.delpdp({"link": link, "version": 1,
+                    "i-tei": 0x999, "ms-address": "10.9.9.9"})
+
+
+def main() -> None:
+    """Run the PDP context tests in a temporary netns."""
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            gtp = GtpFamily()
+        ksft_run([add_del_pdp, add_two_pdp, del_unknown_pdp], args=(gtp, ns))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 71df5880b356..e269a260d58e 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -18,7 +18,7 @@ from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
 from .bpf import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
 from .ynl import NlError, NlctrlFamily, YnlFamily, \
     EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily, RtnlRouteFamily
-from .ynl import NetshaperFamily, DevlinkFamily, PSPFamily, Netlink
+from .ynl import NetshaperFamily, DevlinkFamily, GtpFamily, PSPFamily, Netlink
 
 __all__ = ["KSRC",
            "KsftFailEx", "KsftSkipEx", "KsftXfailEx", "ksft_pr", "ksft_eq",
@@ -32,6 +32,7 @@ __all__ = ["KSRC",
            "wait_port_listen", "ctl_file_write", "wait_file", "tool", "tc",
            "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
            "NetdevSim", "NetdevSimDev",
-           "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
+           "NetshaperFamily", "DevlinkFamily", "GtpFamily", "PSPFamily",
+           "NlError",
            "YnlFamily", "EthtoolFamily", "NetdevFamily", "RtnlFamily",
            "NlctrlFamily", "RtnlAddrFamily", "RtnlRouteFamily", "Netlink"]
diff --git a/tools/testing/selftests/net/lib/py/ynl.py b/tools/testing/selftests/net/lib/py/ynl.py
index 08deff756f29..7edb74971023 100644
--- a/tools/testing/selftests/net/lib/py/ynl.py
+++ b/tools/testing/selftests/net/lib/py/ynl.py
@@ -31,7 +31,7 @@ __all__ = [
     "NlError", "NlPolicy", "Netlink", "YnlFamily", "SPEC_PATH",
     "EthtoolFamily", "RtnlFamily", "RtnlAddrFamily", "RtnlRouteFamily",
     "NetdevFamily", "NetshaperFamily", "NlctrlFamily", "DevlinkFamily",
-    "PSPFamily",
+    "GtpFamily", "PSPFamily",
 ]
 
 #
@@ -85,3 +85,9 @@ class PSPFamily(YnlFamily):
     def __init__(self, recv_size=0):
         super().__init__((SPEC_PATH / Path('psp.yaml')).as_posix(),
                          schema='', recv_size=recv_size)
+
+
+class GtpFamily(YnlFamily):
+    def __init__(self, recv_size=0):
+        super().__init__((SPEC_PATH / Path('gtp.yaml')).as_posix(),
+                         schema='', recv_size=recv_size)
-- 
2.25.1

