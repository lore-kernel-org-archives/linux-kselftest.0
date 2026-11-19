Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115632;
	b=uCFxjG3DeQBCc800iZL3qR3Acc/hlE2BKA8xkg2VT0xkkiKXDtxqOiVMdpRHPQ5JtzC6
	 W0oAfvTfWQuJAE+lUdq/oc4h4vnnY6ms5vTNj8IOTBWb0iZS0OJAUK8ccHS5Y0CZw4hS/
	 logW+LehZisZcnM7Id1eXsWQVCEtzjxjWh6720Ntj2y2sLqkcXXMlRH9/aXkQlNSHbkhA
	 7AyZOBDMWak1R0j1c/NIFL/xUK7Fq69znufwoOMX5J9mvP9EXQo+pTrBKA0VGWeu+IPnZ
	 hg6SgnRValOHWMpbvU/06+QZsQhANrrrDnEr1ZMOwBuHktznuaiRvnZKvKKfNqzRnnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pS1sHDEv0rKpO6+FzjhDMsARIPspEVx0QQujY1U80Ik=;
	b=NyCKkgOSCIr5GboZhGI/skb6UVu5QasV9uRh7mVbL/QJSEa8XzyHMwfp9+I1xD8V8PJ0
	 TVSLJJYKmDdJ/5NSivzjJZ3hV9xt3PPMgqqxeP0JiTmzogwTHxoKJdFl23xP4u0KWYBY9
	 sNwrUhOB66BRNHkTM1JhPJdGj6aDI6Vz4DrRiRY3MHYh0cip028W6wULUKV+qVsCYhXmx
	 qlE2Y1e2gmuGUEx1ai1hNLRUpCLVBVzLDPuwQYKB4Q5/LqWpcVzraUwlGyMTBEoKqswUD
	 DU13heDozu6fZPRXgKpQ11pwdYb+HMieYdpqoGvocaGws946K1EbaBCIOkEby6c1r0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ik8sbPDq;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D067606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 19:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D067606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ik8sbPDq
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cddac941ed1so43163a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795115631; x=1795720431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pS1sHDEv0rKpO6+FzjhDMsARIPspEVx0QQujY1U80Ik=;
        b=Ik8sbPDqf6Dazl+PduhAp9D46Jmy/17dg1Ltm+V55nPn5hC0CWBwAQlA61JX31YfrV
         7otf0/PVe796ahW6lx0k34r5CG9s7zop6lo5h0exxdIJ5k4d0XQrOJp4BszZZ++nmme3
         28Al2R+0SBJcUJbeY2jae/Z3E+K9O3nc+5JfgyhCeQ6ZLkf5Aa6dgc/2LoaCxOf7aD2t
         ZphYvNgbImhL5moGo2zvXfG0uFEyUUOZAAXq6q7NChJ6GAed3DFeNYy6IhVCpdogcN6g
         HfEP9zR/5d7EhWmvrw4Repcd28nYuaqWGDH46MNtDNW2wjV/IXPukF65nEJbiL+Qj+gr
         GCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115631; x=1795720431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pS1sHDEv0rKpO6+FzjhDMsARIPspEVx0QQujY1U80Ik=;
        b=hErRJfnW0VRGTGqhvnaTsg4GWVSR4mbza9gTjQBb43LiUs6T118C9rwXbidpnvCE5g
         SKhnxFfS6FzjGEVkFfp6iffzISXd5Fk37QsssLA4exBGhWic6kkd7FODU5hKF7FhMgsO
         0xIb66PACbRYtNyVD66ykYYb47sh6Hh7DC3rThc7rwQJdXj0PthMtUZ0q4wdcH+DQIH4
         iv+TCeorBkHsxCpnKzruhuwRrg9+lH1M9Pb49RucJsCCNAlvBj1/D2F2bOYfTwxYUby5
         96nyuHn3qEStqxWcU07hiuG31CLMZxcYZsbvl5FI8h17Wl3DciWYUZe7JO1Dyx1OmXcw
         MR1w==
