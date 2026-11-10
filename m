Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316843;
	b=5IQHmX511LUYTSmKveWnWfVZVTJspvQ8dYmdQW9dg/6HZ/efU8We9afDaxDnv6v/UaT5
	 be0q9yRUnMfUTZDwS2LKuVEoshsi1xxr7z1f38NqHrjiqDU7oDBgvK0+QT//5jAKhGq1X
	 xkj96IT4THItKBW/gKbHTI9Om0qvlzgDe+fUIO8MViei7UmkjZgfMSfE3WzCWCyf0dsFz
	 eiO+ZRSoDoaoRwKxti66yk5QWuzQDHSDFEO/YGGVUqiQm06H1SPq8QhLGi/K452Jgx0Os
	 8Kh4ulcSR3FTbL6OR7JiW9jknPsAoAZgckAYAKM78EforqMHWDjAccLbYNJRSwT074g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316843;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AqrDbNk/xaVHc9xh6RFnXh6Hj87ffrP0ahXVb4adO1Q=;
	b=WlebuDqFBgnLwi9cShf1XHQ4rhffcM4lLlk07uhkdEnOX8jYQJyB3Hh3kY8yw75uzTJ4
	 cgyTl8G2NZAhqhljpn+Y7l5N4IjDr9pS8DpYm6x6sk9NM0XvsgUTg/7A0hrnpQvmS2Cy5
	 /1pM3KKceLInGgoLQBg0sJABPJRpI8zlGtB+TSj2rQyXR3OSN8r5jMPR9SrKECgJZHMx4
	 UNIkR5mhjvZFc1NecWnH+F6H1FxyjWtRsz2a5q/UyXvq/qX7X8LEOz7FvqiAYYzUL4fY3
	 MC1tIVApGzapejuVJ+z03Ftci5qfCW9JzS6TShnlBcwNUozEywu01+SzRy3o5W94JnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b="ZDSMJ0/6";
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013C6079894;
	Tue, 10 Nov 2026 13:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3013C6079894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ZDSMJ0/6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794316839;
	bh=wNLCPZp3qCOPdxC0onl2ifZBFX7WzFGvrMZdSxrqp+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZDSMJ0/6ytbrhmHA+KGjAnaQk8jwnF2m0LnWXRzxuIyZqkRlSv55fm4NF/tKbL5Q1
	 DuCYPP7+SF9jhumDVQGpsxjpBPF7WWZ+NPny01iXH6b557A1QeLrpxsmZtVVnrsl/4
	 93/HdPicXShTuJ19SmclH6Inpkg9gjSeyDdhzNGQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 10 Nov 2026 13:19:34 +0000
Subject: [PATCH v3 3/4] vdso/gettimeofday: Add support for
 CLOCK_BOOTTIME_ALARM
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
Message-Id: <20261110-vdso-alarm-clocks-v3-3-8f3c0c5b5a11@weissschuh.net>
References: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
In-Reply-To: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316776; l=1717;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wNLCPZp3qCOPdxC0onl2ifZBFX7WzFGvrMZdSxrqp+o=;
 b=afeTJ5aV3RVIAnj5G7feRA7Q7S3uvj2M10qFzH/bjCS8t0EVLMO8m6KgGGJLzDEdXGwFQ76k6
 YnqvZVIXXsMBv32WA1I4w31ItiSio7zSqZ3/xnaklQp7tPjk2L3ow6M
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
 include/vdso/datapage.h | 2 +-
 kernel/time/vsyscall.c  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 89ecf9f9fce5..49f388a54e6a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -40,7 +40,7 @@ struct vdso_arch_data {
 			 BIT(CLOCK_MONOTONIC_COARSE))
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
 #define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
-#define VDSO_ALARM	0
+#define VDSO_ALARM	BIT(CLOCK_BOOTTIME_ALARM)
 
 /**
  * struct vdso_timestamp - basetime per clock_id
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index fc3313d6afa6..4231b04aec2c 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -69,6 +69,9 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
 						&vdso_ts->nsec);
 
+	/* CLOCK_BOOTTIME_ALARM, copy of CLOCK_BOOTIME */
+	vdata->hres_coarse.basetime[CLOCK_BOOTTIME_ALARM] = *vdso_ts;
+
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		= &vdata->raw.basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;

-- 
2.56.0

