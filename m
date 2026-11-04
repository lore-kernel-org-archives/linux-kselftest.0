Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788670;
	b=dNWDyCSezx6zo9O3yLDmbRfVbSLTAtGCDDqaanibRhoHl8IY8aSUn6zChqIHBiIn9i0K
	 zncqXb6nI3/Mf1K/dWBwXXL3uDeOYLaJ6FUQwOshdmvD/zp4yKpSaLYJnKquKwRDNqnpG
	 kibdEwMIkV1nnTSJHnScKRNmt1Wswuu5PbEQ8oMT3ngRjOH6gR/nU0rK+KGthr/OfBgMb
	 NE2Zz9bxCWqrydC59Ygeyz1Mchf2jmH3nrIyzUIvom3byFW/RdNoP8i9yfLl4fJtGHOX4
	 +hIj0o0p24CN+CDvX9liyFx2fG0KDlO68xWt8IcQueE95YKry3OTRKxvVFifZh1CDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1dkLsXb9/bTYDqyZhGVg0eEZjhAqz/Od70PIDf4k4fc=;
	b=eXI09jvtRwjBSLeIDMUGbh1urg7mkvw8kicA3dRr6UeegWJ9OvgFBptpDitvF55SNaF6
	 9c+hMw2FcVzO1m9cRR6/U+/CtPxFc4UR1bXb4QilqlUI7cr1fGxkOvbDGno+0VvDHHK+0
	 FxfHR5c2s1WFJE+rPo7n7Ve2+sfKrnXWV6eq6zyLVrxsUaAdt7ZchmsEO+dqEpsq1RRcj
	 a6U1tm1uAbCpnWPA/uqK4Z51Thapp5GAyFB6aUnd4vv8MbfyvYcy2R5A1OwvzWLXnGKhL
	 toA1Hy8KNscUr+m5jz+2nwSpvhDStCC7ms0OapGkxjvJWiZUI3NyGOUhBK7vLIobh9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zn4rPmWa;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDE606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 10:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFDE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zn4rPmWa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so4228325e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 02:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788668; x=1794393468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dkLsXb9/bTYDqyZhGVg0eEZjhAqz/Od70PIDf4k4fc=;
        b=zn4rPmWaJ3a++hiLo7Xe3RVBG+PeT0bEuPCVcAY+8QPdo50paPEhhqtYcxONPUreWY
         PTSi5rKZBSU+UfM2I4p6WT3/ITMxuAymkUkGT8IJHI9u77NwNIJdSGO4UiSMOYnsxqBi
         mZ0JHuPeqeYvfugiG1VaiRh49iD5NIzkygnQHSlFf/ZI1ExufTef1Ry/Ps1rgGKgm6AX
         GYnRZI3UrKforOJokHSRElmQp0VRHHU56egQHw/9RXEMu2jN3JbF+9s5GmxZCzV8NTgp
         JiAk7mjeb8DyW6wgDIXKYP3/DMzg5hX8VpUTEn5Z1QV3TT9NY6wZBqtRICzqHkHlBAti
         1G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788668; x=1794393468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dkLsXb9/bTYDqyZhGVg0eEZjhAqz/Od70PIDf4k4fc=;
        b=S0KLm2Gzqx4AcXWw/QrskdAnohDG3HS1q9ehx/H7fBhe5e/DWF3y1l5aEguOxWqIqn
         9jbChCG572qDc9aB6tcIWLyTNEdPgxTbaDyPMOz/1ksUsD7uU3spSwxlC8gZjOWsSRCE
         pwAFb9YlWgitiJ8vfAVvpeNCz/gS+aZYZWeNguAS8XM07AGB8Y6AjTXLaELSXLVo870K
         nHpIY4V8bLTQi4i0xCMXgwVvZUNLkn5KhAq1aZ+603iyGQRWID/OWBzIeZ7HhKxuLNc5
         r//s9/SoQz0+97jpQfwbG8azh4xTxV5WGOEoe2wDvbcjMeI+Wmdx+Ty5zXX3vVuZ/qG7
         mN0w==
X-Forwarded-Encrypted: i=1; AKwUvBxthyjx36pCLB9/9mEHKCLxVafoKbxsQy+4XWm8jJNv5lMcESFcrnutSkiGsl07Gmx/uRZ6/9q2Bq+PF6dlp/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HaYUqt1P/PT3EnMUjvTnm3XuYT5j0lo2ROFJoYu3VS5ydHvzj
	bn4nsjmADpzY1hBWoFuJfh9aKauk7K5rYhjHmNsqbRU6pNkBDhNQijY/
