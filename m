Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D123C3F62;
	Sat, 22 Aug 2026 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400217; cv=none; b=I1rDrZEUMg9iaThr8EuM3BLs4SxTZZHb57v7K8YegmvgR/xPqMiiNbIysAKLLxs7TvwxTTKYBZh9YlTpcx1U5T48aRTJZPfL3D6dCe8vzq1d92+sf0/2SAVCPGXFkTXb6TfEZ+q2IdN8oWRx0E8H+ztFJj4e8V1uFJUK0TSfN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400217; c=relaxed/simple;
	bh=DJ5oQP81v8dL3nQ+yYOC/2UBDJ8DfGjSEf+7+4uX37U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YM463fSSQ69M8ARFeOjW7y7VFVhMXJN+gx1WmeDYy5rwGUp/Dzo5ixKp5ZCd1vdxyK8VjeHHjXLfCyNRH5gy/tli1YjiY0V1vgObJYJ/CWH+JutuuKU+/3jxMHcMPcfMWJGrpr3Qt+/vkR5+RGUg/6NhPcwhKy7NiHUEHeAfMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=EA2krewV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SFu2yAU4; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="EA2krewV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SFu2yAU4"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 004047A00B4;
	Sat, 22 Aug 2026 08:03:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 22 Aug 2026 08:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1787400214; x=
	1787486614; bh=UZyOd0r4jCyWZG9mQE/6PBJDaVLvgRgu6txLQnDkXu0=; b=E
	A2krewVfMcQbbPjub4HxCg2AP8JHUUax44Vf2iuJQxULWjyMabeIoUOuHUHv2aWz
	oCoGLGxAdMatcLpL0zx0Ma2lG5OyY//7/0f5oAiGKLi5othL35m33Mb/6ZYXGnG1
	FhDpiGZeTzwwsBQHSaHzZkfNesiIx9H01OkopwVu1GWPW2ANhldCKhEq0NumxY/k
	niuAsN2LYQQye1hgCFotmRU+J3IAz10kbVZwL9EPbD11tZrh+Td8gCkA5oQAnsHY
	DTbM9bp99SiBmij+u0imJafjkHsyrtRxv9WjTtx2oZCx/TRmDRlPqzYdc0EAxqT3
	vEadGyXRDTsvVti4noSaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787400214; x=1787486614; bh=U
	ZyOd0r4jCyWZG9mQE/6PBJDaVLvgRgu6txLQnDkXu0=; b=SFu2yAU4dAIOiGo3/
	ZkJzXO5Vux9rBS1HRwb7S3kdnfG0SdxMXhe4f0lVdBPTKJBPZpw8vwKZqbVaNsJ+
	Wd03nmh8MJE6h1vsoax1dhRlrECZIMh919In61rDeGth0Mr4kLl7p/U+MhI984DO
	B5ROAwBI0ma+LTS/lpATLFxyhV1783JdcEsg7l1M9OG9HUVf8cE3Ykf11q9GgST9
	UVX4ytYrOjHzuKNVZsNAZZu4cA3k4geIXNkJmEMGQBmN2SaiC5RORF6U0QvansG8
	UhNIqHyWx7/6CbQMIp8UVZd1W3BmXKQ5Vwx5rOmEs4PCG1hqn7LXTAS8cGqKW/bU
	G9lig==
X-ME-Sender: <xms:FpCJastw9h07EL8aw1DK4TOocp8BCTbTvGgkIhI0TJPwi_RVCSaRZA>
    <xme:FpCJanvu4JII2iFoYchdArmQ2xqs19C4eBmQeDPxX6RuKHMvaZphUgnFcp7tBR42i
    g2EeNz7UzMpi89ofv4VoyG6Ly6WPmfmLko3MoZk6W637pYYnNgoOkM>
