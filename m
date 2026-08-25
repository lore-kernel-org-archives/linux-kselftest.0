Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E60337688;
	Tue, 25 Aug 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656775; cv=none; b=s4/KxRNolawFOuIMCCenRXigNKRA7xJy6ClLPiNtCcT+rlWNmY/UC77CCIkxvjoYsNRcsIbLl9HDfj+IUm/TlD3U9eLRyoAaH7pg6pynpbEM7nYzWxeC452U12C1HO+gFQmBh4HRPA4zdtVQYPUoWq6AzrdCbhY+Evssfs3S3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656775; c=relaxed/simple;
	bh=5Sq6kzMYi7a+GOQuK58QTIE83E5jPHwmaVWwekQkOmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGrXuT1dWDUsbnCTprB5FmlJM1eDwlna5v05CyC1Hk5jHqTNHXnrHWt4Gc5715auTBNyWSRj5Ty/K/JwBii6QkigkzQGdJFnd1GZ9bIBxvjSf09QtkvvWKjXHm//tDz/UvqA/VXMwY/81yb6iDwkf9G+bJPLdB7zeivdcs/D30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Wqc2Pnii; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Wqc2Pnii"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD141153B;
	Tue, 25 Aug 2026 04:19:28 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02D7E3F66F;
	Tue, 25 Aug 2026 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656772; bh=5Sq6kzMYi7a+GOQuK58QTIE83E5jPHwmaVWwekQkOmI=;
	h=From:To:Cc:Subject:Date:From;
	b=Wqc2PniiotncFDikIrhtbsivQZRK5tYaensA6HIQw/Foy+aLQT+m3jGRnkFiVPg9k
	 P6gzzDIuK1Z1GdCGUzU1ZGdlrZz+PZP+NWYZLUAh3BJhTmCXE+t0oiDBwVMGXA6T4y
	 wyVmOaJMN19U4yUezG7XYQO9DX4LW50zdKR3XxrM=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 0/4] selftests/arm64: Fix MTE test setup and TAP reporting
Date: Tue, 25 Aug 2026 12:18:33 +0100
Message-ID: <20260825111929.2882324-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the mainline arm64 MTE selftests on a Pixel 8 exposed three
independent reporting problems. Fix these reporting problems, then add
an arm64 Kconfig fragment covering the facilities used by the MTE tests.

Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
the new configuration. All nine static MTE binaries returned success.

Changes since v2:
- Combine the MTE TAP header fixes into a single patch.
- Treat inaccessible KSM merge_across_nodes as a skipped prerequisite.

Changes since v1:
- Add missing MTE TAP headers as an output-only cleanup and clarify why
  line buffering prevents duplicate GCR_EL1 plan output.
- Validate KSM privileges and optional sysfs access before setup.
- Move and expand the arm64 config fragment, and standardize subjects on
  the selftests/arm64 prefix.

Muhammad Usama Anjum (4):
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

