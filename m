Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2B47535D
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143179; cv=none; b=Qu2tZ0Gja4feXs8UT4LoBK7G0goSV2qQMyPIoAHP/VYvdh5qLQTBol8AXebHtisQ2FJuQFUkzYEVcyKEz5Pbnon9gl4PYzoOm11i0UXEcQfFN12hILHS8Eyx0ABQRm6RaKRMgF6MrqLdMTTh7VElHGfl+WlsEcJNAUuaksI0ZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143179; c=relaxed/simple;
	bh=WL3wUIMkwwoPY1trwqCqPuiTCJPxhOE48Ga4j+J8YxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZ9GW4j29C3gbGoZlMtGh68YtDFk6vc+LY54qsfDKlRuZ7s2RB4fZOGzQT/RqhNrwHlIq7tJAwdxV2u+9hhOSgXesFqZy0brlNOHaC4B8WgQNYh0SRo61lBiXktLOYMLteFc9OFc6H1EHyNGIxp9BZe/aOwCrgaSzv7tG5ITzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwnG2uY7; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwnG2uY7"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so909748eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143176; x=1792747976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hejOVt37x/utq4gG5Lp53Db9B5jQdRD2zxHIuxDYm5c=;
        b=cwnG2uY7FEsnSsDJH9ph5p2KvAI6Pj6PySZSzu94Yyd+TxRxQZb9F6Sy7fpOZr7+Pe
         WNAAN49JIL2vxoRWyQjBSqxyo+rdJzJqgvDJ/yugpJNwaiumZzSRJcDv0FY0j8UqnEdw
         t/CifHxeHF5CTINTy3liWZAtB3ZMLNhtmkABq+wLStr6HdlCNuOhcdK3+KYWK7nblclE
         yGZ8HGkWYuXAeY8wy6qKiIUyjpe+DvWkW6/4EMNxmboYYZ6O20XdPTc06Q11mB+typGm
         eFncXbrA38FQ+cwzCWky5RiYFs3CjZjXErdKDhrssu2JN/xrAKH8McJczJt8lz+AOdxw
         HsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143176; x=1792747976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hejOVt37x/utq4gG5Lp53Db9B5jQdRD2zxHIuxDYm5c=;
        b=BPLh4eH3G/sU2Xw10XMIP53YQAaxXnPP/g1LHH+YgKufvK3OYK7Qqm+aL50vmucvWQ
         EjpoCJKzExwfnz39owokIQxFvw68z2+J5YpO8cT+yMTUXFleB0/zDGWpPGp6W8E3+mtU
         WPV8FB6aABltVQyU1+Yn4AKz/C3gMATGIuJv+KFF3FWlQEtd3f7Y7rKv3PBaITfuCCGD
         uWcYMlZSOdHYwwLoLiobkhPHIUlT7yXYeRlM7L5k7bS77t/IxCwjImz5LuFQHW9Pj1aY
         s6fxEFcErtEsVQcBjfiDBblQuOL7o2FDpx6fR6ReJqHfhfh7qHnFe3U8fipXSGCQW5xf
         gLGA==
X-Forwarded-Encrypted: i=1; AKwUvBymi7Rj9DRGMegtFSVGVOl+7tnTwovmmovBtgPVosfRhTvBljBKPo4cB8mjUQrcvWsmDdT24+j/lGcmfxtRJd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxqnEA02iw/BbFoMz4IKO6ldP3pS3jvARSq7ammlLlz/oo/rJT
	FSNugqu/eiaJiETgM5udjV76O/Q0Q4GVuAI7K4oSoBqw6IGNRWK7Tk0J
