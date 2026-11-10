Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316843;
	b=Qmhzkf/8GwzUPVJ5ZAR7+uf7gPMqOoFonAJuBS7G1D4Sxjt/oQ1BjOafbB3QykLNCwlw
	 ap/WMt8iKJ9UDTIwlDUxFB+cO8yQJeeQQQV8UsViItTkldLOa66Zt3hEqXkQZOvhbvIRU
	 We0q7ofzVMSJ2JjiayBHZnfO05wOjFYh791appKxeTV6cATogqozkeFp6Q7pX+2Kufypx
	 F9Jo/k54F7YDvKE1GiGCfRkDIlDdKVgha7I4hadK2mB132NrcjX4WURPCpYXASuAXjEIj
	 zRa0bZew+zgNSTLnjQz41Wlct505bijDTBKMsMT1FiNdhDfpWWiEV5kvK6NXXXgCx5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316843;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DYl3afD78o743G0tLJe7Wd5hjT/jBl2kIpwmgeoheZE=;
	b=yr21xcZQifzLckXHcV8ULuq42+l0/dZhchBiydgwBvKitcbgmTdlJnI87WqdvhPvccHD
	 zeOgjazfS4x0qrEvZ6Ri0nMNHU+13R6Y2kZ3AzL03KU2R8yWf32AtUYkFRHODOEmfNdmj
	 dE8oqF5rIyDl87zkVP6ft5ugBr58Hufk4vwmFo9VRHZFVozqqZPhdXznkwFDy78jONvKG
	 hVIDJv7Pv3lLu7D+x92G3Z7o4RtQiakaHETJC+aDZH328azE/S06Uy54k79A4A07mppek
	 zfLJCc4E5jF4rKPHH9egsTtVJjdNmUX3ioPvl9QGxJWFauzGMty0ppi5AJuW7oUOHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=mqaX6ceZ;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301036079892;
	Tue, 10 Nov 2026 13:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301036079892
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=mqaX6ceZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794316839;
	bh=3oVatgWIai8pkKULRs4vykcR8+FhnwFidaVXC8xriEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqaX6ceZvgqKegVYSRUsaMroDgszKGFt1YfS2bbythCgZH4CyMvchhZWfXVmJhmNb
	 prslZh/92m5VkJqPe7eMyjfD4/q+sR1z+3O3w45fNPXBAZZVg1rQBb1msBCNDqOpYr
	 4ZgO/6ywbwNHjp9/Qj8xtzFwLCxQ9qJN6Ggv2Mw4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 10 Nov 2026 13:19:35 +0000
Subject: [PATCH v3 4/4] vdso/gettimeofday: Add support for
 CLOCK_REALTIME_ALARM
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
Message-Id: <20261110-vdso-alarm-clocks-v3-4-8f3c0c5b5a11@weissschuh.net>
References: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
In-Reply-To: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316776; l=1734;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3oVatgWIai8pkKULRs4vykcR8+FhnwFidaVXC8xriEw=;
 b=GoQ71BbeMcMJJTiCqxWU1o22DRk072DcIJEsjqruTcdqmWtFNncEXjy+EisYPW1PHWGLmErxR
 sJB5ryuF0q3CxFnKCMQuvSnqRySxDAxvY3xlzA6B5NLOne+UF4s0+x1
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CLOCK_REALTIME_ALARM behaves exactly as CLOCK_REALTIME as far as the
vDSO is concerned. The vDSO library can handle it automatically
correctly. Only the basetime needs to be maintained during the tick.

Reuse the CLOCK_REALTIME basetime for CLOCK_REALTIME_ALARM and update
the userspace hres clock mask to include CLOCK_REALTIME_ALARM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/vdso/datapage.h | 3 ++-
 kernel/time/vsyscall.c  | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 49f388a54e6a..a239a2861d0e 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -40,7 +40,8 @@ struct vdso_arch_data {
 			 BIT(CLOCK_MONOTONIC_COARSE))
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
 #define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
-#define VDSO_ALARM	BIT(CLOCK_BOOTTIME_ALARM)
+#define VDSO_ALARM	(BIT(CLOCK_BOOTTIME_ALARM)	| \
+			 BIT(CLOCK_REALTIME_ALARM))
 
 /**
  * struct vdso_timestamp - basetime per clock_id
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 4231b04aec2c..2125c462913b 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -81,6 +81,10 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_TAI];
 	vdso_ts->sec	= tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
+
+	/* CLOCK_REALTIME_ALARM, copy of CLOCK_REALTIME */
+	vdso_ts		= &vdata->hres_coarse.basetime[CLOCK_REALTIME_ALARM];
+	*vdso_ts	= vdata->hres_coarse.basetime[CLOCK_REALTIME];
 }
 
 void update_vsyscall(struct timekeeper *tk)

-- 
2.56.0

