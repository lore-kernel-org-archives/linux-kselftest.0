Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138C63FCB3A;
	Tue, 25 Aug 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656787; cv=none; b=CGngXC5BPTuo+or5vsB3VKFPjbf+boIMhwETIULCWLsQY4W6IDY76MAx3qeDX/GIDwWaX/MQKLcylSimuUFq4bj8uWKDYgz8AB/agOH3xAjXdJWOMSchniGNGeIwTIuYeWu5nd7LW9S0cSqZRM0MN8oEhQkDEIpCtHnoQNkhBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656787; c=relaxed/simple;
	bh=I/697pWPhGzz8TSkJo0AiC5j0ACcBqX/vSOHckSPgog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggWDqs6xp+iGoBCaIV3Qpl/7J/z0xF0VwgwYiXBEJw19MmAJKJCPG0A58rp9q8cNTj5c/zJ7kYkxuakGaEqCxabIFxqoQ8P6uvsz197UGsGnTYwXdY7zGujlhezVMZwAdJ9LVs/s4xADkDnPQJNCoFrrDGv4AfJlS7r0eZCUeg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yv+4Tgm+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yv+4Tgm+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5A8B153B;
	Tue, 25 Aug 2026 04:19:36 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0584E3F66F;
	Tue, 25 Aug 2026 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656780; bh=I/697pWPhGzz8TSkJo0AiC5j0ACcBqX/vSOHckSPgog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yv+4Tgm+wvMu866KPep5l3UKAREe66Bn7QwXjXk9va4PeSxP7YT4Tx1cuI/mC7eOy
	 R4C/ORpy9zabfy2P0hBZjV9tXJX145JsD2CJFtnWxM98SnwelpwsbutSck9JDB5k8M
	 s4pWhoui5DwjsO31ua13S9aYR33r2Dt7b/UM+JSs=
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
Subject: [PATCH v3 4/4] selftests/arm64: Add MTE test config fragment
Date: Tue, 25 Aug 2026 12:18:37 +0100
Message-ID: <20260825111929.2882324-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 selftest collection has no Kconfig fragment, so kernels built
with the selftest requirements are not guaranteed to provide the support
used by these tests.

Add a fragment covering all tests in arm64.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Move the config fragment to the arm64 directory.
- Add requirements shared by other arm64 selftests.
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/config | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/config

diff --git a/tools/testing/selftests/arm64/config b/tools/testing/selftests/arm64/config
new file mode 100644
index 0000000000000..0fa9755853924
--- /dev/null
+++ b/tools/testing/selftests/arm64/config
@@ -0,0 +1,17 @@
+CONFIG_ARM64_BTI=y
+CONFIG_ARM64_GCS=y
+CONFIG_ARM64_MTE=y
+CONFIG_ARM64_POE=y
+CONFIG_ARM64_PTR_AUTH=y
+CONFIG_ARM64_SME=y
+CONFIG_ARM64_SVE=y
+CONFIG_ARM64_TAGGED_ADDR_ABI=y
+CONFIG_HUGETLBFS=y
+CONFIG_KSM=y
+CONFIG_PROC_FS=y
+CONFIG_SECCOMP=y
+CONFIG_SECCOMP_FILTER=y
+CONFIG_SHMEM=y
+CONFIG_SYSCTL=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
-- 
2.47.3