X-Gm-Gg: AYBFou2d174mLnOwrsUxlgrvt+iU/bkQd7pqZi9P8mooVpQ593g0ABQzkmoCoBVkH/a
	sJUvC8UNEKn4IIPXLOH/7mNZiNpfViH1EU6LHL2YM5Uq2+E0OpCswnIsCdhfdFTTCyyyixPeuUZ
	ne14Mfb/PSkK7JsOTtDyrSLv4H5TUKRiX3ZL9HIzjFttIT4bRwHyeEtXDJQ/bQsvveb2mXehoSI
	xS1li9X2Si6VVnLEnTUOA+jcChVukvevJZwl7h04G7tBRj0QC7NVIsnYC62Q9WMvY9H92+pTDeD
	/zp1Y2u9ptvM4Z48NvbYxOdw4223iT/JPJGRz28fNmxwsAYu/i2Ex52SQunnDTaA7dqksbBL5ZM
	csBPvGUgmrlgLVjeipMhV6CxHouPoTlmWnPRXn/QhkZpob6GmLKfU+vMpqPNKmg6o7nEsoo+UhK
	kyUNFr6DZuXpr3KBvj/+XuaD3U1lcx2NhZ3EUuvai0GFS8RFw8ArrAU9joO9E2e1qp8sFY8tLNj
	xLWC4tm95FBOt/CuYj25Dyk965nxG4AHoJJTQ5ar9LjLKajZft2UVzy8VSsUJ6o9IKMRMoZJb0r
	zNDBMSVOgQIgK6PncwaHX3NFJUm5uByrexf+Ni5csFQ=
X-Received: by 2002:a05:701b:2405:b0:155:734:9cc9 with SMTP id a92af1059eb24-1825a19724dmr3014474c88.16.1792143175843;
        Fri, 16 Oct 2026 02:32:55 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm5157172eec.18.2026.10.16.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:32:55 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v7 4/4] selftests: net: add a test for the gtp netlink family
Date: Fri, 16 Oct 2026 09:32:25 +0000
Message-Id: <20261016093225.1036375-5-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
References: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the gtp generic netlink family through its ynl spec: create a
gtp device, add a PDP context with newpdp, check getpdp dumps it on that
device with the expected TEIDs and addresses, and that delpdp by TEI
removes it. Two more cases check that two contexts are dumped and one
can be deleted by its MS address, and that deleting an unknown context
fails with ENOENT, both by TEI and by MS address.

ynl resolves the family ids once per process, with a CTRL_CMD_GETFAMILY
dump which does not autoload modules, so the gtp device is created
before the family handle: that loads gtp.ko through its rtnl link alias.
The test is skipped when the kernel or iproute2 lack GTP support; any
other failure to create the device fails it.

Add a GtpFamily ynl wrapper and register the test.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            | 123 ++++++++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   9 +-
 6 files changed, 137 insertions(+), 3 deletions(-)
 create mode 100755 tools/testing/selftests/net/gtp.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 42df33aea837..8489c37f06fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,6 +11424,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
 F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
+F:	tools/testing/selftests/net/gtp.py
 
 GUID PARTITION TABLE (GPT)
 M:	Davidlohr Bueso <dave@stgolabs.net>
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 54beea2e348c..df5bcc55ea8e 100644
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
index d355cf980597..cb8cb4696df7 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -16,6 +16,7 @@ CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_DUMMY=y
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_IFB=y
 CONFIG_INET_DIAG=y
 CONFIG_INET_ESP=y
diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
new file mode 100755
index 000000000000..d793ca7b70d2
--- /dev/null
+++ b/tools/testing/selftests/net/gtp.py
@@ -0,0 +1,123 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for the gtp netlink family."""
+
+import errno
+
+from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_eq, ksft_in, ksft_not_in, ksft_raises
+from lib.py import KsftSkipEx
+from lib.py import NetNS, NetNSEnter
+from lib.py import GtpFamily, NlError
+from lib.py import CmdExitFailure
+from lib.py import ip, defer
+
+_NO_GTP_ERRORS = ("Unknown device type", "Operation not supported",
+                  "Garbage instead of arguments")
+
+
+def _setup(ns):
+    """Return a gtp family handle, and the ifindex of a new gtp device.
+
+    Create the device first: that loads gtp.ko through its rtnl link
+    alias. ynl resolves the family ids once per process, with a
+    CTRL_CMD_GETFAMILY dump which does not autoload modules, so the
+    family must be registered before the first family handle is created.
+    """
+    try:
+        ip("link add gtp0 type gtp role ggsn", ns=str(ns))
+    except CmdExitFailure as e:
+        # gtp.ko not available, or iproute2 without gtp support: any other
+        # failure to create the device is a real error.
+        if not any(msg in e.cmd.stderr for msg in _NO_GTP_ERRORS):
+            raise
+        raise KsftSkipEx("no gtp support (CONFIG_GTP, iproute2)") from e
+    defer(ip, "link del gtp0", ns=str(ns))
+    ip("link set gtp0 up", ns=str(ns))
+    link = ip("-d link show gtp0", ns=str(ns), json=True)[0]["ifindex"]
+
+    with NetNSEnter(str(ns)):
+        gtp = GtpFamily()
+    defer(gtp.close)
+
+    return gtp, link
+
+
+def _contexts(gtp, link):
+    return [c for c in gtp.getpdp({}, dump=True) if c.get("link") == link]
+
+
+def _iteis(contexts):
+    return [c.get("i-tei") for c in contexts]
+
+
+def add_del_pdp(ns) -> None:
+    """Add a PDP context, query it, then delete it by TEI.
+
+    The dump must return the context with the link, TEIDs and addresses
+    it was created with, and it must be gone after the delete. The delete
+    only identifies the context by its TEI, to use the GTPv1 TEI lookup.
+    """
+    gtp, link = _setup(ns)
+
+    gtp.newpdp({"link": link, "version": 1,
+                "i-tei": 0x100, "o-tei": 0x200,
+                "ms-address": "10.0.0.1", "peer-address": "192.0.2.1"})
+
+    pdp = [c for c in _contexts(gtp, link) if c.get("i-tei") == 0x100]
+    ksft_eq(len(pdp), 1)
+    ksft_eq(pdp[0]["o-tei"], 0x200)
+    ksft_eq(pdp[0]["ms-address"], "10.0.0.1")
+    ksft_eq(pdp[0]["peer-address"], "192.0.2.1")
+
+    gtp.delpdp({"link": link, "version": 1, "i-tei": 0x100})
+    ksft_not_in(0x100, _iteis(_contexts(gtp, link)))
+
+
+def add_two_pdp(ns) -> None:
+    """Add two PDP contexts, check both are dumped, delete one by address.
+
+    The delete identifies the context by its MS address, and must leave
+    the other context in place.
+    """
+    gtp, link = _setup(ns)
+
+    for i_tei, o_tei, ms in ((0x111, 0x211, "10.0.1.1"),
+                             (0x112, 0x212, "10.0.1.2")):
+        gtp.newpdp({"link": link, "version": 1,
+                    "i-tei": i_tei, "o-tei": o_tei,
+                    "ms-address": ms, "peer-address": "192.0.2.5"})
+
+    iteis = _iteis(_contexts(gtp, link))
+    ksft_in(0x111, iteis)
+    ksft_in(0x112, iteis)
+
+    gtp.delpdp({"link": link, "version": 1, "ms-address": "10.0.1.1"})
+    iteis = _iteis(_contexts(gtp, link))
+    ksft_not_in(0x111, iteis)
+    ksft_in(0x112, iteis)
+
+
+def del_unknown_pdp(ns) -> None:
+    """Deleting a context that was never added must fail with ENOENT.
+
+    Both lookups are checked: by TEI, and by MS address.
+    """
+    gtp, link = _setup(ns)
+
+    for attrs in ({"i-tei": 0x999}, {"ms-address": "10.9.9.9"}):
+        with ksft_raises(NlError) as cm:
+            gtp.delpdp({"link": link, "version": 1, **attrs})
+        ksft_eq(cm.exception.error, errno.ENOENT)
+
+
+def main() -> None:
+    """Run the PDP context tests in a temporary netns."""
+    with NetNS() as ns:
+        ksft_run([add_del_pdp, add_two_pdp, del_unknown_pdp], args=(ns,))
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
index 08deff756f29..69a6e9d9b390 100644
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
@@ -85,3 +85,10 @@ class PSPFamily(YnlFamily):
     def __init__(self, recv_size=0):
         super().__init__((SPEC_PATH / Path('psp.yaml')).as_posix(),
                          schema='', recv_size=recv_size)
+
+
+class GtpFamily(YnlFamily):
+    """YNL family for gtp, see Documentation/netlink/specs/gtp.yaml."""
+    def __init__(self, recv_size=0):
+        super().__init__((SPEC_PATH / Path('gtp.yaml')).as_posix(),
+                         schema='', recv_size=recv_size)
-- 
2.25.1

