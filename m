Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35442376493;
	Mon, 16 Mar 2026 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773701113; cv=none; b=T+IzrR99VcxEGoXAiFvxVUMO8LU7HreYPE3XT5kDUmxffEePrc82QaFFVPxNCOwlkAQuJZxxqrVMkj1B1fanshiVqgVmoPzliYGGcjigoJlXl/Ts1N9UXWZ/0oUQ9TqCSmICLsWDfRoasXFvtPHwy3rHW1W8gH+5pdjFSLKYsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773701113; c=relaxed/simple;
	bh=DO/mkLGk6yL2PsedoHJCpK0qcoQ6iivRsAGZS5YStfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjRWao7PnSTtTnHzmgA0ZIAZC26bGMill1vJaO1R6TsMy/D0NOGRVDUpm99cVwOo4mabd0Z7ppGR/bM/zhmUoKytac0HGx+RK4Al0xjCXtGrl/dqvy672U7LYsku1k1mPH19zKw/Yp+h5De7mojPf3qa8cLsFiH7jNZGshmyENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+cQb9qP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+cQb9qP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B705C19421;
	Mon, 16 Mar 2026 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773701112;
	bh=DO/mkLGk6yL2PsedoHJCpK0qcoQ6iivRsAGZS5YStfA=;
	h=From:To:Cc:Subject:Date:From;
	b=h+cQb9qPBQQhFFi2Oq7eYkaF1BqqBWh6UneBcLbfaacxY5s5yMDwvBZNasUNgjvLP
	 62D7HC/ax7Xo1OkXr+C+0AwHPEMQnRp2URo7LAs2PoPWTjAYFH4onxwL7+AE1Qhpze
	 MOzwMv4Gh10/Iy0xA+wG5vUwXFZ1hy5U8drTTzFsLAqL164uTIInBTD4sVMndKYeE6
	 nyDneAv/ae2as/NZRzdElv4wog6Hi+izFzrtsEN/idxh6wbmyXiFcmgdyeqgyYeWr+
	 mp7XWr0PQ0pWbUAmyW6kCL9bYiNqkkhMU3Dja3FQQvC51E4toM633ydXEV4GA5E2sZ
	 8pc0iLgSKU3lw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	dw@davidwei.uk,
	mst@redhat.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v3 0/6] selftests: drv-net: driver tests for HW GRO
Date: Mon, 16 Mar 2026 15:44:59 -0700
Message-ID: <20260316224505.279672-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests for HW GRO stats, packet ordering and depth.

The ynltool and bnxt patches from v2 were applied separately.

v3:
 - [patch 3] add a note about fq being needed
v2: https://lore.kernel.org/20260207003509.3927744-1-kuba@kernel.org
 - [patch 3] do not enable SO_TXTIME for multi-flow tests
 - [patch 6] move the test to cover SW GRO
v1: https://lore.kernel.org/20260205220541.2992807-1-kuba@kernel.org

Jakub Kicinski (6):
  selftests: net: move gro to lib for HW vs SW reuse
  selftests: drv-net: give HW stats sync time extra 25% of margin
  selftests: drv-net: gro: use SO_TXTIME to schedule packets together
  selftests: drv-net: gro: test GRO stats
  selftests: drv-net: gro: add test for packet ordering
  selftests: drv-net: gro: add a test for GRO depth

 tools/testing/selftests/drivers/net/Makefile  |   1 -
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/net/lib/Makefile      |   1 +
 .../selftests/{drivers/net => net/lib}/gro.c  | 252 ++++++++++++++-
 .../testing/selftests/drivers/net/.gitignore  |   1 -
 tools/testing/selftests/drivers/net/gro.py    | 203 ++++++++++--
 .../selftests/drivers/net/hw/gro_hw.py        | 294 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/env.py       |   4 +-
 tools/testing/selftests/net/lib/.gitignore    |   1 +
 9 files changed, 728 insertions(+), 30 deletions(-)
 rename tools/testing/selftests/{drivers/net => net/lib}/gro.c (86%)
 create mode 100755 tools/testing/selftests/drivers/net/hw/gro_hw.py

-- 
2.53.0

