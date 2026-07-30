Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269D3DF000
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405640; cv=none; b=Cb6fcNI4c2S+bEg2clOaPuVqL2snprAhuFHWr5BCr7pqzC9hzpBEm9jKMbRs1rYqX3o4pbUfz197HaogkkIB9G/EJM8e+wqV372JzlQ1a+peoqFcEPJZB8SFCz0C+ojPpC5JuVMFr+LSU62W96au314Bw1pISizsC7exmkXyJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405640; c=relaxed/simple;
	bh=M+EikJXOV5ueFth3iiiyE2gUNLf/QkhEf+GG9Ksx+o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maUd/IAxTPqGM8IJfSeyhu9eJVHsfTwvrk6Mj5sB5TEnfOuOVJWB5cQ72t/OGUMVfiXoLT7l8tNn6BRl7Mr6yzBWNi6YXazKlBTB8G2H9MpmrMy5o9Rgf34ElENSa5ywVnC/yx5MPVIsq3b4C+HjE9VTE8g/ZNBSIrZSwtEnsbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJVcZk90; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJVcZk90"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de0093c42so1466423f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405637; x=1786010437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brqEgrC204Q7R2Ht2zUutLTCuoa/Yw12EIf+KqcFosU=;
        b=rJVcZk90XgABKAAS7X3Z3Q4VZwrrfhvjMtWep4Necwy5l5G1G4pxfcKQQcWjYfLjWD
         Df9Tzl6GQVHId31JQoUYnbO4U11vUxqTUYeQy6CcmCNnH2ruSUZqe7ecgmyW/TLiKlG0
         joLT7JwMTctO9WlIJSRryLMnaxLZUlDaDc6WfAEQLHBUL5Z7bgs6yB9w6tSVPjzvEqxM
         RMd5WSEBkxVu+n8jV/TOW0saPkF9y8D44iAKEwAP9xlw6IBQXh07Js/m3cj94OX9+rbK
         +ZBBaqeF26pCMKemByQOQQrYVOCwKIi8SgHT1M69WJ44Do5w9AJP6eSRi4XJHrquz7Li
         Dlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405637; x=1786010437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brqEgrC204Q7R2Ht2zUutLTCuoa/Yw12EIf+KqcFosU=;
        b=JdsRCcgzgmKa508DS13YKeHsHz5/UFOpRTX3U+KapcveqlJntdaBAvnBi1LAHz17n9
         qcJ7iHwpCczrtW8o7LpYwVrmSXlePBBASzH0FF2qOY7vaFsrajH73nPP+WK1H6SckwXs
         l/6As3zRvuOWwQx10wzc/whJROaFkPsRbT4TP3oGQSxD31c1WzHPNxQchkjGi62FBkiJ
         Sjb2FOwRczuBIo7AzzsDwX0ZneLEq8hWF9Lg08bJsMdgq29glm4hRlo0ReVEzE3KVMwj
         wHyqC2PKew61frJ0fMrIqzwC8DVv4r9D8geyGOBCRZWGuNvvRTwwsl2THxWIXgssv5Vk
         E5Qg==
X-Forwarded-Encrypted: i=1; AHgh+RoJf6bej0m5wG7IvnmVczjEJID/uuj+WEic6eV1D3gtoYo8wLHvy2F12nkmmbe+ccEz+m+I7FUd7aqf0DILXaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmqQtuqPBCM5YY1tO+/PgKysCOudLl7qkBs78ZbOmxOTbFR0W
	A9Df9llvUzQ/wfTd8n61tCflm+mpeJbTHtAh78urZQZFUoeD3m/Mw8SU
