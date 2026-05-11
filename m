Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7B2C159A
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538106; cv=none; b=SnZiyVW2bYL8gsJ1+2byLAJzgdaMRTa66XtsnjFqAwIxGhVvmv+MYxtkZOwr2sXxKy6VK1W1j0glP/+7VfkuBcAam+Geh34EgkvSpiFafdI7MhH50e9t2oJmz8idLOBm5gZpFuP5mnqzWGPYTmKnEifjV3qmkOwz5XsgzNV5kYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538106; c=relaxed/simple;
	bh=jjmM2GGitlEzN5iSzma8jtAOF8FHZhqXKOugnFy/DkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7vfO7GWKw5TOR29/ZVwJ7YS+NaNx4LIjzGO8qE7Il9SntZzQtkPOR+J+Q9JMEDz/r6cEBI4RwBSAdDY93ROp4DQElOcBpPrVtdo+GHiIZ0ILLw5wafYdl51JU7YsQGgvDadkAuRNjn8lh0GtgtYPRi9nigqbSEg0z2Yw/ixkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av8wErJC; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av8wErJC"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c477a3278so4906449d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778538104; x=1779142904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rktqOhL/WC+LFcBNVBl8EKTq1ERQ0ZB3bcN1+M0y/0E=;
        b=Av8wErJCJAFJEvr7zbANilFauaHEd0ZHnRiRJ0IzHqLHC4xF9y9e2yfBPsLKtmjZJ+
         56m9iVoleH2FTxyDI+I8os1L1pn2TOOf8oQse/L+mhlMMtbC32WbzDoebzhFbAabdNCO
         0U3p8WaZOxdEk7Nza/+WXICNaImj9+H5AO6KKtS3KlP6NextYh0jvgUN+KIzjF/ZxnNU
         8q3RDT2jdCta1b2AdiN7P97Q8O7q3nbaDOO1omwe0/w+f1zgY3owbWj++lMy4yt7USrB
         wgaeqLyevl6VYmEcleQvDEWxlzG9nqMmoMH/oVhtUa1mor7pVp9v/3XhECqZ8ExWb/cp
         bJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538104; x=1779142904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rktqOhL/WC+LFcBNVBl8EKTq1ERQ0ZB3bcN1+M0y/0E=;
        b=l1WZjnramXZ7ztMKsUTbvuDJjty5c+P6qibK2YuEvwMripGEGSIpPAEjC43O7IMzv3
         2bCxd8yqO7iD/QtnWIghrfqhcA/+BMaQTIAvAt/fDmKGILZ75UILS4oPNUl48/37BX7n
         3L0FJDVvQOFPJb84pCTFDjulZ0ipVt8ADQtez8escqtPVbcasLAyUZSAydP2NSvL6w6a
         8ICt53JsYj7UcpgaCZjdDWhFEx8m+vrv/xUBcJX2r4C33awADMqcK6ebx18mc4t0GeZ8
         HwD0ERxB5xjZ+TIEmxLFexQzBc2wEprsbWpsmthW6Ktor7DBEGWZri0FI1hvabJ3p9BZ
         kzvg==
X-Forwarded-Encrypted: i=1; AFNElJ/RhxWMag8ri5zHUYv1kBRvr4lyTW/+DU6Rp1gnk6bW2rKP4BsS94QEJXCgCSI3oDJ6x5uhe5VoKNTdgnu3igI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/t9dAnV1E6CgNU6tqX0VE51QwhlKMcd9llSYZ3OnsTJejdFIj
	sVGGyT0tvlF4Pj4J0+BIYmImzvbtOlDRAkBrW1IWlgXZgf/dqokEq+I6
X-Gm-Gg: Acq92OEIBzt2kx26w4vaZfAcgFm0SFd4Q8/9phrmaPi2nmwM616EwkMtEQPOvfUF9Kf
	YoUBkrd/XWFOVOMXmmwJixonH8JH1V+TTSL7mD28tZlVuJi7Q8yTvi22NHXKwSTUfQx2CMMWDgC
	Ie2RYfk35YbCE7EwZ1RBwmRLqQ4/uHGTvm2LC9JT0qEDfYRUlOKCE4DUzt2Tzy26GH5VLBDQERL
	cjcZf4MbcIntlU+vGZcRdhlz+MIFLSPgVL9T+0KOvarVH217SRv8fEAXVRJgvs37Dew1vga/4HN
	awXzZ5y7ycEMbC0BiNYFUvibre8J0phf/pIanutM/wtVJN2F6XCurU/kcZQ7vJIPzl7HAiH/5yz
	i2QxCV1Cr9tKB6EuVvG/qCCk4ibhgPxvqMHj47TqdTSgL4y9IXbq3FYdl16POkD6DKwO4aW2wzF
	uT1Y0Ddoq97KNJ7c1m58BhZSLkYMN4tDTSUrJOpwC8WSeduhl5FIpI5jyjZa8gjEr9jIgaIHEzv
	x18U3p88YkJRBc2FD1XSfjovGHMaJjXwBLWeg==
X-Received: by 2002:a05:690e:15cf:b0:651:be50:af09 with SMTP id 956f58d0204a3-65c79ad6df1mr18811474d50.3.1778538103818;
        Mon, 11 May 2026 15:21:43 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d969fb3b3sm6203476d50.1.2026.05.11.15.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:21:42 -0700 (PDT)
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
Subject: [PATCH net-next] selftests: drv-net: cope with slow env in so_txtime.py test
Date: Mon, 11 May 2026 18:19:20 -0400
Message-ID: <20260511222138.2045551-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

