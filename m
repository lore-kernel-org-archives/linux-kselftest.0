Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741D33AD88
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789189421; cv=none; b=bXoSzUXewbN7rzTRT7+cqjgK86JCmuGfTxR029/Od0etn5+GkXu7uP9DkAeTkQ98/5QfDun4V7eyJuxeBWaaxTHh9Xz1heM8YbBIyKI2iaJpspjUOVJTla2AP+k9SuMoMOViY2JLW4BJWEtwHytPpg1QWeNxec3W4CnhdYvp3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789189421; c=relaxed/simple;
	bh=VJq5LQ7r7pJ7LmC1aTOoHVilbnMoCKTNV2rCoGZ/+3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kU3diCERmFgpD56maZGJJ3AT/a+vmqcIkDrCiFWa+YPDXgm3+j+fqLNwJDxkKIz2nDvpfWzqiWvzNqJJ/lQ4lbEK/Jy8ZlUZy9l0SK2CCkkAbZaqxoQzF0Io0QITR5+LsxN79AYosR8gMQCKX1jcUpYyr67gqExlg3IXgvhwyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aazYrITA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aazYrITA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so232332a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 22:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789189419; x=1789794219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Snhda+LlyUJoB7F+tAs4MLFhJBLrKs+4/O4YopS0agQ=;
        b=aazYrITAh2kIDBuFG/0wE5gWUx3S11NrilCOSbCp2M5fUxCjgGl/oV8hnI6YyNfRHQ
         9CoYnlcX2njodtMknQ1sfW5rwT7irP3gyklAILHRgavWe6uvvuvb6apMw5ljIGxhmpbt
         5D0Fs6Lp6/FhgUIRlmAChu4YzlngslJKuSuaghvp58j+l9bGvTNqTXva3vFyEH7eftCm
         KL6eafNycyE71SMkpSINXl2sMebPL5Fl++mO6ny5OPbwoaFr/borB4cGkrNHXIV9JIFu
         /BMaCIVZnAsvVQ41lmjxiaxlMa0+mpsbpvI0keebqjGWNrESxX1U33dN9eX8hfRz8e2p
         3niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789189419; x=1789794219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snhda+LlyUJoB7F+tAs4MLFhJBLrKs+4/O4YopS0agQ=;
        b=axnzI+4GkMKrg7LTTj3/6LrmgEhlw1xtCdV3U/06gkLIIqm8LQqLnK+K98B0825jbu
         yOJ24JYkcus3sTqJZzmDYuYYNDdxvbBinvLeRYMavRzYT4SfO2HAOrEw3rs7xie6vzsl
         2JekZYAs2T214wVMzgiIx0Ur51trNem+lyxiLm8bJI7QEFC1gPKU+O05eiNCZkS3mV7w
         cDVTApwzL2FCHg9kwjbdFSx28Mm/OOo8lBCrcdXrn8AJPUhJRqCUYmY7kGhRWQmjx2yU
         LL2niPMxmHec+TJ2L70UKOyDWCRirxsddBE786Kgpvybdg5Mk+BQzFqSp9yNwxaSndL6
         sk3Q==
X-Gm-Message-State: AFuF++lyHOtL84Yu5Q1e3J9sUC1v5gj03YkXMryFQmp8AFMWFz3roXsp
	LbOkmfhQyt5Yx7pVPk6Ut0LsVlm+u4t0o/CbMf7MTYJVo4PJvwzhjGFf
X-Gm-Gg: AYBFou2zvfsJnTZgNp7HfRvvBPkqZ4//DYjLKZtO0BCwSSH3g6sX+U9pFkeLJ0nb7M+
	8C4W+3SnXiN+b5dHIH41sNj7Ex/SPEVFgApS/uJG+9fFNPWLi3O6S85IeiSX5Lr3sj6aEo4q+qy
	p26xfJBmpGrzgE36/FSdI3LkgMQeXfgxNSk7ULzK2FFxzp/MbBva39NmCgje1WDzeo+J0Vc28Gh
	rOX16PaD4QM4NDsxXAywD+j0cL4iZE8PCEVXvKIzAwMg1e8+R7PyzJDdUNlVkOC589zOwKjOZ/q
	BYFonNWR+Pebh8gMiKXaPsLDWbY0NtSLN/lOUptCUG1vfEBalFbIxvu77bPNi2r+rJtI89hp6KR
	MT1d5oLnuY0q7kaTqzJjxWeaIfCimBiyNN8nJBz6d0BSc2wJGxH56wRMa0tQuMsRDTG1kH+eL00
	2HjxXGcbb5ZvBMtremXoNGU+GQrHv1OGIyZD4OQGxVsOmvAxuR4hiTehX6X2iuP0m8gSafVMPFT
	N4/PXzkG1t12C1z/QXPEEu2fgFTvrtmI8OT/sIZkq7YwDs=
