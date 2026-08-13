Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397746AF1B;
	Thu, 13 Aug 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622679; cv=none; b=eCYeclWImN3RaiyJ4T3QysqIKXJ2A/up3MeZ/rC5+7/9gz7Aaa8lEKMijVsxCsdpJwFcjT26R6TLAj76S55lxkxOT6UdP7S4fl92sLRLlv3ixG5A9AFvqshBcfG9NrYDAvY3TWfeo7F2qgTN2awrAXQZ/cC1/fyEk9NStrUOahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622679; c=relaxed/simple;
	bh=8cDdnR0rj/Zv2OgnH2rwrUzZRqecYQlVJjFVOm4MwII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zt7+ZAi4ekwySJEUeAFHjESqs48pmCfABMzKhKcnS05aGraU48p7JJig2MI5i0PlkgSjzVTbcX6qhTkkeCTU9K4KuBZfIbJ2Z3ihbi1qnozw0XuulvcwVrAQgi6o5rlVg8ORYOFIR59Zu5+cpzeEMIwm2b1DbvfDJlgQjhYnrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=JHfH4IZV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R3dV72th; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="JHfH4IZV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R3dV72th"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id C77A81D000FF;
	Thu, 13 Aug 2026 08:04:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 13 Aug 2026 08:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786622675; x=
	1786709075; bh=hYJ2ZfuuZL7sn9cT44AiQAJt0+J9fJBAFXFuk6avQ/Q=; b=J
	HfH4IZVg48O/hql4Yz71+BnkPuL8gUNpX1QPLQxdcq8FlcLNimOLEz6eEw26LOWl
	+pcXoHcYGT/cdALtre85jNTXRcGioxmlRKnh/6cuhyuqvUq1oeSrTwULduFY9Bcu
	Eol3CsFgic2pzOgB1dhvpAEsZnYV2zu0gzfoK17ArYpXHf8h2zx3p94eqJIn/8Eg
	N8Ab/aehs1TY55JFuA7Ppvn7pi11xy2aMsfJZSAnVckNajjJNRWb9s6r1xWv1IJo
	0ZwKnOrUkVOkFPskLPZTgPn+gvi3jIH3RdWAz0dcLw4zRJqmVETimi59ZaQUxuG3
	uwMhEwTyIGR9Yxwc+nxFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786622675; x=1786709075; bh=h
	YJ2ZfuuZL7sn9cT44AiQAJt0+J9fJBAFXFuk6avQ/Q=; b=R3dV72thGOIQWhYrw
	clrdgvUHpPh7N1UV2CdlQJfUCzsSELtUes11YqBMg0vfxaPfvoybdj/am2mHqQLy
	gMKTC2NHa+yHkBJV0Q4jRcOK9TFYfFPQ6RvBjc+INFAtjeWwkEYVQDnximlEe+1J
	H0gHJ6Zrl3fXJEJ5MdWcdqXy9yumy2JLp7XJdzRf2MU9cqW8gs7Bb07Fybdd3ThM
	DjVWBfLVhAodlvNItrZNGZQMdZrpT9zaW/kpfiYhEl7ktfMDe+Qadx15GYHOcjQ3
	4oibE5qR7KaFEnUiarFhQRZyDPmH/WnMBWnYCgqGHKdpBUp8aoZ53HoGFS5Dutm2
	MxFDg==
X-ME-Sender: <xms:07J9av2kTHqmPaB-iLxJmNrjxjyKeBXc0uIoY2lMpYwBfswd2z16uA>
    <xme:07J9atCSRAL_4SJ8hlFElvDjY614Pz0if5uCO7dHJyCDxOltNMg7vjeNS-S4pBDm6
    EsKJMnIDudCYHFox_9UpehhEPzPR3ZH5Z2ET0C4I8ys_n_jQ85d6Zxc>
X-ME-Received: <xmr:07J9ar_Vg36_tDeI-dkak49xmmgq6cxid0plrw8DKEVyRvYlRcVkhGcMsEg>
X-ME-Proxy-Cause: dmFkZTGmXpDtKesbzJQMCW2OiFtPcNxxRyd9rfcQ5VjTjDBFuolsNw2HkuWOzd+CtY0fyf
    DBxkjSJGh6QT6eDcWEQs1e33VWKLkyZ5mG35HRdZe0apDfMwogjjroOPiFR4WAlfg87p5y
    avlZjgVodurW8Dx2/XqP2Pydvu7hbjpBnQ+rCmNL8YX0BMhjzcGeSfTB4bUmumKbxmbU8A
    3YVPG++/LHaqHQqTomHAKgHgw+8Td5xF4UEptIXYi4f8xX0qMRgY3BPR2TnzgM3naWRqRb
    hrT/7wTt3gxYxsUV4+xIMgSmeWSSNYjuvuKGkLu9tIzVg3jSWyKWTJQ+V9KcdIiqlmFAEj
    pIy6aPGzt3716/fvgabvr2PZ+kvY3iOaY6Mb9oVmRumxqmi7tnYWnhEQLSPMhdac8hZUs5
    UQyDsS0Krzdwk+Rb48IJLJCxVr3bI9NmHXUQNaTdVh7lAVGvHl+uRqw9G/P0WNXq1DjeNf
    rKI1uTe4zQ5AqHuRZLKTQNCguPwjlqiL25JtkOuEfSwrZEkmSWEo2RqlJkmCAHGDSnCkVr
    LUMWvc+OKy9m14gVARMhWSyU7V0idNxYVw57K8xubzvA+6VM+ziYh6jlnq1p2RD+UsXyvG
    iOlk5bHFZnUlbjYDxnZ+vv1vs2TFo9PrMDxXGk+ukTVoYv3d9WwG3bLuXqXw
X-ME-Proxy: <xmx:07J9aoUMI1-gADzShCuMEWQwrxJ1CYRZ23k_81mVgD6A7hGNnGMzMQ>
    <xmx:07J9akKiWTZYPUUzwHw70LXA3knhjci2zRVzMeGLAIABcLulTP2VGA>
    <xmx:07J9asBsdJcOYgoqWLEjuwZlJerQKg-8t73z8gZTJok7hnZv_mL0PQ>
    <xmx:07J9akEt-orh_hB6F9BCYrCnS5zUpHtDZFaYiN4ZL1Q_74Xmlmeo8A>
    <xmx:07J9akXSbGqXtAlyjXsZeQktYiVsniyJHgeJXHUl7bv_0HAJVeYoLmwF>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 08:04:34 -0400 (EDT)
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
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>,
	syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
Subject: [PATCH net v2 1/2] net: Fix UDP length overflow with PMTU discover and big MTU
Date: Thu, 13 Aug 2026 15:03:50 +0300
Message-ID: <20260813120351.2807829-2-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813120351.2807829-1-alice.kernel@fastmail.im>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
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

The Fixes tag points at the first commit where I could reproduce the
overflow with IPv4 and IP_PMTUDISC_PROBE.

Fixes: daba287b299e ("ipv4: fix DO and PROBE pmtu mode regarding local fragmentation with UFO/CORK")
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
index 2c44e5ed6171..81fb61b94759 100644
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
index 708d960ae07d..82a1407f6a69 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -24,6 +24,7 @@ TEST_PROGS := \
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

