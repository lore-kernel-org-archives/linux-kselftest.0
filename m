Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0913AFCE8
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 03:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146916; cv=none; b=FxDjwdTUhpXnZNzTGW007RwtFmCFM8S2j98Crqx1TMgQlIj1ltdTguR5VZTzUo2sv9sNvL4ZzM+8GwwHbI203ZhrmsRh2PY0IaCxykUnx4wk6vjTGjuoHstDHT+I7n0UOqAsGbi7JRwnkwCQQB511ymKOH2QDB9/RFFrAcCj3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146916; c=relaxed/simple;
	bh=jAOrbLrdXQ+N4YivWaxIg6hnKxFaGB/TEE/75vyRlWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hjeBWvjvej80Zt4jgGQ9VctZSt+iQuZCJn1rcUPwoICeFvEe4LXz/ARmKZoWr9AnTheQlyUIjpDvjdgpI+5bq9xkhCyZ2PNKhzi8PaKlw+cNRuwYHeitvJ5aqC3JuZQcirxPHtCXYqPHR2QtUWumQg3FziIE/JN8MX3+lgbrtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MghtnrkG; arc=none smtp.client-ip=95.215.58.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MghtnrkG"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jAOrbLrdXQ+N4YivWaxIg6hnKxFaGB/TEE/75vyRlWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788146912; v=1; x=1788751712;
 b=MghtnrkG9eslEB991izANuZs9iZJjeIQqjGKLlKtJ1Od5jDiq/gu1RXq6mxNm6qfGtkx36sW
 dnD25laoxttGX8r82uDM04KX/90GOmsUI9eAVomW1KgWumpwpN729nZJHOxgedcmOxuBeHXe0o8
 jLpnUWUh62r2EIkLfcM+lRus=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15f0edf12327b7e6;
	Mon, 31 Aug 2026 03:28:22 +0000
X-Mizu-Trace-ID: 15f0edf12327b7e6
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next 0/2] netdevsim: add link speed support
Date: Mon, 31 Aug 2026 11:28:09 +0800
Message-Id: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBRG4VfRXZuamZC8iiTMj7twaa6k5N1Nl
 t/inIcUkaHUZA9FXKy8S4LLM5rWQRYYDsnkra9s7Z0R5a3XAwgmVA7lVLhytJ5ScETMfP+zlgS
 nEdwnde/7AUS8PchmAAAA
X-Change-ID: 20260821-nsim_speed-d61e5c415b02
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

Add link speed support for netdevsim, so users could test different‑speed
NICs. Currently, I am still using max speed 5000. Maybe we should increase
the max speed in the future.

The 2nd patch adds a simple selftest for the speed feature.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Hangbin Liu (2):
      netdevsim: add link speed support
      selftests: netdevsim: add speed testing

 drivers/net/netdevsim/dev.c                        |  6 ----
 drivers/net/netdevsim/ethtool.c                    | 30 ++++++++++++++++++++
 drivers/net/netdevsim/netdevsim.h                  |  8 ++++++
 .../selftests/drivers/net/netdevsim/Makefile       |  1 +
 .../drivers/net/netdevsim/ethtool-speed.sh         | 33 ++++++++++++++++++++++
 5 files changed, 72 insertions(+), 6 deletions(-)
---
base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
change-id: 20260821-nsim_speed-d61e5c415b02

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

