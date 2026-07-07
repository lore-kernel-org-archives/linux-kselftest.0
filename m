Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF5F33F390;
	Tue,  7 Jul 2026 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451517; cv=none; b=RcsOYb+KCG+XShAeJWhk/+MqIoWeokxV1k/jOk19mDxD21aLT4b6ycXQChY4LhlOcdDI/FzJC4eZvP95rED0Nmg/NjM8Z5k/KnE299Gh6oHsxOYA267wk66jl60/K4hh2XK9QyiHXQRg7vmYlkn33kmsJa3N0zX9Lngl84zkg2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451517; c=relaxed/simple;
	bh=ns1Plvef9yH2InVozXYU85Sza7nfDL2Vk2gfwHbma1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYzo5bvk1PwFB1ZNjz1+1x3vbcP6eNLDOXeGGzOkUGrR0QWVXGgm2EJMtLh9UBph2ZVTJTFNsAHkMFCxzVg7w4Ja41POJRZqS6H5O+YnYdDUsA9NFFjxmjtWTp0WUNPATTe4R0HTPyFuXacrFZJNFGhYihDrsBonEdwxqD/Lr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lUW4LM6x; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lUW4LM6x"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2BCA3296;
	Tue,  7 Jul 2026 12:11:51 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.109.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFADE3F905;
	Tue,  7 Jul 2026 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783451516; bh=ns1Plvef9yH2InVozXYU85Sza7nfDL2Vk2gfwHbma1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUW4LM6xMjO4/pqEQ+c+Kmn6H5MSUekT1UiWdmZZ6u3VMZPvtTc/2ZPqWW1hZluz2
	 CkL0CiNa2GHZ7slS0iMjdSGQol/frnY4HaN9znvotyYGo60P3I24HB0mga43lvRiuC
	 vebfxwVWW3ll5DBHzayFg5lJ4lLqSbUY9KNxiTmk=
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
Subject: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Date: Tue,  7 Jul 2026 14:11:36 -0500
Message-ID: <20260707191136.1732277-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707191136.1732277-1-bill.roberts@arm.com>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that ARCH_SHSTK_UNLOCK can't be called from normal (non-ptrace)
context.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..cbe7ca4ebd90 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -1059,6 +1059,14 @@ int main(int argc, char *argv[])
 {
 	int ret = 0;
 
+	/* Test that ARCH_SHSTK_UNLOCK can't be called from normal (non-ptrace) context. */
+	if (!ARCH_PRCTL(ARCH_SHSTK_UNLOCK, ARCH_SHSTK_SHSTK)) {
+		printf("[FAIL]\tARCH_SHSTK_UNLOCK should fail in a non-ptrace context\n");
+		goto out;
+	}
+
+	printf("[OK]\tCouldn't enable Shadow stack via UNLOCK\n");
+
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
 		return 1;
-- 
2.54.0

