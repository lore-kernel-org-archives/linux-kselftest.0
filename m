Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E818787A
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 04:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877793; cv=none; b=A4o+1JA/5Ko2FwXhUjloNO+LFMvc1Sh3qF7sGg+NVEcFRfc2tuAy2u3X20rsz8XiXeoQxDUQTKoqE+rYicAnXqXKktv7Cxhr5h5fcpVl65HT7OnMwojxsAVNjGmhlJxV5SuhH8vCAoUKDbPpwbAXBgxGaoSi0dkHPGVTqSiYlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877793; c=relaxed/simple;
	bh=5i/xrXB05pYpB7Y/jzFUA4x4HQXReMiHhsF4dRiUhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnVX8TEGac0m7CIRgNAcu1pIFb8P/FAYfqyHnjvWNmwE8b3Dslv+P9fBfNUmPKYVhOdR7ubVt+AnpP7EWwv2FbNfIfQsRKI9nylJGM+285hAEqT5YynYkDw3LjFHDqtiPwCi24hAODPUMOA2QlNXrb3c57Lo9Dlm1ts/RWg3BIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxnfrBK4; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxnfrBK4"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so1166154a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 21:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789877791; x=1790482591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+PFKba1M+eQHsH9jb2Yf4iAy2Pla/AL+6DEGCYNYE8=;
        b=AxnfrBK40LxkI/APVw21uuaAwQYTTiz9x7iarwxv+D2AVOSIGdjyA0vMVOfzQuUNOB
         lzAK26rCMJAK1+jOGNAXqMSTmiFH5IauIL7CWN65MWXF5/f9pvF7mkcbvswixd6XSxx3
         I4I6F9E7dohqbkFsodt+TVRSoNYLbWVoBNL/fanCvYA90ni9fxuY7Lmeg7OlE5iqydY2
         1lxuvfTW17k2rN2087p7Nm5tA1P3lTZyoY/L2sE8IM5xjRELlg9S0TyNf2acWTZETlNo
         nrBBO2SexocMDSDm4Er25r0J6yu3EzQ2mpUAVLqI3wEKdFUx0S67F3yoO/rpzNsLV7gv
         hzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877791; x=1790482591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+PFKba1M+eQHsH9jb2Yf4iAy2Pla/AL+6DEGCYNYE8=;
        b=sZ83LGkZ8MHwOnYjpvFMmWPMj95K9JMRDS9ZMJsjDlMwq4s29jBwaZwR6vBMFtCPs3
         ZAN8pMygpUzbMWReeAVYumfPyn8rAYDRKwOdexK0CA7TOuWdfBj9Dm1otVmHE7ctyyc3
         kaiEFjNyqcchOqE2QGy/oAZr3wfGmzNvFFeWBccA4hAt6FLZRCnh2jrWQSE6gtQcmBv2
         uXg0NzvPJWGIPtb/fGbM4POcgtoSGqyfSbnkOnK1u9shvLsCx4t+K735A9hUkwGzWoBm
         wSs19CPTidlIInr1NEt00JK7ryIxeh5sl5286ySlJbJhZj1HCWsigwc+ErXJ7cjIql4C
         EjEQ==
X-Forwarded-Encrypted: i=1; AKwUvByRL/MEmH6nA6Jn+MPaZIfe6WlDPCI3ZlFEteEXnZnxXLeOJv0CCKmi3hqyILXz40UXNCeLf2q4aSjPOAY9PNo=@vger.kernel.org
X-Gm-Message-State: AFuF++ld91AzRa9apT9fQObTIwCGFJm8HMGvWrIwfPJb55XtogA17wld
	3MpwonWqmd6Lzl72JJNBksd1LC/GmbaEnsOePMrF5DuIRBK0IvBu9wLK
