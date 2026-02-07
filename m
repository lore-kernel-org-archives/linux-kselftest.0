Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AD433B3;
	Sat,  7 Feb 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770424515; cv=none; b=Kjmzlnh4QkQIOD8ypDs85cdGF9BqLk30Ri3EnaSaA3HOxFP4G5eMGW5wCepbIB7CvOpi2UsnWTfA7YY3phK1gXvhqX5lDiL7bqHb9tGegkX0MKKRujC56Q4+rnrT3G/pvZ9SBR8oYiXwBJEUCaeQ+1zumVQe9EH06UoZhtIDBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770424515; c=relaxed/simple;
	bh=FPWGl3nSy7e+hceX7wQr77zr0Z1byxYaxqUaPyY+Yt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5px3aRfPGxWZfxLNjrBBao72EbUQMXXuJ1o2CeUQgDASDxAj4z5p++513xOq6Y5DVuaVR1PTrgqCGIBf3MpUVf7EYE0kHok38qjScRY0mHFSUSpfm292sr/N0do/xOwl+ZzWTzCII6CK7tO7srPssOoohB90xs940SKPD5Fr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSV0kDyy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSV0kDyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F87C116C6;
	Sat,  7 Feb 2026 00:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770424515;
	bh=FPWGl3nSy7e+hceX7wQr77zr0Z1byxYaxqUaPyY+Yt4=;
	h=From:To:Cc:Subject:Date:From;
	b=dSV0kDyyfjuh2aZQV142qlLiE27QQbmBtSF7WI5TZLOdav2/mwtoa7E4TwJd8V5LK
	 djaAbV6EciVpPm4h3p11UjcX4cNyHQJFSYTBMwgMK1i4HV7lOW0uChfgU2LwajFRhK
	 iMTA2l+S397QqT5yY10pKMijiqHYnZdt53NDxUNPDjLJv5eDkp3H/NG3SA6haZ/P8I
	 rYVFG4Wxbu0PFChmyf/Pb1latzqnDIeixtdYMxNEtY1GDPxeZGnoKQc09yeV7HZvlS
	 k39SAL2ZV4BJ1yvHzUte8l/0Wx6ysrAY1+2Jaz030NuR/0yuraQKuu6RV/w0uN8eja
	 oA6SGYbFZG3WA==
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
Subject: [PATCH net-next v2 0/9] net: stats, tools, driver tests for HW GRO
Date: Fri,  6 Feb 2026 16:35:00 -0800
Message-ID: <20260207003509.3927744-1-kuba@kernel.org>
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

v2:
 - [patch 1] fix ethtool -S and unnecessary feature check
 - [patch 3] use %1$s
 - [patch 6] do not enable SO_TXTIME for multi-flow tests
 - [patch 9] move the test to cover SW GRO
v1: https://lore.kernel.org/20260205220541.2992807-1-kuba@kernel.org

Jakub Kicinski (9):
  eth: bnxt: gather and report HW-GRO stats
  tools: ynltool: factor out qstat dumping
  tools: ynltool: add qstats analysis for HW-GRO efficiency / savings
  selftests: net: move gro to lib for HW vs SW reuse
  selftests: drv-net: give HW stats sync time extra 25% of margin
  selftests: drv-net: gro: use SO_TXTIME to schedule packets together
  selftests: drv-net: gro: test GRO stats
  selftests: drv-net: gro: add test for packet ordering
  selftests: drv-net: gro: add a test for GRO depth

 tools/testing/selftests/drivers/net/Makefile  |   1 -
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/net/lib/Makefile      |   1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |   6 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  15 +-
 tools/net/ynl/ynltool/qstats.c                | 171 ++++++----
 .../selftests/{drivers/net => net/lib}/gro.c  | 252 ++++++++++++++-
 .../testing/selftests/drivers/net/.gitignore  |   1 -
 tools/testing/selftests/drivers/net/gro.py    | 203 ++++++++++--
 .../selftests/drivers/net/hw/gro_hw.py        | 294 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/env.py       |   4 +-
 tools/testing/selftests/net/lib/.gitignore    |   1 +
 12 files changed, 859 insertions(+), 91 deletions(-)
 rename tools/testing/selftests/{drivers/net => net/lib}/gro.c (86%)
 create mode 100755 tools/testing/selftests/drivers/net/hw/gro_hw.py

-- 
2.53.0

