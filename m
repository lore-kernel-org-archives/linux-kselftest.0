Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DC43E51C8
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916470; cv=none; b=MOqnA0IIxZPNgnHsDEmJtto0C/f+biiZlE1xs+bwQ4SRbW6bvty72Lub6NL7SITSSfYDPCWDcNtNKgn6KYHbxf9VpimNHCpqusk1CcuK4CPFdZm/JoxlwF3n4Pw20QgCx3TW2VcJu0VKYPVND1l9DpNq4wW58Pn5D1E4FFeQnUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916470; c=relaxed/simple;
	bh=zYUVSpiXhHTmDjiujAIfVnHAH/1qEBrxGCeDySThCwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxpI8dYMPzPh3WXS6FZ94p/Qr0+gonvFPI3iKqO8n1SQMAc6yh7gaUPfOtVstjYvaOX+eiw11cuGX2RiklDuwV39NAq3SR954LWRtDr35uePtVim3TB6UahiPqDu503YhJA5R8WwHh9B5OxXA01XY/N+ZMkTD/fOs0/K6A+yPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anEnZWLU; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anEnZWLU"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64d5a7926cfso4184974d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916468; x=1778521268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzIhheS+NGP/mNKJHmVLLoaBY+K6YTZh9xibPDED74c=;
        b=anEnZWLUjel2GhRBqTeDtiQcURkNCaBm6ry3Phfckx6S2v1jkG2tv+DZ19wJtF8nS+
         id4WsIqBcQ2U5o2YAG7YHkEXofSkAkyFrYSGdek4dDa7ka7a1WCoEk+8V7wbXlmwmy9S
         E2+MTS5x88pi0SXnuu+QnAMqNdGFGofZmDnZQxsh83SMhQgZuS+IDHPk+4P/Qhp8Qucn
         9XRHSlKo4yf+YX4ZX6cyVV0FQzXUR9zXM/w6pC63DyzcZvXv2MPupRqMoRgJ/bAG/9kq
         knVOYxcMbJobbpYznFBC1GXgPriKqKmmLrPp6WB68zWlMK/yGo+tx2p05fDo1R+5mbWk
         dkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916468; x=1778521268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzIhheS+NGP/mNKJHmVLLoaBY+K6YTZh9xibPDED74c=;
        b=qpeRbUo3AyckWsemwe3Er1rYFRrppOMeVJ3B6fg/4cz4Zv3AkGczjWwafOdxP/7sTs
         gcQ/N7womfqiwOau/02x8jJmEK4l82VSlhYWcUezjq8q/o87pDRlFq73mT0wsLB4vLAn
         nYMiI3d1CZTVCPf1vv6UCIpSO4lb2cfrNrGAx1vsOgHaj5XMYAPnC/iCmLGLpIeJTkMO
         QHqSAfBTTDwnXh8EilUBhnzhKaaC9d644Zw5nV55ZGwQRdmXd0ZG5C/5ZThy/ktkOc0b
         yC1GS1tGDiS3TC8bGl499ugAZvrPZk0VauaSjL9GMQBhaeiH2p9PEnpUScdp52pI2RIR
         kkgw==
X-Forwarded-Encrypted: i=1; AFNElJ+lOf9c9oPSNn0shcn01SbPVCaqEpcpmKq7HKfcAeVxm0Z4tJZxBvhNr9UJbdKZZTgwqQcn5mX91x+FMFLZ4Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsCLH19AyOwcGWRmBhl2YBgMi4f0PmeoXMAq04RZa8CejjSgn
	/zrvs35m8+13T9mK6ZXClD+REzaHCEciw3J7eSL41tuPwAY/jAYf5px8/qxBdA==
X-Gm-Gg: AeBDietjPt18Z+C0qJzsTJa+GrICx+4ZPssGgaszBRAFoULalqrhqosQ/aOHV8udcBH
	ndBnr9kHYtqKccH0w5gIR2azblwU9AaCxM/ilCL1+dF5f8fmpfSmp0I1TQFwINd6Eh6n5B7usuU
	jwla1t3VC2q8ZzmkjzBcSrKqzQg8gUTaYUI+puVHAeqIgxA82JYNJHp4ChXyzRdTgXZoedpXTkb
	DY/vmIEQfwiEB3D8aAbFvMcVcS2LJHt2+NwooMm01EiqYDPNne27a5XZhzyVzTdQGDw+59oEoNw
	IBHVNx7vHk8679wpHhIuRRvzDQEnP/fdHCuoI6vJsTsRRjBgv7ThDZGQ1Z3LNjJ39npEG/7w8fp
	l8fL+KKxRYZdOngpVRuQVLnS0VFe0NhN8e1IznRlWga2agecwYkQDBHVCdpHtndPcotSW6F4SnY
	psSbBtacY82f5S43GtJwOSdtsE4vzLrtVFD9tBFXJnWniJH2lLiU0L62aD2OSN9kOxR6eOHWV8v
	V4OzjAGHzNC041z/j7U32ql4uWdRdNtCqgRcw==
