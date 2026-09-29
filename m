Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15BE3B1031;
	Tue, 29 Sep 2026 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713829; cv=none; b=Kq1aeICbEhYKAgDtz/vngj/BxQRlos/jdZyAyIze2YaQEoUhsHSW1+jteZVruIUENWJzW+Q2OKIY9izcPNyRj+MT0FdqW/6oKutrEjA+nrsqEGCqQe5IaRtR49ePeI7Qq2Np+7+0uH5txLjCd373O6aSwQgYKxH51t7ZCRfLcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713829; c=relaxed/simple;
	bh=UmHYgNzH8/0CQ579pAUK2zf1mKPTLuZtYZ4fgDHSZDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLfBlAlEbukoQZX+o7DWcHSFC4M458g/DL0jKBWOaHiVyP8glNvQzVL7Vmxwk7uR0An3ynqeD4DqYbab5m1kxhB0nRkTCDmmdEZmzeycLMhLa04Q8v3cOcHSgdpk3GX9iznzju4HBJPz55WF2AYix3VHgwA97mZyqBJyvf/uCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pXPSOPaI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pXPSOPaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790713465;
	bh=UmHYgNzH8/0CQ579pAUK2zf1mKPTLuZtYZ4fgDHSZDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pXPSOPaIet+6L0vHHtVv804NEJh4OkHs70zFotRO+Fj3Btx6fTbI6zhizRh7utlHi
	 kEaSJQ1KkyYkt5W3yf7fenyOqx4unix9i+tBRqoYS05slo9TEoCJW44prfmDoQnOD9
	 8drcAcfVKopVWa7K7NZ8BOEViaPHDBZ3y4e8gyns=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Sep 2026 22:24:21 +0200
Subject: [PATCH v2 1/3] selftests: vDSO: vdso_test_abi: Also test ALARM
 clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-vdso-alarm-clocks-v2-1-a7af4089a698@weissschuh.net>
References: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
In-Reply-To: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790713464; l=1291;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UmHYgNzH8/0CQ579pAUK2zf1mKPTLuZtYZ4fgDHSZDk=;
 b=91paDDqp7nF5oLIw4+L4Jhvp/VG6vbu88wBX+oNAZoPsWsXTKEKMcHbU7gF0a+9eXixw/2y57
 v017NgAco/bBf8hiMW9gSQL2AvnoY41XiCXXM7IDW9Tc5oj5EUQzVSq
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
2.55.0

