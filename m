Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9212047A878;
	Thu, 20 Aug 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240058; cv=none; b=Yd+htlsjCDLeBp5IOni6r/KBVBz2WgZDd53yvlSTL6WDO2wTMeTW3p9wH6JDCbs0gupJR69IzGb4xt4TjyNWwyoobt/JlVGtJlmXP0RsEpKKlsuVHKh9fpnunLS0S5Q1+2le61jkmN2c4X4crzOADkxEvkvPhYySeRQUyNE5rAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240058; c=relaxed/simple;
	bh=XiIMUAI3CQTSrJclmRgZXDewMHXUs7lMHRaU8Wfpa4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1YOjJlzq/5/d7cc42GSzeD4pdi+POEUyzOpqyrvhDVCZ8/Q6UOTb607B/upODBAWRoXpXxj7cKMpYxkFcwiT8WpE0Xea1ZVxZJ4BZdMJNBMFsCWg1giD+m/2QGYUusL1FHCypNCgt8JI25HbSnBDTPXnJRFxpPQvHhjY0YyxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sqPysWCE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sqPysWCE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410CD1691;
	Thu, 20 Aug 2026 08:34:13 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49D983F763;
	Thu, 20 Aug 2026 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240057; bh=XiIMUAI3CQTSrJclmRgZXDewMHXUs7lMHRaU8Wfpa4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqPysWCE6zOjewZ/05h1yx2wTxbz/AhF4/2AV7LXJZCyUHIZoMggpYHP0HIEmZByQ
	 LOBJJFFh1tfqbDGJlKaAOfH9AdLF9qo/WzeepKNsOikeIa5sNPA/Rd8sj5sBxh4Nl6
	 e2KKrOVKxclOHwikMlkQh/hxVKZ4Kv6csgogmFYU=
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
Subject: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Date: Thu, 20 Aug 2026 16:33:26 +0100
Message-ID: <20260820153331.2448875-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 selftest collection has no Kconfig fragment, so kernels built
with the selftest requirements are not guaranteed to provide the support
used by the MTE tests.

Add a fragment covering the userspace MTE and tagged-address ABIs, KSM
and its sysfs interface, explicit HugeTLB mappings and their proc/sysctl
interfaces, and tmpfs-backed file mappings.

Do not request NUMA solely for the optional KSM merge_across_nodes.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/arm64/mte/config | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/mte/config

diff --git a/tools/testing/selftests/arm64/mte/config b/tools/testing/selftests/arm64/mte/config
new file mode 100644
index 0000000000000..8587ce70c294a
--- /dev/null
+++ b/tools/testing/selftests/arm64/mte/config
@@ -0,0 +1,8 @@
+CONFIG_ARM64_MTE=y
+CONFIG_ARM64_TAGGED_ADDR_ABI=y
+CONFIG_HUGETLBFS=y
+CONFIG_KSM=y
+CONFIG_PROC_FS=y
+CONFIG_SYSCTL=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
-- 
2.47.3

