Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365683A257E;
	Thu, 30 Jul 2026 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394084; cv=none; b=nQ9O+Kvf7BI37BiwQFZgXzTPiafmJr9bH2eOvhO8Nz27SP5HNV45So+cLwvm+x3GFF99OyPS/gHU/PQgtFkC0UtPwq9IEnq8N01xpsHpFqrEWL1u/ipp+XDLEJu2/dPrUWoJ38AzvDUOTe/I4nqU11jbE0mEbfgAQEcRmucWmlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394084; c=relaxed/simple;
	bh=wjTYt8uYuUqPIL2pIMYKEWMLB/3oq3sETSE2st5h2oM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fleg53cA88Zia7VCEitoVSYcouBjd9cUIIZzEPrjt/DFCUMZZ/BC3q/ud2dOn+LUASE/rrB0SvDzHr2tvonvLvhAcslIsLVZVH7DHSekQi2JlntZuUenUtpB4Iq4vgQhG9GlUGa0ElIUDRU/JBGVu1nD9Et9NHBYTgQTXM4sIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2tsSBzMv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=27Qs+7cb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2tsSBzMv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="27Qs+7cb"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MmRZhPBsRXM6Dri3jWmu7e47OonW4Ty7K+Bs5aHy+M=;
	b=2tsSBzMvmz2ZUFasOwrPjGHgeW6GAx1t1/nYHua/L1GUEAQtmBziOdV4tQKwBBJnsyltLr
	oalEXLwtxsz/SrMDVFbVoAe1Fw4blbPAf39udCV6FqfaR9uVt9n9d6btFW12Li/aFm9H9R
	iCBa3wfEtQoo8bXmn+wz7bYbK78Gqa5GwZ91FHVnxXE26nxZhSXNr56WZjLryWFco+0/sE
	RnQnyaVBpuEXI9hOTV1AJreDal3pNda/3D4b8rHZlx6EpQnR2pgLVNMJFfzEKV+tQybw20
	oaEM2NH3jXavJaeFxGkdPbIXUilkmDlYiMKb6X2L5F/VYhSjL+2RyJ5oHuZxMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MmRZhPBsRXM6Dri3jWmu7e47OonW4Ty7K+Bs5aHy+M=;
	b=27Qs+7cbzClwRKgl5niawnnZ2AsPN7Zcm2ZqxLQ7EpYgcZaRl4Nj5Htu1sbvO6AEOjLwKi
	+W4XVEEnfFyOqkDA==
Date: Thu, 30 Jul 2026 08:47:51 +0200
Subject: [PATCH 14/16] selftests: timers: nsleep-lat: Explicitly list the
 tested clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-14-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=1946;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wjTYt8uYuUqPIL2pIMYKEWMLB/3oq3sETSE2st5h2oM=;
 b=0Qg8dYUy10Ph4ULTyrgF+gNUyeI0ZJvXiMYmb6hy03z5ydM8M/gfpDtmY5OYY3bixaFWflL/Z
 nh46j4QEQr+BmesqWQlMTOaNAsAEo7w/Cagk6rw2TjtKwp7tqsNbCRs
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test relies on the numeric values of the clockids.
As not all clocks are meant to be tested, this requires skipping some
clocks unconditionally, cluttering the result.

Use an equivalent, explicit list instead.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nsleep-lat.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index d46f17404439..ead3271287d6 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -29,9 +29,6 @@
 
 #define UNRESONABLE_LATENCY (40 * NSEC_PER_MSEC)
 
-/* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
-#define CLOCK_HWSPECIFIC		10
-
 #define UNSUPPORTED 0xf00f
 
 struct timespec timespec_add(struct timespec ts, unsigned long long ns)
@@ -103,18 +100,21 @@ int main(int argc, char **argv)
 {
 	long long length;
 	int clockid, ret;
-	int max_clocks = CLOCK_TAI + 1;
 
-	ksft_print_header();
-	ksft_set_plan(max_clocks - CLOCK_REALTIME - SKIPPED_CLOCK_COUNT);
+	static const clockid_t tested_clocks[] = {
+		CLOCK_REALTIME,
+		CLOCK_MONOTONIC,
+		CLOCK_BOOTTIME,
+		CLOCK_BOOTTIME_ALARM,
+		CLOCK_REALTIME_ALARM,
+		CLOCK_TAI,
+	};
 
-	for (clockid = CLOCK_REALTIME; clockid < max_clocks; clockid++) {
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(tested_clocks));
 
-		/* Skip cputime clockids since nanosleep won't increment cputime */
-		if (clockid == CLOCK_PROCESS_CPUTIME_ID ||
-				clockid == CLOCK_THREAD_CPUTIME_ID ||
-				clockid == CLOCK_HWSPECIFIC)
-			continue;
+	for (size_t clock_index = 0; clock_index < ARRAY_SIZE(tested_clocks); clock_index++) {
+		clockid = tested_clocks[clock_index];
 
 		length = 10;
 		while (length <= (NSEC_PER_SEC * 10)) {

-- 
2.55.0

