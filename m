Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80839A070
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773304; cv=none; b=dhKtS6431lUCEGQYh/xnFFCWJbCbh8TD3Cyv0XUw0QjuN2uvIkR/Lmu1FvotZWU5MiSqJoxHpsHWxHktyd0z3KkmXj4yGXYLbieMK3hmvrOJB3jyskCSRCXD0ORAeppaGjGJekUpshl9sbq+eC1Qx9QVQUCseQ4X0BvSuivNDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773304; c=relaxed/simple;
	bh=/TI/F3FF9JO9ukV0i4JufUs30694px5Zwa4tJVvmNck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RiISUntYrGmMc7wFDCZlG3OOggL8HicvJeH2lSUeiZoZtguhO3iMvgDIqB+0WFLl2R9d6PjV/0Y9vGE421os/FQLbfZOAAY95ObAvlKnhpxvNaOhtWM4BuU1u0OqexyfG4uNLq9R1i2ipqxQt3SvStMmpSjyGr9ZaJSr9A20J24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kL9Qz6+4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kL9Qz6+4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2584838eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773302; x=1792378102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4paDxoIITi61KNSLOFKPmDlHO1cv1pKbtjNPgmcPaw=;
        b=kL9Qz6+4k+4ITBTzn2WQeM6GWSqpdA2CtvdcZlPr833x6xL9ApzjCL/t6dZz94VJgK
         r5UXR3KxSYPc6i/Tr/4Ap8YwoiQMg9l7LIJgME26Ph1W8ichPSX8toZJ/qVXkyINJIW3
         rrKppf9PE2GVawz2fjhX0dXe/l2FQ8mloANBGNynA9qOlfSXFNt1copbEFAlly1TLFBO
         i/ex63s1yLh1aEYsPV3F1CHn+qiONPP+eQTK3K4HVgXvCf4hGNvAAUP87Uo6uEi00iG2
         XRcsYJg1hIB+6Lx3x5SM49WA7Io+SlvCzLs3+SpSkcmhFXz2Ss9JCKvELOvz5mNKIbAq
         GbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773302; x=1792378102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4paDxoIITi61KNSLOFKPmDlHO1cv1pKbtjNPgmcPaw=;
        b=05hn03e73QUKxzQSfhOS1ZEJ3WpMG09pH0Uss//WMjr0vhCOf6O44KQG0HdM44fDou
         Al7KtwyUs7amwfeZuXTibokhyj9o7pbmJp33BoxCXUhTD0myUKCi1KBXURra1kiamgEb
         7om/EDzPJT0Krviw8tuwpNFxQrd3Njt/AmORY3O4tMwjmNO0nu3vtcu+swDcXahMyVJU
         y5um+EKkPHSeC/vdPofUcWoU8xhmoAJgIvcIRdDqBpdsxGD0S0yNWUKYBWlfiDxnuD9a
         csWOKMcY62LcEZWmGVU6CCZ6OC48Z0mKvw8rnV3ezGUbiIUpdXdJ1nkLRZGM5AScNw3J
         Nf2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMf0sZzxKFHhsq3jRWybbQ6JZCHYi+bR75ZOflT7YDWZuDBxtUy9hp2Zt3QYnTE1sE2fuDhnFJ3+p07IQoxoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnflkcWsgT9NUfZI3QVtkqTpLw280dIjzldMZKtHVEfVVx0dIr
	MHTuyeztHzfgmw+hXMP39l9vvzz1DfrSNuDgDWONuDhPLSQbjiibaAwf
X-Gm-Gg: AYBFou1jLFqulZgfmRgX9Iozc3a84/gxdJMZz1VpejrE6XBfr4nPDFjwbT3Yg1fi90A
	QShNI0mTslyoikk/+/aiFpHe3T2Z0pt2uRRKrnEj+2gj98xJnT2GEMRDpfnsveEQAZd0MLp+x6g
	cjVRQfp/MwbqwJmOmMFsDPpzkUmpnu4dkB+9MahOo40LKHkiNjpi9ShiAYg0nb9o0QcXdlkND65
	2gzbDpe8Lhop40ge7mZUuRcRg6kt0zYrYiWHPNrtD+ZPKKkPjSKPQm892TntseykT4leEsWYzRU
	dgEeCLGaRbnBA0TZvsYGwbQyAoE+0neV/bE8xtFsql44PWP01NVtQkuUvYU33eVrVR1Es4Asl0C
	1G/oNY2sV1A3mCbf3gLHWJ4E+YBEBm6XoaJlWLqcFLaNycjhWvW62V7fxmfd09Y8H+p/P0S+eik
	00MGPUiMI35TuL167KPMyD1dIYlW+GX6c3T/i2epoP46HHkBJPyxhIT+ui6u6fwlV44xjytNoHO
	y/iMD5geKA6189lDMcxcA2FzTS7Fg5OSkqYXD5pqgQ5NU14wkRiwOqwO1lBYdweMnzDGaMONxNu
	FerII8MSJjDo9gJmyQYipzXsEcnr16BktVEo7iRx8s4=
X-Received: by 2002:a05:693c:69cc:b0:351:4a53:ddbd with SMTP id 5a478bee46e88-3537dede999mr12464402eec.1.1791773302121;
        Sun, 11 Oct 2026 19:48:22 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm26075299eec.6.2026.10.11.19.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:48:21 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v5 3/3] selftests: net: add a test for the gtp netlink family
Date: Mon, 12 Oct 2026 02:48:00 +0000
Message-Id: <20261012024800.400616-4-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
References: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
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
 tools/testing/selftests/net/gtp.py            | 122 ++++++++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 6 files changed, 135 insertions(+), 3 deletions(-)
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
index 000000000000..199bc4409190
--- /dev/null
+++ b/tools/testing/selftests/net/gtp.py
@@ -0,0 +1,122 @@
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
+_NO_GTP_ERRORS = ("Operation not supported", "Garbage instead of arguments")
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

