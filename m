Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731643;
	b=V/TmW/x1kPSFvPlnxG3Z1VseCPfNwXxXcNxDOEycXpG7E8qRGVqDjphSzJtfKQosZbYr
	 F19pHy2msSYAJYlB2JNnsabTesgdVxhzULQFG0+Tb8BN037m4Hk7Vy+8Qv+LsZRj+HSvO
	 ADtsn89QyLC1tOBx1+sW6tAY1PPwfpM09psQHPu4LAwB1EE1dxug2UKLl/thbHcimK+Pd
	 0W+8PZnptwn2AEkeX8dwwZH6BAH51sYbsTyjMP32eoKj6rMx6l5xWaxTsqVar5VkJBUau
	 y5L6m+IRv9j1YMC8REhF0sOjKw+5h3qhBDE5bfVtwbmT8xmubB9ZbVDxGL0NaXqMMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731643;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3EZ7bYWkHQbtUFV5xeGwJreImJLFMe8+jHkT+GjWgXs=;
	b=E4ok7XPfDx3i0fgoKte9w0BM3zEgjsi1dA6GDQykMyT+IXWL/dg+cuHWkQkHVaJVFqxM
	 mlu0OkYAcUp3VEN80S0CKWPlCxr63OcovFlC3ARchHUsVB+D7S5Yrj4FM8rFsoxMvPBYG
	 y9wcLnpPuCx/2ecjSHymxB2lRTqMONZNOTFyXiCO2jYfcrBGO+G/Y1ZIcQpXitPENU09y
	 USFvy+UVMMgPzXKlelwyZHEevac7oxriScZOA8Cqg6R2I1Anjxsglb2JTNQIJRMyVGkmd
	 QrrXbDDMaCSU1VcqP3M1QY+h1VqaNkK3QobJtE0pLbsSxBiF1jyUSMZIuVZ+aMWF67Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eeXhCSeC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295C2606A31B;
	Tue,  3 Nov 2026 18:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eeXhCSeC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 274A81650;
	Tue,  3 Nov 2026 10:47:18 -0800 (PST)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6D693F628;
	Tue,  3 Nov 2026 10:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793731641; bh=CZfqHU9385UFiE636WVzWc/cGN1QRqewjRfnI0GDwjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eeXhCSeCB4gye0Z4AQLqmYr6BJlV2WdpeT3UD/eQY0vum1tiLFZA+3Nw3Ymr6jiza
	 Yj25s93CVpSYgQf8mvDA4/+6dGbdC3apHawWrq+qnXKXWw5iBU5GP2yTcMioXfpMFl
	 rWmp8LkvvoQ8eWCDXyNdEuzZMgxw2aHhnVFDNabI=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH RESEND v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Date: Mon,  2 Nov 2026 12:17:08 -0600
Message-ID: <20261102181708.29178-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102181708.29178-1-bill.roberts@arm.com>
References: <20261102181708.29178-1-bill.roberts@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that ARCH_SHSTK_UNLOCK can't be called from normal (non-ptrace)
context.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
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
2.55.0

