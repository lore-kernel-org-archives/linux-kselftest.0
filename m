Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB38284883;
	Thu, 23 Jul 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815411; cv=none; b=cxi3ucRqd3h3JDcPdDHCdB3N3dbLHBAU9QR6ypqEHfa2J/B1W4KSOq/lbhSOn0bwe7W57+3uozljwMhBKJJAWHwS1L3A0JlUZCS2z34jUswgdDe1H1DWjwVrEfH5l4SU99cCIV575pCpkjKJwl2q9r7k64GW0j+Rm3LkQvnFkOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815411; c=relaxed/simple;
	bh=BCM0Kgc2C4k4GDJaoDD4yA2c6ucWqVNTuKLpETMh4Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYfl+k8I2k8Bzyor14SKy0V9ml3bm2ftVG1Zim9bY3yxp0CWcq39LnTprJNwfA1md9/uQyJXC4TRXoKieNnVLqYEKUV+VKE9H3otJWk4rsqRsOYTA3xLrpB5uFlFX5Ooyn+zkBnZCy6ta2C0cTKVwXej/7kA9pnBbT9hdhOTra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=sehjEHIb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jJc27GHH; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="sehjEHIb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jJc27GHH"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 24FA37A012E;
	Thu, 23 Jul 2026 10:03:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 23 Jul 2026 10:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1784815407; x=1784901807; bh=FGpthCba0yb539wjtBDWA
	MNPRlzkbQT0A+NI/ZxZ0TU=; b=sehjEHIbF3yZ6irJcd/n42KLlvYOgL+nB12m5
	gqjAmJcg/i4Kd4RU5O/FR0CaIU9SkzMmOW5C+9aCxn/SsxLsEiiX78wDMNWqY0+5
	BGJnU4zuOngcVnwsTtZ6rACWilmdcDzxGqOueI72ZuQ+tOZX6BMczos1BKYwWHTh
	8l+1C9sgEdFMJAhdj2WqYZ/5xNvp76i58I3dNX31WKSeK+wJAZEOlxks9WqL4dgK
	pa8cyotFbnDCvYEL+oYZGeSMGFRPpqsvaMkTGhjfS9ixeWEZ/vMZ1CnMJ2EDtRQH
	QLCLjYNqeVqRt4KgI3Vb7W66dVOU+rsLy7HeKveySc9xOn/Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784815407; x=1784901807; bh=FGpthCba0yb539wjtBDWAMNPRlzkbQT0A+N
	I/ZxZ0TU=; b=jJc27GHHbM05+csjO5qsQAFaiH31p61cOBWJ0TzyRXh0xp00M/O
	japccjhF7x/w4yWU8kcvmrBpzixyxFo46/tjLnJ2y1j8oRfg6kaoOc2V+Boz7KoA
	1mKrNjFroBcydK4xejNHZr1chc52m2lbYZBMUhc8dxxe+E/z+aP4LPZMjKrxd3U+
	oqaUi95/+2LHY5D0fl0WWA+bqk+YQSHjYeBFI9sh33JvE3xxhvCh14/NDfYpMywN
	lfM02n/xsyac2L34qNBH//XAMuQnZYJQ9lYWfJgS2CG8xj/MuyxtW8ePW2d7z9bQ
	lnlX9UW2nCqAhZhrLK+lzQxDyTwhZnIjFag==
X-ME-Sender: <xms:Lx9iagJkTv4-XrOcSFEoEXudcqIcR85ECHUy4KCeMaQKZSm1PaqGmw>
    <xme:Lx9ialEWn7AX_6Fh13Ysobu-quMJ3loIbu1FNhkTPGorohCE4J_Obl6Gx8uNlQH7w
    8l7sI5-TQb2p1yTdnzp6-zSbd0Rfhr_gbAVecrDORECdE0WaHvzXYY>
X-ME-Received: <xmr:Lx9iak929XNSfBmaMFDEdcvMkcK8BoZDaQyxMfMN3hscafZI0W_Og3qEABQ>
X-ME-Proxy-Cause: dmFkZTGywutbRDH+nuJS1FCcOkle0DSR+g1KzxZE2aBdtpqKvP5BuwIZZOUL7w9CT0g3eS
    MA/zg888aC7u/yiHiq2TqfnVDMa1OuVLV4OjOhmNW/J6uEhJC8lrhER2QKsQUcKGBk5lxV
    lGvSLQAKCLlc5v4lbMcYm173fE1ycTWTR+aOPz85n4u624+/s9R4Z6E4pPOdYKly/0BLCK
    /veXVgs3ZTJUDGUKcXktVygLQJVBjornnl5dt7FW6mWeG+P6n7xeXw+GG9YeYa/q3GUXSQ
    OteBMEkBNXxLMwInl1+5Bn7rANY8Q2ct6OVTQarlKVtVIMwXnwQxtxxfEld8N5XIBnd4gh
    9woWaqv/zb26qnkEneT8XXm/0hsmwVGeF55b7rYiDEJ437g7RWT573zVfa6u/3fnk3NZun
    n4SYEnUQ/WV/gs+MbBMjN+sNTXi5XntMVTGxHGCy8irJbUy6QGjO6UUBzNa4lEdLSUuu3w
    V4uy9G9ms64mflXhj25C03cq8ErMzDe8PIGVCSL6tj+U3bh0crlTyJC6v311i9dv8vp7n+
    f/qFQbJS0LKzd0Eb8APzIEA4g11JjMfSu49Xv6Lx3XoKVVibyo30ZNBYAQbIFY1YZOOBjj
    RqzPe/aG1s18uhx/el4dkhDa6vUNloTZM6J7KylNDwPp7ynP+Das5T+KvMLw
X-ME-Proxy: <xmx:Lx9iatIPRIzauEoa-SurjcVqSHUf5pj_hNfh1INCXEZiJFxx45DUvQ>
    <xmx:Lx9iaqtk0FnSyDWN2nQK2It4SLxtMPnelm7U1XliuSr1vGnr7KeNeg>
    <xmx:Lx9iasBlnAfq_GalCjwi5rLlsIVdgBR4fL7s06zvdQz2nLNRhEW2sg>
    <xmx:Lx9iaqMLqIEUJzoGxb20SKpZg97A8qTxJaM1ted2vpQxAHM_wHeivA>
    <xmx:Lx9ialwa2x1jzHvOm_U6K-CoEanZOtan-KmJfcF4qL-fpHtxyG5GjoXg>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jul 2026 10:03:26 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net-next] selftests: net: Add a missing config option
Date: Thu, 23 Jul 2026 17:02:41 +0300
Message-ID: <20260723140241.132120-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

Commit 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP
tunnels") used iptables match comment, which was missed from the CI
kernel config. Add the missing config option.

Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 96fffca6547c..a2d14ec9df1a 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -82,6 +82,7 @@ CONFIG_NETFILTER=y
 CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MATCH_BPF=m
+CONFIG_NETFILTER_XT_MATCH_COMMENT=y
 CONFIG_NETFILTER_XT_MATCH_LENGTH=m
 CONFIG_NETFILTER_XT_MATCH_POLICY=m
 CONFIG_NETFILTER_XT_NAT=m
-- 
2.55.0

