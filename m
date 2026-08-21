Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3899314A98;
	Fri, 21 Aug 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321763; cv=none; b=qEdqAKM1PB3dFJqz6uCdc2M9wwxTkQLZyDYyeFW9jcT5MjWiPXtKl1D8IlCUhZ2N2O9XttbLnpNjt797PohNJ19lIkS470xjsZqqPh3eItEjdvVGdfJrsUyRAXlm9gFMJXIgrXUQ+Y9UE2L1kBagy8pVds4XEPLCQTLECD/HoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321763; c=relaxed/simple;
	bh=+pFmLDKVHJtPYfEbsWpxCGIG9ybjUqOMcP0D8NbikrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGMi9fghNNJiMksaFnJdpVJHN6pCWomPof6418sWsattFojlwCqG4RAlhoRmf5vf78/jjpRmuN/pOtPNUJyAxopxY6tsaLWyR2CSYUSnL5/KTlCWdtWxdQTN+p2VYeXE37OW7l22iKXwfEs6arHHaEeUy6KJLs1gg46kNHJNZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MmRdPhP2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MmRdPhP2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F643153B;
	Fri, 21 Aug 2026 07:15:57 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 024683F85F;
	Fri, 21 Aug 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321761; bh=+pFmLDKVHJtPYfEbsWpxCGIG9ybjUqOMcP0D8NbikrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MmRdPhP2qgnfJqVLfSdnX3MZd4HgMEv3NiENacNI1n8PClWuMJlL2Lv7iplzcGqi5
	 87M//L1u32iGqho0O1JscPzPcw/BenPdzi1MbikWc+ZCi0X0BXcwz4cp2KgPuCScpx
	 JdtONEn+rUU05OTmXDLL/wzBNFdYQvZwuCL67Rjc=
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
Subject: [PATCH v2 0/5] selftest/arm64: Fix MTE test setup and TAP reporting
Date: Fri, 21 Aug 2026 15:15:48 +0100
Message-ID: <20260821141556.4065894-1-usama.anjum@arm.com>
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

Changes since v1:
- Add missing MTE TAP headers as an output-only cleanup and clarify why
  line buffering prevents duplicate GCR_EL1 plan output.
- Validate KSM privileges and optional sysfs access before setup.
- Move and expand the arm64 config fragment, and standardize subjects on
  the selftests/arm64 prefix.

Muhammad Usama Anjum (5):
  selftests/arm64: Print TAP header
  selftests/arm64: Print missing MTE TAP headers
  selftests/arm64: Treat KSM merge_across_nodes as optional
  selftests/arm64: Fix MTE prctl TAP plan
  selftests/arm64: Add MTE test config fragment

 tools/testing/selftests/arm64/config          | 17 ++++++++++
 .../selftests/arm64/mte/check_buffer_fill.c   |  2 ++
 .../selftests/arm64/mte/check_child_memory.c  |  2 ++
 .../arm64/mte/check_gcr_el1_cswitch.c         |  1 +
 .../arm64/mte/check_hugetlb_options.c         |  2 ++
 .../selftests/arm64/mte/check_ksm_options.c   | 31 +++++++++++++++++--
 .../selftests/arm64/mte/check_mmap_options.c  |  2 ++
 .../testing/selftests/arm64/mte/check_prctl.c |  2 +-
 .../arm64/mte/check_tags_inclusion.c          |  2 ++
 .../selftests/arm64/mte/check_user_mem.c      |  2 ++
 10 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/config

-- 
2.47.3

