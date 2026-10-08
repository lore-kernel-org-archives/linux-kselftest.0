Received: from mail-108-mta66.mxroute.com (mail-108-mta66.mxroute.com [136.175.108.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0931432309
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490629; cv=none; b=oK29PLUQBPU78lRjksFYjM8pwIWYWZRmnAZL0HMWHEqhHWLvOtjxbABVbTQaE5vFoBkfxos72mnHoOXuRJFkNCfiwJtdKW2tMSUvQwpI1sTjNFeWw/MysZZxYLDjjW1AH6EP/VYaabBHb6FQObc8347UYl/EDFPN8mpMBbKYzCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490629; c=relaxed/simple;
	bh=AdewahXmQVoGFKbvFx9hrY5Lw3JRM57+R4xGi95K+WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUAIhsfOFt+dCqJBGowYYJAm+AU30Wv09uweqvlnnm2O+D/nvKP6XqlVPt6wNCqOGaJg6Zfub0gLN5nvztyjxOTm6kzwZ8vcsoPyquruk53rpT1LcViPsI7UZy0npHULITszSzrkg4nvviirYZNY++FsKDmYfW4Nzt3e6DecijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=iXWOr8S1; arc=none smtp.client-ip=136.175.108.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="iXWOr8S1"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta66.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d29832500028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 20:17:02 +0000
X-Zone-Loop: c1d50d4c2bab70cfb721e980c6b493d8befdbb4b3d0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=98aMzkvRL5YTiN/cBhGVogLVsHcjkgm1Lg+pmTYtpdY=; b=iXWOr8S1TmSX0n/zs63uEaggXs
	zZ6g/v6xC6YK3CFZ1qGofvUR7Exdjhdp1wlWet+7yl1Uh8329+aTsj2ItIvjKn21rvORoQu0G7LEa
	HnSBEJRE7aNYfLy9gdtrO1shcDjffajHZ8E8fdWKQ92r69rm7FKuzqtn99rtD3DxZ5ZYk7rlSvYZz
	DLv6+6v98vd/JllRfMRlmAOzELt9u3vwE9RqgJ5K+qWl32awob9m2miIPMBRzk6XXxkML3T/J38Jm
	iBDeIdNbQx8U2IpB7l+KRBn9qC+FAxTYJ4zB9bARqK41e5KW9H4/dIhJdfC4cZIQYEeGdDDbu3s6G
	df2hAXBA==;
From: Richard Patel <ripatel@wii.dev>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH 3/3] selftests/x86: skip shstk tests where perf_event_open() fails
Date: Thu,  8 Oct 2026 20:16:10 +0000
Message-ID: <20261008201610.1003569-4-ripatel@wii.dev>
In-Reply-To: <20261008201610.1003569-1-ripatel@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

perf_event_open() without caps fails with EACCES on some kernels.
With this fix, the shadow stack selftest passes without privileges
on a kernel with a RHEL-like config.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 67baebbdbd87..e2340232a7b6 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -952,8 +952,11 @@ static int test_uretprobe(void)
 
 	fd = syscall(__NR_perf_event_open, &attr, 0 /* pid */, -1 /* cpu */,
 		     -1 /* group_fd */, PERF_FLAG_FD_CLOEXEC);
-	if (fd < 0)
+	if (fd < 0) {
+		printf("[SKIP]\tUretprobe test, perf_event_open() failed: %m\n");
+		err = 0;
 		goto out;
+	}
 
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
@@ -1031,8 +1034,11 @@ static int test_uprobe_call(void)
 
 	fd = syscall(__NR_perf_event_open, &attr, 0 /* pid */, -1 /* cpu */,
 		     -1 /* group_fd */, PERF_FLAG_FD_CLOEXEC);
-	if (fd < 0)
+	if (fd < 0) {
+		printf("[SKIP]\tUprobe on CALL test, perf_event_open() failed: %m\n");
+		err = 0;
 		goto out;
+	}
 
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
-- 
2.52.0

