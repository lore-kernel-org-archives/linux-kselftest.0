Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CD351C0C
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861010; cv=none; b=fQ2cwggVCElEoElY+ShxiwGg1FIzQgsrntvMiWJmRArpAsUyl+7tKhEEqMF4J6fAf4MaXSJvQiwTFwFZODuVctZo1ErXHWMha30MDFi39k/qFExVw3D3gwLGpVtuaEQXncxKRssWL1wbkHHd7hnBIu4UfURBZ2p3CJmBd/x/i/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861010; c=relaxed/simple;
	bh=YcESl/ADayFbyaJFP0o4E3Zs0nYkFpwyo9EyrGvtq0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YV0DXSjrQmAgyeuViDpq6vwq5Uhc3CQCwIp0Q50XcQcImw+TKES439ZHBo2VeyFiMpyZtKGNRwjF3DOQa0gARiaDsiRJy5vQOyOnuS82AKoo3MrKLHGZclG8ycbt8hNOVj7qH3AXIoAuhgtlbNZvrS8tz4og3yfLfUAcskBTHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0BEjlzs; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0BEjlzs"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so4681130eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861008; x=1792465808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4qXadGqOSJuFTQlPSxL6FN1OZie+PxVsFb6Na9SuAw=;
        b=N0BEjlzsPSkaFzWiEP3nIveFFUR3eM54B7FIOfuP5Hu1xy4AuOD1hsDXNorvEdnQyu
         imH/Z72zdwJa0gTxEGB0a/4Y5THWB4TiVw1MSP90drmhfTL2yA/cXAslW1f+Whi83uZv
         9a6yHCn5PUA2q5X3/DzHWtJHPqQCECysjBM/quaV5zBSQPIrnl9BhROVBTzh+tggTSRl
         0rb8S4R5x3O8I4YON1PrI9wizl+V89KcYzaf6z5UwJOjRUO+sPOp27L5kFuudbQGOrwe
         bIH46OVowp76JJM3cfVSWvQIGuz0VqMeumpBrRxu9O/cm0PbMDb+GrZ9X5ui/w223jXd
         3OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861008; x=1792465808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4qXadGqOSJuFTQlPSxL6FN1OZie+PxVsFb6Na9SuAw=;
        b=qssbWb1w2ZgWCbNfb1KOSwS/ytYftJKeO2ioZF0XZN/aS4Hq/pikl2CD3j0HXibZd6
         F8M/GGT/b/WrL5ErNrqS3Xjv9sSD0uE32CxEWTBjHqjDGI+0oMaDt6SvUXCLOz8eUmmf
         ucHuhknlYLSM36PVqPuicbZCRJV+/WQeJYWzGD/zK3RFRtHOwcgWs1fyIYJrfh5mVZrc
         /eAnEAqh40pFfM6+XMSzNPlQn2tnoOs3YTdivCAHinEWkMKNM6sbcBwPSD3oU5Qjie7R
         dY3iO5o22AKhavSJ1Pv3LLNDms6M+w68g8qTemoqZCJaz1umgKnr5juHAC6T+LTGi6U2
         XTFA==
X-Forwarded-Encrypted: i=1; AKwUvBzdeeyacLwQBq6rPXYikinwfiwrWrDJqVjttt8/+vPrvt9p3J/fMs4JCRCdvDqyNTSqSUzhtV7OQSh1I4wFsJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjtNDik+rpnAdkQud3XkgiiQljWXGn2D4yf+JuUlWpj/IAWtKd
	cpDxrTrGvtLRP03Bwe8nYDbcfbroTkeOxqIzZ12yEsT8otVQhFuWT7yu
X-Gm-Gg: AYBFou3D/2cuAI9GBA4Bh3YiF+/wTrtt2O8NettX+ScW0Aj75oFdffxkx0gqeqZH3KR
	dflq/+X2W0wCn8HyJ8OXqrSlIF5qOpGwFagYM7X3jXCX/SYsALX5OHBkxmUVuRngUnA3rhx45j6
	uPrUdZJuNYQT7cV+84xoKRigGX0Zfln1mmMMtQTQvu7VxBh8lVpjU9TEuwTRL9Z2EbNrCoes6zf
	u0vgi7+C0zH7lwqXZvN8+hO0d1AK61mUZgBvHje+OZ7b+zU6Lvt7BsFDLTRpbjreeKQSh97Al2F
	zFcavyXdN2q/bJoD2hy7flnUZ/k02dqyzk79jrq7IZrxHtYxhsawn36uFeN2PsefDirHLejzYN9
	blwbOepZzhYpYNyT17/X3eDzcOm5Pi8C32XoI/3XqR8OOS+PjmmkT2o6ysFwgIccz+sfwa3B0r7
	eLPtY7+mC2F5E8yH4EvZ2+7hZiMzlZ17qedWFFy9XfZDfEqEr/A9nHZ0uOPa1iv0Jcw2smlLYMx
	oGCbTK58dbbTiC/ldRkMbTM08biZFBzTpRUeB06qJtb6Et0RarFN6I1t0QPsbEgwPe4kpciWfYX
	DGx0Ic9A4Mh7RoPHaOm0BlY/qaDhjVkZcHiqpFAqd3Q=
X-Received: by 2002:a05:693c:8943:10b0:35a:17ed:b31e with SMTP id 5a478bee46e88-35a17edb9dbmr7603628eec.8.1791861007893;
        Mon, 12 Oct 2026 20:10:07 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm41129053eec.27.2026.10.12.20.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:10:07 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v6 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Tue, 13 Oct 2026 03:09:57 +0000
Message-Id: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a ynl spec for the gtp genetlink family, a small driver fix
it needed, and a selftest.

Patch 1: the GET and dump replies carried the family id in the command
field, so ynl dropped them. Use GTP_CMD_GETPDP instead.
Patch 2: the spec (NEWPDP/DELPDP/GETPDP/ECHOREQ), no uapi change.
Patch 3: a selftest that adds, dumps and deletes PDP contexts.

The multicast notifications are not in the spec: they reuse the request
command values, which the ynl C generator can't express with the
current uapi header.

v6:
 - spec: use the gtp_version uapi enum for the version attribute
 - spec: family only applies to the MS address, fix its doc
 - selftest: also skip on "Unknown device type", printed by iproute2
   with extack support when the kernel has no gtp
v5:
 - ynl: add CFLAGS_gtp so the generated code builds with older headers
 - spec: doc fixes, min-len for the IPv6 attributes
 - selftest: only skip when GTP is unavailable, close the ynl handle
v4:
 - spec: request/reply attributes now match the handlers
 - selftest: fix the gtp.ko autoload crash, check ENOENT, delete by
   TEI and by MS address

v5: https://lore.kernel.org/netdev/20261012024800.400616-1-anilkaushikwireless@gmail.com/
v4: https://lore.kernel.org/netdev/20261010105740.223992-1-anilkaushikwireless@gmail.com/
v3: https://lore.kernel.org/netdev/20261009060615.4177402-1-anilkaushikwireless@gmail.com/
v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 196 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/net/ynl/Makefile.deps                   |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            | 123 +++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 9 files changed, 336 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

