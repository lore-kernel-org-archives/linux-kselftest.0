Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952459;
	b=sgbOVEcuqzoc/m8JuF7eUPvFIJ3mQYOjwc1BdRGWU4AZdRf9/Ij7yL6hnTA6SrgzVfDt
	 C1GGeO4/mGY9GsrtvgjTNPGl/LW7q+YTrkkBsTtSyslYQUXBhBMAlFAjuhm9689uQKL3c
	 eoasHmmWS5AhFGfTvFXG3yF9c6so2Ug9VlWb87GsD1slAkZcxG7puIYt4cqgCg/OOvjip
	 KV5WOIWNTZvMrKZ1tRGcE8AnjJTa20iowRVs0E4eL0gz7utG/tN+JgEmgABZXn9TdB/QA
	 x1Di748Trsl2xT3XiDFYYqqjBj0qZ/PU6Gm7TaJLr3Njz9VOCc4x2thM9T3M0G+XjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
	b=Gp8NrJt2s7Yv+gNjOs61LZpmGXUOWe2aJADugoFEJb5ckRtPFC01JTyYt0L/iZaKrLRd
	 xOT3FxcJc3mmnKOjHF3CHS4ildOOqemnryTFLkvBj9VX9d7wweQ9OT/+j0Ae+XvMIkJru
	 OigzI6kUbWZ3pTV6z3nbhFj84fO/oPJL/uUAc1jYxyYkcsbbP3YHG9x4swKQiZPHQEyHN
	 VSbuVgPf48J9nwWDLrW/hF5l4+m+13ThBef+PR9+CjrJ3or3XmzWLLqIAzHrnNdpW0vvV
	 2/lRhKTsbyV5ZDK4VV+UjsaedMQGuw+RZO9CbnNpRMnShndDtlAPVo7Uw6qwAtkavcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO9DMV7O;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDB606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EDB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO9DMV7O
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso168319a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952458; x=1795557258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
        b=gO9DMV7OAT40Q43P8iIj6JyFwfw/ZRNM4IY2Da43leKDchgYPQ7EgQYt9jRjfrPfbH
         qdaE+DJdaX1+y6K4ZI17w4kGdaleplGWZwXL6J4mz38LV5piuhtuxYPTsZg6YDu1q1rg
         wiG1ZwQFQaT/48DOJOOA9ekz8nl+vy20pihC34pRJGIgKOKdiYdXXy6NSnkzL/5ZtiJr
         8C0bDMqzZp4fWFGruc+e5E+1Wss8BQ4BikkSCRGi8zgFWWLAzhWUwCA/qMuWiA30l57u
         5rgrdYICzddUJZ2dDkULgrNJCEEvG5XdgBKZfA1hTXAq+ukS+Bc2iLvNzUKzqHP1HKLK
         uovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952458; x=1795557258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
        b=rPG35KujONEcZ3Uw/x/+BDPj37cqUf+U3vjVPnyCYaYzCF4qH0FFFabEsuG8QH/5mQ
         +fufTTgRCQvPVF7CSuLC/KPWg/gJ5KtpcL3i7+TLK6Qh27a92VfuecHRowW398bvy3qa
         TDL7kVL2HgFGPiAj1nyyTGzgCs3BOt9xxM2TV3RWftuBd1tCM7ZXsS6EBQhY0MszJYTY
         otjYyGQuyF+yUD5dzEeyB7Qj1sY2IMtOuJ+C8FDGjn1+VhwU8X48oA6+HrCWm7I7Sl3G
         CS3q8GwhgEiQoTbbUevkNBaLB8Lwdb/Xb/tH50ry4AbvCgCg509UTP5IRF+DR7prO73v
         sZag==
X-Forwarded-Encrypted: i=1; AL+hErFD0bOBRSTQ7sPmDyfRB3jzrO14WjJgDS0dQeJOWZs/ctK2QGv6Ti1gU7wCABhH0Q8ZNXm/ZXwqtgDmp2oOFDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YyEYV3qZ+FlJzssUtWt/8ppLrdCU7XrTOYM6kNdFA47qob7gp
	ZMVwsA8Oaui9M/lcXL4aXyggSaW6F0EXx0gyGhUn08ZsIdmB2I/sQFdQ
X-Gm-Gg: AZFdTZfy4knjuBj6napmzdierWPX+54LcY8B/Vz283OfKpDAitnGn9L8wdIxJqHiNMc
	abPC5683zeJ5lXj4Rt6BSzBj/cP2gbA1qEXat0/7KXYXHAvp8dNRBGrSWTdvYWia/ghjKgD5AMF
	OnTOgeTuflWlwT590MDIdQ1p1D+v8rUjYfbOK8Ok9vxbJQRSJ/DWfPf/dvtw14bWN0kiG06H4/u
	lMKRv0+Mho+5i+PFddmO/7+vBozRhADS7JpuDk8/Q/vhdwzkf3M3jm3orMkoRolpWZVVetv0BWe
	KhA63Pb1+D2pJfGomlj1ENCBOfxzkkvDGLDoFai8tu8cmXT3DKQh2Kth+suf5UdvMc7eQtj0sGJ
	UoooCfW2HN5syNNxOqFAA0465GAej50PXotc0mSzcGhKyxKgLoQ5dxbjP7gWgiT1qh3sGQoK3cE
	i7/xMN3pnr3kCtXJRN0GPOQ45rQxrvJQrpWMplKVSvyoQ8HZ9lloAl+O7SmLnNNDnEI7+9+bL9Q
	6Y0NszL6Jve4Pu8IxZC9zh8j//QTuzo2aPDaSD1lOYN1JcbutY91VopmaNyMxeC479f/V/v+Ybu
	zsX2H1KQlzJzsGgx/+gGKtwsjzoI16GqmZw=
X-Received: by 2002:a17:90b:268c:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3b3d0761a7fmr712478a91.30.1794952458419;
        Tue, 17 Nov 2026 13:54:18 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:51::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187df25sm732970a91.3.2026.11.17.13.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:17 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 0/5] eth: fbnic: miscellaneous driver fixes
Date: Tue, 17 Nov 2026 13:54:11 -0800
Message-ID: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
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

From: Dimitri Daskalakis <daskald@meta.com>

AI identified several bugs while I was working on unrelated parts of the
driver. fbnic_queue_stop() always waits on queue 0 to idle for rx queues.
fbnic_get_ts_stats() dereferences a NULL pointer when the interface is down.
And fbnic_{set|reset}_netif_napi does not account for disabled rings.

All bugs were verified on HW, and a new stats selftest was added to identify
other drivers with the same timestamp stats mishandling.

v2:
 - Add .get_ts_stats() support to netdevsim
 - v1: https://lore.kernel.org/all/20261116202957.3601684-1-dimitri.daskalakis1@gmail.com/

Dimitri Daskalakis (5):
  eth: fbnic: wait on the correct queues in fbnic_queue_stop()
  eth: fbnic: skip disabled Tx rings when setting the queue NAPI
  eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
  netdevsim: report fake timestamping stats
  selftests: drv-net: stats: query timestamping stats while down

 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |  3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 20 ++++++++++++---
 drivers/net/netdevsim/ethtool.c               |  9 +++++++
 tools/testing/selftests/drivers/net/stats.py  | 25 ++++++++++++++++++-
 4 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.52.1

