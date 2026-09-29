Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15343B0AE1;
	Tue, 29 Sep 2026 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713830; cv=none; b=RghN9qOjmCZVLIOjAshARRA671Ll48TZ4j9Wk8AovaGQGOtChW6MUsk/kS2WBUJMfUSCIU/fu87AN6YxrMaSS97XI1Ygi3VJcnhJEnkLQmQyulm35n3rJdZ3PELZh9d2zTvmvkixJJLFDOfbVbMSkfIA4Q9l6nSSj4lByGjvTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713830; c=relaxed/simple;
	bh=5lC7HbjdgRHGyx95ib/h3xJBGI+W/T+P7wbv2zIu3rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz+ho0CCLYHzlKMBLxlILqKrSDZlvZYOTY2AYFf9+Wt/0e5h4rw0++kZtmKcjcnaWZ9EWKIlQeCQP5NAShEZwAiHoNOp8kWRwplF9C6opVk9LAAb69aDCKaSswREYXsFIg4Lj7LsJyEX+eZexXu2IgyvChxIDlkpmradrTUyR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DyhAcv1Q; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DyhAcv1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790713465;
	bh=5lC7HbjdgRHGyx95ib/h3xJBGI+W/T+P7wbv2zIu3rw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DyhAcv1QuNBJ2z2L9YTTTACsZC6+UOvKCYW+iXPigQUFd4L2rpLmJbC3NpGZny9AF
	 2lquBz0kgpgvhzdUPmu+L0g3P0JXgMLdAo4R+mSgbisjPRrg3wW+HpA0P4WG4z8Zvv
	 oHLlnSRy7dhqXzzOynGe983i5lZllZkDRwsJqcxM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Sep 2026 22:24:22 +0200
Subject: [PATCH v2 2/3] vdso/gettimeofday: Add support for
 CLOCK_BOOTTIME_ALARM
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-vdso-alarm-clocks-v2-2-a7af4089a698@weissschuh.net>
References: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
In-Reply-To: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790713464; l=1690;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5lC7HbjdgRHGyx95ib/h3xJBGI+W/T+P7wbv2zIu3rw=;
 b=EjtzUMlHJxgRvrump1zMDFjYW0gp4FNE94cI/H08aEh5vQRVO11ejLZlQsvh6F8NZJ4pPWLoQ
 weD8c+gXGi9DLbn/pJBnoUNYSoH8pWHYICf7lC6yeZTcIirQICJJBC6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CLOCK_BOOTTIME_ALARM behaves exactly as CLOCK_BOOTTIME as far as the
vDSO is concerned. The vDSO library can handle it automatically
correctly. Only the basetime needs to be maintained during the tick.

The namespace offset is already set correctly, although it was not
used before.

Reuse the CLOCK_BOOTTIME basetime for CLOCK_BOOTTIME_ALARM and update
the userspace hres clock mask to include CLOCK_BOOTTIME_ALARM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/vdso/datapage.h | 1 +
 kernel/time/vsyscall.c  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 09897f76ae07..33297b5e2521 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -35,6 +35,7 @@ struct vdso_arch_data {
 #define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
 			 BIT(CLOCK_MONOTONIC)		| \
 			 BIT(CLOCK_BOOTTIME)		| \
+			 BIT(CLOCK_BOOTTIME_ALARM)	| \
 			 BIT(CLOCK_TAI))
 #define VDSO_COARSE	(BIT(CLOCK_REALTIME_COARSE)	| \
 			 BIT(CLOCK_MONOTONIC_COARSE))
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 0e4b499328c0..bb412ad1782f 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -57,6 +57,9 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
 						&vdso_ts->nsec);
 
+	/* CLOCK_BOOTTIME_ALARM, copy of CLOCK_BOOTIME */
+	vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME_ALARM] = *vdso_ts;
+
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;

-- 
2.55.0

