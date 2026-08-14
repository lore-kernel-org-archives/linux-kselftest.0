Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C13C0635;
	Fri, 14 Aug 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736551; cv=none; b=BfVVyF70d/pMPRBWKNZLR3adl4Og30A6+MI6skH0l0idGrK1z75DWGPUZjAN8zcYmu3BDv6X1QtYQsHngZITEI/OgGWpgcBypaNRnLyGdhKUcRMgK3Ou0i1zRllrXMrj0qOf4a27Wx0LB7XuTA16w6FuyEoxJRlCWO6t/KkZ9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736551; c=relaxed/simple;
	bh=G9O5jJg0h84By096BmQO+2z0gh5fnw9l1plsBpzFR2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BToKDyN/Uwbs1BetITA7VbOZ1lT1g94e46JVwhHucF2sQMb6EE3tuv8wiN1iH51o1pM7gyzdCLSOJw/a8pJOJ4dGfrQ+ZU3g42WqVrpcHQAc0Z2cDbv6z3DKibNaipWTsMp4FH7kVg7BfDrcfVk/JoiiMQring91dnOIj5EHnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=Jidgb2Jt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ObNlYuyE; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="Jidgb2Jt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ObNlYuyE"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D963A1D000CA;
	Fri, 14 Aug 2026 15:42:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 14 Aug 2026 15:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786736548; x=
	1786822948; bh=+QFziBVQi0h9Fnv5obT16MU1JuOBl1MbCeiEVbEBTlA=; b=J
	idgb2JtT9vMxsWROU2LmAW/N/MPnG0MS43tgdUiDoQgFnweIW9Yi6A/J9OsnO7At
	/Kg1uOYHqiunt1neQwJucMcqRZKOrBowZGudv+VTQ+pThf+wl8nduO+qR7c0T6xt
	JxJoh5WTUkSSgviukWno7vcLusYzchw1LfyyP2ruOSSB4tmewl5tW4qITTmYy6ox
	QJaQ4UFMI/LVb0oZvuzr62y0r7XZ79jGP+DzaVg3mkwt7uBKLyvzmeaHEUotjqxs
	183mp8mE2Smqkk3edHPLFIiwssWuJVDuZposaatQrt21/iyL2y37tVzlpI8d6Ew3
	g6oCEe5US3ZeEq+WJLruQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786736548; x=1786822948; bh=+
	QFziBVQi0h9Fnv5obT16MU1JuOBl1MbCeiEVbEBTlA=; b=ObNlYuyEanoynh2ex
	hFH5C0B9YvSYEKkmfVr9oE81ohpZ36IWZ065DEhVRqMcoBbhDGRyB8AEYoviAGk0
	rg6Hl1jlWk+EAFpkiZinf+ZM1/U0dgR7C6H+/9ueVmy94bcLWnK0uWGtHFZdglk9
	Z22qXCv75FV6b6ftR16d9Da9ppI/iPYXgUmUu9H5E1gI++OA8SGiHBMdpIWU3ZHY
	MEm5AKNAUGRMp0T1vgctdas40jxr5LINfdyXMGNyPHV33bxs9vODvPunCy5ukoUc
	LOon/ED3CDzu99jWRE4VWpjrExQkBRhPwuBoVjoDHjkHn3EdlaQhj5/H1TKh7VP7
	+Dy7g==
X-ME-Sender: <xms:pG9_avmYS9CpL4i42lRR-7aGhQgO2d4d7IDiYboyrFkh6xVtUsga9Q>
    <xme:pG9_al7ZoL_IqKPtalwdUysO1J39eCZp6XYe33n-VE3vX7p3LB9sRQ-KHUcjktpI1
    xB9eQZZDsDCbyquYNc2cLWg6mPxjcYXTRG6LqNpwhvukbje9L9CeXax>
