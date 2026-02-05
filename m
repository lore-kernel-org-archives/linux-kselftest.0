Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943D28A3EF;
	Thu,  5 Feb 2026 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329241; cv=none; b=KubIlUcXKC7zXAHs8drkP65OqMYNckPp7Aru/WvwjFckSYCUqtqZCsGn/xZ+cabUEYPAyXzMgLo7tnw1ADxJlYSOuhQKJaI5yX8959ZsSprqAVBank5+jmjV4mcxTzDLzcTNtFePg1AnCXuItTMyIpbLTWRLB7axpZcQcmROjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329241; c=relaxed/simple;
	bh=eMJ2Nzro0JFUNNIfB+sTNQrje4HKqIjU6wTN/iWewC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YP6FvYu5ios4+dpNwgLNYrh/ISgA7podmPL7qEUHd+t2FkLDSCSN3MJFWbv7nP4r7Z+1PDdOJwW9SsQ8ViocafRTWaAa0liZeO128k4ve9zaNNt3EqPKR0tto9/8zN3VSW2ucgaQb+kkdxsPItJ0n1i5OCO9AZvlqosURNHV4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJwh4m7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJwh4m7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C0EC4CEF7;
	Thu,  5 Feb 2026 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329241;
	bh=eMJ2Nzro0JFUNNIfB+sTNQrje4HKqIjU6wTN/iWewC4=;
	h=From:To:Cc:Subject:Date:From;
	b=iJwh4m7AOE00qqTYbE5RcMqxMgjEe2znIpcmBrk/83LE70vg01nHmi7INZ5FPVKug
	 tplTU+1/BGwQPQyLQf4vue9MPUQ6x2F4a+sxh+ofE8qGkSTxwHQWG1m+ai88V3xnxs
	 BL8Xg8obo0gjVS2O/OL50WZ9Vw71wuN1QEU/Hvhoy62P0s+zo74lQmKanJgFD5FQKn
	 QhzYzzTInNv4lwAmA2Ea+op49l2hGQf8gfMLXXh2T/9N+NZQXz2VbJIvvzZG2R2jbN
	 mI7QVmwH985Bs9Qp2ipZN7BpQ6ceT07Ats2nqwoklHOt0tNrLBwIZQKXT3MrsXl8Wo
	 mGhgxs/wrzo+Q==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	donald.hunter@gmail.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 0/9] net: stats, tools, driver tests for HW GRO
Date: Thu,  5 Feb 2026 14:05:32 -0800
Message-ID: <20260205220541.2992807-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add miscellaneous pieces related to production use of HW-GRO:
 - report standard stats from drivers (bnxt included here,
   Gal recently posted patches for mlx5 which is great)
 - CLI tool for calculating HW GRO savings / effectiveness
 - tests for the stats, packet ordering and depth

Jakub Kicinski (9):
  eth: bnxt: gather and report HW-GRO stats
  tools: ynltool: factor out qstat dumping
  tools: ynltool: add qstats analysis for HW-GRO efficiency / savings
  selftests: net: move gro to lib for HW vs SW reuse
  selftests: drv-net: give HW stats sync time extra 25% of margin
  selftests: drv-net: gro: use SO_TXTIME to schedule packets together
  selftests: drv-net: gro: test GRO stats
  selftests: drv-net: gro: add test for packet ordering
  selftests: drv-net: gro: add a test for HW-GRO depth

 tools/testing/selftests/drivers/net/Makefile  |   1 -
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/net/lib/Makefile      |   1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |   4 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  17 +-
 tools/net/ynl/ynltool/qstats.c                | 170 +++++---
 .../selftests/{drivers/net => net/lib}/gro.c  | 242 +++++++++++-
 .../testing/selftests/drivers/net/.gitignore  |   1 -
 tools/testing/selftests/drivers/net/gro.py    |   2 +-
 .../selftests/drivers/net/hw/gro_hw.py        | 374 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/env.py       |   4 +-
 tools/testing/selftests/net/lib/.gitignore    |   1 +
 12 files changed, 748 insertions(+), 70 deletions(-)
 rename tools/testing/selftests/{drivers/net => net/lib}/gro.c (87%)
 create mode 100755 tools/testing/selftests/drivers/net/hw/gro_hw.py

-- 
2.53.0

