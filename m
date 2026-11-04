Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788675;
	b=EhLDtSnVtDKDm/NbEsQG6ITwLBwOl5CH/190ad5q63FDhUJkUSNstzr9pIhlddNpFqcx
	 kSXm6hiD0Y7e0TIaxwGv5jeCr3BqRvhA55F2lfnXVQm1RIKIN8EeuKy6hMAqXrkG41JNE
	 kDS9jNVSYEcs6X6lFUCLyF8Ct4PvSR+nlr03acUanlq3q2Fso6VV1d9dq5ceo9V1iPS+S
	 PMSXocQct2ipj0lHU+muxSftuzhTDm4BeDqtsQivCrqcETBbaSKrdV/Kp4dQl+sj4QUk8
	 y+w8nz0vrvfzQJsTXKLK5K0Uknqy/d5+L0Go6gU7C++3t/6Znwwx+PNG5YhRaVFc6ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
	b=bIjefxNb19QF/rZBH8l02oruCLe2lYnZsNsvzPb4rwk4G6QrSGmx2AY65gGEaQi0eSsI
	 yVNtqaxvfYFIhYpLgCy+ztGZk8rSjsNDabJu0SBRQhUs/LM8BCirBpEGXfYE4nHfpPQqG
	 3zYnpGoEWWcZW7tA9hR2T7ziOorEZh8DlIr84q+VVLJcN/ccTAH+ZuWFrRAbQs2OzMJ6T
	 nCc79gv7YrCojJ/4XWybw3Gt84GTII1dR3BUPhWGbZRIxAtZ4xm16bxF8FAv9w99LSk3z
	 dYjRaRzMeAF7haAeFRXWLzUVqqaEMzTwqjbLIT8MIS7VRi94HdtzmqF12FOjJ5QcUww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ky/Vvs7v";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E015606A338
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 10:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E015606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ky/Vvs7v
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3625545e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788673; x=1794393473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
        b=ky/Vvs7vq9acnbAepAf0/7PqZUgHqQhJ4a1jWVId1ZL5PMZ9n1cXoI4O/MFd4PCDuN
         mVCr3+rcb95tcGDQ2pM0Z3W/KlfGkuN3rysnVL57YSKjWbxA+d37SlXRl6VteydczA0A
         +P4PEfGGiBxtkM/CTtyxvU3OgfwnnRUNiouA5vud1D6xnJwPoSiy+pNIl5Euv0YYZWsL
         2wbSgTRF9oLjzz+reaRVnj/xSyCLeDXuJe1HiTgncZJXx/QYVH7odhAuTW92cQrh8oiM
         TCNRpahqS22ALACm8jukuWC2qySmc6IalfIOt+blGS5PFLQV0BQ3sT/RylPghRnniv34
         vT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788673; x=1794393473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
        b=iaTm3QGqtFp3wV9dChwsApRFlDUcldvo7i2EE9N9gFSx52HcwTcSIxI+nhdBsGFxnq
         gLBkYokeIjsnawH1R4Mn3Sbw/+na+IlnDmhb7Ki81tvAyjsH7+uHoZ/A9OkQBEFIvxvX
         kr60hGJJVywOneNoEiF4gUSLeDhFS2bdYstx8bdbLsCxzRHtpqo99PqoATwy6XY/JKvr
         mjiBDr2gttf4obrzKCQxsPfv0ZdNemWCD+rwNiK+zK7NCM8xI7HglMWjLBEJGBwPOhzE
         23BFlX/XPz9ZXsPJV6c0+d3TIpFJtfp6lJI/c4Knx7+ZUbrKa76VxFz5+vgxOSo3pioa
         H31Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhCjTuZtWCLZozfQNmjbgfln7uANZTJzeTGZfJE7lI7NsfXF2XBGS496jDYnM0KSGCHpgGAXxF4F3n8qWk40w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o1d2QdnbrDC39sYJMH/S+09x4Dn3Hrq58Oumsdu52RQ7VovS8
	a8m8Iq+LsjfEUUJhbCC1X17PoIV9pwMJnPu7HLOnr/Vnqvg6gQOi0myb
