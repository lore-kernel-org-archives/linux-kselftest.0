Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A52D7D3A;
	Fri, 27 Feb 2026 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174766; cv=none; b=QCu+Q8DNDY2VQwSncAhHDXmRmqYXkNzPuI6+EzkE2nbABAp4jTJHcIFWhNYK6cWR9FzySmCcQB9cIhhMMAtTUkBVrbnQlgoiyMa7kV3F5T6ZtmIhnKADPmlDDCcGHpT2Gs9rPSfzkBeXpOuRvKdLZbSCrJbjQENkglIhv97ffs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174766; c=relaxed/simple;
	bh=BhJnU+XZ7s4nOTcoHQXDrcC+wyWHHM45cwIWYc/VP8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFJbWifoGyIkMYV7/MlJXLfRpkXH5OZcAHAiC3DS19xgN1cO6THg824v/aPDCbiv/0PDDrAnn+d/rCJq2GdiNijO/ZQOlWldjfIG4mfsZUPmnNmGocSwjrvXghuOn3N8YSMxaZmCePTD80cMumIvI1XIv6BY7Uiov8r32xOCRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vRVEDkT+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z8htRvo8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vRVEDkT+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z8htRvo8"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJ9I+RUYqBJ4s4WEyJIFCtXGrhWGow04KzyKm4o60kM=;
	b=vRVEDkT+g3WG+uQuwli7dkI5v5ldlGQS6N1l0Oqmmnhuo12mibHcpa6qmFY3NUbFEtzEtw
	QzULl4q5XT9DaUnzrcwtqoSMJFl/mbJAZIL330+FIA54fFtlpl0BnRiQCgAkcilyAP01Bz
	f8rnMkAuoB9CVQOUtt0qESt/JSHDrIMKAmCnXZu9blnnUXSHxID7+LW80Vay7QrI6O3YL4
	D3CQSTQ5XvVWjSS/aO4H5DVjkAO0C7XU2sSTUbLAkGk4Nbw63m7X0oTWBxKJ2QRudjzxQS
	Xu1uzemI4djvEALyJfEJmakNnY7f4CInBJRpSrqBLFdmpNi/ViF01tb5ckDNcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJ9I+RUYqBJ4s4WEyJIFCtXGrhWGow04KzyKm4o60kM=;
	b=z8htRvo8GPN5sNcsbrdiesYX6kIu41wZPo1bDxEXWbDNutKzYAyWZZhMyP5fL9fbbPfiBV
	CG+Mz2O0kcGg9iCA==
Date: Fri, 27 Feb 2026 07:45:59 +0100
Subject: [PATCH v2 4/6] selftests: vDSO: vdso_test_correctness: Handle
 different tv_usec types
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-4-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Andreas Larsson <andreas@gaisler.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=1580;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BhJnU+XZ7s4nOTcoHQXDrcC+wyWHHM45cwIWYc/VP8s=;
 b=Nq6f2KspAk6WgXdavI3EYKlDPVXwDASORmGQcfs1/yFN/FFF9TUJBpjqYrI3bUyszQXCThOk/
 WXKNOulS1AWCukW8DQdkQ9445YTTDTeAamDjkcMJJl1gVxZJcBTnd11
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

On SPARC the field tv_usec of 'struct timespec' is not a 'long int', but
only a regular int. In this case the format string is incorrect and will
trigger compiler warnings.

Avoid the warnings by casting to 'long long', similar to how it is done for
the tv_sec and what the other similar selftests are doing.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 2a2d9b01a938..9b564888e74d 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -404,10 +404,10 @@ static void test_gettimeofday(void)
 		return;
 	}
 
-	printf("\t%llu.%06ld %llu.%06ld %llu.%06ld\n",
-	       (unsigned long long)start.tv_sec, start.tv_usec,
-	       (unsigned long long)vdso.tv_sec, vdso.tv_usec,
-	       (unsigned long long)end.tv_sec, end.tv_usec);
+	printf("\t%llu.%06lld %llu.%06lld %llu.%06lld\n",
+	       (unsigned long long)start.tv_sec, (long long)start.tv_usec,
+	       (unsigned long long)vdso.tv_sec, (long long)vdso.tv_usec,
+	       (unsigned long long)end.tv_sec, (long long)end.tv_usec);
 
 	if (!tv_leq(&start, &vdso) || !tv_leq(&vdso, &end)) {
 		printf("[FAIL]\tTimes are out of sequence\n");

-- 
2.53.0

