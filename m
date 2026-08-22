Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415B49364E;
	Sat, 22 Aug 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400208; cv=none; b=p67TyVXGWlDkJjIOIPTHKil3K360+x0l+zIgC5/SjvUvcb2+zJEZTKDqIiclLXXJ4U/43JlJQia/zesZglZcdNl2egnjgN5X8hyY7ZCcs1oOv6ycFXGL6xL3nXkb6WOb/ONrl2jzJyUWrl/fzJYZ2TMvQg5iLHQpn2iO6h+gQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400208; c=relaxed/simple;
	bh=rNJKTbTifnNGotg6lX4H/d/HzhAbv8OwwY3tZoUNHYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MgSLIkADDRGXovI6zwGiRhE/LTLrB4zTMTVl+H1r0cP8IE06nfyhv7ko2OcwT4eUCOtBedN+ccP9nkIc5Tqtf2w+CfxhvwGRjbd9rOMmg2IgbYIxcWBnPSvTq0BLUvyy8yZ2zDyuzSgUJl2PPqC7kmUJeuET7LvGouxCQ5IbjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=nK7O0PDZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PzOBFJFa; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="nK7O0PDZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PzOBFJFa"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 292401D000D6;
	Sat, 22 Aug 2026 08:03:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 22 Aug 2026 08:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1787400206; x=1787486606; bh=NGC2Ea3wjGV5zv7cz0rFV
	t8MXQMwMsonzcW8UdzfdxY=; b=nK7O0PDZtyUFR/HHvdaYLYmz2GTu+AIwsONDv
	ILLbydKtwbIV5RwXKXb3PhooOzY03dir8C9iYHjpnWssE0KGWsnpOucFh8hZMi0h
	bLNRByPIPWjmiGShpBcTp027tan+/A870uehgY2qoby7nVHUhTOiZ8XitNTC5967
	FDcyNtRLRIW/x6cpXHWYGR50X92oGk71SO2nmXeA6qZ0B4nLT8LFhZqHLeowXk4h
	FeX4ouFasNiRlyZlpTxXmoAA57ZtX8Fyieq1CdGt1CoEdMK8xW3puIf3Yn+NpnSN
	S33iaVcIZy9W87YCVbbliz6utxJfdW8N+r/T3/6Zu/QyTE4WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787400206; x=1787486606; bh=NGC2Ea3wjGV5zv7cz0rFVt8MXQMwMsonzcW
	8UdzfdxY=; b=PzOBFJFaxVP8b86ktI6OSubaSLoU6ke65x9MHOQf7A630ygSjv8
	euJVQtrgsu4E9xJHgywefeMGbZgQSoWaoqCxytAt/E8YnOClB5sSRMbYXnoONmeS
	A2qG9tI8oRU8fZtuSP+4XygTieWH67G9QVlmzqHf03SG5kGR+DtQ3Nj4VQpiuPj4
	zqLY661f3Kvv+OtBoTzmtFbRZ32E044sJCa6aB8+NdGA0mzWKWCtwD3ltTaGrrUO
	wb/llky7Wn7E64pRz+8KOB5JU9Ef2bZmoeU5p47bfD+KB2bUiLVlp92+Db0mPTdY
	0ftoAhpIhCEjp/Y70dx0dlkmRmi+6sXpJtQ==
X-ME-Sender: <xms:DZCJaviaDtDTbbB0rXgqhUhGwu2T2ebfQH4LDIRLu_d2m2I0Mo12Ww>
    <xme:DZCJaqRRiwRZffgEasy_Cup4TL6LUUHZ-xRXRxlGh192q9_704ONLXpPYJHkSCRdJ
    je1FxXFqdQMqkkvXEMTt-i-CULXW70tLlRK30Kw_wDG8KacwHOPcRA>
X-ME-Received: <xmr:DZCJaoZeKY3FQkYv0Ou26ZcYyIjsP7HjcB3saR_Xzf4Q2dSXwGGAokS7hzYFvA>
X-ME-Proxy-Cause: dmFkZTGAUtaR5SGMZtwmGZA8zXTccG+8x2jFK2i5GYpgMeIlQtG634HopO170zJ1zeDPPS
    H+G7nclAdPw5noyu3EOPbJRvvXFL5l7UZ6LEs8l1G2w7vOMMJ7E1xfmU0WGv1fsFbbfEk7
    W6esyeJBln+magL22D8VfAt6oDwgHgc9UgHc/j0rFoP2Ppqi/JbUtxOtB2xLCnf9KL/rQ/
    AjU46IM44edi8rT2I/y81ux5p0XW69EmWXd4qxXRUTPKA+zAXYkYFf/V4Dhz/6hP+51p9H
    /XArFRdXEPC0YK8pdt7/95dThtvUcY+KMKnQlafG8kiP0eebeduG1fPzYyU7/4KGwel+YR
    lqrq3D7X+US30aTztsuNAziSiKGjAceTYnh520ODPfYxQ1ml/mnaIscSA/li3sqKBgkxAh
    keMB5SqPDJ3WybqOGYcEtePnHSPi6M25TWjE1pGhdbbS1hOldCHW3VG/7ei70as3oB1Zb8
    y1duQwM0Sfg6rdrsp5vVlSxvKEowk+5zjGWnkuzKrQiyiiddJ8q5n/CzIJs/CYgZWFxRLS
    1TAJX3aOhvcsikBlybFq/3NVcRVA6nBtgHUoBScE8XWwLw2em3MCpD94c7ME7vecxc6taA
    5QiYA1VQ8wekEqNVpBcSLbg2YWabRC5sK7PzcQjA9ByxROZLBxHKTC4YaHnw
X-ME-Proxy: <xmx:DZCJavR19pN-8PeLKuod2Ot_fD5OugB0LH4Ugjd4VBHSSSBfdejQ1g>
    <xmx:DZCJav-LpJIeHsdvFk9i7KstnF0rgSIhiuHoCIXV3FwWS9UOre_KsQ>
    <xmx:DZCJanggHDSDOOsnQEAMGCpPVlb2LVa9V8SWk2of9Q-0V7DnzPQWdA>
    <xmx:DZCJaobcFjwNu90NZl4XsRmNeNONRqs5Bt4pWFpd0SYMpecN0R1JNA>
    <xmx:DpCJajPVql9ob725Cf7m2EGr_Zh884zJmyIDqN6MnsLttCVRUw-YYwI9>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 08:03:25 -0400 (EDT)
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
Subject: [PATCH net v2 0/4] Improve stability of big_tcp_tunnels.sh selftest
Date: Sat, 22 Aug 2026 15:03:04 +0300
Message-ID: <20260822120308.1165200-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

This series addresses flakiness of big_tcp_tunnels.sh discussed at:

https://lore.kernel.org/netdev/349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com/

Lower the thresholds to avoid failures like this (number of packets
below the threshold):

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout

Tweak tcp_min_tso_segs and initcwnd to avoid failures like this (BIG TCP
doesn't kick in in slow configurations):

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout

v2 changes: Use $KSFT_MACHINE_SLOW instead of probing kernel config.

v1: https://lore.kernel.org/netdev/20260814194124.3102581-1-alice.kernel@fastmail.im/

Alice Mikityanska (4):
  selftests: net: Wait for netserver to launch
  selftests: net: Lower threshold on debug kernels for
    big_tcp_tunnels.sh
  selftests: net: Lower threshold with csum offload off in
    big_tcp_tunnels.sh
  selftests: net: Fix slow configurations in big_tcp_tunnels.sh

 .../testing/selftests/net/big_tcp_tunnels.sh  | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.55.0

