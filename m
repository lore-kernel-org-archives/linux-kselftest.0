Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B6C3ACEEB;
	Mon, 15 Jun 2026 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553149; cv=none; b=LzLXxbs6948yYdye2VHHdsfv0HAxpvVb4Rq1EFpG9kxWWGja+ZETiNKJXMkuV7HIauXkNce8NPeFQm5rQ4zNFN3wucjFbZNXvQlEh/vf1/PxYImbT2cyqW71mswQTZ5cHtceMndXdNN/utAFcgUn8njNOu/NNwPzu1Tl+tC1x+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553149; c=relaxed/simple;
	bh=Wv/bUKA4KjTgjPmC6F1peCpuW0JmKfAYNy55jBf2yDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipuBALby2KVd0hyPZnWPDpxV/3iYSdrE95+Xm4S+P/0LZvC1TR0RgYZ7PdqVM7jvNscCYwicBL20wOIc59QbQDFoUnkuuk/taUfu53/HvUM1PP7qTg3Nh7dMN7XxyY+4HKycvZFkTcW/juoKdMt+MEVEhGFr8yU7V8VNINTyloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u0CqFXBs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u0CqFXBs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BCE93558;
	Mon, 15 Jun 2026 12:52:22 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.102.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C0C63F763;
	Mon, 15 Jun 2026 12:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781553147; bh=Wv/bUKA4KjTgjPmC6F1peCpuW0JmKfAYNy55jBf2yDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0CqFXBsmRO2ke5nFWE2u/WKFfEec8FEToweyiLipYYzAZedGt3bitjIVNj1sDgpJ
	 PWtJS0NqXGs7kzN6NSUCPo6jh4kYBQYA5IWNNfRRe9bxoGu/0ibYhHpfmanofRZ08b
	 gSmejkwyOnfBf0y3e4QKGFKtu6RAusmeV+dLqzAw=
From: Bill Roberts <bill.roberts@arm.com>
To: rick.p.edgecombe@intel.com,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Bill Roberts <bill.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Date: Mon, 15 Jun 2026 14:51:55 -0500
Message-ID: <20260615195156.257950-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615195156.257950-1-bill.roberts@arm.com>
References: <20260615195156.257950-1-bill.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One should not be able to use ARCH_SHSTK_UNLOCK via arch_prctl to twiddle
feature bits, test that this is the case.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..82a5fefa9df5 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -979,6 +979,14 @@ int main(int argc, char *argv[])
 {
 	int ret = 0;
 
+	/* test that we can't use unlock to set shadow stack */
+	if (!ARCH_PRCTL(ARCH_SHSTK_UNLOCK, ARCH_SHSTK_SHSTK)) {
+		printf("[SKIP]\tCould enable Shadow stack via UNLOCK\n");
+		return 1;
+	}
+
+	printf("[OK]\tCouldn't enable Shadow stack via UNLOCK\n");
+
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
 		return 1;
-- 
2.54.0

