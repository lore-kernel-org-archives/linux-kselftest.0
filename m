Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212044E67D;
	Mon, 21 Sep 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984454; cv=none; b=X75b5ZWN/Ftcj0FAnTYJlqylg0r8J40tm6nZcvVDExO3iVDyRUQErqFac5T8KEFD084k+xKF+aM4WGypU3cRnKMzQlVaq52ACZOnE6Iq3lGKzp4OXOyvd70pyluWdqCny4EcfM1dX8tSDpWcDAKGd42HsWnXf0XRh/bLlSvm2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984454; c=relaxed/simple;
	bh=u8+Wo5bVYCOs/gBbJ4eQuBX3XO9EzF3ApSswvDpbuw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0ByaITkCKjsZPVyFmURdlb70RXnCgGVCbjZS1jkI78bgZYen3Cn8SrG7GwBHZtoiZtFnQjfexy67CshSl+4T7Z4QMM2BWXHW8+G98Qd0sWrKvf07ODIfyu1ivaZTOVDOSemnom1UrzOuu7qe3ebC3/uXgyniVUBtYim+OWDsAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UVOXXIs4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UVOXXIs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789984449;
	bh=u8+Wo5bVYCOs/gBbJ4eQuBX3XO9EzF3ApSswvDpbuw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UVOXXIs4k5R4biXZkn11H8JoGD4HiJ9Nc+zSDWjjiA7adTQy3H5a/raE2+v5jvpiu
	 iAj1pb2zMSN0Nn+1zwMuacSXIJnFGyHX6X5WuQLatxXWJ0uJel1IIDQV1r45Q6qJzh
	 utEbitAtVxny8DFwhIgAPFgO2Y1v2dH+B7KN/4HQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 21 Sep 2026 11:54:00 +0200
Subject: [PATCH 1/3] selftests: vDSO: vdso_test_abi: Also test ALARM clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vdso-alarm-clocks-v1-1-617abb5271c7@weissschuh.net>
References: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
In-Reply-To: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984448; l=1232;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=u8+Wo5bVYCOs/gBbJ4eQuBX3XO9EzF3ApSswvDpbuw8=;
 b=dMUbh9vGJ0Gd1F3Ajq6S04iwC0EIkWY4MpDKxCoFnaJvxgUxdXrnmuGDT+AiNliYLIRLRam1v
 1eVgBc0o9BSBXi9TVB2nmDqyHR26p+1g4EEvMxx+tyxj5NdVA4MLOKL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the tests to also handle CLOCK_REALTIME_ALARM and
CLOCK_BOOTTIME_ALARM. These are currently not handled by the vDSO,
so will fall through to the system call and succeed.

The tests will become useful when the vDSO will start handling these
clocks in later patches.
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