X-Gm-Gg: AYBFou3PmMu5y0KtNqbN0+wF8yiqzFb6rEK2qjgMceLnNxLjCDJJlcBFQPQJCE8bNDq
	myVepXXG3Jmt1UphkM3BoIb2IGzxuZLLa275Zin7ZgqXIVKwZaH8OLo/itWvuV8EmcO8RkarCHy
	cC53U6TK5T/KrlL9RSlRp38Vwg6wIatD9dyNKVZQ5jSIP4KP9cHJLPqK9go/Bpga0cKjzYlPbcy
	GkrOd34woDIl4J3IicAs5f8yBGzt1G3INU//vQ4J5yGMaMtT5w3H73ZmXIw2Q3JHocVjENqFl3f
	co0rnpPudAr8punj2BjfaZClfSKx4nqVRwFPQ7cK8qaimLoLppEBGAL21CK07DJmoA7xU11fbLY
	EdvEiyOqOIG2/t8K6OKycmt4k4F/JXZRKLl2i83G0EiQeuVk69KXGzAx5Rn/c9b5DI2AB39gm/g
	V+G5uc3VMo0yogvV4Jus9Zvm1TIaL/WY7JqlT54xO8S1pC+xsITRauBaFQGSoiD3zN0KuOsLpcf
	GwzSw8UMi5In9rNYMOeur0Q4VNVLDbEczAdRb5F5vqjhdnhswlTHT/xzneA9fhBQJE4SX4J3Ggb
	kIsrcBQfivZNda3SPQN53wgf80EHJsIX8lWsZXZIHjf5mB3jkL8EKNSAQp1yBPSFtpCum06gsxu
	crJQQPQG4R5+tBbg37TWJkg==
X-Received: by 2002:a05:600c:698d:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4ac185bcc4emr358335545e9.34.1793788667829;
        Wed, 04 Nov 2026 02:37:47 -0800 (PST)
Received: from andreayoga.wind3.hub ([151.76.4.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm36342995e9.0.2026.11.04.02.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:37:47 -0800 (PST)
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
Subject: [PATCH 0/4] seccomp: fix user-notification state transitions
Date: Wed,  4 Nov 2026 11:37:30 +0100
Message-ID: <20261104103736.71956-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

An atomic SECCOMP_IOCTL_NOTIF_ADDFD request moves a notification from
SENT to REPLIED, so the listener stops reporting EPOLLOUT for it.  Two
paths move it back to SENT without waking poll waiters, so a supervisor
waiting for EPOLLOUT, with edge- or level-triggered epoll, poll() or
select(), can remain asleep, leaving the target blocked in the trapped
syscall.

Patch 1 fixes the failed descriptor install, present since commit
0ae71c7720e3a ("seccomp: Support atomic "addfd + send reply"").  Patch 2
fixes the restore on signal interruption, added by
commit 832b9b176be06 ("seccomp: restore knotif->state when
SECCOMP_ADDFD_FLAG_SEND is interrupted").  Patch 3 moves the state change
and the wakeup into one helper, with no functional change.

SECCOMP_IOCTL_NOTIF_RECV marks a notification SENT before copying it to
userspace.  Unless SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV is also set, a
signal during the copy makes the target return EINTR, even with
SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV, while the supervisor can receive
a withdrawn ID.  With it, the signal is held back as if the notification
had already been received.  Patch 4 adds a RECEIVING state and marks the
notification SENT only after the copy.

Patch 4 affects all filters, not only those using RESTART_BEFORE_RECV:
RECV now fails with ENOENT if the target withdraws the notification during
the copy.  It clears the buffer first, and
Documentation/userspace-api/seccomp_filter.rst already asks supervisors to
retry on ENOENT.

All four patches concern transitions into SENT; patch 4 takes its
post-copy transition through the helper added by patch 3.

Tested in vng on x86_64 with the full seccomp_bpf suite, using the seccomp
selftest config plus CHECKPOINT_RESTORE: 146 passed, 0 failed, 0 skipped.
Reverting the kernel/seccomp.c changes of the whole series makes
user_notification_addfd_rlimit and user_notification_addfd_send_interrupted
time out on their second epoll_wait() and all four during_receive variants
fail; reverting only those of patch 4 makes just the during_receive
variants fail.

The bugs were found and the patches were written with the help of an LLM.

---
Reviewer notes: 832b9b176be06 and f7952251ecc3, fixed by patches 2 and 4,
are in v7.4-rc1.  Patches 3 and 4 only need backporting to 7.4.x:
f7952251ecc3 adds a new flag that is not tagged for stable itself,
unlike 832b9b176be06, and patch 3 is tagged only because patch 4 needs
it.

Patches 1 and 2 do not depend on patches 3 and 4 and can be applied
first.

The series conflicts with Cong Wang's RFC "seccomp: report the result of
continued system calls" [1], which is based on v7.3.  After patch 4, a
task killed while its held notification is being received is in
RECEIVING, so the "killed unseen" check in seccomp_hold_result() would
need to become n.state <= SECCOMP_NOTIFY_RECEIVING for the result to
still be queued.

[1] https://lore.kernel.org/all/20261020001124.974063-1-xiyou.wangcong@gmail.com/

Andrea Parri (4):
  seccomp: wake poll waiters after failed addfd send
  seccomp: wake poll waiters after interrupted addfd send
  seccomp: add a helper to move a notification to SENT
  seccomp: publish user notifications after copying them to userspace

 kernel/seccomp.c                              |  79 +++++----
 tools/testing/selftests/seccomp/config        |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 162 +++++++++++++++++-
 3 files changed, 204 insertions(+), 38 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

