Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4641F37F;
	Mon, 31 Aug 2026 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194260; cv=none; b=jxwac+usAswF2L38vhL01qvv/b8Vw9UZRtDRCtpCVm3XpTz/m9n7sflFANahJp3StMnQ36yA5e3LlETpKo93ymt+9LasowJqjzGjWNcOJEVP4pMvZ0RoJezNQK2M/FfjuRjPLssrZ8hXH/D3dxbGo55wQo6HR0B15KOAQ2PQNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194260; c=relaxed/simple;
	bh=0CAQHYJ/WJfAHAd7JVdW+rHQ5Jw3/v2EKuvgsSqjxKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RwYr348yCUCBKR1m1K/cWEN4tFcCdfpvuVJl5vE+256qO62kcuNFa3Y7rlgOGa4GLPoqy2tkXf5BssDITWMuD3TwZzsSx2sF4TvvYz5jg2RHt/IKUhrvHBcB48eXEDunYS7IME1kdQA1OYIut26DBgGExdu2bivwtXIZXkdKfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXCUW2zL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXCUW2zL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760C71F000E9;
	Mon, 31 Aug 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194258;
	bh=W/c2rkKeS870ux/M3sHENCDweZZhFOcaCG0xfzVyW1A=;
	h=From:To:Cc:Subject:Date;
	b=JXCUW2zLDdrqbUjAsjF2fAaiD6k2qSKVRFL5qvpldYYDyE1AayhOSMq66zl1++YM8
	 eWjmclv6mVLWcqfJYbjewl7GsD1Yaf2cd9aqahFprIXN4fXOiZnNVQYQc6EEpCx0sD
	 mfTQavjP201fK1uXpENshVbdYJdVEKlNJR1PQoiR7mKoJeIK7LfdKdFjPY3/yIM/QD
	 nx580hFo2zTwCdDWNqUBzuKFc6R0Me3sNSkMW9YhkmgKRQWoRMxmFLaIPKjx81xL75
	 SLSG4zGeZX8R4kZ7LUpNLslkWoN51hd91UWe5MCMGnDCk7PuSXGOtQ+BA91UD49Brf
	 PAjZza9sIGyfA==
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
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 0/3] selftests: drv-net: split up gro.py
Date: Mon, 31 Aug 2026 09:37:31 -0700
Message-ID: <20260831163734.1121891-1-kuba@kernel.org>
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

Jakub Kicinski (3):
  selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
  selftests: drv-net: split gro.py into one test per coalescing mode
  selftests: drv-net: bump the timeout to 15min

 tools/testing/selftests/drivers/net/Makefile  |  9 ++-
 .../testing/selftests/drivers/net/hw/Makefile |  2 +-
 tools/testing/selftests/drivers/net/gro_hw.py | 14 ++++
 .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
 .../testing/selftests/drivers/net/gro_lro.py  | 15 ++++
 tools/testing/selftests/drivers/net/gro_sw.py | 14 ++++
 .../net/hw/{gro_hw.py => gro_stats.py}        |  0
 .../selftests/drivers/net/pppoe_gro.py        | 46 +++++++++++++
 tools/testing/selftests/drivers/net/settings  |  2 +-
 .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
 10 files changed, 131 insertions(+), 41 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
 rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
 mode change 100755 => 100644
 create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
 create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
 rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)
 create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py

-- 
2.55.0