This test was converted from shell script to drv-net test.

The new version is flaky in dbg builds on the netdev.bots dashboard.
The previous shell script had more protections to avoid these. Added
in commit a7ee79b9c455 ("selftests: net: cope with slow env in
so_txtime.sh test").

Add the same overall protection:

- Suppress so_txtime process failure if KSFT_MACHINE_SLOW

Also relax two timeouts to reduce the number of process failures
themselves

- Increase SO_RCVTIMEO to 2 seconds
- Increase process start-up stabilization to 2 seconds

Delays were experimentally arrived at while running with vng
built with kernel/configs/debug.config

Fixes: 5c6baef3885c ("selftests: drv-net: convert so_txtime to drv-net")
Reported-by: Jakub Kicinski <kuba@kernel.org>
Closes: https://lore.kernel.org/netdev/20260510174219.74aeee6d@kernel.org/
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 tools/testing/selftests/drivers/net/so_txtime.c  | 10 ++++++++--
 tools/testing/selftests/drivers/net/so_txtime.py | 11 +++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/so_txtime.c b/tools/testing/selftests/drivers/net/so_txtime.c
index b6930883569b..75f3beef13d9 100644
--- a/tools/testing/selftests/drivers/net/so_txtime.c
+++ b/tools/testing/selftests/drivers/net/so_txtime.c
@@ -38,6 +38,7 @@
 static int	cfg_clockid	= CLOCK_TAI;
 static uint16_t	cfg_port	= 8000;
 static int	cfg_variance_us	= 4000;
+static bool	cfg_machine_slow;
 static uint64_t	cfg_start_time_ns;
 static int	cfg_mark;
 static bool	cfg_rx;
@@ -142,7 +143,7 @@ static void do_recv_one(int fdr, struct timed_send *ts)
 
 	if (llabs(tstop - texpect) > cfg_variance_us) {
 		fprintf(stderr, "exceeds variance (%d us)\n", cfg_variance_us);
-		if (!getenv("KSFT_MACHINE_SLOW"))
+		if (!cfg_machine_slow)
 			errors++;
 	}
 }
@@ -263,7 +264,7 @@ static void start_time_wait(void)
 	now = gettime_ns(CLOCK_REALTIME);
 	if (cfg_start_time_ns < now) {
 		fprintf(stderr, "FAIL: start time already passed\n");
-		if (!getenv("KSFT_MACHINE_SLOW"))
+		if (!cfg_machine_slow)
 			errors++;
 		return;
 	}
@@ -326,6 +327,9 @@ static int setup_rx(struct sockaddr *addr, socklen_t alen)
 	if (bind(fd, addr, alen))
 		error(1, errno, "bind");
 
+	if (cfg_machine_slow)
+		tv.tv_sec = 2;
+
 	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)))
 		error(1, errno, "setsockopt rcv timeout");
 
@@ -512,6 +516,8 @@ static void parse_opts(int argc, char **argv)
 	setup_sockaddr(domain, saddr, &cfg_src_addr);
 
 	cfg_num_pkt = parse_io(argv[optind], cfg_buf);
+
+	cfg_machine_slow = getenv("KSFT_MACHINE_SLOW");
 }
 
 int main(int argc, char **argv)
diff --git a/tools/testing/selftests/drivers/net/so_txtime.py b/tools/testing/selftests/drivers/net/so_txtime.py
index 5b54ce76dff4..e7de8fe22c1e 100755
--- a/tools/testing/selftests/drivers/net/so_txtime.py
+++ b/tools/testing/selftests/drivers/net/so_txtime.py
@@ -6,6 +6,7 @@
 Test delivery time in FQ and ETF qdiscs.
 """
 
+import os
 import time
 
 from lib.py import ksft_exit, ksft_run, ksft_variants
@@ -15,17 +16,23 @@ from lib.py import NetDrvEpEnv, bkg, cmd, defer, tc
 
 def test_so_txtime(cfg, clockid, ipver, args_tx, args_rx, expect_success):
     """Main function. Run so_txtime as sender and receiver."""
+    slow_machine = os.environ.get('KSFT_MACHINE_SLOW')
+
     bin_path = cfg.test_dir / "so_txtime"
 
-    tstart = time.time_ns() + 200_000_000
+    tstart = time.time_ns() + (2000_000_000 if slow_machine else 200_000_000)
 
     cmd_addr = f"-S {cfg.addr_v[ipver]} -D {cfg.remote_addr_v[ipver]}"
     cmd_base = f"{bin_path} -{ipver} -c {clockid} -t {tstart} {cmd_addr}"
     cmd_rx = f"{cmd_base} {args_rx} -r"
     cmd_tx = f"{cmd_base} {args_tx}"
 
+    expect_fail = not expect_success
+    if slow_machine:
+        expect_success = False
+
     with bkg(cmd_rx, host=cfg.remote, fail=expect_success,
-             expect_fail=(not expect_success), exit_wait=True):
+             expect_fail=expect_fail, exit_wait=True):
         cmd(cmd_tx)
 
 
-- 
2.54.0.563.g4f69b47b94-goog

