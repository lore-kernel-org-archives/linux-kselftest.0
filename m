Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696034216C
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940637; cv=none; b=ExaFxEpFRn8VtqAMrpVRxMaHaUvbQlPFsvkWdf81TpvkgbrCSvk7p/W663s5KAXcvGCb+69GJ0wb8mnAt82rK538ITlxtVdDE+eJlw3kqTyBHcjILUuGNFPbrMWbjd1Ie8AlO22sDRwBeNnmyZA9OWAfk5K4KHPuqeqY0tAHD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940637; c=relaxed/simple;
	bh=6Ke/qXuAFWpOwvA+TbsjbUYyyLE9fGpPpz2JCxY3gU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3Eh2AoIF4txeZYiLJZ7sV7iATsfmC7JzFBGttmJLXO2iVIwYwTkM4/fsNJC67axbm9Qvta5lpYiaj1I7+GI5cxrf1lvcm82wafW7flxJ96W5qE1lw7Jf3oMoey66cvWwZeHHOKvHlV5WFO3vKFEwP0UcmsmK0SJa7SHMstpbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=ospvDtLW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="ospvDtLW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499de29beb7so1402555e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788940632; x=1789545432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvryFZND2qtqNhnrV/ZhmZ533JTNZP/644T63iiaUjg=;
        b=ospvDtLW5aBrS9lMb6hTuvp1yhdbTw//wcyO5pZSVNLsq8kHpUYXNlI2iPnoTtTQmz
         3bJo2OY3dt0VPfFoYQF9IikVMjKhvC3jROs8w81fLXXNMxYbsMl9C4RyCwDfWU9ZsYpI
         ZcMhJU6G8czi83n1Hk5rw9Bt9AawnPX6jOG5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940632; x=1789545432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvryFZND2qtqNhnrV/ZhmZ533JTNZP/644T63iiaUjg=;
        b=I/VA2/HUnfL0gW2E32+2DfODX4NR/vVh3Ae9aaYvRbuF4vDuL35EWakNgaAOC6ujdE
         Q/UwS4j0v/EpuXGJxKQzN/BNtEx89KBLPfFXU+djev7dUxYuWeD49Ll+7C/oh2/XXyjx
         wJMavxU7BmdxY5nNkoKoR9hXUBqJxjymMRRz8wfAQL5z/ZvsSYMacBWb9XD/PS42TB3/
         2YjYCnsGMo31RzoYTj+mepyO1T1OykYludyxkmPO7oh4AApMtUVv2bapIcIf1kf6DTGa
         1ItAtaOmZ2q/6p5ECOz29SyJQouQNSwjrgqvexMi2Mf0mkc0X1bucJ9XNtDavQkCGbvw
         2COQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgaFWvdbFpAk25mu+UTu9V50YsUbO+eN4+w7AXtR/uu/CHyoqhvjqQ3cpPZS2KzlQ2upDEys8dOkkHlfxQt1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lg4CejgXpV5TTl2rnR3PbUwqtRTOYlRMp8M06GX/h23FPH6B6X
	Ka926Im6WPzkSL2R7DweBmk3kDOUt6eR14lhE8st+YbUHTazbx0RXVE99bB7pwHRge0OPvsAz3n
	9e2REnuUI
X-Gm-Gg: AYBFou0Bq/g6mmyHI04TVnCq4R+Dp/yLMidDatgUd0hgXEVJgsf+j/obn4VBlQYVSj6
	67RFHChdeBfDg+XYSL4hKBPYlN0+gW5eI+MYxikimJwCWwOgiStarKJIs3Az9gW95zPD6OmwANn
	bIZc1rAeH4wtygNL8iklR2MKNHwCx28AiK4H9S3AYa65Bz3PbTR/S9QPpMdrAnKd1vIlc3LGKLR
	1nfUuCAxQKDIKYDO3iyAKjNcOdbcegvaSEIX15ogZ1y1g+ropras5x/doEKK9dhyUlbYu9+u+Vz
	YxH51jMJxmQW9iGI7K0UEPMPKRYjb1XiWB4Ys3TfhnHddq8kP69ryZ9LQhZg2D+udHdRiNy0asu
	Pry4Z+Ucj/Dv9ZLJ/wooSDTj+5mR9RWBuZbo8B9439qeMWgLtum2bhIQ8gQ3aoL0FjEiMi/dmDu
	hLpOCtuj31Q0pCz+psBoA9fq1GdR6/cUCZKx+FKBEcEO2uSaVHvSQkDs6eu5nUPTrFeE3ZrJuM5
	0bmwh8QZATnUyBccH4ZrL5Htmrsty7MYICL
X-Received: by 2002:a05:600c:a012:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d01dc0137mr233217885e9.1.1788940632336;
        Wed, 09 Sep 2026 00:57:12 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm45677255e9.3.2026.09.09.00.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:57:11 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH net v2 0/2] tcp: exclude old ACKs from fast path
Date: Wed,  9 Sep 2026 10:56:42 +0300
Message-ID: <20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude ACKs outside [SND.UNA, SND.NXT] from TCP header prediction so
that they fall through to the slow path, where ACK
validation is applied.

Add a packetdrill test for a data segment carrying an
excessively old ACK. The test fails on the unpatched kernel and passes
with the fix.

Changes in v2:

- Exclude all ACKs before SND.UNA from header prediction instead of
  duplicating old-ACK validation in the fast path.
- Cover pure ACKs as well as data-carrying segments.
- Let the existing slow path handle validation and challenge ACKs.
- Remove the packetdrill reproducer from the commit message; add the
  packetdrill test separately.

v1: https://lore.kernel.org/netdev/20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il/T/#u

Inbal Schussheim (2):
  tcp: exclude old ACKs from tcp fast path
  selftests: net: packetdrill: test exclusion of old ACK from TCP fast
    path

 net/ipv4/tcp_input.c                          |  2 +-
 .../tcp_rfc5961_reject-old-ack.pkt            | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

-- 
2.43.0

