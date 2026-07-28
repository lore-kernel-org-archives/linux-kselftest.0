Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E143E9C23;
	Tue, 28 Jul 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225388; cv=none; b=McRTdkGdJBnvr1gUJbjjZ1kHE70t/HSir9SX4gp/gtLP2y6Ipn1Uq3otPsc5Jc0NBkrNHMoGSV7LD8Ag2e8wC8Z1IJYZFNTIz4O01Bi3ST46zQADMfdIs1fyTDvtB5zzgI19c5XlkI4CDqQoSu27Pdyr9HaHc5ADqu72lXwdYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225388; c=relaxed/simple;
	bh=nBaH4uynzc+/SWX6lSuiZ6OiM7gO3CaI1BUwxQFBnVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bi3OqI3s0M6qEBrhJXeR8+hqgyPjU/Bcrq7LVgyGNlWV2karGsvcJf/eVgYyda8JhZdibC3EITh3q16k42qir3sCfM2cX6CSGrbnFXrdif2amQvgD860ox1+Z1Cr5I4ZRWfzCXcdY7i2FBlh98AuvgRNB56SovJs0kiqESXnlPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J8wy+8QG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H0L6qUFj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J8wy+8QG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H0L6qUFj"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayZfBZRL6gYyR6W8VRtlphke6tdrwICFrrQNAymU26I=;
	b=J8wy+8QG+llv9MTap7kzT7Ryd6oa1Mu0QU53OpqvkPl0Men2pH9irqY1TLs5/5jiC25KXv
	yWxp54pR+Xf7YzRUilgz+vnLNk1gigam9jx8gj+MuDNg3LZ2PbYbFI9PTOmntqKkV87T4v
	oN2hLxAjrLAmrNOCvpz4D215V+ndqxLsFWlmSFBA4g05cPxnosjq4tVVxEegguIN3fXJz7
	7qzNVkm3Zd7QrhJrgUOkds12mF9mujLzS+aOoMyR9vHO9J1dh9PhoDZWpAI4BC4zQ8DXBG
	PoDWlKAFHfDwrwbfvJRPP/CRH4LEXSR5d5gwKN9QSpZqV57JBXrWyYU1Voq60A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayZfBZRL6gYyR6W8VRtlphke6tdrwICFrrQNAymU26I=;
	b=H0L6qUFjlvqr3BN5px1XJZEhI0qgEDxC8zB6Um+QN8Df5E6cY6hZoCGZumFNjKKm71Ep90
	qHDvHyLjU+uCT5CA==
Date: Tue, 28 Jul 2026 09:54:29 +0200
Subject: [PATCH 3/5] selftests: vDSO: vdso_test_correctness: Validate match
 for all returned errors
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-vdso-test-axuclocks-v1-3-2fcc883a2940@linutronix.de>
References: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
In-Reply-To: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=2743;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nBaH4uynzc+/SWX6lSuiZ6OiM7gO3CaI1BUwxQFBnVo=;
 b=4B95nF58XiRWtUvRDSyXlcveXkpnv0rslOMoNyizFe3DGSvnWKDssjGHeo3MyaBNvaJaN8BMD
 hGZh/IjYCwKBUSkOjB8QvrfqVehVrctXZzOwRGOFGgMz4tBR9ysm2RU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vDSO should always produce the same errors as the system call.
Either by reporting it explicitly or by falling back to the system call
itself. Previously it was possible for a vDSO function to be present
while the matching system call was disabled through
CONFIG_COMPAT_32BIT_TIME=n, but this was aligned recently.

Make sure the error return values always match.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 3671ea815823..ffad3e636e56 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -277,14 +277,14 @@ static void test_one_clock_gettime(int clock, const char *name)
 	printf("[RUN]\tTesting clock_gettime for clock %s (%d)...\n", name, clock);
 
 	if (sys_clock_gettime(clock, &start) < 0) {
-		if (errno == EINVAL) {
-			vdso_ret = VDSO_CALL(vdso_clock_gettime, 2, clock, &vdso);
-			if (vdso_ret == -EINVAL) {
-				printf("[OK]\tNo such clock.\n");
-			} else {
-				printf("[FAIL]\tNo such clock, but __vdso_clock_gettime returned %d\n", vdso_ret);
-				nerrs++;
-			}
+		vdso_ret = VDSO_CALL(vdso_clock_gettime, 2, clock, &vdso);
+
+		if (-vdso_ret != errno) {
+			printf("[FAIL]\t clock_gettime(%d): Differing errors between syscall and vdso: %d %d\n",
+			       clock, vdso_ret, errno);
+			nerrs++;
+		} else if (errno == EINVAL) {
+			printf("[OK]\tNo such clock.\n");
 		} else {
 			printf("[WARN]\t clock_gettime(%d) syscall returned error %d\n", clock, errno);
 		}
@@ -339,14 +339,14 @@ static void test_one_clock_gettime64(int clock, const char *name)
 	printf("[RUN]\tTesting clock_gettime64 for clock %s (%d)...\n", name, clock);
 
 	if (sys_clock_gettime64(clock, &start) < 0) {
-		if (errno == EINVAL) {
-			vdso_ret = VDSO_CALL(vdso_clock_gettime64, 2, clock, &vdso);
-			if (vdso_ret == -EINVAL) {
-				printf("[OK]\tNo such clock.\n");
-			} else {
-				printf("[FAIL]\tNo such clock, but __vdso_clock_gettime64 returned %d\n", vdso_ret);
-				nerrs++;
-			}
+		vdso_ret = VDSO_CALL(vdso_clock_gettime64, 2, clock, &vdso);
+
+		if (-vdso_ret != errno) {
+			printf("[FAIL]\t clock_gettime64(%d): Differing errors between syscall and vdso: %d %d\n",
+			       clock, vdso_ret, errno);
+			nerrs++;
+		} else if (errno == EINVAL) {
+			printf("[OK]\tNo such clock.\n");
 		} else {
 			printf("[WARN]\t clock_gettime64(%d) syscall returned error %d\n", clock, errno);
 		}

-- 
2.55.0