X-Gm-Gg: AR+sD10kCQvCjJu96q3HgrNRYkB+BwaLyZ41FCh1xVQJ8pdhpvXlyEiJLI046vM52Af
	tmRs2QwFReX468o97gtDxJXJweT1g1ol/BwUFfDsKeL1n+WAE4Ozx0flUWUODMskxyD5c/+XL0N
	WoP35Q0/Q5o05GzGlTBur/q7fF6gPh5wmHYvp4bhRoZccz/WexxASvLlqrBEY2ZW6WXLPshKl+B
	CVf1ouxKNMpWjSiZlK5J4xz0nlM6UZjm330T/TNrjQqbt15HcKhtKNOZJM91GKFb4i/EI6+HMPM
	wKiWvurW0kyWXWWP6yihEbC2wgsgU4onhW0sB7S4F9CNxGdqZgFDDXn5+8urVT48RdZXhFK/EWy
	HqI9j4LnsrwsHKXsjhVkEIqVrQh7ZJyeGkYpWP+CAkaK5rVbP17vx1CTgxXl2JuwvQDxS8kv/hH
	zlR7PtCF4P+t46LYD9260UM7uZHSH1gsnWX0FUjS9tYDaR3djGQ1i424e4EbmCW7POnjwtsL2Qa
	VNOhG9/iThE
X-Received: by 2002:a05:6000:4a10:b0:47f:9720:4740 with SMTP id ffacd0b85a97d-47fc822dc64mr2244168f8f.37.1785405636307;
        Thu, 30 Jul 2026 03:00:36 -0700 (PDT)
