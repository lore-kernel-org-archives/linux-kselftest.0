Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E853BB103;
	Fri, 14 Aug 2026 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736548; cv=none; b=D+CazPDKNnT4aY879k8XIvme2dbGHu10WUPhcCUY8yYwixYIvxcOPXrP6JZtHEPuTliVxKSGlUPmOs9a409IgwFGSBZBc6qzmuvMScnmeGLpBa8gHdg8ppd4FyBPt0SUIVTgw5qvEq6o83Au0R5AHq43+izSRK4an9C8vrErAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736548; c=relaxed/simple;
	bh=i9bRuEgvLcVe8H3cai5O56iNlaDCkpJGlzAXDdVxNUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IphIKZt2U6adKwsQCFro7AAS6xp80cSaSFdgB+U72L3TTHM/jb56LF5zhMdukWZD4ps9bX6Wj4Sxw4f/cpxuacDy0nhvVuw25faC1NuZEq9ItTSAL2PVz/H2vLFX33Ry2TRHrj9l5y2+SZ44LM80pj/Th71l9nAiwa6voLlhVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=HUyLxUDu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O16Eo2yM; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="HUyLxUDu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O16Eo2yM"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 7AF331D000CD;
	Fri, 14 Aug 2026 15:42:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 14 Aug 2026 15:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786736545; x=
	1786822945; bh=q9+HMLOXPeCugPNCSQNrQsX9TUuBt6VjdON58ExGb94=; b=H
	UyLxUDuDD50FOoYu4cprULwTkZSGVvAcfrhQSiAnJWblE04WhCeFWxKQOUKl1jZj
	rZ19Q9nP7ZIuyL7eRttI+afSlLiUc8dFl8Mv1+SzwghzhREmU9+J4tWBsqehv3vH
	wmrDcHvXVS2NzU4+DpAx8jYyqckob4oknpPoKz55MvXtn9YPr5OFvwgbPLrMhOfT
	4D9TYGWTOjFsLjNPwGYoGAOVaM0VggPwSrp7ua+npRjTGNS5MzwvAcWC7dU6E7sl
	kICVQihgLqJE0SVdRzgTraszBdNt7MbolvZyy6HfhqFt9StSs7CX2N2j6KSQrP4l
	Daub9cOpsLQL+cKUywlZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786736545; x=1786822945; bh=q
	9+HMLOXPeCugPNCSQNrQsX9TUuBt6VjdON58ExGb94=; b=O16Eo2yMxHmYcYPX9
	NRP14DgasYoqvwXKa54jwFfju2eMnTzEuDeakWxio9UeqwpC15xTaMx+U3oGl4LS
	m7ic9vo7j25JokfpWSvxDoWP1zCx1W5F8vJ1JnpBz/vMwwtDyD0QFMbECuL9dk/0
	FOqSd2KOCfnzYllu4uBeMd2RYHsFhXUvFTQ/27ihk1FpTZFMOZAyXQuG0OK22Esp
	QWc42LkScYciH21owA4uyUMYCtBWOASQqy/aVprMETjWI5aydSb7oYchf4Ab65V4
	HkFJMk7L+F0PSqwZm8VFgxoCGE5o9iHuKJMtbGTTMMoL2yE7iQTdOY1cWk2gd0ot
	Ke3mA==
X-ME-Sender: <xms:oW9_ajvZco708HxvukodR75OuWTOXS9YNN2XGBmPxaJ0DRS_ylroSw>
    <xme:oW9_aniB6nKlzeIJjjquJnTczxUOnpzPJsgXJqKIBFxyGGdIWAWIJHQknKRfL1_Qj
    ZGvXDfqxoK8lHrkpuu5hGzTAp-tRyTp5djZ-Gws_po6C55gz1DjFWg>
