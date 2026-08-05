Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF21684BE;
	Wed,  5 Aug 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963652; cv=none; b=FM6uJTX0pJyHSFxq6gfe7pPRuf1Z4UDQQcXixxdf+mSsz5C5SdseE1Oa2J69anU/q0q18bIe7qYsM20okLlDzjrMRwkgyB1SJ/sQ2jRKeFev8HYh4VQgu0Ez2DEKDP76Ya3sJsuwxZd5R5UU9LoP1BIA6918PwN2QLq4tLyeJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963652; c=relaxed/simple;
	bh=+cxK5P/bJGs4ItNP/oAIWRzifrKN/3aN8FTWi3r+lkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pteDHJF+EqTifjxB7/DimRZ+L+JBBY/1+UElPki+MBy/EKfSBzIPkDf7AU35iCwkTd2W/qqXBVhjA47vCDrrQUw3IKR35o6KxJEI+RLwcDNgg+vOfsqV5UJn3buEQFlDbMOCYurhOZv2touac5j7j4wTdBTGF8SZcO/Jm4umB8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=nui42/fC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UGJB2csl; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="nui42/fC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UGJB2csl"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2A5D27A00CC;
	Wed,  5 Aug 2026 17:00:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 17:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1785963649; x=1786050049; bh=jlAqnc6TQG2nC/5MOhJ7Q
	NIf3SI8wa8SWCBJU2u2GEo=; b=nui42/fCbSlwDtExTH4ZpZz2iOdct1R1WsLPN
	diA6GPFqXF94CST5EDmKK/+oBNUSD/7kWyKZdaUIETPgGxPuz4Pk5rKOCfeeEi52
	mVyTlzTgslV054vwwoIBzmwQMC6Woo3TR2n7ivXOmBSpu4+TVKEektF/tFYtDtLL
	vgEdkKrThwY0X5yqCKdBiQ2aatpnAR7hzQQXcQhebnp+q/ZBqiFqOwCf9VzJ1JRk
	k+b6bAS0/eChmSeRJrXctzAb8L8mPZyz9TW5RMjwvUAhtUuN5UhnZjLvhqzUIu4m
	VHLfxqzgljMYxceC4pWff042sR6DD2g+31ZIYgR908r21vzcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785963649; x=1786050049; bh=jlAqnc6TQG2nC/5MOhJ7QNIf3SI8wa8SWCB
	JU2u2GEo=; b=UGJB2cslKyaCYA6OBrlQkCc92+z43oAm3Bh8n365ZoAaGZW0j1B
	JrbmMtZ3BBcvOBfjI3jNJVMiwfwHbH55h4SHRkuNtveU4UFZCxv+tscYm2/y3rqi
	V6WXpdakesDfJPHxuF8WrZ7g/NeAhyauGsTZyW3HtZyf7dmBBgIPaQ315wYO+4jx
	Wwg2F5acmRUvAlpNNkIlB52cuEYK5+u0w2VR2Bn+rhyM2bXirGR/DfShlH2nU799
	g+3D/maJq0P9pZPFqaqnyy0m37TAokeWYkir/RiIT38aCsBJQpm1+yUqvQvyNpSr
	bA74D6IeDnktFOxMPjSpQK6WNkF/sCAOCxA==
X-ME-Sender: <xms:gKRzamHDxq1yWo2Khm02XBkhNeFYFLF3XcZV2gDl7sAntg8xbsfM3A>
    <xme:gKRzakCiQNpmS6a7d6KwqcSpM9T0lPl-OP5CCSwV_HXNf5nRp-wlpo_xuWQcCSPF7
    0B3_PM4rfanhs6Ya-pYVoJTGK-nOtEY3tpvhv3rXUoWjx1PjuYaJisM>