X-Received: by 2002:a05:690e:b4d:b0:654:1261:8ba4 with SMTP id 956f58d0204a3-65c3d9ba2bcmr10200857d50.19.1777916467257;
        Mon, 04 May 2026 10:41:07 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d0cbsm51551767b3.35.2026.05.04.10.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:41:06 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v7 3/3] selftests: drv-net: convert so_txtime to drv-net
Date: Mon,  4 May 2026 13:38:34 -0400
Message-ID: <20260504174056.565319-4-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
References: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

In preparation for extending to pacing hardware offload, convert the
so_txtime.sh test to a drv-net test that can be run against netdevsim
and real hardware.

Also update so_txtime.c to not exit on first failure, but run to
completion and report exit code there. This helps with debugging
unexpected results, especially when processing multiple packets,
as happens in the "reverse_order" testcase.

Signed-off-by: Willem de Bruijn <willemb@google.com>

----

v6 -> v7

- update test to use new argument expect_fail
- v6 received Reviewed-by, but dropped due to above (minor) change

v5 -> v6

- fix order in tools/testing/selftests/drivers/net/config

v4 -> v5

- move qdisc setup/restore into each test
- add tc to utils.py (separate patch)
- test expected failure (separate patch)
- fix pylint
- convert fail to pass for timing errors if KSFT_MACHINE_SLOW
  (cmd does not special case KSFT_SKIP process returncode yet)

Responses to sashiko review

- The test converts per packet failure to errors, to continue
  testing other packets, but other error() cases are not in scope.
- The test starts sender and receiver at an absolute future time,
  like the original test. This assumes ~msec scale sync'ed clocks.
- The tc qdisc replace command works fine with noqueue. Tested
  manually.

v3 -> v4

- restore original qdisc after test
- drop unnecessary underscore in tap test names

v2 -> v3

- Makefile: so_txtime from YNL_GEN_FILES to TEST_GEN_FILES (Sashiko, NIPA)

v1 -> v2
- move so_txtime.c for net/lib to drivers/net (Jakub)
- fix drivers/net/config order (Jakub)
- detect passing when failure is expected (Jakub, Sashiko)
- pass pylint --disable=R (Jakub)
- only call ksft_run once (Jakub)
- do not sleep if waiting time is negative (Sashiko)
- add \n when converting error() to fprintf() (Sashiko)
- 4 space indentation, instead of 2 space
- increase sync delay from 100 to 200ms, to fix rare vng flakes
---
 .../testing/selftests/drivers/net/.gitignore  |   1 +
 tools/testing/selftests/drivers/net/Makefile  |   2 +
 tools/testing/selftests/drivers/net/config    |   2 +
 .../selftests/{ => drivers}/net/so_txtime.c   |  25 +++-
 .../selftests/drivers/net/so_txtime.py        |  96 +++++++++++++++
 tools/testing/selftests/net/.gitignore        |   1 -
 tools/testing/selftests/net/Makefile          |   2 -
 tools/testing/selftests/net/so_txtime.sh      | 110 ------------------
 8 files changed, 121 insertions(+), 118 deletions(-)
 rename tools/testing/selftests/{ => drivers}/net/so_txtime.c (96%)
 create mode 100755 tools/testing/selftests/drivers/net/so_txtime.py
 delete mode 100755 tools/testing/selftests/net/so_txtime.sh

diff --git a/tools/testing/selftests/drivers/net/.gitignore b/tools/testing/selftests/drivers/net/.gitignore
index 585ecb4d5dc4..e5314ce4bb2d 100644
--- a/tools/testing/selftests/drivers/net/.gitignore
+++ b/tools/testing/selftests/drivers/net/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 napi_id_helper
 psp_responder
