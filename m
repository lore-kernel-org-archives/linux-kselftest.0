Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03568411A1C
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282541; cv=none; b=uplfQdMl8TD4qksKhl9YBcl+uuByRSrGjZzL2N8LeVwx+mSrcgJ48Jv2Yb8dkMFZDW+TJrOLbRJNQrzUL9l9pQMP71ZYU3ewIC0+inGe4l8y/9RLBBwsXpftY0Zn7Yc3JxXcK2Y0692AmHmLpR8USIpJM5dVl8uK789d957Nr4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282541; c=relaxed/simple;
	bh=bBi9t3/XNj2fxZ4GFxBaUZi+HB2ny2QNyH+RsLcMXqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WU1u5ejxnP7DqWiOXHXPbwPvB0V+PWO4N27M3rND597q8SQ/EUlD2EyZOwbnvWoHopBsn9WIcDTVF6+4v4HAK6HC49OTYSpDpvpyMua3QGAMbwtbgIcZtb5tHdxh8BrMU3wAvJgnEVi5A57s2xni9HLoYfoj/CRWOy2lXinybiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKyfQYUq; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKyfQYUq"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-33c0d931083so61644eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282532; x=1790887332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=KKyfQYUq27vw2IMBkBhWY6gQ56fu6eoVeoWpmuzsLB3KTG9v1+7/LpUZC/t+tpSe1s
         3IRWzR27WvyFyrVJD7Op8kqMkjpsuPPxhyNfRtWKP9R+FB3Oi5Ai/aHclCBHmvMbeGUS
         Y0tts3OujfRoP98FUXek2VcLzR8DGb1ff06ZwlYFPncRmZD4c1lljGDD/vT+dwN6LufW
         y5irk3THLuzvuFKR2tOBKbjpMwvAXn1iALxlq8BqTz4Urrp5d7QM1lUpEsYVO0j0LPA6
         gQraca6Vb29uALaArMixJMGa2vT4bOb57vFXlbXnmDC6fP2aiNwSSr+FfJbmvBQW1hWS
         q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282532; x=1790887332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=m2NMhuyfVPaJ8vDTnmYBoY+EGhyX8mABFOasipayFl5kSlg7sG9kkfKVsrneGOd34W
         vRxkYJyHyy+zewPLyd/BWecKhwIB9Yqb+JSdwmXJaWZjqtBpi81Qas06AWaLTOxhAYWG
         SXSVdRJoDKYY+Flxtcd1+tIF4nUsYsymaSMeJkBThLWWT5S5hSxdXSiWEDEsm/oXQrDw
         M/i/ESgfUkwniVXcjrmrAmDzVDw13kF1X6YYVl9CHbuRKkibrnbLXPtSn1tIF81x754Q
         ZMVEDtPzdeNqruPUN9deTjqM6KLCUyQ5/zdwvJ/EDX8x1L9u3gOTosA0vaM0WRrwkX6b
         dKnw==
X-Forwarded-Encrypted: i=1; AKwUvBycaVx6OuXbuan+/NwPWOJesJ9f+c5agVtPI5Oz/xa2GQ1aBBZW6o9WgTsph3et+2m1MhyiQxeTwIDWAL9ORoY=@vger.kernel.org
X-Gm-Message-State: AFuF++mCRUnvpeaW2mLU9hAu26HCeNluS8bcMRMIHBkg2tJgu2YkjR06
	cp4Eff0QCrYQYrx2V7xj2bjJu6KJPI2RQHDTQczwuG2hGhOb9DIllZNv
X-Gm-Gg: AYBFou1jaOipV0c3d4iB2JcWS5oQBK49aFKUzM/rPsAOpaIea5MYghnN0zhGZnOpHDj
	r0RvMNj/kyRC+IsThDfopu8PvubC+vkbxNS6smmBjEjOcYwCTXeotvnJ0MdaaOeDKGpCGVvwhes
	mpHHFethKgVtdQrUo8Vf6P75ndsiM/cs1JAoKcjt3WL1Ahwie0C3HeP/sKdKWqZep2qiVOA+uhO
	WNCHiMR4GSLxKt7j0EWQjNqZGQP2eZC6sF7r2bhzWZPpF6nfxqIwXaYfzXOj4voNRitcbnGdHpi
	B5F2s7CcUmt36BHYeGPdohZZog/YaPjy7JectCBvqYuSwBBofH8IdLxkJXDDXQKMQPcvVng/zGS
	T+MFsa+dWuqRIDou/plqNBSISYRMvrtHCt5LHq6RSDHEnmkLAysMZq/a9/f1vyktGfJIeNb1R8w
	xZ1u+QtYzm1LA1MjzBjmWQrRIJRtE+k9JOosAkuzEQ5wmtuJ9ts1LyLejxCJPgXWvMWSHT+TVcw
	z2esbE+gq47ImQeBSXakTfV5wc9SjPmmlRO8CjQEA==
X-Received: by 2002:a05:7301:e0f:b0:33c:29d8:bc21 with SMTP id 5a478bee46e88-34004a89af2mr2406330eec.10.1790282531857;
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] seccomp: opt in to restarting notifications before receipt
Date: Thu, 24 Sep 2026 13:42:06 -0700
Message-ID: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Sandlock is an unprivileged Linux process sandbox that uses Landlock and
seccomp to confine untrusted programs.

While using seccomp user notifications to enforce process limits,
sandlock encountered intermittent shell pipeline failures: SIGCHLD can
interrupt a pending fork notification and make fork return EINTR before
it executes [1]. The same pre-execution interruption can leave an
intercepted close returning EINTR with its descriptor still open.

Receiving notifications eagerly only narrows the race, and
WAIT_KILLABLE_RECV protects the task only after receipt. This series
adds SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV so applications can opt in
to restarting these unexecuted syscalls after the signal handler
returns. Existing signal-driven cancellation remains unchanged unless
the flag is enabled. The series includes regression tests and
documentation.

[1] https://github.com/multikernel/sandlock/issues/235

Cong Wang (3):
  seccomp: allow restarting interrupted unreceived notifications
  selftests/seccomp: cover restart of unreceived notifications
  docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV
    flag

 .../userspace-api/seccomp_filter.rst          |  29 ++
 include/linux/seccomp.h                       |   3 +-
 include/uapi/linux/seccomp.h                  |   1 +
 kernel/seccomp.c                              |  16 +-
 tools/include/uapi/linux/seccomp.h            |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 354 ++++++++++++++++++
 6 files changed, 399 insertions(+), 5 deletions(-)


base-commit: f2c53ea949c5048f96b3dbb5a5ee7131ce4ff2de
-- 
2.43.0