X-Gm-Gg: AYBFou3C+O8JX9ezaurM1D+bGeHiiKWZ+lG+oCGBXUUUh2R3csaCwinDtYN1cVtmleE
	c2sy25wX9KAn17rTun5d9BaYDzVMIuEmb6jQaMDK3QSpwybb9WbASa5IPNlXaKhP5d2WwIuCU1R
	9tbY2Me9btF9SICse3y901B1iUtB2CKMq8Z5lljFGMHTZxzF4dxqe5cPY4ZTi49Vn+MKXkup0KM
	mOIwEwXxqscaWdl8SSLcMbPn1UAGL6wZAI05DezzBlrCmCzR7C84IbV92eM8VEb/lc/oltEv13T
	mU++MzciM+p1f8eVjabVIRa/LhG4kiW2D7G48veXljZVsEZXePdMMex69FJlSSdHafQ7PDVfr2L
	gT5B8SxbkLQ3UADtsGX4b/Bi0dUBF2WM4rHmo/8e3XaWkWx6MC1kKqN3BndJ8Hde7+9YOAOht8J
	ZhPcbjLv93pI+Tsc8mK+qur7KYw73pqml5TuFWtoc4osNG9J7fIbBUhYC67luUn8TcTeoaFkZy6
	kGpji/DTmLf7F1HvEPfwwtzWofMZpmsWFxfiOK05nTyA1JSAUz2VeyRAAs09R4VF7dAKwwX26OP
	1lK9DkNoAlvacl4z7Y8yD0KmvNcjsPmv6FOQHB05RIonh4gI4y+yMGTM+jzvkCoBf7DB0lnq/Hw
	pbs2dzbQ+7TRLjs6OiKhopLs=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr368842285e9.10.1793788673254;
        Wed, 04 Nov 2026 02:37:53 -0800 (PST)
Received: from andreayoga.wind3.hub ([151.76.4.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm36342995e9.0.2026.11.04.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:37:52 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Rodrigo Campos <rodrigo@kinvolk.io>,
	Christian Brauner <brauner@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 3/4] seccomp: add a helper to move a notification to SENT
Date: Wed,  4 Nov 2026 11:37:33 +0100
Message-ID: <20261104103736.71956-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seccomp_notify_recv(), seccomp_handle_addfd() and seccomp_notify_addfd()
each move a user notification to the SENT state.  The notification then
accepts a reply, so each site must also wake EPOLLOUT waiters.  Both
addfd paths have missed that wakeup before.

Move the state change and the wakeup into seccomp_notify_set_sent() so a
new path cannot set SENT without waking poll waiters.  The helper asserts
that notify_lock is held, as all three callers already do.

No functional change intended.

The change was written with the help of an LLM.

Cc: stable@vger.kernel.org # 7.4.x
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/seccomp.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index ee94a071736ef..75a758128db2d 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1125,6 +1125,15 @@ static u64 seccomp_next_notify_id(struct seccomp_filter *filter)
 	return filter->notif->next_id++;
 }
 
+/* A notification in SENT state accepts a reply; tell poll waiters. */
+static void seccomp_notify_set_sent(struct seccomp_filter *filter,
+				    struct seccomp_knotif *n)
+{
+	lockdep_assert_held(&filter->notify_lock);
+	n->state = SECCOMP_NOTIFY_SENT;
+	wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+}
+
 static void seccomp_handle_addfd(struct seccomp_filter *filter,
 				 struct seccomp_kaddfd *addfd,
 				 struct seccomp_knotif *n)
@@ -1145,8 +1154,7 @@ static void seccomp_handle_addfd(struct seccomp_filter *filter,
 	if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_SEND) {
 		/* If we fail reset and return an error to the notifier */
 		if (fd < 0) {
-			n->state = SECCOMP_NOTIFY_SENT;
-			wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+			seccomp_notify_set_sent(filter, n);
 		} else {
 			/* Return the FD we just added */
 			n->flags = 0;
@@ -1600,8 +1608,7 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 	unotif.pid = task_pid_vnr(knotif->task);
 	unotif.data = *(knotif->data);
 
-	knotif->state = SECCOMP_NOTIFY_SENT;
-	wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+	seccomp_notify_set_sent(filter, knotif);
 	ret = 0;
 out:
 	mutex_unlock(&filter->notify_lock);
@@ -1824,10 +1831,8 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 		ret = kaddfd.ret;
 	} else {
 		list_del(&kaddfd.list);
-		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND) {
-			knotif->state = SECCOMP_NOTIFY_SENT;
-			wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
-		}
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			seccomp_notify_set_sent(filter, knotif);
 	}
 
 out_unlock:
-- 
2.53.0

