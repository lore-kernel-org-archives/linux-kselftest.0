Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67154707E;
	Fri, 18 Sep 2026 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707032; cv=none; b=Z6YFIYROKJ1D+68ZMG5wZCbA1b49jkPlklDHMZz6+CAk1RRNzd7vmkE7BTw3wpV1f8Jb0REEtsdAOafw79pRLGm5RQs1OdEw3Njckm2rFdOPwEdkoaJFrI5MZ9eyN/C/4P9CYxKdQC9FfSBT6AtXkdx8Yl12RgwZCZDeUjNqFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707032; c=relaxed/simple;
	bh=n2piDbYsTAYFwqdXcKxPJVurKNps3aJYTe9GNTCvdd8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AMXs/SfqBgs/EO32w5OE0f0OEbkbr7Vu0XRfn35vb+9oA00fPqytsf61UhHxqdIX9SprxG5DH/12+4yM708uKqzw9ds94t++gyfxnuLutpNmeaJG2I9AFBxRUcyR7z/LVynNHnBHRJ2zqoJnoBEYbaZmR5w/9W/a45y0mPK7mco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=DCNMqRQM; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="DCNMqRQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789707030; x=1821243030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SyFwGRaqH3oiMPjnkPS47mB6Cdto9junyyZzujrDe6s=;
  b=DCNMqRQMjkVRhhROTSIQLHYLbDPcRvcW1TTC/o61SrczHEiZ885S6b0f
   WglGbS3TzeZ8wigyrvi/3SK/dwAF15Gc0eZX7dL22vxLldsJCRG1zwFqn
   L9oN4j8FVBCB2ydlH42jtPxrNXhqy0kDhQF3O362WmKnFWs1FwsLSAiI3
   RSOw3UuF2T/A5OBWgXFtCOsASB1A2vQ1X9m9NdKqyuGXzKs6nuoRJALVa
   K1220oobKfN8Pxy0yviMDl4S2tbJ5ySlS70Zm0WlEitdn5wTwKhM/fpHb
   j7YxY5kjfIuqz1IepdFAKC9dxRTa/k5Z7YaAfOyjA6BIiQzZQV0kBzCQi
   Q==;
X-CSE-ConnectionGUID: BNh80O8jRzexf/r4DoH8og==
X-CSE-MsgGUID: VtQlHfxkTZS7CXiOdcjmww==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28762656"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:50:30 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:30209]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id f7103714-67e9-45c2-bbf4-f7afe6d43e37; Fri, 18 Sep 2026 04:50:30 +0000 (UTC)
X-Farcaster-Flow-ID: f7103714-67e9-45c2-bbf4-f7afe6d43e37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Fri, 18 Sep 2026 04:50:29 +0000
Received: from 6c7e67c92ceb.amazon.com (10.187.170.24) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Fri, 18 Sep 2026 04:50:29 +0000
From: Nathan Gao <zcgao@amazon.com>
To: <edumazet@google.com>, <ncardwell@google.com>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>
CC: <kuniyu@google.com>, <horms@kernel.org>, <shuah@kernel.org>,
	<netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Nathan Gao <zcgao@amazon.com>
Subject: [PATCH net-next] selftests/net: packetdrill: check rcv_ssthresh vs scaling_ratio changes
Date: Thu, 17 Sep 2026 21:50:21 -0700
Message-ID: <20260918045021.42138-1-zcgao@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB003.ant.amazon.com (10.13.139.172) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

tcp_measure_rcv_mss() recomputes tp->scaling_ratio from
skb->len/skb->truesize and updates tp->window_clamp accordingly. Commit
f5da7c45188e ("tcp: adjust rcvq_space after updating scaling ratio")
made that update go through tcp_set_window_clamp(), which also shrinks
tp->rcv_ssthresh, so every scaling_ratio dip cut the advertised window
as well. Commit 0e125ecfe20c ("tcp: do not change rcv_ssthresh in
tcp_measure_rcv_mss()") restored the plain window_clamp update.

Add a packetdrill test for it, as suggested during the review of that
fix. A fixed SO_RCVBUF pins sk_rcvbuf, so window_clamp can only move
when scaling_ratio does, and the peer announces TCP_MIN_MSS so that
icsk_ack.rcv_mss sits at its 88 byte floor. A single 89 byte segment is
then measured, and 89 bytes of payload in a ~900 byte skb is far below
the 50% that TCP_DEFAULT_SCALING_RATIO assumes, so scaling_ratio and
window_clamp drop sharply. Nothing puts the socket under memory
pressure, so rcv_ssthresh must not move at all.

The test checks the state it depends on instead of assuming it.
tcp_measure_rcv_mss() only measures segments of at least rcv_mss bytes,
so rcv_mss is checked to be 88 before the segment is sent. It is checked
to be 89 afterwards, because rcv_mss is only updated by the same code
that recomputes scaling_ratio, so this proves the segment was measured.
rcv_ssthresh is compared against the value it had right after the
handshake, not against a fixed number, so the test does not depend on
the receive buffer size or on how the architecture accounts skb memory.

Verified on net-next, where it passes for ipv4, ipv6 and
ipv4-mapped-ipv6, and on the same tree with the fix reverted, where it
fails in all three modes with rcv_ssthresh cut from 260684 to 51200.

Signed-off-by: Nathan Gao <zcgao@amazon.com>
---
 .../tcp_rcv_ssthresh_scaling_ratio.pkt        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_ssthresh_scaling_ratio.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_ssthresh_scaling_ratio.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_ssthresh_scaling_ratio.pkt
new file mode 100644
index 0000000000000..f99ecb8a224f7
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_ssthresh_scaling_ratio.pkt
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+// tcp_measure_rcv_mss() lowers tp->window_clamp when a segment carries less
+// payload per byte of memory than the ratio it had assumed. Test that it does
+// not lower tp->rcv_ssthresh as well: rcv_ssthresh is cut back under
+// memory pressure, and it only grows back slowly, through tcp_grow_window().
+
+--mss=1000
+
+`./defaults.sh`
+
+// A fixed SO_RCVBUF keeps sk_rcvbuf from moving, so window_clamp can only
+// change when the ratio does. The MSS of 88 (TCP_MIN_MSS) is the smallest
+// segment size TCP will measure, and window scaling lets rcv_ssthresh start
+// well above 64 KB. The window the peer announces does not matter here, this
+// side never sends data.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [262144], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 88,nop,nop,sackOK,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <...>
+  +.1 < . 1:1(0) ack 1 win 65535
+
+   +0 accept(3, ..., ...) = 4
+
+// Only segments of at least rcv_mss bytes are measured. Note it down, along
+// with the rcv_ssthresh the connection starts with.
+   +0 %{
+assert tcpi_rcv_mss == 88, tcpi_rcv_mss
+ssthresh_0 = tcpi_rcv_ssthresh
+}%
+
+// One segment, one byte above that threshold. 89 bytes of payload sit in an
+// skb of about 900 bytes, far below the 50% ratio TCP assumes by default, so
+// window_clamp drops sharply.
+   +0 < P. 1:90(89) ack 1 win 65535
+   +0 > . 1:1(0) ack 90
+
+// rcv_mss is only updated by the code that recomputes the ratio, so 89 here
+// means the segment was measured. rcv_ssthresh must have been left alone.
+   +0 %{
+assert tcpi_rcv_mss == 89, tcpi_rcv_mss
+assert tcpi_rcv_ssthresh >= ssthresh_0, (tcpi_rcv_ssthresh, ssthresh_0)
+}%

base-commit: 4982d3552a3bf94de503acf93433277d08421de6
-- 
2.50.1