X-Gm-Gg: AYBFou1B26zSx3GZ+nS30bzE1194971w+tmS18Q5RdwIhEMvNAxP//ZkZ5NxkrZnCQR
	TejFt5H+iTakd6JxjOV8fnWOa0pQcUgkMYGBWV6YqtB59ygREG4QYi1ulBLzS9nihw2G+GCDfrx
	S4185uDsxitzOzFTKvDNZcpsR8DY0CWOrOnsRzI5BwPy5fEPOtSqkRJhi+o2+m2tGJpF05zROh6
	wS2D0G75aswysE54418d2JrGHx8e3e6baS2baah/WtLifImAuAsIWXHZRfcVUCN+KuDtm2Hql4B
	m4yu8WCJfkpQVdtPo0I4eKZNya+E7IegoNKCpQc9Xi4JhbzTA3UdREC3dzWCoTTouCgGS+8j4jO
	yVmwtucWuSSfU4rO01/M99w4L3jIcYjubwq75T8j2EmuRr444Xe1vh/G8xXTO0Urw4sGrOja+Nt
	8rP8u2WshEpVwowIyWZ5zDDC+Pj1+5+tKPS3IK2nBEhIsHks0K00tsLZsPv6gqnAvdPz3EOQp3k
	G1QOosWCgJYOgVDtLoVTsTnvSlhmNnlCb2+VAUc0umNSsSR52JQOvF6RA7fjXYTQjUivGjBM7Mo
	qvLpkPhapg==
X-Received: by 2002:a05:6a21:6915:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3dd8c2ea2afmr10710958637.12.1789877791485;
        Sat, 19 Sep 2026 21:16:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aecaa7fsm1613635a12.21.2026.09.19.21.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:16:30 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
Date: Sun, 20 Sep 2026 04:16:29 +0000
Message-ID: <20260920041629.2453290-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <202609192050.D1E0CD96@keescook>
References: <20260919203514.2580997-1-benquike@gmail.com> <202609192050.D1E0CD96@keescook>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
in wait_for_completion_interruptible(&kaddfd.completion).

If wait_for_completion_interruptible() is interrupted by a signal before
the target task processes the kaddfd entry, seccomp_notify_addfd()
removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.

As a consequence:
1. When the target task wakes in seccomp_do_user_notification(), it
   observes knotif->state == SECCOMP_NOTIFY_REPLIED with an empty addfd
   list and zeroed knotif->val / knotif->error / knotif->flags, causing
   the supervised syscall to prematurely complete with return value 0
   without installing the file descriptor.
2. Any subsequent retry of SECCOMP_IOCTL_NOTIF_SEND or
   SECCOMP_IOCTL_NOTIF_ADDFD by the supervisor fails with -EINPROGRESS
   (or -ENOENT after the target exits) because knotif->state is no
   longer SECCOMP_NOTIFY_SENT.

Restore knotif->state = SECCOMP_NOTIFY_SENT when removing an unhandled
SECCOMP_ADDFD_FLAG_SEND request from knotif->addfd, and add a
kselftest (user_notification_addfd_send_interrupted) to cover this race.

Fixes: 7cf97b125455 ("seccomp: Introduce addfd ioctl to seccomp user notifier")
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Added kselftest regression test (user_notification_addfd_send_interrupted)
  in tools/testing/selftests/seccomp/seccomp_bpf.c per Kees Cook.
- Collected Reviewed-by tag from Bradley Morgan.

 kernel/seccomp.c                              |  7 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 98 +++++++++++++++++++
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..94c7ba80a8f7 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 	 * We need to check again if the addfd request has been handled,
 	 * and if not, we will remove it from the queue.
 	 */
-	if (list_empty(&kaddfd.list))
+	if (list_empty(&kaddfd.list)) {
 		ret = kaddfd.ret;
-	else
+	} else {
 		list_del(&kaddfd.list);
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			knotif->state = SECCOMP_NOTIFY_SENT;
+	}
 
 out_unlock:
 	mutex_unlock(&filter->notify_lock);
-- 
2.47.3
