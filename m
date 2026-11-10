Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316843;
	b=B8G4qPFiLcRCHTqajhp7BK31tnNdEifm9F0u1HGVaQUMtdBVvs6D+jImPdSyrKs8Pl+V
	 F7p87+kOjkamiOValLG9C3lnCgGH/8Wj5lcaWvZb3EEAWYo8tMAao/VXHfLjDvGf7oXkh
	 0Ni8w6oj75xSaZMYYxMgO9JWpbRhh8xhfuWaZ0qs+mfa5LkbElzUOMNIMuh4dW2FunOm3
	 lwmlw21ESE26+Gic79J8oHd8BR7kBH2wb8y/HKuyYQ21pc5THP7BqllvI/2xPJXRDeXic
	 fy4Gz+lf58knw5xwiq4nL29y/xNqEMWm0dcCytJxNtXw9njPezf69Ujude3qXCCvq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316843;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=irQkyS6R2ByHmf95L4ju16p7TcA6BjXfIlp8HHDcyTw=;
	b=p93sxYlHrhKV6Jqj+ns53ggUg7YJt0dZrzOYyBjTarCjrt220J0+ShP2QzPjVAuYLxos
	 lj6mWhQuZ6RABbVf0EnPJaR/cBJDkJei0J0eS2leNHyyUWHh/Te8JcfaEZaLIuad7hQ0N
	 oYqNfFvfhtocAcKJdjKO/2PkK+wxaJt8BMgf02a6IMgdVpzWnb3ATGkPIGTvGgElQdbC+
	 WJw43bxTEUwkNd+fsLdBN+JQG6Y8lCWXRBMAP+gZb9khBw5YdSlHb74Uooq9p56rDlWR2
	 Co0Ei7wDYwztc44bOwRQFF1aILKk2/xkyVSHeCVM134tiOEH6N+0cm5TTc/FmwacBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nZnU3UTQ;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3011B6079893;
	Tue, 10 Nov 2026 13:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3011B6079893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nZnU3UTQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794316839;
	bh=w7Va6Ls1wtSbdusEKufScr+bNHRrMKNZrfAP0lfFrl4=;
	h=From:Subject:Date:To:Cc:From;
	b=nZnU3UTQw8Rc07O4DLMh3kmgAcBc3z49jueXdxEmAAYvPYD6SuIy0L9pO2Wbypnwh
	 FU0+lHDtWSa1zIq6hN/4ag2HgioszoWynq86/zJsdkBFf+Jr3eCgsGL71Qd59SHdYT
	 jLZNS9y2iQ0XMIsX4ltQi+rWpVr5eU3CTBURv170=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/4] vdso/gettimeofday: Add support for ALARM clocks
Date: Tue, 10 Nov 2026 13:19:31 +0000
Message-Id: <20261110-vdso-alarm-clocks-v3-0-8f3c0c5b5a11@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Oyw6CMBAF0F8hXVvTVsvDlf9hXAxlkPoA7UDVE
 P7dgiaaaFzeyZ0z0zNCZ5HYKuqZQ2/JNnUIi1nETAX1DrktQmZKqFhkSnJfUMPhCO7EzbExB+K
 xFgq0llBow8Le2WFpb5O52T4zdfkeTTtCr4bDSxeOte9aZalt3H36xMtx+u+ol1zwWCaQ51ol0
 iTrK1oiMlVXzWts2Uh69clkvxgVGEigXIo0gzhLv5hhGB4CTt4YJQEAAA==
X-Change-ID: 20260921-vdso-alarm-clocks-6502a551ad5c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316776; l=1596;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=w7Va6Ls1wtSbdusEKufScr+bNHRrMKNZrfAP0lfFrl4=;
 b=/fmpcYqYthKBKOAIxQKN1hcEX/RpJaW+xOvYPI1jTMuDfi/aboLafIwr3DV1Shce0ixTVfwe3
 uzP+7RpIDSQCQWXH8a2PLQDiDFFw/y+4bgUe0YbTKV0hHmWxBL40Q3Z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the generic vDSO library to also handle CLOCK_BOOTTIME_ALARM
and CLOCK_REALTIME_ALARM.

This has a conflict with the alartimer changes in tip/timers/core.
Resolve it by moving vdso_time_enable_alarmclock() after
WRITE_ONCE(rtcdev, rtc).  Or I will just resend the patches next cycle.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Return an error when the RTC device is missing.
- Rebase on tip/timers/vdso.
- Link to v2: https://patch.msgid.link/20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net

Changes in v2:
- Rebase on tip/timers/vdso.
- Add Signed-off-by tags.
- Link to v1: https://patch.msgid.link/20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net

---
Thomas Weißschuh (4):
      selftests: vDSO: vdso_test_abi: Also test ALARM clocks
      vdso: Add alarmclock support infrastructure
      vdso/gettimeofday: Add support for CLOCK_BOOTTIME_ALARM
      vdso/gettimeofday: Add support for CLOCK_REALTIME_ALARM

 include/vdso/datapage.h                      |  4 +++-
 kernel/time/alarmtimer.c                     |  2 ++
 kernel/time/timekeeping_internal.h           |  4 ++++
 kernel/time/vsyscall.c                       | 18 ++++++++++++++++++
 lib/vdso/gettimeofday.c                      | 12 ++++++++++++
 tools/testing/selftests/vDSO/vdso_test_abi.c |  4 +++-
 6 files changed, 42 insertions(+), 2 deletions(-)
---
base-commit: 689868cc2af9cae9a4eff90eadf5726bdc20cd82
change-id: 20260921-vdso-alarm-clocks-6502a551ad5c

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