+so_txtime
diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index b72080c6d06b..d5bf4cb638a8 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -7,6 +7,7 @@ TEST_INCLUDES := $(wildcard lib/py/*.py) \
 
 TEST_GEN_FILES := \
 	napi_id_helper \
+	so_txtime \
 # end of TEST_GEN_FILES
 
 TEST_PROGS := \
@@ -21,6 +22,7 @@ TEST_PROGS := \
 	queues.py \
 	ring_reconfig.py \
 	shaper.py \
+	so_txtime.py \
 	stats.py \
 	xdp.py \
 # end of TEST_PROGS
diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index fd16994366f4..2309109a94ec 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -8,5 +8,7 @@ CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETCONSOLE_EXTENDED_LOG=y
 CONFIG_NETDEVSIM=m
+CONFIG_NET_SCH_ETF=m
+CONFIG_NET_SCH_FQ=m
 CONFIG_VLAN_8021Q=m
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/net/so_txtime.c b/tools/testing/selftests/drivers/net/so_txtime.c
similarity index 96%
rename from tools/testing/selftests/net/so_txtime.c
rename to tools/testing/selftests/drivers/net/so_txtime.c
index b76df1efc2ef..b6930883569b 100644
--- a/tools/testing/selftests/net/so_txtime.c
+++ b/tools/testing/selftests/drivers/net/so_txtime.c
@@ -33,6 +33,8 @@
 #include <unistd.h>
 #include <poll.h>
 
+#include "kselftest.h"
+
 static int	cfg_clockid	= CLOCK_TAI;
 static uint16_t	cfg_port	= 8000;
 static int	cfg_variance_us	= 4000;
@@ -43,6 +45,8 @@ static bool	cfg_rx;
 static uint64_t glob_tstart;
 static uint64_t tdeliver_max;
 
+static int errors;
+
 /* encode one timed transmission (of a 1B payload) */
 struct timed_send {
 	char	data;
@@ -131,13 +135,15 @@ static void do_recv_one(int fdr, struct timed_send *ts)
 	fprintf(stderr, "payload:%c delay:%lld expected:%lld (us)\n",
 			rbuf[0], (long long)tstop, (long long)texpect);
 
-	if (rbuf[0] != ts->data)
-		error(1, 0, "payload mismatch. expected %c", ts->data);
+	if (rbuf[0] != ts->data) {
+		fprintf(stderr, "payload mismatch. expected %c\n", ts->data);
+		errors++;
+	}
 
 	if (llabs(tstop - texpect) > cfg_variance_us) {
 		fprintf(stderr, "exceeds variance (%d us)\n", cfg_variance_us);
 		if (!getenv("KSFT_MACHINE_SLOW"))
-			exit(1);
+			errors++;
 	}
 }
 
@@ -255,8 +261,12 @@ static void start_time_wait(void)
 		return;
 
 	now = gettime_ns(CLOCK_REALTIME);
-	if (cfg_start_time_ns < now)
+	if (cfg_start_time_ns < now) {
+		fprintf(stderr, "FAIL: start time already passed\n");
+		if (!getenv("KSFT_MACHINE_SLOW"))
+			errors++;
 		return;
+	}
 
 	err = usleep((cfg_start_time_ns - now) / 1000);
 	if (err)
@@ -513,5 +523,10 @@ int main(int argc, char **argv)
 	else
 		do_test_tx((void *)&cfg_src_addr, cfg_alen);
 
-	return 0;
+	if (errors) {
+		fprintf(stderr, "FAIL: %d errors\n", errors);
+		return KSFT_FAIL;
+	}
+
+	return KSFT_PASS;
 }
