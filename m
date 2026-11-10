Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316843;
	b=nTurjnGJajka/e4Q7WqPV67My/10gPc5FPEXarGeBN7aJMaRb+RqAfWwfnUQtLVGapek
	 rDtQXwIAjLmyjLLIZc7iAGmvaCr34J7fC59Sfb4NXqtF4pMJMBlFViIbWCdYu5AFXRMZS
	 JnGgAIuA0crkYctDbuS53xp9hF9haFMra35intjv0eOvkZuBIiUrgqFWBm9jxhg/RMDil
	 gek1Dfwa3CD9aX2ZiHOj8r+5fm38gsB4xTgByqgKjt9SOl7mPcB7cyCFzNW++ODJe0nTI
	 49byglcsio6d0goCspSbLSbeIIhHDuFCl3jbTS5xYsQ+hm1VheAERbZLJi49XEuzfZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316843;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kX8LGnsRnSmfvQlt6QdK+7ym1kDFujMmN9By+cL+/10=;
	b=V3Kgkai+FpFP1p+0k0V8gVtqarLvG3XwLYXdcB99/mB2+ZOJVl4ltKpO6erG/wHR6oeZ
	 1BUmnE4K9CNAzJUHctJUz9KXyXqK23WeKBN+IcUtMYGNy52JCNBUIEOHTatRxPaqdL475
	 ITEWYw9ir5S4dc3lLnJm2yOT8W8NOzfFBpry2xU2K1ra80hT9WqPm6pGTv/LZ7oP4UhC8
	 dZvdsTYlBBLal18pjmsD8APyOf7ethK+LEA6L09YMlOmUSPx6R3FkXnaoR+Cxy4rkTDFb
	 KR9QjJnfwJxUfRbHfFEebu1cCHrWcJqUFEyBv50JzOUWZtpPh8SnTgBRw8xqOLBtoLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Xsfg4laP;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D36079896;
	Tue, 10 Nov 2026 13:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301D36079896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Xsfg4laP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794316839;
	bh=oh/CJGlYVkljDHq2Wtxd308vKLzmZu5wMC594kpep5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xsfg4laPiQGrNqCJow5PSmIgEUruyfhvRG/Jr4DVKdz4hwfhEfZrYVMpBLdClsvRD
	 CuPdpc0yyZv2C0OBM2bWZYTZkgS8RjUcZDjbAVsiPLcc/PCtzkpatX1wGt4iu08kdT
	 W22NLHLf09SCUyLUV/52vwND+BiyuKTJwYJ7I3+k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 10 Nov 2026 13:19:32 +0000
Subject: [PATCH v3 1/4] selftests: vDSO: vdso_test_abi: Also test ALARM
 clocks
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-vdso-alarm-clocks-v3-1-8f3c0c5b5a11@weissschuh.net>
References: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
In-Reply-To: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316776; l=1291;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=oh/CJGlYVkljDHq2Wtxd308vKLzmZu5wMC594kpep5w=;
 b=2YWH5I5GFOZPBnh1ld/BMTmdAdbEPGEMGPLn5SWbjUK7xdjr3NQehuRZEotC/lkTdgvPTB3FY
 Ialq3rqK8nSCEDXyQvJGPhE1iMRyNpGxUBubp7XKfWuOxLqsHmtokZJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the tests to also handle CLOCK_REALTIME_ALARM and
CLOCK_BOOTTIME_ALARM. These are currently not handled by the vDSO,
so will fall through to the system call and succeed.

The tests will become useful when the vDSO will start handling these
clocks in later patches.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index b162a4ba9c4f..4f538928e1d4 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -261,7 +261,7 @@ static inline void vdso_test_clock(clockid_t clock_id)
 	vdso_test_clock_getres_time64(clock_id);
 }
 
-#define VDSO_TEST_PLAN	38
+#define VDSO_TEST_PLAN	46
 
 int main(int argc, char **argv)
 {
@@ -284,7 +284,9 @@ int main(int argc, char **argv)
 	vdso_test_gettimeofday();
 
 	vdso_test_clock(CLOCK_REALTIME);
+	vdso_test_clock(CLOCK_REALTIME_ALARM);
 	vdso_test_clock(CLOCK_BOOTTIME);
+	vdso_test_clock(CLOCK_BOOTTIME_ALARM);
 	vdso_test_clock(CLOCK_TAI);
 	vdso_test_clock(CLOCK_REALTIME_COARSE);
 	vdso_test_clock(CLOCK_MONOTONIC);

-- 
2.56.0