X-Forwarded-Encrypted: i=1; AL+hErFffXNBWNt6sWTZ7qW5bEa5CnhhXANbmREM/45GFnhL9FaIGcGBHvMLbmkMPGZxLU6GIkWnTStoVQUB7G0TgKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I6QewyNAOQ6YQJPXM4nSDMwoQEO4hgJ4ARm9livvc1mz1rT8U
	LGOBE3/DI/QSfC2fukDvjBgQUFAFmR3UWJNMHRgMUXnfYYvByYorx9lL9zoR0d3J86orP6YHjgQ
	VmgZH42oPNBnYXn7f+uhPxj+UaSRMI5NCdAOz
X-Gm-Gg: AZFdTZf0+hG8kBBf+eiEYl2IeHC179A/BUtIUYVhIB6c+NUh8ISlaq3IVc9e8/JcH5P
	oEqVawL8e7kDgj5BkKTB2cYRq9x1FAdwU381dzuCS1nIWFfcGr2ohPLk14z7onFVemp0zzlJiL5
	ewD2KvNSpC8+XmXnGue60S3IqB8aYaKtMGySJg2E+1qhOFfzn769APcLF6XQqpo9cyz0C6kXiJT
	gq6Xp01tvO182teDc/eM6Pn1PgLzNKBgc8T0MBEHHlt7Y0dSg4LozSknnFhkMUxB/oGDimcajnZ
	ZFqN/8Lt4xRVTzrWQqyY8D7lvpCdOTl6I/VFTbrjrBVsNB7xdW5cGJMuhhhjqFdZltF5odPL5/N
	2OTSp0ly7ZDwV55DskmcH0cv1hSbKN6LO/Zo=
X-Received: by 2002:a17:90b:5407:b0:3b3:c998:6d6e with SMTP id 98e67ed59e1d1-3b41c961528mr252910a91.37.1795115630124;
        Thu, 19 Nov 2026 11:13:50 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm296867a91.8.2026.11.19.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:13:50 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 37E7F400FB;
	Thu, 19 Nov 2026 12:13:49 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 351CCDC1565; Thu, 19 Nov 2026 12:13:49 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 3/3] selftests: net: add TLS offload over bond tests
Date: Thu, 19 Nov 2026 12:13:39 -0700
Message-ID: <20261119191341.4089157-3-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119191341.4089157-1-rjethwani@purestorage.com>
References: <20261119191341.4089157-1-rjethwani@purestorage.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run the kTLS HW offload echo test over a single-slave balance-xor bond
with xmit_hash_policy layer3+4, which maps each socket to a fixed slave
and so lets it offload, without needing an LACP partner. The bond takes
over the NIC's MAC and addresses, so the peer sees no change.

test_tls_offload_bond checks that the slave did the offload.

test_tls_offload_bond_bounce takes the slave down while the client is
paused halfway, moving the socket to the TX SW fallback, which over a
bond runs at both master and slave and must encrypt only once. "idle"
brings the slave back before the client resumes; "inflight" keeps it
down until after, so the first record on resume goes out on retransmit.

Enslaving or bouncing the slave makes the NIC retrain for seconds, so
the cases wait for carrier and peer reachability before starting the
helpers. The helper gains -P to pause the client via ksft_ready() and
ksft_wait(), and -T to widen its timeouts to cover the retraining.

Tested on a pair of mlx5 hosts: the bond cases pass, and both bounce
cases report an echo mismatch without the fix.

Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../selftests/drivers/net/hw/tls_hw_offload.c |  57 ++++-
 .../drivers/net/hw/tls_hw_offload.py          | 203 +++++++++++++++++-
 3 files changed, 247 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index 081155bf7847..ee658188670a 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -1,3 +1,4 @@
+CONFIG_BONDING=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_FAIL_FUNCTION=y
 CONFIG_FAULT_INJECTION=y
diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
index 5b3887f32b68..0be321866a97 100644
--- a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
+++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
@@ -24,6 +24,8 @@
 #include <netdb.h>
 #include <linux/tls.h>
 
+#include "../../../net/lib/ksft.h"
+
 #ifndef SOL_TLS
 #define SOL_TLS 282
 #endif
@@ -81,14 +83,19 @@ static int random_size_max;
  * fixed setup/summary lines, comfortably inside a 64 KiB pipe.
  */
 static int verbose;
