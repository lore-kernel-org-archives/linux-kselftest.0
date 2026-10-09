Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB363A3822
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525991; cv=none; b=DZukQ4n77ELwPwjpm5PEfbqdzFF3l5G1qG9M9TcxulPCFWOR/PmGf1z1tbpB/PsblDk7RZhi/bBxbfUB08w7QPLlcUS23n4LNPTUBLK3acM2wyYxHJNZ6qsujZGydVh+Ff4bn1UbgjQmbKyS6gZcmCOoqW+Jy3r2V6B+8YFruGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525991; c=relaxed/simple;
	bh=HdMdiMCe3MKVqlaCIyB0c2RfvFNaLGy9nwclIDSQHRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sc07ifmmbcCCGzeukwS3fLcWIDSCttDQPUisIlLrX9DabsJgyTTnDHCB9xKsGVEVqVixiBqGvojacLYU2dwUEBZRpbC+wuTbMpikY/ew3XwqjTCR9KnRRVowAFDEzKQ87tclWKlcY4j2xbL/8GIzGR7iEG4WP5wGl//+xPwHRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLJhTOz2; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLJhTOz2"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15168a20b47so2534558c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525989; x=1792130789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb4Xp4D0s8TBdd/O2D9YrmHfrZaQPX0yAvwKrkVsb5Q=;
        b=jLJhTOz2h4odG2H3v/UViuNyPp0oQubMwQKAzLqER/g8krzcFx+MbI4HhhDbzbspJT
         REm81gvRV+a4KdZfqenjCITSZ3FCJ7JqGlYVwsP5jqssc3v5K2PiMRWpyYVB/SOReYXR
         YbIuc+QugoemaN52mmD5+Y+vqgTvicl/S1YnGYiFf4aCzN0bXDPQpUa9vFX4MoLRlM74
         g8QZ6vGml/eAEtQuOC6801SWcZnkEfcOqO/4UJtzHD9fYJRpQ3clQy2DbNaSWffafMwv
         KxEXyHe5WgGF5sq97/af5SkjnVDIR4UtgtTY7+S2XwFJ/WATqJoBOOPGuMgkEOSLYqAW
         9TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525989; x=1792130789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4Xp4D0s8TBdd/O2D9YrmHfrZaQPX0yAvwKrkVsb5Q=;
        b=NY72RZFRHSuYpb7J5H27sszNR+WSWzocd13WPKY0w/jWrgtYIgimVxyxdCWozn4O1F
         8/d0SMNSF8KqM2wcQUjYm9443XBxO7WgzqwGq252egztMlg3rtLmkQQSrC7WtefGQ36q
         Ww79sW9dZvZdcO/BOv1VXDgfkYI32+K1w+jVrM3FGrQaorIy4mvp8WD5G8FbOSVCsV6e
         Qm/+HahgbliFpmt+r4VGuQ1KWatD9UtWb5n8JE9HNyZRtvd8ZWTlKw6YYI7nXB1mHVby
         +BawlogKEKMj0SIHUQIaOGblNYLVH4690o8MfWAaEGLrEqDONA7UuDopeXMjOMljlZA5
         4c7A==
X-Forwarded-Encrypted: i=1; AKwUvBxx5bcrjkJM3c7r7IEV1LwO9rYP+LNn8kL+wTZnDuxNzji1HQH+/axOROv2JOsZ04tug4agEsQfvcVykb8UVJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2N39LS6iQFcoBhubQfW+yQ/5WNBmCFurxacY/IFZW77d/8/ds
	vqivvurilRfbiQFaGwfhgvgV5apGXBKngAf7klQJ6IJLb1pd2yHYkFyl
X-Gm-Gg: AYBFou1pGYkFCYEmES2PzfMyvQ9sHLfVRBLE1vic+IKh1Yjw5SpVOq/jfPhtXWChIPw
	vILtFXbnH0fujgw91jMZB/xyYeunie2lvrgRw6WWJt0WYIBXMNqQiTJxBB20+mHbyVIRI1jNIZq
	aaMDkFUuRZJdK8nuCObZt/0wWzSGs6xch94VzZrU2ylLuZez732MrlGbr8uHFiLl07U/sdbZu+5
	u3Jn4FCs2tUYH9RNbfYJXPeELnnQCvJp1sAXbmvEbsCZToPLF8HFaN8JIjaFUWXpB2fxrGhW7t4
	kJeZuv7EEmACfGpGPR7I8jSdnvRTTyu945gXK2HcsABKuzyYIAIvzDWoLp8g4Sm8YiInFvWXVmZ
	vtDJKxprud/ulx1AmS7/6Uk0ea44pqtQ+ginTJ256KHzhrUbQR/iM0Uertmb5R8aW+3gKXXxZyj
	S2yYr6ZBdIJK4nWJ2XFJ2tQQ7kQ1TMNfvRGPgapYg1m4Nyj4ADOg9IGrR2/7IExt1rIpY4/MbZZ
	fO/piSDWcu7Ka4Sg1TwqYq+b6j0eSJNdUxzFhBgsQ4gVeJa0hlMMzWHJK4SKtsLzCrX1OskLEFT
	8h9FcASez4LBzL5od1J3Ut6Z7gfhTH8dokvxPcyjAKw=
X-Received: by 2002:a05:7301:1522:b0:351:6b56:6627 with SMTP id 5a478bee46e88-3537e0f5b7bmr1520841eec.40.1791525988955;
        Thu, 08 Oct 2026 23:06:28 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:28 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Fri,  9 Oct 2026 06:06:12 +0000
Message-Id: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This respins the RFC "netlink: specs: add genetlink-legacy spec for GTP"
(netdev, 2026-10-01) as a patch, and adds a driver fix the spec exposed
plus a selftest that uses it.

While writing a ynl-based selftest for the existing gtp family I found
that the GET and dump replies put the genl family id in the command
field instead of a GTP_CMD_* value. libgtpnl ignores the command so it
never mattered, but ynl rejects the reply as an unknown command and
drops it. Patch 1 fixes the driver; patches 2 and 3 then describe and
test the family.

Patch 1 sets a valid command (GTP_CMD_GETPDP) in the get and dump
replies.

Patch 2 adds a genetlink-legacy ynl spec for the gtp family
(NEWPDP/DELPDP/GETPDP/ECHOREQ). Description only, no uapi change.

Patch 3 adds a selftest built on the spec: it creates a gtp device, adds
a PDP context with newpdp, checks getpdp lists it and delpdp removes it.
It skips when the kernel or iproute2 lack GTP support.

Changes since v2:
 - selftest: add CONFIG_GTP to tools/testing/selftests/net/config
   (kept in sorted order).
 - selftest: move gtp.py to its correct alphabetical slot in the net
   Makefile (after the gre_* entries) and mark the script executable.
 - selftest: add docstrings to the three test functions and main();
   ruff check is clean under tools/testing/selftests/net/ruff.toml.
 - selftest: move GtpFamily before PSPFamily in lib/py (import and
   __all__).
 - Patches 1 and 2 are unchanged from v2.

v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 170 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            |  85 +++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 8 files changed, 271 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

