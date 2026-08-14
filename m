Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B73B95FA;
	Fri, 14 Aug 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736544; cv=none; b=CTYBNx/kgnz8GKPBa157Sa75sEtzl87WiuPCn4DvqayoJdyKypVUMBUeTtRKcVI33RSlH9IFa4noxuD7msxiN8jFD6S+72ZXx9E7hP2T5E+ZX+5Zz12MBSAQdKJCV0rMIdDrx8ptlhOduU+e3rBCnvEbxSeyps70rgZIM3NMNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736544; c=relaxed/simple;
	bh=BP4rPxMAqmoNnTTxTFn9sXOTuHkbHz5CyoLDrPXNdqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjAv90jJ0KSI4xYmGNW1/BB+YhLyDeuld0IVZj6eqCkRN8Qfr6va63zKORsGttCl6ZD5k56thCV5XsraJ18vNLSNH+lifE3PlKOE+HYYkXHaFK/VjzK6WtH4YVLwJNfYi10zVGlDwCfjRJNaWqm7UQ4r1im0Pq1naakPEYKZsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=bBKV60Qj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TiK+gyYx; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="bBKV60Qj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TiK+gyYx"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F0287A00D4;
	Fri, 14 Aug 2026 15:42:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 14 Aug 2026 15:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786736541; x=
	1786822941; bh=SGGHA0xKImQ7zIKV8qFlIGM1xXHx2zELzBqZz2ALgI8=; b=b
	BKV60Qj0XeE9y5gKJfHFpxqdEAqAUciBUroq+D8D95uSi6uGdvh3wAdVXHTKGaYv
	e640CdLmCJlQqhuNRu3sqiZvf5i2yzpyR+CZFJTXbVSMT/uNQQ2aVXLsmO5yE7eK
	iXItmgx1rzvdM8vn2XxftfQzcK5K599Cz6YyORbljAUT9AmpHf3K870W+/ycdPv0
	JpAg+gU8qOVH+0WjSMbmBq7CYECAdRrtJnvJCmfEMaf7TxPsHvWXzbRcOwcI7whX
	AySB5ohowKZroeXSgpvlCBb9YDmyd5jz5uwrz5toKU1WI6n+I/PixC3gLFLrv+eD
	hIvkUZAHr1rlStL4n864A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786736541; x=1786822941; bh=S
	GGHA0xKImQ7zIKV8qFlIGM1xXHx2zELzBqZz2ALgI8=; b=TiK+gyYxf30CZqcER
	Nm2jIW9b/mtx7/VeaO3mApA/6URCX/5Vt97F1gyTx74wB3gM9zGKzaOfKWDaoFM4
	duRNBcbfY4g59LBvmmZMpD6rn+AZDqyUThIeUjnR5uWq9ION6/CADXDprqlb4Auk
	aSduFooMdEJuArcu3GCzixBfLiwObSePNzgUemlQSN2hWyz0CofKrcCIJ0vAAp7Y
	5eUPKtx7cGSI00IkKnno5091+WVIhb5U3A+FoJEvXx5zbJwyqnjkRkh0mXrjt962
	yOnjTZ/n5v4opNGj0jMGcWT6Uxn6qocF27rHJ4S+aJYwyxw5PsBLvQtAbviRnlI8
	Hfu0g==
X-ME-Sender: <xms:nW9_aiaachKoF60fk9AH-nY2FrC5cTFMlF7muT0SbvGfV8NFcC8cZQ>
    <xme:nW9_aofHxhA5rkzfIcPR-l4TOcihJOstEjyliKyBhlSxt3GfO9rqjVdSD3mP-uAJ7
    CL37g71e48zuXrvqTD5_UZcfW4nZhwqS90yUPVPRaD5TtNG0DHx5w>
X-ME-Received: <xmr:nW9_ankWeBpFaVQddp09qehEos9la1l_gCCPZQsBEjLWhZTfKc5up-rlXbAzSVbwEdYepU5ROZFATKWBbaXuAquH4A>
X-ME-Proxy-Cause: dmFkZTF5RcHVIOFJBS4QMFSy2DmxeH9magFI+UxI8S7HhKrs9u31RwDCMVbeK2o4gOn5en
    XLjwt96IhDBCQj6fyNcZjMIk+6+xfew9M6WLIDl6vcvMj8u/FvuFP+2s0XmcCmkdCX7DjZ
    /F8DsXzTyP1dOHQsQDIf9wk9Iee+HKlYuOo0RJOG+Y9hqZuFJtHMYcAbf6B3pCZC/bBN6A
    nOWeygqW2ORnFkc8X6eqEg/Ho+gaz8cuCMgO8/KP2u9b/6z8PggpFbXbInsgdtxnAK1/j4
    3ckuw94J9Y7UYRLLhLMq5idSVidfl3zyEFrHu4CdwsykSbDzaspufv+EpWdJXeu+n6/Vns
    qj6ykRudQcSLoOlCSG+AS/kADwUbyGR4cf5wT+6cTT7PCJK4QuntGWe41BEEtVNZ5JzZ26
    NpO4TPzXkFaxx66CzIJwHvWYlzqbfDwRcINKOYJ4FveSc5VY40f9NEPvhPr7U06Yl2c84c
    GxksTLxis305cc+VQ5Fop2L7aUs1wpTI3b5n7bOFt1DjMzpn/2HzRHxjLRlgXSQU9rIgNz
    avxFnT4N2LrsiPFuJSjilcmgwcc7bNWveAuyi+CMK/F/KY7JShQYz8WXp1g21Td2Tv3zwq
    KVvbe4ELlssTiJYY26fOTXA4USDT6dJR/NEJzViUELcQyBYhzXIORfbg2ynA
X-ME-Proxy: <xmx:nW9_ag2_4KdHmKOkzs6ytZtdINmcb_aWAy6AZRboKkmLOrbwYsov7A>
    <xmx:nW9_aodvE2Bms3jEsyPik3ME3LX9ncUL31OUqULOKLjWqtMctRRRzw>
    <xmx:nW9_aibXXwOeYM7DX_HJGXlyy62NbIqaBHw4fkfWdHlyYHxDXu8yfg>
    <xmx:nW9_alGBnV_3f0jF5gFspJSWMuaazLBmH8ruJKrsB2BALp_yKgMtLw>
    <xmx:nW9_amjJypnxwP2F0oaWh-D3WhjMY2yaO_pSLby5IEiR5KxpOHu1Ensk>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 15:42:20 -0400 (EDT)
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
Subject: [PATCH net-next 1/4] selftests: net: Wait for netserver to launch
Date: Fri, 14 Aug 2026 22:41:21 +0300
Message-ID: <20260814194124.3102581-2-alice.kernel@fastmail.im>
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

Use wait_local_port_listen after starting netserver in
big_tcp_tunnels.sh to ensure it's listening when the test starts.

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

