Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7654C77B4;
	Fri, 21 Aug 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321775; cv=none; b=TsLRvZVGxicheUVy69L9kFvz43LsfCAg/S2b5mNwUhBQVR5HsJJqb6n2Cpwh5u7xkk5Diw3XyNc41+I07SfrckCg6aOChwsu4RW6el+aSmA740hkNsrlJzdvIETI5nksTwr36cy7NyWtCE8ltbdPHOGapZZV4A2xqK9iLXcr99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321775; c=relaxed/simple;
	bh=kcTQsC3Bd3GhdslHTEcBTgJQu7xoquii4VHYMzHe8WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejsA0EOp30YUgXBh21PKIGjMszmQUOBfEN2PO38HjnDlfUhhnpfbovoyYJam7isBiyYAN9LR7Wa5iJ+l9rAhQJl+Z+AS3/YboVbVGGEXWfcep8cycmr5Pw8TAWnlWg6kL6EGkm6NfRfkoXEZrlQuTAhBQpwkeaN3lsOaTqJ55Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TiDhLsfB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TiDhLsfB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E26722C8;
	Fri, 21 Aug 2026 07:16:09 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A6AB3F85F;
	Fri, 21 Aug 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321773; bh=kcTQsC3Bd3GhdslHTEcBTgJQu7xoquii4VHYMzHe8WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiDhLsfBJqhxlr3u4mRBOJlkF66QtntY7nKg+yOcy8hQ9C76tifjdB3FsHt+m/64E
	 qiZN5uLaZni5qtGRrbJkn3h9QxTmQPmqCeh+HRJudd4icu5UqtIa5F10BGC/Jd3Z+m
	 PgSG44rqDCWo3iwd21rl0Btipjc/Zhc2yT9L8Jgs=
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
Subject: [PATCH v2 5/5] selftests/arm64: Add MTE test config fragment
Date: Fri, 21 Aug 2026 15:15:53 +0100
Message-ID: <20260821141556.4065894-6-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
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

