Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D9449997
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371803; cv=none; b=kNeBmQdZcCZZSxBPEnfwYmCCxVhfYdRelxST8yqlcGGoNggvdZxmu72vAZzIRjD26gURYiklJRqVefmg0q0t4IF5H2si4E1cu2I1+I21gOz9j9AEkL0c17GvaqV9GvjkwLetzFYpTwwy0j2PQEiM8GFrUT3qe0Cj1+SSaYl5dXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371803; c=relaxed/simple;
	bh=P3KyXyTNzLWqPtiDsAWlEoyQ2QATyxAt/NpP8cQGtao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awPWZrt+bueUI//IVcbBXg0I2lch89T0pLYpHz4f8OaQ1z6k5+5RHfyV7xHHjTyrDHSGseEe/Kn7RZSbEkTIz/JzxrYK/IixmoGI+it+oczq23Qhm+JvugeEp+Jbie0FEb/YnEV7CPgqYanmFdTkYb/OFpKyn85Hy3eQXEw5XQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iln7cd7+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iln7cd7+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a8a2df4f93so384893a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371781; x=1791976581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=epeEoqFJxJZ9rzrd7Yj+uBKsPgIccWzbk6+MVwkssHo=;
        b=Iln7cd7+o5eBViKFtOjZOE5e/zOFAMQiK4voG5O5+FoSD3b4D5hOmAL6GR4rqzVTLT
         ZBuIs80RiKLH1XcvDWvglvZeXCiCNxAZzIbstGQ/NofVbeM1Lbx6pEHJm1rKUgV37iDT
         /hI66+SpyWy33NRwIghFkrvyZzPC2A/EHLywWW9GJZHvFSDNjlbHoNehfd+5N2R5KNt1
         LIvfq+UNzRLWm143KCIORZGilblgovvGWOJt7d+xbIL0o4KeHtI3vdMX86TnVdM1zS3E
         O031w2y/NsC51Q20kvbC3NOpoJKQsiSDmtov0jNWzfoC/WUQmjfHZX1V4AZy4Zbjq7rV
         lMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371781; x=1791976581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epeEoqFJxJZ9rzrd7Yj+uBKsPgIccWzbk6+MVwkssHo=;
        b=n0yTD1Mrp9KwbW43VjYNRggo8UhI74hhmkHL+srFb56jQ6Tcb/9hpA3qVe3Pu6srzK
         HuuH/3Anrb0u2IWyDdO1iGDzwslYSdnwsKQfIOR+fVCZdV8yiLqh8TMk9zKoMxEZ6w8m
         MUhC4iPhvzXxQUfXB55t4xwiDkrSVTplKFCPLvbiMADYO2Xtu8XTyFITdhGj9W2qf9oj
         hpv+relbylMD1liNMgQUUuPcU+403di/jseKilRQBU/p91gvvpvk5KBK8pGIcvBb88ZW
         dXRGqvwYI+MKzf96WlI01Rv90WS3iH/LqBnanJoHtTsYhwLQb4NuqO7I76vF1vz3uWDM
         ZgZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWJkdLh3Vb22Co4xprllhm4uD5JS+eXmXmT07Sqo+/vHqsBPzvUfODk5yrDeCzvdOcI0lDX4JmrAXakiL5Ypw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ5/RGIb38Mc0eN4Zc+DBwIeO6hmZVax134UXegmqVKp00cS0i
	UYMPT+6mCY70+HrP5die5+Ni2kiE/eRN1oRprCuCrglj/8NdJ36CRE1W6HzcFRoTMYVH7A==
X-Gm-Gg: AYBFou1m2lzo70O1hiaWRHLabBTBZLIbEG8E8Ot8L87tyAX3Ug+uZgKfuZb/h2LDngV
	J16/aeUB6NU4Iixd0RhrlpZBwOQ84dtCW3zOwr8uBo94l0GPzV/sb+dsU3G+6ejuxXJExOKrFz+
	MGcGupYRFTba/wY8ou7v7LS33kWOYwoJPKT+GXa7p/2eojJa9iZKM6LFysMlIs7AXggAQk5/h67
	9RcxVegpnjMI1ywHTfgThxA71Xa46CsXnrjRrnrcKW3SW6c+qPNNQWR+QfcL3D9dpvP+mMFjuk6
	ZLlo5mPx9ZodIRDwXezkJjfstfOvaMTV2WkXPR8V/VKF9dqRWrdxFqGTHwjvtUG/Geuvbm9xXWX
	ZJxIMFAJg7l8FTRQjcIkBsZvMjvHPoKl3OFm93XIOSulLNBPT2sHGfdbFWcPQgsrQejPeKOjLLM
	aZxajQKflgW08TTU4ilM7fKYYf2FKHI0i+Wy49SffNK18XMXUmN1LX2mp8m+bNpHtC84Wz2Cfyx
	g==
X-Received: by 2002:a17:90b:4b8d:b0:3a5:25e:85fc with SMTP id 98e67ed59e1d1-3a8a1ce5d6cmr1698155a91.63.1791371781245;
        Wed, 07 Oct 2026 04:16:21 -0700 (PDT)
Received: from lima-kernel-dev.. ([161.142.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e825b9sm1450044a91.3.2026.10.07.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:16:20 -0700 (PDT)
From: Daniel Syauqi <syauqicode@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
Date: Wed,  7 Oct 2026 19:16:11 +0800
Message-ID: <20261007111611.2086-1-syauqicode@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

raw_skew reads frequency and offset data from adjtimex() without checking
whether either query succeeded. If a sandbox blocks the syscall, the
test can use uninitialized data and wait two minutes before producing a
misleading result.

Skip on either failure and report the syscall error. Preserve errno
across the newline printed after the second query.

Fixes: 51f91cbdf545 ("selftests/timers: Add clock skew estimation test from timetest suite")
Assisted-by: LLM Codex
Signed-off-by: Daniel Syauqi <syauqicode@gmail.com>
---
Tool assistance: OpenAI Codex helped identify the unchecked adjtimex()
returns, draft the fix and changelog, and create failure-path tests.
Prompt summary: Investigate the unchecked adjtimex() calls in raw_skew
and prepare and test a narrow selftest fix. The affected content is
raw_skew.c error handling and this changelog.

Tests: Built raw_skew with make. Forced EPERM at each adjtimex() call
separately with LD_PRELOAD; both runs skipped with exit status 4. A
normal raw_skew run passed, and targeted timer selftests had no failures.
The full kernel test suite was not run.

 tools/testing/selftests/timers/raw_skew.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index 0c87a8fb0..2ad5e2e35 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -19,7 +19,9 @@
  *   GNU General Public License for more details.
  */
 
+#include <errno.h>
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <sys/time.h>
@@ -101,7 +103,8 @@ int main(int argc, char **argv)
 	}
 
 	tx1.modes = 0;
-	adjtimex(&tx1);
+	if (adjtimex(&tx1) < 0)
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(errno));
 	get_monotonic_and_raw(&mon, &raw);
 	start = mon;
 	delta1 = diff_timespec(mon, raw);
@@ -116,7 +119,12 @@ int main(int argc, char **argv)
 	get_monotonic_and_raw(&mon, &raw);
 	end = mon;
 	tx2.modes = 0;
-	adjtimex(&tx2);
+	if (adjtimex(&tx2) < 0) {
+		int saved_errno = errno;
+
+		printf("\n");
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(saved_errno));
+	}
 	delta2 = diff_timespec(mon, raw);
 
 	interval = diff_timespec(start, end);

base-commit: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
-- 
2.47.3
