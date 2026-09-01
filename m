Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB6468C14;
	Tue,  1 Sep 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293265; cv=none; b=c/BHm/JWyfDCtIKn2gFFeTqUaQcR1ClHhhDTTqw2+mgnG9PInrIXexV82lQKL3OQsSeCYcz+uH0tcNpGOf0w95H+jYidpgyWmiWcYsUwZPJGdk0vdBUAVcTHnPhY9TJpB25TpIBvCjXrDDJRaGZXzFzcR30YyBtqG5i12Iv3ebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293265; c=relaxed/simple;
	bh=CE+I5Eib96BZBQ7t+v+jC9k83yPJUT2oBVd/o/68eBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcuKpIF1CEGcRGytM5DyEQ6/YmuL4moJBeTht1Fc+pOFvq1Tqock2T4hh0+jrsk8RXQ88ssYN/O658op/RJRQPyu7Fz9a9AC0qxf/MHA5zcsxfidUHgTo9cJFd09mkkQS1Caldc+2qF9Ku9pYIz9oDoFy8HHj+HjJqkvtOLnbgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSQKE5he; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSQKE5he"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415691F000E9;
	Tue,  1 Sep 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293263;
	bh=DpAiKm8MQaDChVyNBwiXRz83RlFzm62MQTEJjiIFG8k=;
	h=From:To:Cc:Subject:Date;
	b=dSQKE5hewnEXBnBudTYpmP9nNY21an1n4lxRwutgbNlb9cTYXp+St7QfGvFzOL5vN
	 v5sIbkYoIpDE2mauc4ObSdV8jRs8hCFGGnNhKXmSpm3Kd7uHr6A2kSFlWk5xo6ouuk
	 Ir8ooQcm9Y8YeAAgeVIAiqGiuCDY3m1XY445td42oxlxGsUCvS7KdAwHc0EKN1rDzt
	 3cqVv6nTYB9AGU0lw3aZOcI852dEcT7dfMhPsW5PkwerBo106d4v9dBIFYd7ZrRbBx
	 aC48I6qCXYJ636pXBPAE4J4Ne3ALT/48mM37iGyebKU/yV8VUg9f0U4TuQ51BqQ3qK
	 L6P/Rs2iaRDqQ==
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
	linux-kselftest@vger.kernel.org,
	noren@nvidia.com,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 0/3] selftests: drv-net: split up gro.py
Date: Tue,  1 Sep 2026 13:07:25 -0700
Message-ID: <20260901200728.2063720-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gro.py runs its full set of cases three times over - against SW GRO,
HW GRO and LRO. It's our test with the longest runtime. The 318 cases
take 12m30s on mlx5 with a debug kernel.

We will likely add more subcases here as the time goes on, so it's
time to start splitting it up. Long runtime wastes time on retries
(if any of the 300+ cases fails we try to check if it's a real failure
or flake an re-run the whole thing). It also forces us to increase
timeout for the whole test suite.

v2:
 - [patch 2] reorder import lines to make ruff check happy
v1: https://lore.kernel.org/20260831163734.1121891-1-kuba@kernel.org

Jakub Kicinski (3):
  selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
  selftests: drv-net: split gro.py into one test per coalescing mode
  selftests: drv-net: bump the timeout to 15min

 tools/testing/selftests/drivers/net/Makefile  |  9 ++-
 .../testing/selftests/drivers/net/hw/Makefile |  2 +-
 tools/testing/selftests/drivers/net/gro_hw.py | 13 ++++
 .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
 .../testing/selftests/drivers/net/gro_lro.py  | 14 ++++
 tools/testing/selftests/drivers/net/gro_sw.py | 13 ++++
 .../net/hw/{gro_hw.py => gro_stats.py}        |  0
 .../selftests/drivers/net/pppoe_gro.py        | 45 ++++++++++++
 tools/testing/selftests/drivers/net/settings  |  2 +-
 .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
 10 files changed, 127 insertions(+), 41 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
 rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
 mode change 100755 => 100644
 create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
 create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
 rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)
 create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py

-- 
2.55.0