Received: from pf-5j7x25.fkb.profitbricks.net ([2001:9e8:482:5000:a5d:311:98af:bd1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4721sm3984728f8f.16.2026.07.30.03.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:00:35 -0700 (PDT)
From: Reshma Sreekumar <reshmaisat@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reshma Sreekumar <reshmaisat@gmail.com>
Subject: [PATCH net 2/2] selftests: net: check that a disturbed qdisc dump is flagged
Date: Thu, 30 Jul 2026 12:00:06 +0200
Message-ID: <20260730100006.3547944-3-reshmaisat@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730100006.3547944-1-reshmaisat@gmail.com>
References: <20260730100006.3547944-1-reshmaisat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test for NLM_F_DUMP_INTR on RTM_GETQDISC.  A qdisc dump spans several
netlink batches once a few devices carry a full set of qdiscs, and RTNL is
only held while a single batch is filled, so the device list can change in
between and entries can be missed.

Netlink dumps are driven by the reader, so rather than racing against a
dump the test unregisters a device at a known point: it receives the first
batch, unregisters a dummy, then drains the rest.  This is deterministic --
one flagged message, every run.

A second case dumps without disturbing anything and requires that the flag
stays clear, so the test cannot be satisfied by a kernel that raises it
unconditionally.

Four dummy devices with mq + 16 fq + clsact each, read with a 4KiB buffer,
give 12 batches and run in about a second.  The test skips if dummy, mq, fq
or clsact are unavailable.

Signed-off-by: Reshma Sreekumar <reshmaisat@gmail.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/qdisc_dump_intr.py  | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100755 tools/testing/selftests/net/qdisc_dump_intr.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 708d960ae..769ee26ae 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -72,6 +72,7 @@ TEST_PROGS := \
 	pmtu.sh \
 	protodown.sh \
 	psock_snd.sh \
+	qdisc_dump_intr.py \
 	reuseaddr_ports_exhausted.sh \
 	reuseport_addr_any.sh \
 	route_hint.sh \
diff --git a/tools/testing/selftests/net/qdisc_dump_intr.py b/tools/testing/selftests/net/qdisc_dump_intr.py
new file mode 100755
index 000000000..9623847f4
--- /dev/null
+++ b/tools/testing/selftests/net/qdisc_dump_intr.py
@@ -0,0 +1,123 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Check that a qdisc dump disturbed by a device unregister reports
+NLM_F_DUMP_INTR.
+
+tc_dump_qdisc() walks every netdev in the netns and spans several netlink
+batches once there are more than a handful of qdiscs.  RTNL is only held
+while a single batch is filled, so the device list can change in between and
+the reply can miss entries.  Netlink dumps are driven by the reader, so this
+test unregisters a device at a known point between two batches rather than
+racing against one.
+"""
+
+import socket
+import struct
+
+from lib.py import ksft_run, ksft_exit, ksft_true, ksft_pr, KsftSkipEx
+from lib.py import CmdExitFailure, NetNS, NetNSEnter, ip, tc
+
+NETLINK_ROUTE = 0
+RTM_NEWQDISC = 36
+RTM_GETQDISC = 38
+NLMSG_DONE = 3
+NLM_F_REQUEST = 0x001
+NLM_F_DUMP = 0x300
+NLM_F_DUMP_INTR = 0x010
+
+NLMSGHDR = "=IHHII"
+TCMSG_LEN = 20          # struct tcmsg
+
+# tc parses handles as hex; 64: keeps the mq root clear of the fq children
+MQ_HANDLE = "64"
+CHANNELS = 16           # fq children per device
+NDEVS = 4               # 4 * (mq + 16 fq + clsact) is several batches worth
+BUFSZ = 4096            # small recv buffer keeps the kernel's batches small
+
+
+def _setup():
+    """Devices carrying enough qdiscs that a dump has to paginate."""
+    try:
+        for i in range(NDEVS):
+            ip(f"link add d{i} numtxqueues {CHANNELS} type dummy")
+            ip(f"link set d{i} up")
+            tc(f"qdisc replace dev d{i} root handle {MQ_HANDLE}: mq")
+            for q in range(1, CHANNELS + 1):
+                tc(f"qdisc replace dev d{i} parent {MQ_HANDLE}:{q:x} "
+                   f"handle {q:x}: fq")
+            tc(f"qdisc replace dev d{i} clsact")
+    except CmdExitFailure as exc:
+        raise KsftSkipEx("dummy, mq, fq or clsact unavailable") from exc
+
+
+def _dump(between_batches=None):
+    """
+    Walk an RTM_GETQDISC dump one batch at a time, optionally running
+    `between_batches` after the first batch.  Returns (batches, qdiscs,
+    messages carrying NLM_F_DUMP_INTR).
+    """
+    sk = socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, NETLINK_ROUTE)
+    try:
+        sk.bind((0, 0))
+        hdr = struct.pack(NLMSGHDR, struct.calcsize(NLMSGHDR) + TCMSG_LEN,
+                          RTM_GETQDISC, NLM_F_REQUEST | NLM_F_DUMP, 1, 0)
+        sk.send(hdr + bytes(TCMSG_LEN))
+
+        batches = qdiscs = intr = 0
+        done = False
+        while not done:
+            buf = sk.recv(BUFSZ)
+            batches += 1
+            off = 0
+            while off + 16 <= len(buf):
+                mlen, mtype, flags = struct.unpack_from("=IHH", buf, off)
+                if mlen < 16:
+                    break
+                if flags & NLM_F_DUMP_INTR:
+                    intr += 1
+                if mtype == NLMSG_DONE:
+                    done = True
+                elif mtype == RTM_NEWQDISC:
+                    qdiscs += 1
+                off += (mlen + 3) & ~3
+            if batches == 1 and not done and between_batches:
+                between_batches()
+        return batches, qdiscs, intr
+    finally:
+        sk.close()
+
+
+def dump_intr_on_unregister() -> None:
+    """Unregistering a device mid-dump must raise NLM_F_DUMP_INTR."""
+    ip("link add victim type dummy")
+
+    batches, qdiscs, intr = _dump(lambda: ip("link del victim"))
+
+    ksft_pr(f"{batches} batches, {qdiscs} qdiscs, {intr} flagged messages")
+    ksft_true(batches > 1, "dump did not paginate, nothing to disturb")
+    ksft_true(intr > 0,
+              "NLM_F_DUMP_INTR not set although a device was unregistered "
+              "while the dump was in flight")
+
+
+def dump_intr_absent_when_stable() -> None:
+    """An undisturbed dump must not raise NLM_F_DUMP_INTR."""
+    batches, qdiscs, intr = _dump()
+
+    ksft_pr(f"{batches} batches, {qdiscs} qdiscs, {intr} flagged messages")
+    ksft_true(batches > 1, "dump did not paginate, test is not meaningful")
+    ksft_true(intr == 0, "NLM_F_DUMP_INTR set on an undisturbed dump")
+
+
+def main() -> None:
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            _setup()
+            ksft_run(globs=globals(), case_pfx={"dump_"})
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.43.0

