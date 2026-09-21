Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CF346E01A;
	Mon, 21 Sep 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984453; cv=none; b=GIex9tBKFBui/qmQ0jfygqB1CdDgkkRBIWPRWCGmgH8beTw86GKsmJ5xZLjQy1ymSfj/QAG7zZ5Kw/KE1Euu2PwbIXWhp5V06me+ta0VK52MKwcb0mqK69VP9V+OJvMUTOV4No1Ert+036aTyAL7y7jKnNXLqg6mLffkQx+KT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984453; c=relaxed/simple;
	bh=HI4VPXrmlX1durqmX0VCRg379rFhRaIdAtjE4Lwyjmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kfa/MGJ7If5NLkaZM0S2d8IKaZmnpyS3O+sYZY/8fO3P6hW70PBUU9I/onF2TyuS8EGvGpxvKFTIMB0F/e1OSlXuAooTPMpYn+Mqb/y82jCgULeBuVSyhpN6f/K55nSBbwMOgVN5ZWlL/MBivzCUoMKzMbzczu7XBXVFjIOZlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Rlj5toD3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Rlj5toD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789984449;
	bh=HI4VPXrmlX1durqmX0VCRg379rFhRaIdAtjE4Lwyjmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rlj5toD3LYoRSNF/Z5yy4KDGwmXhBahOy9lHZptT8RA5Ivq0AF+BuWmhKTNtg5ic+
	 OKBZDdswsAhQvciAkaJpi8njljEdIka5cgHDmWSEXP3bYlzxX2xAyzXLmoGDx5E33N
	 EW6v8f8/jDOjavtW95k3pOSh2h44oMF065IGichc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 21 Sep 2026 11:54:02 +0200
Subject: [PATCH 3/3] vdso/gettimeofday: Add support for
 CLOCK_REALTIME_ALARM
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vdso-alarm-clocks-v1-3-617abb5271c7@weissschuh.net>
References: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
In-Reply-To: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984448; l=1573;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HI4VPXrmlX1durqmX0VCRg379rFhRaIdAtjE4Lwyjmw=;
 b=LrHPJJitOO4Eppm4WO0LExhYu+npbD65YSKsW3Tzrm0QuPkvr5Bwk6Y4SiJ2sXByLBFOLKJ5u
 YDDMjTLzivHDORK3HIXwDcaIiXJOzsjQhDKL7VIuaQbRjAvvFcWyhP5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CLOCK_REALTIME_ALARM behaves exactly as CLOCK_REALTIME as far as the
vDSO is concerned. The vDSO library can handle it automatically
correctly. Only the basetime needs to be maintained during the tick.

Reuse the CLOCK_REALTIME basetime for CLOCK_REALTIME_ALARM and update
the userspace hres clock mask to include CLOCK_REALTIME_ALARM.
---
 include/vdso/datapage.h | 1 +
 kernel/time/vsyscall.c  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 33297b5e2521..0aa28a484dcd 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -33,6 +33,7 @@ struct vdso_arch_data {
 #define VDSO_BASES	(CLOCK_TAI + 1)
 #define VDSO_BASE_AUX	0
 #define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
+			 BIT(CLOCK_REALTIME_ALARM)	| \
 			 BIT(CLOCK_MONOTONIC)		| \
 			 BIT(CLOCK_BOOTTIME)		| \
 			 BIT(CLOCK_BOOTTIME_ALARM)	| \
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 24082b9d7869..b32bfded7d53 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -75,6 +75,10 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_TAI];
 	vdso_ts->sec	= tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
+
+	/* CLOCK_REALTIME_ALARM, copy of CLOCK_REALTIME */
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_ALARM];
+	*vdso_ts	= vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
 }
 
 void update_vsyscall(struct timekeeper *tk)

-- 
2.55.0

