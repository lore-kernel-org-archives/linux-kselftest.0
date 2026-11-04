Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820999;
	b=1yRJ+I6Dz37TsQwRnPMXUcAfU3BLZwxGQfU1E11w+WXBKI0Q1bmPijtvhqInW5heaeAp
	 lh8VBLg4BWi1L5IgTVkh3fHVes/0EkHUvrqoyIiBGoQlH1ZPOEAA4A8zXhphDP+gdaP6S
	 PGyXX0BYFmJ7f9GinmAbm7qv9MXHN+QImPCFcLvg/6TEFoSuwKfOHUiRAu3MWnkyQ0b+s
	 zZMpJQ7poQQkBQz+XqBNh4AUzx4oxhXWVrnUIqt8MwF+6ZkRtsy4fxx0zGMdtpEZu3z80
	 MFYmozX/a2NPeDom7dsVkCCkXJG1eLklYZ2uLlNFJ+iRj6+36E6AD4rG/YpFJtXMF1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820999;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Itb/+XUxzwDjuKQwsAJFR47NDknmWF5dyrfvKBFmIfk=;
	b=eEn+J7EkR+ixlqIWLBh/8MtNi8FQ4XZ6J4/1QD2CjL+g+xIRYjhHvaedbupkK3Hq7fGH
	 snBeIbFNeYxB+xOrll4UGppYeHc+j3puuhd1OSnk6XRevBs9PK8pPeCNanVHrhJGyZufG
	 OXmVHl0n+Zhgl/4xc6VzxwTSGFhKLQLr6dY4WsdlkGy+iS8i1aXsUkdKI9sosS16SVBfl
	 XxR7rUutn9oDOVBIFWlEH9BYYOZLlJuc4vFG6cRshPwPGDARLVZ5Z7AgyqZVWalpJza29
	 7awN31dy7DRPTSSLQ2/sETNpfnlfLEwDX7G7xtQ8V6MrJX+MHTsQkOf4J9ue0r0IL2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHogC9f+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BCD606FAF2;
	Wed,  4 Nov 2026 19:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHogC9f+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1551F00919;
	Wed,  4 Nov 2026 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820999;
	bh=Itb/+XUxzwDjuKQwsAJFR47NDknmWF5dyrfvKBFmIfk=;
	h=From:To:Cc:Subject:Date;
	b=kHogC9f+CSu/YIkuUTNAcDq003+8HXU+ITLFDlsbwhw1GoU2HyvqiJyoPVfMQzBgE
	 9HruiKS/bFPfYumogbwljnXrOHutj64vVseMoFoRn9i9mEavOHl0UIm0bjUPQpKJ9W
	 T+T13Jpx4AwuUkCdMUsJAyIDWZPplt4C3fqsFD0uoRK87ngTX/FkNtSN4mm9zNeQ89
	 ucg9ydD5/4kJQX+WxSqyzRaqQQWjsfb+WO/hSRgnJ4+ICMb+o+FB7fNM+mDTr7RlDj
	 xaY+CJhUWXFYOBMcFjGyDgsjpo6sAl6wCBhhBBD08MBSCq7EWW21waQ625FLE1khsw
	 M5STEaQpYDSOQ==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>,
	kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/kexec: don't fail the build on other architectures
Date: Wed,  4 Nov 2026 14:36:37 -0500
Message-ID: <20261104193637.333158-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The kexec tests are only built for x86 and ppc64le. On other
architectures the Makefile defines no rules, so building or installing
the suite fails:

  make[1]: *** No targets.  Stop.

Give the Makefile empty targets there, as sparc64 and
drivers/s390x/uvdevice do, so that the suite builds and installs
nothing.

Fixes: a802ed0dd9c2 ("selftests/ima: kexec_load syscall test")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with KernelCI-style TuxMake builds that record per-suite results
with KSFT_BUILD_REPORT. x86_64 builds don't change, and arm64 and arm
builds now succeed without installing anything.

With ARCH=powerpc, as passed by the kernel's kselftest targets and by
CI, the ppc64le check doesn't match either, so the tests are only built
on powerpc when ARCH is taken from uname -m. This patch leaves that
alone.

 tools/testing/selftests/kexec/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
index 874cfdd3b75b3..11b30d49a7f23 100644
--- a/tools/testing/selftests/kexec/Makefile
+++ b/tools/testing/selftests/kexec/Makefile
@@ -17,4 +17,8 @@ endif
 
 include ../lib.mk
 
+else
+nothing:
+.PHONY: all clean run_tests install
+.SILENT:
 endif
-- 
2.53.0

