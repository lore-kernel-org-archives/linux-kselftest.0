Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AB335064
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973222; cv=none; b=Mppbm+bzCG6Pha3C0Can882R7hvQ1YU1H8aKZdWadWLTvJti0O/HhX0PXPdtDfpC0Z+8OXKoayd87EZylkIQeguFexLNQwKB6kDHPgvlpy3E3PXw1zayiv51LjxRmAWCo16dEiy6GC9fu806IeuFeM2l8sXIPvmK0SoUG9/Nh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973222; c=relaxed/simple;
	bh=Y3I3Z6aMF6k3luiiTn9t3iVSMNicsz+VMWaOi+NdkSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubKQ4/aMbFgAzOCkSbFtBL0dRzxDgsC5g8vS6S3Jzvyuzm+un9AXFmLzsV/yTEJObXyz7n1mGupS6lWjmU6r1OBHqMm+QtJ5DxwQXSMHYzRRw03qzlvWT1YVTwNtNH3RUF78ONW5Q29Jt8vdSbpt3od716zliDT/Hi22Fq8URKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UazQpQ4M; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UazQpQ4M"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-46391e91e16so4276073b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771973220; x=1772578020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5c1EoPKk72Be+126KhlAHwq3me18corIKZfzY3nIwvM=;
        b=UazQpQ4MC6IuJDHAppTJFFos7hu0Qg9ssWNcMhyup5PEQOHvP8UaJ0MtvrMpRpav/0
         6EPu5n3zbgx4miBdTBzELe3fROjSN5FO4bq+UeqomyZ2Ky8GJa65biFVYo5rtd7KqBo+
         Eu4D3FNmYmxRSiZyx+JXfr/2xj1U3ySqPe/boGJcPv5GuZinHNJrFGhIPff5VlfX2qd/
         Z/30bJFqTn1JMnY+7sqLbkPjY7eD1jk8WLioO8XuSvncP1XZYMGCdpuLNdA+4eAXKKvC
         JyQdI7edFBtACJgnfFW6zFmsdsKtcl1k9c6ogAr6IS8S07yBfSZUY+r6jFSiDQqP85Ym
         kRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973220; x=1772578020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c1EoPKk72Be+126KhlAHwq3me18corIKZfzY3nIwvM=;
        b=e1v7QFauC5g2YtVMLv8Qy2qrnXrjSW2tavWpChfNTrX+8vdm09vT9o1JgV2nUoITBm
         F04GnEfBZqEEzgY/NT7M2UT5dRx+DDPOf9IZQmUdy9QUaJ1Ik48x3ysmzhxuILnxgpxT
         7Gmsde+gec/eJYAddq/ImoXouWVWIT8SCg6GxMX2wTqvMPjguMia/J6HBqZ7FXUotpmN
         fqi7iLoKVtGVnNXel6IKkINX4O3u4BiBTMNpW7wIOY1Ui+hGtycpNAuPJua8z67ehK9H
         63dljUVSlT45pPRFp2qiuqup7s2SzVCDQDmQfMYkbN7osv+fzQhAFxwf/okP5TrCoauB
         42sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVroLBycT39Tofr0EpzpNRSPvtIFm/hqgKBsIm4U98djP49ltEtIajHm/ADOPmRLX/UXyjPEcH+wyt62Z2XiAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHAnNmQR5aq6A232YzbkmewR1+73VGMKxSdTivBCc07DDD8Mc
	r6iBsGKSk88an2S5NIYDFpYs5XU7V0UbiHeUK4z0Fher3Wz9XrwagAhi
X-Gm-Gg: ATEYQzwivKzFoTXo8kaUvpN+iWlmUG1PS55bRmkFN3B2XpmfFFj3VXHot/mwLrckvc7
	1QWao9Tfhwgl+gFi32XEK8gYAovnSTyr39uLcEL9lzQztVBx5vpaEUFxdRVglM6uxaqYeRk1MgP
	aT19CL+00z1pOYQQN1yCcrIORL+2A/cHgZUCk68whCnvvwx1SYr3uY3iq8V7UG2nQPwULNRocmr
	ZNA/6AxEFYWUVL/5f+N4vaTMv9V8IJKoCS5aogSJVVzonl5bwzNBfBOuRE04n16YF72NeSwLUmT
	kEkwhdHWczVKCVykXRWLjObDetRUESQan2QHjyTU24L3Klp9Og5rb3DVenpltR2xRuWUQMzU6S9
	8YHjPReunymHfQ/E8l+D1tQE/y/Sve/j0tcxUsZJc/D19YV/HBX3xti0Dd5g=
X-Received: by 2002:a05:6870:e6cd:b0:3d4:b76:5080 with SMTP id 586e51a60fabf-4157b0c8eb1mr7792977fac.28.1771973220715;
        Tue, 24 Feb 2026 14:47:00 -0800 (PST)
Received: from localhost ([2a03:2880:12ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cd54ed8sm11007733fac.1.2026.02.24.14.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:47:00 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	David Wei <dw@davidwei.uk>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Petr Machata <petrm@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/2] Add selftests helper to get N unique ports
Date: Tue, 24 Feb 2026 14:46:57 -0800
Message-ID: <20260224224659.1507082-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rss_ctx.py tests would occasionally flake. I found that the successive
calls to rand_port would occasionally return duplicate ports, breaking the
tests invariants.

Add a new helper that guarantees generated ports are unique.

Dimitri Daskalakis (2):
  selftests: net: py: Add rand_ports helper method
  selftests: drv-net: rss: Generate unique ports for RSS context tests

 .../drivers/net/hw/lib/py/__init__.py         |  5 ++--
 .../selftests/drivers/net/hw/rss_ctx.py       | 13 +++++-----
 .../selftests/drivers/net/lib/py/__init__.py  |  4 ++--
 .../testing/selftests/net/lib/py/__init__.py  |  5 ++--
 tools/testing/selftests/net/lib/py/utils.py   | 24 ++++++++++++++++---
 5 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.47.3

