Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058472;
	b=e23T4N3m7wL8m9QBIeXQRH+enpJvXF+PJmja7G3M8+l64Y6ollu4PcSTOxz/fmhws5k+
	 h+1lrVNRkTRxGfF5OXmQRsPlD1SO7IT7h1rTMgpcPdihF+C1l8qXATByC2F/sZ2yHlLDe
	 Gbn/7fs6fiqRzl+BvWgPv/m3eF3SiRPAXXAo2SYAnrUSiVP1uhLcqbNqypw+yg6CS+CvT
	 Eks40BHT6czLrQ3HVGG/cFpmIY2FVqDQ0rEKiLMpjl+EZlGLF1GdwAyAlGg9fyAtRv4D8
	 c3z09V6rRUwJI97l9HlFzMWnhAAtMrtY6OZI7WTroS3YwXfNlUQr+h3S62oE8GvcTyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058472;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Content-Type:Date:
	 Content-Transfer-Encoding:X-Lms-Return-Path:To:Subject:Message-Id:
	 Mime-Version:Received:X-Mailer:X-Original-From;
	bh=nINnfU7bY08LHLuoUTIzwVaBOZEYQj6zHgkfmZk00xM=;
	b=NZHe57tlwCry6V0a0449k7awHCwL5X4kz95HkSlduDkfcwe2NWyM2SwSjVDTkSzjkgcr
	 BX/F1TP2ve/43vb9dFiSCsToXnhpKY7TyG7ob/yYoIk8WglpnaCQh0/nB/gLDUBcVlCFN
	 DJ4EHdEjn9gSsAq6sO7gRvCz5HV3ykA62akYTwcJsQUDLOyrzduX85IbhVMZWbD8nYskj
	 2ZiMUD3noLzKi+Dy+RwU9vMSW+D43RX6Uo4Yk2wgYYXK2s1E3iN9v/p8kfzMRtR5F/LQv
	 r0Jt7phJJuMiwTv8CigJNAbbbqESuosXdITFCaMBivONNn43d/0oZoueHaWas7jdS7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lanxincomputing.com;
	spf=pass smtp.mailfrom=lanxincomputing.com;
	dkim=pass header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=bIyEJZl4;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF0606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 13:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBF0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=bIyEJZl4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1794058462;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=nINnfU7bY08LHLuoUTIzwVaBOZEYQj6zHgkfmZk00xM=;
 b=bIyEJZl4fG74HmgmBD3EiDlJp9gERQ9/sSijx+VKlhGmSjSN6PhLU76BJMkDXoSCPQuPbi
 K2cTss2AK+FvPir009Whec/9aw2zxZV28zlutAhxr/5wfViE6NJMwnXKqJaBVP4cMKl77x
 95fRFtT5j0SJkX9GdbabQeHYwfZW4ZOpiffbcmcQm9H+4dvIyktdRaYLupP1C/PeKkXnAh
 mRvLAD2oIeqSTIl7GoSL8iUQ3GeWcwF4OH22B09xWlfBItZpZXoFoAVrpXICBT0nE7Rydx
 p0NqkbqWpdQSDgLFiP2L6F432EdTNL4Y3UNIFDIwjhzb2gK2kMc4wNm6v+bTCg==
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>, 
	<pabeni@redhat.com>, <horms@kernel.org>, <netdev@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, "Jin Li" <jinli@lanxincomputing.com>
From: "Jin Li" <jinli@lanxincomputing.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat,  7 Nov 2026 21:34:16 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26aef28dc+b4cfd5+vger.kernel.org+jinli@lanxincomputing.com>
To: <dsahern@kernel.org>, <idosch@nvidia.com>, <shuah@kernel.org>
Subject: [PATCH net] selftests: net: forwarding: replace bash brace expansion with seq
Message-Id: <20261107133416.212677-1-jinli@lanxincomputing.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Sat, 07 Nov 2026 21:34:20 +0800
X-Mailer: git-send-email 2.53.0
X-Original-From: Jin Li <jinli@lanxincomputing.com>

{1..16384} is bash-specific brace expansion and will not work with POSIX
shells like dash or busybox ash. This breaks the flowlabel test when
/bin/sh is not bash.

Use $(seq 1 16384) for portable iteration. Fix the same issue in
custom_multipath_hash.sh, gre_custom_multipath_hash.sh and
ip6gre_custom_multipath_hash.sh.

Signed-off-by: Jin Li <jinli@lanxincomputing.com>
---
 .../selftests/net/forwarding/custom_multipath_hash.sh     | 8 ++++----
 .../selftests/net/forwarding/gre_custom_multipath_hash.sh | 8 ++++----
 .../net/forwarding/ip6gre_custom_multipath_hash.sh        | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
index 5dbfab0e2..92940370e 100755
--- a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
@@ -224,10 +224,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
diff --git a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
index b4f17a5bb..19384be4b 100755
--- a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
@@ -319,10 +319,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
diff --git a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
index b24acfa52..d848e82d4 100755
--- a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
@@ -321,10 +321,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
-- 
2.53.0
