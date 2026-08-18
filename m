Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF2257827;
	Tue, 18 Aug 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070799; cv=none; b=JZFphVHIxHBfweu/OhNFgeSKhCubv6WhB0pSFmFlZpvjn03luap2PcfehvFvntVuUtc5+iSVR/OKCLf8THgZIAEBGUUlNH1/o8LUXM7bQjuHdrYn84CvC8PjpL0F2HTnGXX7XA3a2qhx39ljgoTDTR50yEtRSykJlGJOOiQ+gbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070799; c=relaxed/simple;
	bh=DbrWcJJ1jMfcGSgj37oyQ8v/le67wsjr1qcdMXDeqSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PGuPehWkln5eJ1H0DczxLkOu5hl4f4z0PSWv69AKPRMbk3FAScmASA1LHPy3JYqg34BPv6ZEvjl4DZV2sNpl5TPrrzCbPofyWOWXM5qxqWqvU9yPVpIsnjiwlLyMzNpyY5fNV/MUoZ7jW1AN7p/RDh6O8eCFyfq9O2ZsbqllkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EPg2vDpb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EPg2vDpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787070788;
	bh=DbrWcJJ1jMfcGSgj37oyQ8v/le67wsjr1qcdMXDeqSw=;
	h=From:Date:Subject:To:Cc:From;
	b=EPg2vDpb0fmhPegVP6xEL7CjM1JEyg6uJNGef4GwF65orAWgP+0MPKKo1hpwwF472
	 6AugS5KEyxPLpgrKj18WByO9TMPkmXURfasvuO3NIuWO5fnG+mQpmma3/ND15mYCr4
	 GdQ+yPwGdqHPHi/m+68AnPK3Kl3pbIVSA9VZ8u8s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 18 Aug 2026 18:33:02 +0200
Subject: [PATCH] selftests/nolibc: stop treating skipped tests as warning
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-nolibc-test-result-warning-v1-1-d15cdda84ccd@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTtJaUSJVzEuaPngGFLMTFETw
 t2punybt5JBBUaXaiXFS0zmVFAfKor3Lo1g6YvJO39ybX3mNE8SImdYZoUtU+Z3p0nSyI1vh+D
 dsXEAleCpGOTzy6+3v20JD8T8HWnbdtN/Fop+AAAA
X-Change-ID: 20260817-nolibc-test-result-warning-528fb20450ee
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787070787; l=1457;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DbrWcJJ1jMfcGSgj37oyQ8v/le67wsjr1qcdMXDeqSw=;
 b=iulsqoVMQmaBHUgHX8PKs8f7t+JdiS0RDO2CUmRoKPQ9m7lNElzViNUQWekz/pqyiZffEZh8d
 kH+jP0un0zeCKEVOOcPg3g6MUyvHAMszf5bHEGu3xtgkIi8lQ1pCjXu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The nolibc testsuite will always have some tests which get skipped.
Due to this the full testsuite is always marked as 'warning',
even though all testcases succeeded as expected.

Stop treating skipped tests as warning.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile.nolibc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index f70c8dfca018..c790f937fe0a 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -225,7 +225,7 @@ include $(srctree)/tools/scripts/Makefile.include
 REPORT  ?= awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{if (!f) printf("\n"); f++; print;} /\[SKIPPED\][\r]*$$/{s++} \
 		/^Total number of errors:/{done++} \
 		END{ printf("\n%3d test(s): %3d passed, %3d skipped, %3d failed => status: ", p+s+f, p, s, f); \
-		if (f || !p || !done) printf("failure\n"); else if (s) printf("warning\n"); else printf("success\n");; \
+		if (f || !p || !done) printf("failure\n"); else printf("success\n");; \
 		printf("\nSee all results in %s\n", ARGV[1]); }'
 
 # Execute the toplevel kernel Makefile

---
base-commit: b58afc8d1cf85688601b8d7e271125fff666f661
change-id: 20260817-nolibc-test-result-warning-528fb20450ee

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