X-ME-Received: <xmr:pG9_agTZjF2KvVDb82QN5t9dXnwykqcoJf6SJA_7PHQ-b1lWdSWNDGXC2AsJAqQjTaMZ6JCTVBFWNabEN28UMiv_gw>
X-ME-Proxy-Cause: dmFkZTE8MN0WwCcLzgvvMXy7JdXVLDAV8KxvYwt3isTmHk6JjIDpqXHzMchH8SeyfkVbC+
    X0ALSO0OYMHLr6U2P/+xcSgFrynKEQkHqp5kvxDpMKQ2TRmY/YYR6NGyQsO7b7eVLrDYI6
    ctpQ8eUjcJdhf+ICjUV/9qai04UIQtbrNGvpgElGtAafc9RfJnSkBh9fEtp33FqR4avJdp
    IxEnAPBewY2NXNQwACH2HDU98YCy+08/yWfJuveQuCknWJilvLK3Nn6LLikI0bFe6ZGWDW
    8p3cdA9GcQWhwgN2H2ocu6GMfluKHRSdIZjUAdo3LC/FamnfjkEQlYy3GDjkvcOoY9PteI
    yM/kEJM3f1/FNNDF0RHc+/dFDDeyjBg7XiE4PV0DFiTnUti8nqoJeK3cngWf9JZ/aKkMXP
    EnSal/vZbp8sud5BNg2WAb33hcs7+Kx8aaZQo3w6RJROsjMw9IBhVYFDX+YcR7mMiY4ZF/
    Xkrz22fXfUUdvHxirBQGH85nHoisC2YrpiHR2nNzE3DGBtYo89SNqHThW63CMBi0SCqOrz
    fxtTOuzcRoRD+Be4Lgx55kJT6mljnZIKa6M8DO1MwMkp+B34Z5nw5uMA7gsNjjaXV537su
    TKO9BuAp99xSCH9PAcnRpO/VwooTO3NhAMkGd3T3g9sVApk0U/P/WRR8a7TQ
X-ME-Proxy: <xmx:pG9_ajx2pMAinmtoSfdwcqv-_5khQ2JxNlJRbQxQvGpe_hQgD3yKiQ>
    <xmx:pG9_aoqoUGMkNl7_TT4SGz0eJ6n_FqnXKSQT1ThdkM7BQQzZw8SXjg>
    <xmx:pG9_am3PbY6g9t5i-AOrEwViRas7A83cfblLmTXnkUlV2ozXM8poMQ>
    <xmx:pG9_aowBFJXI2l1fGwuM_I37sLIXJl7zhE59EmUz9zZnDmvFsxbs1A>
    <xmx:pG9_aqvh4ApyIKpXtIbbkWIdG6721dzSPvD7ifqsawUwt9vgNlgvXSDM>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 15:42:27 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net-next 3/4] selftests: net: Lower threshold with csum offload off in big_tcp_tunnels.sh
Date: Fri, 14 Aug 2026 22:41:23 +0300
Message-ID: <20260814194124.3102581-4-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814194124.3102581-1-alice.kernel@fastmail.im>
References: <20260814194124.3102581-1-alice.kernel@fastmail.im>
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

Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index e27774eae20e..1f1c811c563c 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -114,6 +114,8 @@ cleanup() {
 }
 
 do_test() {
+	local packets_threshold="$PACKETS_THRESHOLD"
+
 	# When tx csum offload is off, software GSO is performed before passing the
 	# packet to veth. Check BIG TCP packets inside the VXLAN tunnel to verify
 	# the software checksum path: if the checksum code is broken, these packets
@@ -132,6 +134,7 @@ do_test() {
 		else
 			IPTABLES=ip6tables
 		fi
+		packets_threshold=$(( PACKETS_THRESHOLD / 10 ))
 	fi
 	if [ "$2" = 4 ]; then
 		IPTABLES_SACK=iptables
@@ -164,8 +167,8 @@ do_test() {
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

