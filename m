Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0F476056;
	Wed, 14 Oct 2026 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008105; cv=none; b=Q0mleIYQ/jSwNo+fcpobOsL1xITZYT7QWrJr6p264Mhc20fAqye5NgVRDtkJ08zl/lSib3osC9VhleKW1RgqCeIZ38O+qS9hpKsMaaWVG4cs62OmDOmExKKuLUp4LIuNmw6Y62pNNzT9KBApyuZpiXKkST0Yn5kNDj4bL/wH28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008105; c=relaxed/simple;
	bh=cWnvjPzeh+PMt5TPvtD2U8muCc6pFu2c7cAB+PR5Vs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YiJ3vWYu6n/mRWlCH+yDXelOckTGm4ZoGh4Ub1gTvEH3eCWVMTujziVeezQIbU279ckBLUCbHUNMT8/uRu2BHuqc3H7x1/OArYQwPf0+xNg+XOXVcUmYFeTxGTqDJJJOeTsRjJf9CIHPwbyfaOjkUPzm2w+wAG44WhCTw6WelyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/rF8yPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/rF8yPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E261F000C4;
	Wed, 14 Oct 2026 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008104;
	bh=ZrPAzutf8awPyjVlYSNYRP+pT/7nUYoQCA38Ul31YCQ=;
	h=From:To:Cc:Subject:Date;
	b=S/rF8yPgx97nrEfuiHLzJimSOK40Wlv3EtkdV+xg9iDWhTVr9cRYQ1lwrfw3gtWgH
	 tvljaomId3olEngAeR+tB8/MXTB0iHJkNRLXKfyytpgJCTYnhyWTb4GE2/NIDBE73x
	 alZU0WGfCNN9JU09WY3T1uiQOd5of6R1m4JF9vbkBoZfdIBOWiLrVGe/X1TnVynFLZ
	 91GtGREJi+BjAgDncjFTsMvkM0qHwbu3E+ue02pLvPC5+0hEMSVtP3WAjZ9rbIhffw
	 muXhoHdZukVB+2mIaqpcC+47IFdJrCCzzjaC2LBDYiIBZbpfE0YDfb5TpEPDrOe5qR
	 bwleSxL+bmrpA==
From: Sasha Levin <sashal@kernel.org>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Sasha Levin <sashal@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/nolibc: use the configured kernel header directory
Date: Wed, 14 Oct 2026 16:01:42 -0400
Message-ID: <20261014200142.1364761-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The freestanding build hardcodes the source tree's usr/include even when
selftests exports KHDR_INCLUDES for an output-directory build. Use the
exported header location while preserving -nostdlib, -nostdinc and static
linkage. GCC 14 and Clang 21 builds then find the generated UAPI headers.

Fixes: eb1353110831 ("selftests/nolibc: integrate with kselftests")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 6bace04227a74..6981c220eed76 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -10,7 +10,7 @@ cc-option = $(call __cc-option, $(CC),,$(1),$(2))
 include Makefile.include
 
 $(OUTPUT)/nolibc-test: CFLAGS = -nostdlib -nostdinc -static \
-	 -isystem $(top_srcdir)/tools/include/nolibc -isystem $(top_srcdir)/usr/include \
+	 -isystem $(top_srcdir)/tools/include/nolibc $(KHDR_INCLUDES) \
 	 $(CFLAGS_NOLIBC_TEST)
 $(OUTPUT)/nolibc-test: LDLIBS = $(if $(LLVM),,-lgcc)
 $(OUTPUT)/nolibc-test: $(NOLIBC_TEST_SOURCES) | headers

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0