diff --git a/tools/testing/selftests/drivers/net/so_txtime.py b/tools/testing/selftests/drivers/net/so_txtime.py
new file mode 100755
index 000000000000..5b54ce76dff4
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/so_txtime.py
@@ -0,0 +1,96 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Regression tests for the SO_TXTIME interface.
+
+Test delivery time in FQ and ETF qdiscs.
+"""
+
+import time
+
+from lib.py import ksft_exit, ksft_run, ksft_variants
+from lib.py import KsftNamedVariant, KsftSkipEx
+from lib.py import NetDrvEpEnv, bkg, cmd, defer, tc
+
+
+def test_so_txtime(cfg, clockid, ipver, args_tx, args_rx, expect_success):
+    """Main function. Run so_txtime as sender and receiver."""
+    bin_path = cfg.test_dir / "so_txtime"
+
+    tstart = time.time_ns() + 200_000_000
+
+    cmd_addr = f"-S {cfg.addr_v[ipver]} -D {cfg.remote_addr_v[ipver]}"
+    cmd_base = f"{bin_path} -{ipver} -c {clockid} -t {tstart} {cmd_addr}"
+    cmd_rx = f"{cmd_base} {args_rx} -r"
+    cmd_tx = f"{cmd_base} {args_tx}"
+
+    with bkg(cmd_rx, host=cfg.remote, fail=expect_success,
+             expect_fail=(not expect_success), exit_wait=True):
+        cmd(cmd_tx)
+
+
+def _qdisc_setup(ifname, qdisc, optargs=""):
+    """Replace root qdisc. Restore the original after the test.
+
+    If the original is mq, children will be of type default_qdisc.
+    """
+    orig = tc(f"qdisc show dev {ifname} root", json=True)[0].get("kind", None)
+    defer(tc, f"qdisc replace dev {ifname} root {orig}")
+    tc(f"qdisc replace dev {ifname} root {qdisc} {optargs}")
+
+
+def _test_variants_mono():
+    for ipver in ["4", "6"]:
+        for testcase in [
+            ["no_delay", "a,-1", "a,-1"],
+            ["zero_delay", "a,0", "a,0"],
+            ["one_pkt", "a,10", "a,10"],
+            ["in_order", "a,10,b,20", "a,10,b,20"],
+            ["reverse_order", "a,20,b,10", "b,20,a,20"],
+        ]:
+            name = f"v{ipver}_{testcase[0]}"
+            yield KsftNamedVariant(name, ipver, testcase[1], testcase[2])
+
+
+@ksft_variants(_test_variants_mono())
+def test_so_txtime_mono(cfg, ipver, args_tx, args_rx):
+    """Run all variants of monotonic (fq) tests."""
+    _qdisc_setup(cfg.ifname, "fq")
+    test_so_txtime(cfg, "mono", ipver, args_tx, args_rx, True)
+
+
+def _test_variants_etf():
+    for ipver in ["4", "6"]:
+        for testcase in [
+            ["no_delay", "a,-1", "a,-1", False],
+            ["zero_delay", "a,0", "a,0", False],
+            ["one_pkt", "a,10", "a,10", True],
+            ["in_order", "a,10,b,20", "a,10,b,20", True],
+            ["reverse_order", "a,20,b,10", "b,10,a,20", True],
+        ]:
+            name = f"v{ipver}_{testcase[0]}"
+            yield KsftNamedVariant(
+                name, ipver, testcase[1], testcase[2], testcase[3]
+            )
+
+
+@ksft_variants(_test_variants_etf())
+def test_so_txtime_etf(cfg, ipver, args_tx, args_rx, expect_fail):
+    """Run all variants of etf tests."""
+    try:
+        _qdisc_setup(cfg.ifname, "etf", "clockid CLOCK_TAI delta 400000")
+    except Exception as e:
+        raise KsftSkipEx("tc does not support qdisc etf. skipping") from e
+
+    test_so_txtime(cfg, "tai", ipver, args_tx, args_rx, expect_fail)
+
+
+def main() -> None:
+    """Boilerplate ksft main."""
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run([test_so_txtime_mono, test_so_txtime_etf], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 97ad4d551d44..02ad4c99a2b4 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -40,7 +40,6 @@ skf_net_off
 socket
 so_incoming_cpu
 so_netns_cookie
-so_txtime
 so_rcv_listener
 stress_reuseport_listen
 tap
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a275ed584026..d53670c0d7a2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -83,7 +83,6 @@ TEST_PROGS := \
 	rxtimestamp.sh \
 	sctp_vrf.sh \
 	skf_net_off.sh \
-	so_txtime.sh \
 	srv6_end_dt46_l3vpn_test.sh \
 	srv6_end_dt4_l3vpn_test.sh \
 	srv6_end_dt6_l3vpn_test.sh \
@@ -157,7 +156,6 @@ TEST_GEN_FILES := \
 	skf_net_off \
 	so_netns_cookie \
 	so_rcv_listener \
-	so_txtime \
 	socket \
 	stress_reuseport_listen \
 	tcp_fastopen_backup_key \
diff --git a/tools/testing/selftests/net/so_txtime.sh b/tools/testing/selftests/net/so_txtime.sh
deleted file mode 100755
index 5e861ad32a42..000000000000
--- a/tools/testing/selftests/net/so_txtime.sh
+++ /dev/null
@@ -1,110 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-#
-# Regression tests for the SO_TXTIME interface
-
-set -e
-
-readonly ksft_skip=4
-readonly DEV="veth0"
-readonly BIN="./so_txtime"
-
-readonly RAND="$(mktemp -u XXXXXX)"
-readonly NSPREFIX="ns-${RAND}"
-readonly NS1="${NSPREFIX}1"
-readonly NS2="${NSPREFIX}2"
-
-readonly SADDR4='192.168.1.1'
-readonly DADDR4='192.168.1.2'
-readonly SADDR6='fd::1'
-readonly DADDR6='fd::2'
-
-cleanup() {
-	ip netns del "${NS2}"
-	ip netns del "${NS1}"
-}
-
-trap cleanup EXIT
-
-# Create virtual ethernet pair between network namespaces
-ip netns add "${NS1}"
-ip netns add "${NS2}"
-
-ip link add "${DEV}" netns "${NS1}" type veth \
-  peer name "${DEV}" netns "${NS2}"
-
-# Bring the devices up
-ip -netns "${NS1}" link set "${DEV}" up
-ip -netns "${NS2}" link set "${DEV}" up
-
-# Set fixed MAC addresses on the devices
-ip -netns "${NS1}" link set dev "${DEV}" address 02:02:02:02:02:02
-ip -netns "${NS2}" link set dev "${DEV}" address 06:06:06:06:06:06
-
-# Add fixed IP addresses to the devices
-ip -netns "${NS1}" addr add 192.168.1.1/24 dev "${DEV}"
-ip -netns "${NS2}" addr add 192.168.1.2/24 dev "${DEV}"
-ip -netns "${NS1}" addr add       fd::1/64 dev "${DEV}" nodad
-ip -netns "${NS2}" addr add       fd::2/64 dev "${DEV}" nodad
-
-run_test() {
-	local readonly IP="$1"
-	local readonly CLOCK="$2"
-	local readonly TXARGS="$3"
-	local readonly RXARGS="$4"
-
-	if [[ "${IP}" == "4" ]]; then
-		local readonly SADDR="${SADDR4}"
-		local readonly DADDR="${DADDR4}"
-	elif [[ "${IP}" == "6" ]]; then
-		local readonly SADDR="${SADDR6}"
-		local readonly DADDR="${DADDR6}"
-	else
-		echo "Invalid IP version ${IP}"
-		exit 1
-	fi
-
-	local readonly START="$(date +%s%N --date="+ 0.1 seconds")"
-
-	ip netns exec "${NS2}" "${BIN}" -"${IP}" -c "${CLOCK}" -t "${START}" -S "${SADDR}" -D "${DADDR}" "${RXARGS}" -r &
-	ip netns exec "${NS1}" "${BIN}" -"${IP}" -c "${CLOCK}" -t "${START}" -S "${SADDR}" -D "${DADDR}" "${TXARGS}"
-	wait "$!"
-}
-
-do_test() {
-	run_test $@
-	[ $? -ne 0 ] && ret=1
-}
-
-do_fail_test() {
-	run_test $@
-	[ $? -eq 0 ] && ret=1
-}
-
-ip netns exec "${NS1}" tc qdisc add dev "${DEV}" root fq
-set +e
-ret=0
-do_test 4 mono a,-1 a,-1
-do_test 6 mono a,0 a,0
-do_test 6 mono a,10 a,10
-do_test 4 mono a,10,b,20 a,10,b,20
-do_test 6 mono a,20,b,10 b,20,a,20
-
-if ip netns exec "${NS1}" tc qdisc replace dev "${DEV}" root etf clockid CLOCK_TAI delta 400000; then
-	do_fail_test 4 tai a,-1 a,-1
-	do_fail_test 6 tai a,0 a,0
-	do_test 6 tai a,10 a,10
-	do_test 4 tai a,10,b,20 a,10,b,20
-	do_test 6 tai a,20,b,10 b,10,a,20
-else
-	echo "tc ($(tc -V)) does not support qdisc etf. skipping"
-	[ $ret -eq 0 ] && ret=$ksft_skip
-fi
-
-if [ $ret -eq 0 ]; then
-	echo OK. All tests passed
-elif [[ $ret -ne $ksft_skip && -n "$KSFT_MACHINE_SLOW" ]]; then
-	echo "Ignoring errors due to slow environment" 1>&2
-	ret=0
-fi
-exit $ret
-- 
2.54.0.545.g6539524ca2-goog