X-ME-Received: <xmr:gKRzakB4OIw-7pibaeGJVDMA6dRrJlpTTrIrRb71xHbD7d3tYuTCs9We-jk>
X-ME-Proxy-Cause: dmFkZTEIxe+liMbbdv+sTMH8RGdWjhq/Wgc4eHO9JMeSVjpHpMoC39/wR7bYx5fIeq010y
    KjxD2c7/QtcbNDDZr/sxp7tPbIElYNspFuf8cd0hvPo0AozienH6iEvXzKmIlLWowKftxh
    /v05UzIgOHxwzxpgoQD3UuvyYUOkwCuPalIG2Gwr/dD6AQyZElllCwHPkN4PGh2loxdtRs
    kqtw6zPYj2vh9GSXF6f8mTOBA8SCmnehNoBflxTolAiwk1OKtRonPHn0rTb3+IC53WSvPm
    NtbO1TyANUPm9A272a32nnNTg5OG1tnx2L2EU1yDtD+fau9knd8lXTxjs8PxHVESAs90CT
    ltT7Qa27SD1dXmFUc4bnv0ujU/Yjk6PogSFeMOXMpzAkoTIcHKP1g0w4tpt64IioM2Gy2o
    5fUeKY7uOkX1Cf8gQK9IvmVuu+jCLg0fcXZWzhQzdMCkM28QrFW3NtGTuxzMR3qOUKrbLL
    EfpuNYmn6c0EzUCIzV8z2iUe6Fy4H1wXEhtDK0SAjpla1uqhdo8fxgl0dALSgFi6Sm+Kwq
    luwk7uWokaxq3qHKc/3KOGKrfFjkfbWzQjfEUi5XRbn07vLnmXgSzQKbQ8+8V3tZh0Wkec
    goCDyobj5sTfcRX3IB35so0O7A/foBMhgzeD0ccLWfGiKmgnNi9Cj8hoGCug
X-ME-Proxy: <xmx:gKRzaqOm2mgfz2IY51oURZckMFrbnsf1L5viRcfh4lEvH-XcqKSjDw>
    <xmx:gKRzagOzitbNkA2kNsnuBDU7kmM940iwL7dlcl02NHLxxIAIVPebfw>
    <xmx:gKRzasIxJ8eJPsgRZmcHgfRLf14kjfrMLPm0mKbNAmsUkS18bhyGgA>
    <xmx:gKRzaqoDpzxR13QiRRiC36ujoTF4UuOWYKg43mzlbhd1ABwyCtLWoA>
    <xmx:gaRzaub1TKFF8-ECc2qn7R60M24KMz2eZqiIi7R5vbzVT1LI-Lkt4qMA>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 17:00:47 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>,
	syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
Subject: [PATCH net-next 4/4] net: Fix UDP length overflow with PMTU discover and big MTU
Date: Wed,  5 Aug 2026 23:59:57 +0300
Message-ID: <20260805205957.1652619-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

This commit bounds cork->base.fragsize to IP(6)_MAX_MTU to avoid a
possible overflow of UDP length that triggers a WARN in
udp_set_len_short when setsockopt IP(V6)_MTU_DISCOVER is set to
IPV6_PMTUDISC_DO or IP(V6)_PMTUDISC_PROBE, and a large packet is sent
over a netdev with an unusually large MTU.

Steps to reproduce (included in the new selftest):

1. Set device MTU bigger than IP6_MAX_MTU (or IP_MAX_MTU + 20).
   cork->base.fragsize will be set to that MTU in ip(6)_setup_cork.
2. Set IP(V6)_MTU_DISCOVER to IP(V6)_PMTUDISC_PROBE or IPV6_PMTUDISC_DO.
   It lets maxnonfragsize be set to device MTU (cork->fragsize) in
   __ip(6)_append_data, rather than to IP(6)_MAX_MTU.
3. Send 65528 bytes of payload (+8 bytes of UDP header, +20/40 bytes of
   IPv4/IPv6 header). Device MTU allows it (it's only one byte bigger
   than IP6_MAX_MTU or IP_MAX_MTU + IPv4 header, and the device MTU is
   bigger than that).
4. The UDP length in the built packet is 65536, which overflows the
   16-bit length field and triggers the WARN in udp_set_len_short.

Note: IP_PMTUDISC_DO with IPv4 is safe, because ip_dst_mtu_maybe_forward
always clamps at IP_MAX_MTU, unlike ip6_dst_mtu_maybe_forward.

