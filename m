Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14373AFD15;
	Tue, 29 Sep 2026 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713830; cv=none; b=c7gxQBD0lOnhKJs/Rks3TmXXVvBuQRH3Bcw45fd3t/BWDkWSP2idh0oAyIzMqvoGt/XagzTLxMDzTpmekAIIcvLVU5iwolOHbEGNSpo/oxfs4MjhR9OtBS4E3ts3u3g8yWgTek0hXalvFVbu/Gs22jNbBnKY1s1sVB3qcRznI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713830; c=relaxed/simple;
	bh=LFtm3Eo2BRBl3Q+0TVGZq4TWMDNPMJU4orCucJmdj54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCNCmTb4+HetMmam7L20GVlwyew6Prmn0M17kUeuXPhj+j5IRtbhuv420UsfdMQqpMNgit5ig3N7O5s87Bp5/xWq16YTCgJipnK/TJMzMKatR7P6/Xh+FF9yIBr8/uRz8BkBUx61xmolJ1fZxZI/teouEo9uGHdBYsnzYhGBNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=q3RECGix; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="q3RECGix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790713465;
	bh=LFtm3Eo2BRBl3Q+0TVGZq4TWMDNPMJU4orCucJmdj54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q3RECGixf/ZtS71FT+2U7SyVl3CrqLJ79RPTmu9IVxJzTH2zkLpfMil/GakqbSc83
	 VyjDEaL7Iap9g3OcmGZ9t8EIHT0rzeIm61gIp6zcg4dujtwf281s+qNJpLe35wbjhf
	 /e9Q6au/AetTZYRbsCOIF4hcf8R8y9N+P91IJEYA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Sep 2026 22:24:23 +0200
Subject: [PATCH v2 3/3] vdso/gettimeofday: Add support for
 CLOCK_REALTIME_ALARM
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-vdso-alarm-clocks-v2-3-a7af4089a698@weissschuh.net>
References: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
In-Reply-To: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790713464; l=1632;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LFtm3Eo2BRBl3Q+0TVGZq4TWMDNPMJU4orCucJmdj54=;
 b=NhIp/rSGCgQGwA2NMrcjQZJqvzDfwxpHdQA0kWIC36YaNUx1VYkf7dloKUAcoKR9N8MuCKysv
 tbgenkp712SDcsicxLSfqFwO7DK301XF8cVmFgz//N3C5kHRQP6tvrW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CLOCK_REALTIME_ALARM behaves exactly as CLOCK_REALTIME as far as the
vDSO is concerned. The vDSO library can handle it automatically
correctly. Only the basetime needs to be maintained during the tick.

Reuse the CLOCK_REALTIME basetime for CLOCK_REALTIME_ALARM and update
the userspace hres clock mask to include CLOCK_REALTIME_ALARM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
index bb412ad1782f..0cf4eadf6996 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -69,6 +69,10 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
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

