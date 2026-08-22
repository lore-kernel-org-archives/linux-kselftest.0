Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9893B8412;
	Sat, 22 Aug 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400211; cv=none; b=K8pBZ2+8Ip2vpLgdNNRxWyxmSTZxFOlvJodpY1YYAKVcSe2fJdc1SgjqdeDbD461Ddz4oiAgoxqVF3X69S1I50K7MkA9RWkU+TCxD3Ac4h62vZVOd+/4Q2JN9ae7UNPAPqkBfV+AlJ3Ht4rwoTZ24WycH28Q8aIZax0wBH/4aIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400211; c=relaxed/simple;
	bh=5N2XWcg4XrJRKxfDerqWZ2yhKCs+1mJbi01gjEU9YiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CT1vtl5y5i6C9oMAHuxpRyuX4XFtfyDZE4ZXjf8r9ybMeahvK6RoE2XkNL+/f6pJI5JU0jS0dV9Tn1JjS+3fmX1LbCq/sn2VIUvoTvZQr/9iGxgN2yq5r6WR9U+yGjpM51qo+8SdlOIP4cNLwCkcYx/f7EAg8J4F3i8kFzL5s5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=cw7JJXFr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=clnqFjiq; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="cw7JJXFr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="clnqFjiq"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E431F7A00B4;
	Sat, 22 Aug 2026 08:03:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 22 Aug 2026 08:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1787400208; x=
	1787486608; bh=qh2BcRf/1XD9eHqWIQBHxCfoJltrqePDcK3FNqa6zpg=; b=c
	w7JJXFrWK/zICw3i8F0KEFUPVUxMxUkPyOLTVYyixvyrl6on0ctsIvERGFS1/J2P
	a+ef2stsTTRGWDp9i25fMwi1wiCUTo+1TtPLKQ2oO2wahmZBMXJZIJN279gKp6P+
	oyJtDHp4xhx9Mxf2KqntI/A09ZiAmCBTybU+8l50ZHRc0c1oTo/Vzr7Nu1TToh4B
	YebG7Oagh6GgU8mkidClAOwQvVphi0Bw71z88LWeqhfluTomBgPgueQ2P0AQeACa
	KvM8JjSqXPiGc7MW5SLZ2HeUeSu7u/Wunkcd/gtc75QfwbojdQHmn+wmWHwzrBeP
	0FlfO5CkAWraFrwmhCBEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787400208; x=1787486608; bh=q
	h2BcRf/1XD9eHqWIQBHxCfoJltrqePDcK3FNqa6zpg=; b=clnqFjiqm1hCKo7sv
	fztCh+q6MZiHFpWzZPM7dsF9XJxM0SulpIzzqIWmpgooWOfg5j+iKegNQLn5KIcN
	OxpxjNDb/gAWUBDdgolj3jqS40Fxa6KQdLrOxoFU14gC1YmTlYD1l+7rVpwnqQ9M
	owV3yMMoiW8MtS1cWXfBL2n/ks519fX+12RFUyBoexyDGJm8RUuVidOyAf98ev4B
	Gi1vQWD/516FlYZrUZFnB6BslqXGAJoqiCRq+DMQUfm/jeGkGmuKKombf6/Szw97
	B0ij0Q6TAukP75r/IZdJ3xOmfKa01SBr7Y3Oas2O+3ITefpvpZJD/J+2U6+w5egS
	VbYYA==
X-ME-Sender: <xms:EJCJamlRsuQ-_6o-iDVdLQfEht8fEEj-apANMFOYLSZnCwSDw3Rl-g>
    <xme:EJCJasGFVRKotmgE3WlIvo5rYcw6juYMpz-3pkdRGZXfbcr82DtDC3zx070p_ETq4
    t5hIyLRaDiiu5bJi3sQnjwIvl3j9gSgHm8SR5E_eYQ0UCgOXOri20M>
