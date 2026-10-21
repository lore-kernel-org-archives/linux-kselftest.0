Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.60.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611151;
	b=dJQxhewbrcpikFl2pNLemWPR1DA4zAVoLPiy6cEz0sScyqWcOYbTYyAh/4Cz9j+XWIH/
	 KfEba6z0jUBt4J08kNHxXRRRgymfWxFBohGPC0kBxTBQuacKDWqu8pwK/0oFAruyL2qMy
	 KWsv+r8ZDlwtqClqQP+POJ1DA0hVzVZZPmKnO5Qp/cziGdRcaPccw32wfNftngFokfqNp
	 6xRyUUaZGxwOXC53y91H1UAdq6k7GINkcgTpyUF12Xf2HI/iml6m50YfwHZlEyd5fAztx
	 +RR4RoefCXJNCD0ydGJpY5IdFj2Xb1s0rBuGLDfcr2RauftEyUSQen6Ox2Pmsij2PlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611151;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+BwI7VCDsasaWw/jTRL2bZb4OWS/vutwDK005m/u6KI=;
	b=beVpf7zPXR5WUmV1oi3MZBAYC5gzIzslSmKXpxWRonrlV5HDTns/uX4F8Z8UXerLgp+m
	 lmwenrA09CG/WF/wIy6vK5yfMdTVNTzQoMtmV59GVavze4lnvF5nzsDmVyIoQ+dT4BU6p
	 Rw8CUiV8iMht4iERVdv4AnaQuxp07yPFnnqOi/ECltbZheuwHLjYNk/KgrmKVjVuK/JRK
	 8L6ZFAEdIXJDMC5ZIc4eAhXKfwWKiX1oAbB/AzvDHP/jccNj5o/iTZC6J+82z3FV+1Tf3
	 vo2OSWRdjNFaAaKqeUU8vGNAgymg+h5hF+YqsBkNrVrXnIXyJNncEvzCULHSZ6NVBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=corp.free.fr;
	spf=pass smtp.mailfrom=corp.free.fr;
	dkim=pass header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=KBT0dzJ7;
	arc=none smtp.remote-ip=212.27.60.169
Received: from rcs.proxad.net (rcs.proxad.net [212.27.60.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441C606A319;
	Wed, 21 Oct 2026 19:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=KBT0dzJ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corp.free.fr; s=rcs;
	t=1792611148; bh=OPSNdDfUHKdDYC8urkecaETg+u56GncmYI3zC+zqHh8=;
	h=From:To:Cc:Subject:Date:From;
	b=KBT0dzJ7aS9OsWnl5g75WsB64VBDcw4LU8Gm2A2Ok+mAOb5k2XlIkC+E8MpTHSPpN
	 DwJzm7nzVkJFTcOyyd2c/QCXE1nC0K93pUi8pzAhcVYgfWK6czpxMqV4oIKCruiltX
	 NBc0YGKdMzDamyG87ZCNBOIr/u4X0CLuLv+/xfC+4a0V4NVB9mwfGpd/qbBq2vNmud
	 hbHusYES2GFx88WFt28HCazWSNdJq5gu8WZkaE6vWuaFLqdiBhnrLM44Akt34XR6s3
	 c0zCcKTt/AGjXsjquxQFJJRejy0nhOIHQH1Ru5I3BQ4qz2TX7ILYC7NAiTOc5nmalF
	 kJu1x8wKcwjiQ==
Received: from lnxos-dev.home (82-66-150-212.subs.proxad.net [82.66.150.212])
	by rcs.proxad.net (Postfix) with ESMTPSA id 7F68944C2B41;
	Wed, 21 Oct 2026 21:32:28 +0200 (CEST)
From: Alexandre Cassen <acassen@corp.free.fr>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/2] net/sched: act_api: keep the offload flags of shared actions
Date: Wed, 21 Oct 2026 21:32:17 +0200
Message-ID: <20261021193222.1318333-1-acassen@corp.free.fr>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a filter reuses an action that another filter created, the action
also gets the skip_sw and skip_hw flags of the new filter. These flags
apply to every filter using the action. A software filter thus stops
running its action once a skip_sw filter reuses it.

Patch 1 lets only new actions inherit the flags of their filter. Patch 2
adds tc-testing coverage on a dummy device.

Tested on netdevsim with the reproducer of patch 1. The tc-testing
action, matchall and flower tests show no new failure.

Alexandre Cassen (2):
  net/sched: act_api: inherit filter offload flags only on new actions
  selftests: tc-testing: test offload flags of reused matchall actions

 net/sched/act_api.c                           |  3 +
 .../tc-testing/tc-tests/filters/matchall.json | 71 +++++++++++++++++++
 2 files changed, 74 insertions(+)

-- 
2.43.0