X-ME-Received: <xmr:oW9_ahbI6GQ43uF2bwat1PO3xtNd8G6eoTN90cB5tziGT4Z4Y04X0o9RViRV4pmpL1mbgftYRjnGLCATd3VLIbUpew>
X-ME-Proxy-Cause: dmFkZTE8MN0WwCcLzgvvMXy7JdXVLDAV8KxvYwt3isTmHk6JjIDpqXHzMchH8SeyfkVbC+
    X0ALSO0OYMHLr6U2P/+xcSgFrynKEQkHqp5kvxDpMKQ2TRmY/YYR6NGyQsO7b7eVLrDYI6
    ctpQ8eUjcJdhf+ICjUV/9qai04UIQtbrNGvpgElGtAafc9RfJnSkBh9fEtp33FqR4avJdp
    IxEnAPBewY2NXNQwACH2HDU98YCy+08/yWfJuveQuCknWJilvLK3Nn6LLikI0bFe6ZGWDW
    8p3cdA9GcQWhwgN2H2ocu6GMfluKHRSdIZjUAdo3LC/FamnfjkEQlYy3GDjkvcOoY9Ptdp
    yLpn9e/rR2wZU55mbp7yGFDzP8JD2agtMumsxQ8m0+QxSagGNlz7jRGTc5pPBtRt196nzT
    arDjM4VIMQSdxhv5SMtQitfeEqUutXWCjnX0hrZGveFsVfWqzNSKBRkn7QKHsoIqx6OIvt
    lG/8ff7lQxm+kdPNXqbqo9gcfQPARgIVJX7G4opx8h5CdNQ/cDffSxr2jZe3R/5OZ0KOel
    rERTS3GhJ6EsN69aLTMX5OkDjekEEw5dzlq1F++xQVFSUw5FyGLXpZL62IVk8YdrJIjUFo
    H6DoDXtFZkasUw7FOksRN4EJ4HfFyjmeMk0PL7b4yTjFa5VHUEhciUVgSnEg
X-ME-Proxy: <xmx:oW9_auZsK3xIJqy3EHHoHPqTPV1ooafL0HfH-8EwdWlYYAxEPCqfOQ>
    <xmx:oW9_auxqHE5aI-zdlEFHuc8n5PfItSyFOLaLGcJCKAvFq123Fu-WPw>
    <xmx:oW9_aiefK8aMRjl3OKc8mhUbN0Vt53sPwkRR6hj8iGAB_TMBzBANgA>
    <xmx:oW9_ar6P_qT50L95XCr--F1zyfdPEr96QXpyKOhQhE_S6AHOVZF8yg>
    <xmx:oW9_ao3L5HZMzR-RMrVv-_wGmnYhL0pqloeDEt-FasPZx1WmzoE2UzWK>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 15:42:24 -0400 (EDT)
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
Subject: [PATCH net-next 2/4] selftests: net: Lower threshold on debug kernels for big_tcp_tunnels.sh
Date: Fri, 14 Aug 2026 22:41:22 +0300
Message-ID: <20260814194124.3102581-3-alice.kernel@fastmail.im>
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

CONFIG_DEBUG_NET kernels run slower and generate fewer BIG TCP packets,
making the test flaky on upstream CI runners. Lower the default
threshold for those kernels.

Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index 9b7d0456bcc1..e27774eae20e 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -17,11 +17,25 @@ CLIENT_IP6="2001:db8::1:2"
 CLIENT_IP4_TUN="192.168.2.2"
 CLIENT_IP6_TUN="2001:db8::2:2"
 
-: "${PACKETS_THRESHOLD:=1000}"
-
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+is_debug() {
+	local config="/proc/config.gz"
+	[ -f "$config" ] || config="/boot/config-$(uname -r)"
+	[ -f "$config" ] || return 1 # No config found; assume non-debug.
+	gzip -dcfq "$config" | grep -qx 'CONFIG_DEBUG_NET=y' || return 1
+}
+
+if [ -z "$PACKETS_THRESHOLD" ]; then
+	if is_debug; then
+		echo 'Debug kernel detected, lowering the default threshold'
+		PACKETS_THRESHOLD=100
+	else
+		PACKETS_THRESHOLD=1000
+	fi
+fi
+
 setup() {
 	ip netns add "$SERVER_NS"
 	ip netns add "$CLIENT_NS"
-- 
2.55.0