Reported-by: syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/6a6a966c.86abc875.e5c3d.0054.GAE@google.com/
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
Assisted-by: Claude:claude-sonnet-4.6
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
---
 net/ipv4/ip_output.c                         |  2 +
 net/ipv6/ip6_output.c                        |  2 +-
 tools/testing/selftests/net/Makefile         |  1 +
 tools/testing/selftests/net/cork_fragsize.py | 77 ++++++++++++++++++++
 4 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/cork_fragsize.py

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index e6dd1e5b8c32..2bc997c4fa7b 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1299,6 +1299,8 @@ static int ip_setup_cork(struct sock *sk, struct inet_cork *cork,
 
 	cork->fragsize = ip_sk_use_pmtu(sk) ?
 			 dst4_mtu(&rt->dst) : READ_ONCE(rt->dst.dev->mtu);
+	if (cork->fragsize > IP_MAX_MTU)
+		cork->fragsize = IP_MAX_MTU;
 
 	if (!inetdev_valid_mtu(cork->fragsize))
 		return -ENETUNREACH;
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 368e4fa3b43c..91c92cb8e529 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1430,7 +1430,7 @@ static int ip6_setup_cork(struct sock *sk, struct inet_cork_full *cork,
 	if (frag_size && frag_size < mtu)
 		mtu = frag_size;
 
-	cork->base.fragsize = mtu;
+	cork->base.fragsize = min(mtu, IP6_MAX_MTU);
 	cork->base.gso_size = ipc6->gso_size;
 	cork->base.tx_flags = 0;
 	cork->base.mark = ipc6->sockc.mark;
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index b43ddf192ecc..628203fda424 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -25,6 +25,7 @@ TEST_PROGS := \
 	cmsg_so_mark.sh \
 	cmsg_so_priority.sh \
 	cmsg_time.sh \
+	cork_fragsize.py \
 	double_udp_encap.sh \
 	drop_monitor_tests.sh \
 	ecmp_rehash.sh \
diff --git a/tools/testing/selftests/net/cork_fragsize.py b/tools/testing/selftests/net/cork_fragsize.py
new file mode 100755
index 000000000000..7a1bb069227a
--- /dev/null
+++ b/tools/testing/selftests/net/cork_fragsize.py
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+# Test possible UDP length overflow in udp_send_skb/udp_v6_send_skb.
+
+from lib.py import ksft_run, ksft_exit, ksft_true
+from lib.py import ip, NetNS, NetNSEnter
+import errno
+import socket
+import subprocess
+
+
+IP_MTU_DISCOVER = 10
+IP_PMTUDISC_PROBE = 3
+IPV6_MTU_DISCOVER = 23
+IPV6_PMTUDISC_DO = 2
+
+
+def check_dmesg_clean(func) -> bool:
+    dmesg = subprocess.Popen(['dmesg'], stdout=subprocess.PIPE)
+    result = subprocess.run(['grep', '-q', f'WARNING:.*{func}'], stdin=dmesg.stdout)
+    dmesg.wait()
+    return result.returncode != 0 and dmesg.returncode == 0
+
+
+def test_ipv6() -> None:
+    with NetNS() as ns:
+        ip('link add dummy type dummy', ns=ns)
+        ip('link set dummy mtu 65576', ns=ns)
+        ip('link set dummy up', ns=ns)
+        ip('-6 addr add fd00::1/64 dev dummy nodad', ns=ns)
+        ip('-6 neigh add fd00::2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
+
+        with NetNSEnter(ns):
+            with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as fd:
+                fd.setsockopt(socket.IPPROTO_IPV6, IPV6_MTU_DISCOVER, IPV6_PMTUDISC_DO)
+                try:
+                    fd.sendto(b' ' * 65528, ('fd00::2', 1234))
+                except OSError as e:
+                    # Ignore EMSGSIZE: it happens on kernels with the fix.
+                    if e.errno != errno.EMSGSIZE:
+                        raise
+
+        ip('link del dummy', ns=ns)
+
+    ksft_true(check_dmesg_clean('udp_v6_send_skb'), 'WARNING detected in dmesg')
+
+
+def test_ipv4() -> None:
+    with NetNS() as ns:
+        ip('link add dummy type dummy', ns=ns)
+        ip('link set dummy mtu 65556', ns=ns)
+        ip('link set dummy up', ns=ns)
+        ip('addr add 10.0.0.1/24 dev dummy', ns=ns)
+        ip('neigh add 10.0.0.2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
+
+        with NetNSEnter(ns):
+            with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as fd:
+                fd.setsockopt(socket.IPPROTO_IP, IP_MTU_DISCOVER, IP_PMTUDISC_PROBE)
+                try:
+                    fd.sendto(b' ' * 65528, ('10.0.0.2', 1234))
+                except OSError as e:
+                    # Ignore EMSGSIZE: the check happens after the WARN is printed.
+                    if e.errno != errno.EMSGSIZE:
+                        raise
+
+        ip('link del dummy', ns=ns)
+
+    ksft_true(check_dmesg_clean('udp_send_skb'), 'WARNING detected in dmesg')
+
+
+if __name__ == "__main__":
+    ksft_run([
+        test_ipv6,
+        test_ipv4,
+    ])
+    ksft_exit()
-- 
2.55.0