X-Received: by 2002:a17:90b:582f:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39dbbea2aa4mr2576677a91.3.1789189418476;
        Fri, 11 Sep 2026 22:03:38 -0700 (PDT)
Received: from narcisav-mac.thefacebook.com ([2620:10d:c090:400::5:3ff5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm13133056eec.23.2026.09.11.22.03.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 22:03:38 -0700 (PDT)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev@vger.kernel.org,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	anubhavsinggh@google.com,
	richardbgobert@gmail.com
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	narcisav.kernel@gmail.com
Subject: [PATCH net-next v2] selftests: drv-net: add BIG TCP test cases
Date: Fri, 11 Sep 2026 22:03:27 -0700
Message-ID: <20260912050327.20616-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add four new test cases that validate coalescing
under increased size limits (BIG TCP):

big_tcp_data_same
  - validates that equal-sized segments coalesce past
   the legacy IP_MAXPACKET limit.
big_tcp_data_lrg_sml
  - validates that a smaller final segment coalesces into the
    previous chain of large-sized segments while crossing the
    IP_MAXPACKET limit.
big_tcp_tcp_seq
  - validates that a packet with a wrong sequence number doesn't
    coalesce. The test uses a sequence number for which the low 16 bits
    correspond to the correct sequence number to validate against
    truncation bugs, since total aggregate length crosses over the
    legacy size limit for BIG TCP.
big_tcp_large_max
  - validates that coalescing stops at the configured BIG TCP limit.

Use a gro_flush_timeout value 15x higher for the BIG TCP test cases
to prevent under-coalescing.

Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
v2:
 - increase gro_flush_timeout to 15x the regular value for the new tests
v1: https://lore.kernel.org/netdev/20260911050659.13367-1-narcisav.kernel@gmail.com/

I've run the tests in a loop on a slower system running a debug kernel using
10x the previous flush timeout and I still noticed retries every 10-20
iterations, so I've settled on 15x higher timeout to account for variability
across different systems.

 .../testing/selftests/drivers/net/gro_lib.py  |  56 +++++++-
 tools/testing/selftests/net/lib/gro.c         | 133 +++++++++++++++++-
 2 files changed, 185 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
index b7ac0660adc0..fafe2975401b 100644
--- a/tools/testing/selftests/drivers/net/gro_lib.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -40,13 +40,17 @@ Test cases:
   - ip_v6ext_diff: (IPv6) IPv6 ext header with different payload doesn't coalesce
   - large_max: Packets exceeding GRO_MAX_SIZE don't coalesce
   - large_rem: Large packet remainder handling
+  - big_tcp_data_same: Same size packets coalesce past IP_MAXPACKET
+  - big_tcp_data_lrg_sml: Smaller last packet coalesces past IP_MAXPACKET
+  - big_tcp_tcp_seq: Packets with 16-bit truncated seqno don't coalesce
+  - big_tcp_large_max: Packets exceeding the BIG TCP limit don't coalesce
 """
 
 import glob
 import os
 import re
-from lib.py import ksft_run, ksft_exit, ksft_pr
-from lib.py import NetDrvEpEnv, KsftFailEx, KsftXfailEx
+from lib.py import ksft_run, ksft_exit, ksft_pr, ksft_eq
+from lib.py import NetDrvEpEnv, KsftFailEx, KsftSkipEx, KsftXfailEx
 from lib.py import NetdevFamily, EthtoolFamily
 from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip
 from lib.py import ksft_variants, KsftNamedVariant
@@ -55,6 +59,8 @@ from lib.py import ksft_variants, KsftNamedVariant
 # gro.c uses hardcoded DPORT=8000
 GRO_DPORT = 8000
 
+BIG_TCP_GRO_MAX_SIZE = 128000
+
 
 def _resolve_dmac(cfg, ipver):
     """
@@ -91,6 +97,34 @@ def _set_mtu_restore(dev, mtu, host):
         defer(ip, f"link set dev {dev['ifname']} mtu {dev['mtu']}", host=host)
 
 
+def _set_gro_size_restore(cfg, size):
+    """
+    Set the local device's GRO size limits, then confirm they stuck.
+    """
+
+    _set_mtu_restore(cfg.dev, 4096, None)
+    _set_mtu_restore(cfg.remote_dev, 4096, cfg.remote)
+
+    if "gro_max_size" not in cfg.dev or "gro_ipv4_max_size" not in cfg.dev:
+        raise KsftSkipEx("iproute2 does not report the GRO size limits")
+
+    if (cfg.dev["gro_max_size"] == size and
+            cfg.dev["gro_ipv4_max_size"] == size):
+        return
+
+    old = (f"gro_max_size {cfg.dev['gro_max_size']} "
+           f"gro_ipv4_max_size {cfg.dev['gro_ipv4_max_size']}")
+    new = f"gro_max_size {size} gro_ipv4_max_size {size}"
+
+    ip(f"link set dev {cfg.ifname} {new}")
+    defer(ip, f"link set dev {cfg.ifname} {old}")
+
+    dev = ip("-d link show dev " + cfg.ifname, json=True)[0]
+    ksft_eq(dev["gro_max_size"], size, comment="gro_max_size not applied")
+    ksft_eq(dev["gro_ipv4_max_size"], size,
+            comment="gro_ipv4_max_size not applied")
+
+
 def _set_ethtool_feat(dev, current, feats, host=None):
     s2n = {True: "on", False: "off"}
 
@@ -239,7 +273,11 @@ def _setup(cfg, mode, test_name):
         flush_path = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
         irq_path = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
 
-        ctl_file_write(flush_path, "200000")
+        # "big_tcp_*" tests need a longer timeout, use 15x the regular timeout
+        if test_name.startswith("big_tcp_"):
+            ctl_file_write(flush_path, "3000000")
+        else:
+            ctl_file_write(flush_path, "200000")
         ctl_file_write(irq_path, "10")
 
         _set_ethtool_feat(cfg.ifname, cfg.feat,
@@ -289,6 +327,9 @@ def _setup(cfg, mode, test_name):
     except KsftXfailEx:
         pass
 
+    if test_name.startswith("big_tcp_"):
+        _set_gro_size_restore(cfg, BIG_TCP_GRO_MAX_SIZE)
+
 
 def _gro_variants():
     """Generator that yields all combinations of protocol and test types."""
@@ -304,6 +345,11 @@ def _gro_variants():
         "large_max", "large_rem",
     ]
 
+    big_tcp_tests = [
+        "big_tcp_data_same", "big_tcp_data_lrg_sml",
+        "big_tcp_tcp_seq", "big_tcp_large_max",
+    ]
+
     # Tests specific to IPv4
     ipv4_tests = [
         "ip_csum",
@@ -322,6 +368,10 @@ def _gro_variants():
         for test_name in common_tests:
             yield protocol, test_name
 
+        if protocol in ["ipv4", "ipv6"]:
+            for test_name in big_tcp_tests:
+                yield protocol, test_name
+
         if protocol in ["ipv4", "ipip"]:
             for test_name in ipv4_tests:
                 yield protocol, test_name
diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 7a333155de1a..70b0deb3c11f 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -46,6 +46,12 @@
  *   - large_max: exceeding max size
  *   - large_rem: remainder handling
  *
+ * big_tcp_*:
+ *   - big_tcp_data_same:    equal segments coalescing past IP_MAXPACKET
+ *   - big_tcp_data_lrg_sml: a smaller final segment carrying it over
+ *   - big_tcp_tcp_seq:      16-bit truncated sequence number must not coalesce
+ *   - big_tcp_large_max:    coalescing stops at the configured limit
+ *
  * single, capacity:
  *  Boring cases used to test coalescing machinery itself and stats
  *  more than protocol behavior.
@@ -110,6 +116,16 @@
 
 #define EXIT_OVER_COALESCE	42
 
+/* Must match BIG_TCP_GRO_MAX_SIZE in gro_lib.py. */
+#define BIG_TCP_GRO_MAX_SIZE	128000
+
+#define BIG_TCP_RECV_BUF_LEN \
+	(BIG_TCP_GRO_MAX_SIZE + MAX_MSS + L2_HLEN_MAX)
+#define BIG_TCP_MIN_MSS		(ASSUMED_MTU - (MAX_HDR_LEN - ETH_HLEN))
+#define BIG_TCP_MAX_FILL_CNT \
+	((int)((BIG_TCP_GRO_MAX_SIZE - 1 - (MAX_HDR_LEN - ETH_HLEN)) / \
+	       BIG_TCP_MIN_MSS))
+
 #define ipv6_optlen(p)  (((p)->hdrlen+1) << 3) /* calculate IPv6 extension header len */
 #define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
 
@@ -166,6 +182,27 @@ static int num_large_pkt(void)
 	return max_payload() / calc_mss();
 }
 
+/* How many maximum sized segments fit under the configured limit. */
+static int big_tcp_large_cnt(void)
+{
+	return (BIG_TCP_GRO_MAX_SIZE - 1 - (total_hdr_len - ETH_HLEN)) /
+	       calc_mss();
+}
+
+/* How many calc_mss() sized segments are needed to satisfy the
+ * following condition:
+ * pkt_count * calc_mss() < IP_MAXPACKET < (pkt_count + 1) * calc_mss()
+ */
+static int big_tcp_fill_cnt(void)
+{
+	return IP_MAXPACKET / calc_mss();
+}
+
+static int big_tcp_fill_len(void)
+{
+	return big_tcp_fill_cnt() * calc_mss();
+}
+
 static void vlog(const char *fmt, ...)
 {
 	va_list args;
@@ -560,6 +597,61 @@ static void send_data_pkts(int fd, struct sockaddr_ll *daddr,
 	write_packet(fd, buf, total_hdr_len + payload_len2, daddr);
 }
 
+/* Send num_pkt segments of pkt_len bytes, then one of remainder len. */
+static void send_big_tcp(int fd, struct sockaddr_ll *daddr, int pkt_len,
+			 int num_pkt, int remainder)
+{
+	static char pkts[BIG_TCP_MAX_FILL_CNT][MAX_HDR_LEN + MAX_MSS];
+	static char last[MAX_HDR_LEN + MAX_MSS];
+	const int filled = num_pkt * pkt_len;
+	int i;
+
+	if (num_pkt > BIG_TCP_MAX_FILL_CNT)
+		error(1, 0, "need %d packets, array holds %d",
+		      num_pkt, BIG_TCP_MAX_FILL_CNT);
+
+	for (i = 0; i < num_pkt; i++)
+		create_packet(pkts[i], i * pkt_len, 0, pkt_len, 0);
+	create_packet(last, filled, 0, remainder, 0);
+
+	for (i = 0; i < num_pkt; i++)
+		write_packet(fd, pkts[i], total_hdr_len + pkt_len, daddr);
+	write_packet(fd, last, total_hdr_len + remainder, daddr);
+}
+
+/* In BIG TCP configuration, the total aggregate length can
+ * be greater than the legacy IP_MAXPACKET. Since the aggregate
+ * length is used in calculating the sequence numbers,
+ * send a packet with a sequence number that differs by IP_MAXPACKET + 1,
+ * to test against truncation bugs.
+ */
+static void send_big_tcp_bad_seq(int fd, struct sockaddr_ll *daddr)
+{
+	static char pkts[BIG_TCP_MAX_FILL_CNT][MAX_HDR_LEN + MAX_MSS];
+	const int num_pkt = big_tcp_fill_cnt() + 1;
+	static char last[MAX_HDR_LEN + MAX_MSS];
+	const int pkt_len = calc_mss();
+	int bad_seq;
+	int filled;
+	int i;
+
+	filled = num_pkt * pkt_len;
+	/* Low 16 bits match with the correct incoming sequence number. */
+	bad_seq = filled - (IP_MAXPACKET + 1);
+
+	if (num_pkt > BIG_TCP_MAX_FILL_CNT)
+		error(1, 0, "need %d packets, array holds %d",
+		      num_pkt, BIG_TCP_MAX_FILL_CNT);
+
+	for (i = 0; i < num_pkt; i++)
+		create_packet(pkts[i], i * pkt_len, 0, pkt_len, 0);
+	create_packet(last, bad_seq, 0, pkt_len, 0);
+
+	for (i = 0; i < num_pkt; i++)
+		write_packet(fd, pkts[i], total_hdr_len + pkt_len, daddr);
+	write_packet(fd, last, total_hdr_len + pkt_len, daddr);
+}
+
 /* If incoming segments make tracked segment length exceed
  * legal IP datagram length, do not coalesce
  */
@@ -1161,7 +1253,7 @@ static void recv_error(int fd, int rcv_errno)
 static void check_recv_pkts(int fd, int *correct_payload,
 			    int correct_num_pkts)
 {
-	static char buffer[IP_MAXPACKET + L2_HLEN_MAX + 1];
+	static char buffer[BIG_TCP_RECV_BUF_LEN];
 	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
 	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
 	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);
@@ -1541,6 +1633,25 @@ static void gro_sender(void)
 		send_large(txfd, &daddr, remainder + 1);
 		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
 
+	/* big tcp sub-tests */
+	} else if (strcmp(testname, "big_tcp_data_same") == 0) {
+		send_big_tcp(txfd, &daddr, calc_mss(), big_tcp_fill_cnt(),
+			     calc_mss());
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+	} else if (strcmp(testname, "big_tcp_data_lrg_sml") == 0) {
+		int remainder = calc_mss() / 2;
+
+		send_big_tcp(txfd, &daddr, calc_mss(), big_tcp_fill_cnt(),
+			     remainder);
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+	} else if (strcmp(testname, "big_tcp_tcp_seq") == 0) {
+		send_big_tcp_bad_seq(txfd, &daddr);
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+	} else if (strcmp(testname, "big_tcp_large_max") == 0) {
+		send_big_tcp(txfd, &daddr, calc_mss(), big_tcp_large_cnt(),
+			     calc_mss());
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+
 	/* machinery sub-tests */
 	} else if (strcmp(testname, "single") == 0) {
 		static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
@@ -1768,6 +1879,26 @@ static void gro_receiver(void)
 		printf("last segment sent individually: ");
 		check_recv_pkts(rxfd, correct_payload, 3);
 
+	/* big tcp sub-tests */
+	} else if (strcmp(testname, "big_tcp_data_same") == 0) {
+		correct_payload[0] = big_tcp_fill_len() + calc_mss();
+		printf("data packets of same size past IP_MAXPACKET: ");
+		check_recv_pkts(rxfd, correct_payload, 1);
+	} else if (strcmp(testname, "big_tcp_data_lrg_sml") == 0) {
+		correct_payload[0] = big_tcp_fill_len() + calc_mss() / 2;
+		printf("smaller last packet past IP_MAXPACKET: ");
+		check_recv_pkts(rxfd, correct_payload, 1);
+	} else if (strcmp(testname, "big_tcp_tcp_seq") == 0) {
+		correct_payload[0] = (big_tcp_fill_cnt() + 1) * calc_mss();
+		correct_payload[1] = calc_mss();
+		printf("aliased seq past IP_MAXPACKET doesn't coalesce: ");
+		check_recv_pkts(rxfd, correct_payload, 2);
+	} else if (strcmp(testname, "big_tcp_large_max") == 0) {
+		correct_payload[0] = big_tcp_large_cnt() * calc_mss();
+		correct_payload[1] = calc_mss();
+		printf("shouldn't coalesce past gro_max_size: ");
+		check_recv_pkts(rxfd, correct_payload, 2);
+
 	/* machinery sub-tests */
 	} else if (strcmp(testname, "single") == 0) {
 		printf("single data packet: ");
-- 
2.53.0-Meta

