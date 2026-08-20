Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15BD35E956;
	Thu, 20 Aug 2026 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240051; cv=none; b=m2S2pMRdeF7PL0mBVLKo3JczsnyACn45B+6TK1OK4bjqWazyB5bHcfd2g8Flzpzmi7kqZ2yYV47cjOYliYRACoFMM/r5EsEIeaXdkG/ZaRmwadICIC1tTFzbZxeY4srS8d0lc8ju5O1UcLsiiGronKyx1WBQWafFNj3JP0p2VgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240051; c=relaxed/simple;
	bh=XuCHpFD2l7XFa7GMDBXKP2ptFWqTS5hZSmxYFeMwnWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHnv7k4OXhVF+69kBibrrL5DiLNHzm6yDHdTv6lCrUyOFqDp83RW0PVNm/4rZ4KnwsVyiCTu3VC5tC8LoH5JeZn4nmdB/gyymkMsrSgDd4ik2XBLV66TJjIK/NMqHl3uKbGz0gFGOx4lwEMiD3VNPKmsFkVokSnNlTAdoboJTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O5yfQ65r; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O5yfQ65r"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4F0153B;
	Thu, 20 Aug 2026 08:34:04 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD4C73F763;
	Thu, 20 Aug 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240048; bh=XuCHpFD2l7XFa7GMDBXKP2ptFWqTS5hZSmxYFeMwnWw=;
	h=From:To:Cc:Subject:Date:From;
	b=O5yfQ65r3WbDLdo4AWTy/15UkNT7END7W3vLqQ7GXBSyK2ZVAWPN/UM8B57jahXFR
	 BGKt+6AEDdvgZg6BWe2DINX9aGlO6pGeJBJ4pWDOlhY3y8YkhK93g+MKRkdMQWanBl
	 hj8EZxzczr+8Kr6Hztbb4tn/rPI0H8AkLIFF+vc4=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 0/4] selftest/arm64: Fix MTE test setup and TAP reporting
Date: Thu, 20 Aug 2026 16:33:22 +0100
Message-ID: <20260820153331.2448875-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the mainline arm64 MTE selftests on a Pixel 8 exposed three
independent reporting problems. Fix each issue independently, then
add an arm64 Kconfig fragment covering the facilities used by the MTE
tests.

Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
the new configuration. All nine static MTE binaries returned success.

Muhammad Usama Anjum (4):
  selftest/arm64: Print TAP header
  selftest/arm64: Treat KSM merge_across_nodes as optional
  selftest/arm64: Fix MTE prctl TAP plan
  selftest/arm64: Add MTE test config fragment

 .../selftests/arm64/mte/check_gcr_el1_cswitch.c      |  1 +
 .../testing/selftests/arm64/mte/check_ksm_options.c  | 12 +++++++++---
 tools/testing/selftests/arm64/mte/check_prctl.c      |  2 +-
 tools/testing/selftests/arm64/mte/config             |  8 ++++++++
 4 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/mte/config

-- 
2.47.3