X-ME-Received: <xmr:EJCJat-cz0cryMZ2DGFqknTz0Zd07pBsU6OBQTz9cespOSHNTHnLAh1yEzm65Q>
X-ME-Proxy-Cause: dmFkZTFaX8wOrshvLU7J+PDxpoaAht0xCWfKNXQ/qJ3dE1uDwyLmT1zixuGol9FVIlMxyp
    cFtQAuesbPUaE0ZxfYZB+K2zojBKYzXoU1STxlX76VvucFiM2Z3v8iVx6FWJ8v98GWSzv+
    kXCbYSb5YfF0cTIkshGEtMW/bZ0GoeWSJcpB07HHug7750WgGAiaGLrlPTq5aiLUTILobB
    r7dLoqKvPNyVUDO2Gml6UvBBTfnI9R8d8nBzycG+nRjYd+21x8sHtymqK7M4mggT7fBusu
    fpBxzAgFc3gr0bsNq/VbINecjkJSHC+6ClR+PgSAp66Em81xHBYeZKY2lWKkyVIY3eIKR8
    EocudIg9NYCG3TrryXOylycOwrOYOjp2R+iwE93Q4zAKdE8h20LufayPRHhx7Fzm+uW+NB
    /+AIw4MeAGOhn8vQknMW2BnqBaV54PLvFSyfB4OeVXWs1PZt1ZLyWaIPMiNxw1GNrhE6BL
    pD6v9ToPhH8kO2N5n+wTJ+5pe03Xyh0MM6wZ4V3wiAV5qd+9ei3BhBm2NwEJCk81tryGYi
    UE1Brpz7mG1F1KNTCvCpSOmdk0umegUD0OugYgm1K8vgbSGvxXosKvehh/vNxLrPLhxDzO
    vcEeZV3TEjqYUgduJr5ENu+rzzbpXMpNefenoNdTdRr19ebIiXxb5LSL0QkQ
X-ME-Proxy: <xmx:EJCJatn3zhDeRovv7wZ4iQWTbvkYRvT3DZM92ZQjoLA9DdSwAugNLA>
    <xmx:EJCJaoCYo5RhkYJN2_8WsdL-5YmRaSwpn7ny4DtfSfI9SM4Gv90aog>
    <xmx:EJCJamVZ3JcLsq-60lGhYMbTfrV6bDVSdC51vpgFAxnGkNFBUrRpZA>
    <xmx:EJCJam8HkGgd5i1Bmk6aRaI3zb3DCzMP54viG7UtPapeZD2mpA5koA>
    <xmx:EJCJauCyz5C-Y_tqivHPM4yuehlr0LjvEbRoNzKpp-B_xmAGL3ko3qCd>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 08:03:28 -0400 (EDT)
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
Subject: [PATCH net v2 1/4] selftests: net: Wait for netserver to launch
Date: Sat, 22 Aug 2026 15:03:05 +0300
Message-ID: <20260822120308.1165200-2-alice.kernel@fastmail.im>
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

Use wait_local_port_listen after starting netserver in
big_tcp_tunnels.sh to ensure it's listening when the test starts.

Fixes: 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP tunnels")
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index d6513ed8d4e8..9b7d0456bcc1 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -3,6 +3,8 @@
 #
 # Testing for IPv4 and IPv6 BIG TCP over VXLAN and GENEVE tunnels.
 
+source "$(dirname "$0")/lib.sh"
+
 SERVER_NS=$(mktemp -u server-XXXXXXXX)
 SERVER_IP4="192.168.1.1"
 SERVER_IP6="2001:db8::1:1"
@@ -39,6 +41,7 @@ setup() {
 		gro_max_size 196608 gro_ipv4_max_size 196608
 
 	ip netns exec "$SERVER_NS" netserver >/dev/null
+	wait_local_port_listen "$SERVER_NS" 12865 tcp
 }
 
 setup_tunnel() {
-- 
2.55.0