-
-/* Upper bound on a helper's lifetime, enforced by SIGALRM. The harness
- * waits for both helpers with the default 20s cmd()/bkg() timeout and
- * cannot signal the one on the remote, so each must exit on its own first.
- * A normal run takes a few seconds; the socket timeouts catch most stalls
- * sooner and with a better error.
+/* Pause the client halfway through (-P) until the harness releases it. */
+static int pause_mid;
+
+/* Upper bound on a helper's lifetime, enforced by SIGALRM. On a timeout
+ * the harness can only kill the ssh client of the remote helper, not the
+ * helper itself, so each must exit on its own first. A normal run takes a
+ * few seconds; the socket timeouts catch most stalls sooner and with a
+ * better error. -T raises both, keeping the lifetime above the I/O timeout.
  */
 #define HELPER_TIMEOUT_S	15
+#define IO_TIMEOUT_S		8
+static int io_timeout_s = IO_TIMEOUT_S;
+static int helper_timeout_s = HELPER_TIMEOUT_S;
 
 static const char *cipher_name(int cipher)
 {
@@ -152,7 +159,7 @@ static void configure_echo_socket(int fd, int payload)
  */
 static void set_io_timeouts(int fd)
 {
-	struct timeval tv = { .tv_sec = 8, .tv_usec = 0 };
+	struct timeval tv = { .tv_sec = io_timeout_s, .tv_usec = 0 };
 
 	setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
 	setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
@@ -388,6 +395,13 @@ static int do_client(void)
 			printf("Sent %zd bytes (iteration %d)\n", n, i);
 		if (client_recv_echo(csk, buf, echo_buf, n) < 0)
 			goto out;
+
+		if (pause_mid && i == num_iterations / 2) {
+			printf("Pausing after iteration %d\n", i);
+			ksft_ready();
+			ksft_wait();
+			printf("Resumed\n");
+		}
 	}
 
 	test_result = 0;
@@ -751,6 +765,9 @@ static void print_usage(const char *prog)
 	printf("  -c <cipher>   Cipher: 128 or 256 (default: 128)\n");
 	printf("  -n <N>        Send/echo iterations (default: 100)\n");
 	printf("  -t <type>     Record type test: 21=alert, 22=handshake\n");
+	printf("  -P            Pause halfway (client): ksft_ready(), ksft_wait()\n");
+	printf("  -T <sec>      Send/recv timeout and lifetime bound (default: %d)\n",
+	       IO_TIMEOUT_S);
 	printf("  -V            Verbose: log every iteration\n");
 	printf("  -h            Show this help message\n");
 	printf("\nExample:\n");
@@ -779,7 +796,6 @@ int main(int argc, char *argv[])
 	 * is not lost in the stdio buffer.
 	 */
 	setvbuf(stdout, NULL, _IOLBF, 0);
-	alarm(HELPER_TIMEOUT_S);
 
 	if (argc < 2 ||
 	    (strcmp(argv[1], "server") && strcmp(argv[1], "client"))) {
@@ -789,7 +805,7 @@ int main(int argc, char *argv[])
 	is_server = !strcmp(argv[1], "server");
 
 	optind = 2; /* skip subcommand */
-	while ((opt = getopt(argc, argv, "s:p:b:r:c:v:n:t:V46h")) != -1) {
+	while ((opt = getopt(argc, argv, "s:p:b:r:c:v:n:t:T:PV46h")) != -1) {
 		switch (opt) {
 		case 's':
 			server_ip = optarg;
@@ -797,6 +813,17 @@ int main(int argc, char *argv[])
 		case 'V':
 			verbose = 1;
 			break;
+		case 'P':
+			pause_mid = 1;
+			break;
+		case 'T':
+			io_timeout_s = atoi(optarg);
+			if (io_timeout_s < 1 || io_timeout_s > 120) {
+				printf("ERROR: -T out of range 1..120\n");
+				return 1;
+			}
+			helper_timeout_s = 2 * io_timeout_s + 15;
+			break;
 		case '4':
 			if (force_family == AF_INET6) {
 				printf("ERROR: -4 and -6 are exclusive\n");
@@ -865,6 +892,11 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
+	if (pause_mid && (test_record_type || num_iterations < 2)) {
+		printf("ERROR: -P needs echo mode and -n >= 2\n");
+		return 1;
+	}
+
 	if (test_record_type && random_size_max) {
 		printf("ERROR: -t cannot be combined with -r\n");
 		return 1;
@@ -879,6 +911,10 @@ int main(int argc, char *argv[])
 			printf("warning: -r is ignored in server mode\n");
 			random_size_max = 0;
 		}
+		if (pause_mid) {
+			printf("warning: -P is ignored in server mode\n");
+			pause_mid = 0;
+		}
 	} else {
 		if (!server_ip) {
 			printf("ERROR: Client requires -s <ip> option\n");
@@ -886,6 +922,9 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	/* After option parsing, so that -T applies. */
+	alarm(helper_timeout_s);
+
 	printf("TLS Version: %s\n", version_name(tls_version));
 	printf("Cipher: %s\n", cipher_name(cipher_type));
 	printf("Address family: %s\n",
diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
index e720ce654761..345d5fd9a5e9 100755
--- a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
+++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
@@ -3,15 +3,20 @@
 
 """Test kTLS hardware offload using a C helper binary."""
 
+import time
 from collections import defaultdict
 
 from lib.py import (
     CmdExitFailure,
+    KsftFailEx,
     KsftNamedVariant,
     KsftSkipEx,
     NetDrvEpEnv,
     bkg,
     cmd,
+    defer,
+    ip,
+    ksft_disruptive,
     ksft_eq,
     ksft_exit,
     ksft_ge,
@@ -19,9 +24,20 @@ from lib.py import (
     ksft_run,
     ksft_variants,
     rand_port,
+    wait_file,
     wait_port_listen,
 )
 
+BOND_IFNAME = "tlsbond0"
+
+# Send/recv timeout (-T) for -P cases: the echo stalls for as long as the
+# bounced link takes to retrain, seconds on a real NIC.
+PAUSE_IO_TIMEOUT_S = 45
+
+# How long bounce_inflight() keeps the slave down: far longer than the
+# released client takes to send, and well inside PAUSE_IO_TIMEOUT_S.
+INFLIGHT_OUTAGE_S = 2
+
 # `ethtool -S` counters on the DUT NIC, from the minimum set every TLS
 # offload driver should report (Documentation/networking/tls-offload.rst,
 # "Statistics"). Drivers expose varying subsets: mlx5 has all four, nfp
@@ -198,7 +214,7 @@ def verify_tls_counters(stats_before, stats_after, is_dut, hw_directions=()):
 
 def run_tls_test(cfg, cipher="128", tls_version="1.2",
                  buffer_size=None, random_max=None, ipver="4",
-                 record_type=None):
+                 record_type=None, pause=None):
     """Run the TLS offload test.
 
     The DUT runs the TLS client and the remote runs the echo server.
@@ -213,6 +229,11 @@ def run_tls_test(cfg, cipher="128", tls_version="1.2",
     kTLS because TLS is pairwise, but verify_tls_counters() requires HW
     offload only in enabled DUT directions. The peer and the DUT's other
     direction may use SW kTLS.
+
+    pause: if set, the client stops halfway through the echo, pause(cfg)
+           runs, and the client resumes once it returns. pause() may hand
+           back a handle to work it scheduled to run after that point,
+           which is reaped here once the echo is done.
     """
     require_tls_setup(cfg)
 
@@ -228,8 +249,14 @@ def run_tls_test(cfg, cipher="128", tls_version="1.2",
     port = rand_port()
     send_size = random_max or buffer_size
 
+    # -T only for -P cases; the rest keep the short, loud timeouts.
+    io_opt = f"-T {PAUSE_IO_TIMEOUT_S}" if pause else None
+    budget = {"timeout": 2 * PAUSE_IO_TIMEOUT_S + 30} if pause else {}
+
     server_parts = [f"{cfg.bin_remote} server -p {port} -c {cipher}",
                     f"-v {tls_version}", f"-{ipver}"]
+    if io_opt:
+        server_parts.append(io_opt)
     if send_size:
         server_parts.append(f"-b {send_size}")
     if record_type:
@@ -244,6 +271,10 @@ def run_tls_test(cfg, cipher="128", tls_version="1.2",
         client_parts.append(f"-b {buffer_size}")
     if record_type:
         client_parts.append(f"-t {record_type}")
+    if pause:
+        client_parts.append("-P")
+        if io_opt:
+            client_parts.append(io_opt)
     client_cmd = " ".join(client_parts)
 
     stats_before_local = read_tls_stats()
@@ -254,11 +285,33 @@ def run_tls_test(cfg, cipher="128", tls_version="1.2",
     # once it exits, so the helper keeps its per-connection output small
     # (see the note on verbose in tls_hw_offload.c); do not pass -V.
     #
-    # Both helpers exit on their own within HELPER_TIMEOUT_S (see
+    # Both helpers exit on their own within their SIGALRM lifetime (see
     # tls_hw_offload.c), so nothing outlives the variant even on failure.
-    with bkg(server_cmd, host=cfg.remote, exit_wait=True):
+    with bkg(server_cmd, host=cfg.remote, exit_wait=True, **budget):
         wait_port_listen(port, host=cfg.remote)
-        cmd(client_cmd)
+        if pause:
+            # bkg() returns once the client is paused; leaving the block
+            # resumes it and waits for the echo.
+            pending = None
+            reap_timeout = INFLIGHT_OUTAGE_S + 10
+            try:
+                # The client reports ready only after half the echo, over
+                # a link that has just retrained.
+                with bkg(client_cmd, ksft_wait=30, **budget):
+                    pending = pause(cfg)
+            except BaseException:
+                # Cut what pause() scheduled short without masking the
+                # failure: restore_nic() brings the link back regardless.
+                if pending:
+                    pending.process(terminate=True, fail=False,
+                                    timeout=reap_timeout)
+                raise
+            # The echo needed the link back, so this has finished.
+            if pending:
+                pending.process(terminate=False, fail=True,
+                                timeout=reap_timeout)
+        else:
+            cmd(client_cmd)
 
     cfg.wait_hw_stats_settle()
     stats_after_local = read_tls_stats()
@@ -305,6 +358,145 @@ def test_tls_offload_record_type(cfg, record_type):
     run_tls_test(cfg, record_type=record_type)
 
 
+def wait_carrier(ifname, deadline=30):
+    """Wait for carrier, which can take a NIC well over wait_file()'s
+    default 5s after a flap.
+    """
+    wait_file(f"/sys/class/net/{ifname}/carrier",
+              lambda x: x.strip() == "1", deadline=deadline)
+
+
+def wait_reachable(bond, peer, deadline=30):
+    """Wait until the bond carries traffic to the peer.
+
+    Carrier is not enough: the peer can take a moment to answer after the
+    flap. Fail here rather than with an opaque connect() error in the
+    helper.
+    """
+    family = "-6" if ":" in peer else "-4"
+    end = time.monotonic() + deadline
+    while cmd(f"ping {family} -c1 -W1 -I {bond} {peer}",
+              fail=False).ret != 0:
+        if time.monotonic() > end:
+            raise KsftFailEx(f"{peer} unreachable through {bond}")
+        time.sleep(0.5)
+
+
+def restore_nic(cfg, addrs):
+    """Bring the NIC back up as a standalone link with its addresses."""
+    ip(f"link set dev {cfg.ifname} up")
+    for addr in addrs:
+        nodad = " nodad" if addr["family"] == "inet6" else ""
+        ip(f"addr replace {addr['local']}/{addr['prefixlen']} "
+           f"dev {cfg.ifname}{nodad}")
+    # Best effort: a raising defer() callback fails the case, and the next
+    # case waits for carrier itself.
+    try:
+        wait_carrier(cfg.ifname, deadline=10)
+    except TimeoutError:
+        ksft_pr(f"NOTE: {cfg.ifname} still without carrier, "
+                f"leaving it to the next case to wait for")
+
+
+def setup_bond(cfg):
+    """Enslave the DUT NIC to a single-slave bond for the rest of the case.
+
+    The bond offloads kTLS to a slave only when it maps each socket to a
+    fixed lower device (bond_sk_get_lower_dev()), which means balance-xor
+    or 802.3ad with xmit_hash_policy layer3+4. Use balance-xor: with one
+    slave it needs no LACP partner or switch setup.
+
+    The NIC's global addresses move to the bond and back on cleanup;
+    anything else on the NIC (routes, etc.) is lost, so use a dedicated
+    test interface.
+    """
+    # Give the bond the NIC's MAC rather than a random one that enslaving
+    # would impose on the NIC, so the peer's neighbour entries stay valid.
+    link = ip(f"link show dev {cfg.ifname}", json=True)[0]
+    mtu, mac = link["mtu"], link["address"]
+    addrs = [a for a in
+             ip(f"addr show dev {cfg.ifname}", json=True)[0]["addr_info"]
+             if a.get("scope") == "global"]
+    if not addrs:
+        raise KsftSkipEx(f"No global address on {cfg.ifname} to move to "
+                         f"{BOND_IFNAME}")
+
+    ip(f"link add {BOND_IFNAME} address {mac} mtu {mtu} type bond "
+       "mode balance-xor xmit_hash_policy layer3+4 miimon 100")
+    # defer() runs LIFO: delete the bond (releasing the NIC) first.
+    defer(restore_nic, cfg, addrs)
+    defer(ip, f"link del {BOND_IFNAME}")
+
+    for addr in addrs:
+        ip(f"addr del {addr['local']}/{addr['prefixlen']} dev {cfg.ifname}")
+    ip(f"link set dev {cfg.ifname} down")
+    ip(f"link set dev {cfg.ifname} master {BOND_IFNAME}")
+    ip(f"link set dev {BOND_IFNAME} up")
+    for addr in addrs:
+        nodad = " nodad" if addr["family"] == "inet6" else ""
+        ip(f"addr replace {addr['local']}/{addr['prefixlen']} "
+           f"dev {BOND_IFNAME}{nodad}")
+    wait_carrier(cfg.ifname)
+    wait_carrier(BOND_IFNAME)
+
+    for peer in filter(None, cfg.remote_addr_v.values()):
+        wait_reachable(BOND_IFNAME, peer)
+
+
+@ksft_variants([
+    KsftNamedVariant("tls12_aes128", "128"),
+    KsftNamedVariant("tls12_aes256", "256"),
+])
+@ksft_disruptive
+def test_tls_offload_bond(cfg, cipher):
+    """kTLS offload to the slave NIC through a bond."""
+    require_tls_setup(cfg)
+    setup_bond(cfg)
+    run_tls_test(cfg, cipher=cipher)
+
+
+def bounce_idle(cfg):
+    """Bounce the slave while the socket is idle, then resume the echo."""
+    ip(f"link set dev {cfg.ifname} down")
+    ip(f"link set dev {cfg.ifname} up")
+    wait_carrier(BOND_IFNAME)
+
+
+def bounce_inflight(cfg):
+    """Send the resumed echo into a bond that has no usable slave.
+
+    The client is released only after this returns, so bringing the slave
+    back here would race with it: a NIC that retrains quickly could be back
+    before the client sends. Instead, schedule the link-up after a fixed
+    outage, so the first record always hits a bond without an active
+    slave, is dropped, and leaves through the TX fallback on retransmit.
+
+    Returns the scheduled link-up for run_tls_test() to reap.
+    """
+    ip(f"link set dev {cfg.ifname} down")
+    return bkg(f"sleep {INFLIGHT_OUTAGE_S} && ip link set dev {cfg.ifname} up",
+               shell=True, exit_wait=True)
+
+
+@ksft_variants([
+    KsftNamedVariant("idle", bounce_idle),
+    KsftNamedVariant("inflight", bounce_inflight),
+])
+@ksft_disruptive
+def test_tls_offload_bond_bounce(cfg, bounce):
+    """Bounce the bond slave under an open offloaded socket.
+
+    NETDEV_DOWN on the slave moves the socket to the TX SW fallback, which
+    then runs at both the bond master and the slave and must encrypt only
+    once. Encrypting again with the same IV puts plaintext on the wire,
+    which the peer either fails to decrypt or, for a complete record,
+    accepts with a valid tag, giving an echo mismatch.
+    """
+    require_tls_setup(cfg)
+    setup_bond(cfg)
+    run_tls_test(cfg, pause=bounce)
+
+
 def main() -> None:
     """Set up the DUT/peer environment and run the offload test suites."""
     with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
@@ -313,7 +505,8 @@ def main() -> None:
         cfg.tls_skip_reason = None
 
         ksft_run([test_tls_offload, test_tls_offload_sizes,
-                  test_tls_offload_record_type], args=(cfg, ))
+                  test_tls_offload_record_type, test_tls_offload_bond,
+                  test_tls_offload_bond_bounce], args=(cfg, ))
     ksft_exit()
 
 
-- 
2.50.1