X-ME-Received: <xmr:FpCJahFQuhpRZ4IjIlYfqVsEcbMthWqLqihymdrdKmA6Ha2975-oAwuXoeNzoQ>
X-ME-Proxy-Cause: dmFkZTGg+gnfyiS/t0GzAo9yUBBjMZ35coAZHemgLRoQ6FsfA0/o2Ma0c4XLrDNGgpGHJu
    R9QOgavv5gnUAaq5PlAGR/Q1wvvqEnwtGdoO/if4P2aqgkbEdxx4escrJkOUa7yE5QoLR9
    jlXbj/SlikNDiMSWFuPvh37QmJEAWZ8u1GsiBYdalb3xw+iu0VcTG2NCg7htlbr41FadCY
    jVigAM/4qybxO0KDNZOg20UyC8h8jEYL23bpDcC2y6GrK+XSJ/O+NP4xuzYsYJ4f/VIgtN
    dRqvAzjihBES2wKytVKbYrJO6cwXdEf6UlOFKNlHsS5Fsla1B7hshGIL5eXy6pcRianiSU
    nX09HD2vTXZqtVq3DdT1lH07HB1FqAwpwwaVxovqQ7nxFbB09jjhgSMhmgRNjYxIRwDUh+
    0iY/MkWx0jOrL8WKDRijDozBoRCDHuhdjag2M6xpyzQ5B9/eJVKSR/HeqIc/XRTx77xG3+
    rcl/UPvplZ87dItNh8yHjKc7OACX3+p5zYmFNxbJo/pTA+uHjjouQfdWro9tGM5WvkdYsU
    B4+PeO8Ks9QKv4yYsul7EMrwn5C0+pHJV6v+S+B11mjQHkFAbCKQUZXmZ2QyxXZZKhO9h/
    vJWQChyLq6WW0LA0Kj3jkt8nR06tlvEDe/bLF2kwwhD/Lh8fvGt0fbBUCGkQ
X-ME-Proxy: <xmx:FpCJaiMw1EkQ56c0xBkwORtb_Z7joQTHLiVT3Q8ZYjhZHKMudGTF2g>
    <xmx:FpCJagIMp5x7tnDP692D9hDZOnNqLH5h3co45hoqpmsfKqRRy9z4JQ>
    <xmx:FpCJar9T81ItMpXUUF9eKjdvVIxcxM8hRFiP9J39ufQzPYbJqdFJWw>
    <xmx:FpCJasF7PY28oFCY84t7jgoUATkIquhdJtWa3h-_QUXpaAB15ZkBxQ>
    <xmx:FpCJarrWPSWKcGcwvCwDF-bbATDaos8w2c7CPBSA9JbV1TJwOszTOog2>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 08:03:34 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net v2 3/4] selftests: net: Lower threshold with csum offload off in big_tcp_tunnels.sh
Date: Sat, 22 Aug 2026 15:03:07 +0300
Message-ID: <20260822120308.1165200-4-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822120308.1165200-1-alice.kernel@fastmail.im>
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

With checksum offload disabled, much fewer BIG TCP packets are generated
due to overall loss of throughput. Use a separate threshold in these
tests, which is 1/10 of the threshold set for the rest of tests.

Fixes: 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP tunnels")
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index e0b41f394ebb..003878df7415 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -107,6 +107,8 @@ cleanup() {
 }
 
 do_test() {
+	local packets_threshold="$PACKETS_THRESHOLD"
+
 	# When tx csum offload is off, software GSO is performed before passing the
 	# packet to veth. Check BIG TCP packets inside the VXLAN tunnel to verify
 	# the software checksum path: if the checksum code is broken, these packets
@@ -125,6 +127,7 @@ do_test() {
 		else
 			IPTABLES=ip6tables
 		fi
+		packets_threshold=$(( PACKETS_THRESHOLD / 10 ))
 	fi
 	if [ "$2" = 4 ]; then
 		IPTABLES_SACK=iptables
@@ -157,8 +160,8 @@ do_test() {
 	echo "Captured BIG TCP RX packets: $PACKETS_SERVER"
 	echo "Captured BIG TCP TX packets: $PACKETS_CLIENT"
 	echo "Captured TCP SACK packets: $PACKETS_SACK"
-	[ "$PACKETS_SERVER" -gt "$PACKETS_THRESHOLD" ] || return 1
-	[ "$PACKETS_CLIENT" -gt "$PACKETS_THRESHOLD" ] || return 1
+	[ "$PACKETS_SERVER" -gt "$packets_threshold" ] || return 1
+	[ "$PACKETS_CLIENT" -gt "$packets_threshold" ] || return 1
 	[ "$PACKETS_SACK" -lt "$(( PACKETS_CLIENT / 2 ))" ] || return 1
 }
 
-- 
2.55.0

