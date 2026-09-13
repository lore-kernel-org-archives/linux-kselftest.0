Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD0388382
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338014; cv=none; b=Amv9a1MEaRbV04+BpQa0tb7ovi5nNMfak9LTAehBwtzLBACWhEb1QLDld9a0JDCGJ4t2L+Eqbbo4WO87YLUOAkHie6nat5AW7XErsf7YBAePyosU6xT41VFfHJ4dTAlbWn+CNS/KygxOn0XZ9be0BWU9plSMd576F/K6CzpvspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338014; c=relaxed/simple;
	bh=3Q2i0jpjPgJWyOfN2ps8ATc7g5rJV/FdIA+P1pwUXO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpXhfTjLpScEIN2JIamgTcpG2hX3ykO9KptwL3MzCFJHOdP1jdKHjEqvS+SXBUTfNVRQWpE6R4No9hG7GnPeAwCVW7XOJq4eCjnuNLLJnP6/G83y3WL3OvOit57IDf/KDCltxzBQEWUVFwbFeGSec+FpBa3YKazSOB92qNFw7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=ZI8womty; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="ZI8womty"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20e86cffso159257d50.1
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789338012; x=1789942812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8ge3U9xNywezlJGA++PqIty96zLoa0cQYn9Az2YiYY=;
        b=ZI8womtysJP7jKvnzuss8CciDCoVExte1+UzCnffhyzmQG/deTZcjIX1kGCZoRCSok
         YaJ1wC0GotXeS6Vtmk93JqQVtbE7Tmibe/EqczlvTpIE+o/LedYxJ0uBzat7kq/1Xc3V
         usI0nZ8UJMT2OOZ//9DOFIIEaAf+pf9ifdOi3RCpzihnZ9Znzrw1aiNAHyykVfcSzqDS
         pePTV0bLRHoft566tOGzQSnJPHc62Ki4DAmu5fBYMDPvE4mS1oTf3vzbVriNqrfFsXfy
         w2cNmZBer48qYKDn2Ug0ECiTnrDbA2LKTk1r4F2Vlt7w7RB96M5uxPhMEVGZLmtdVXdX
         gpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338012; x=1789942812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8ge3U9xNywezlJGA++PqIty96zLoa0cQYn9Az2YiYY=;
        b=BQqlmUzItrQB/kloTXplI/BFxH4V5n2uBT3pvO+JUwp9AimGtK/SriSZVNrUn1GQGZ
         4f8vikCKwlHvDhZFDqGqBaz+folNwcSy5TpWuwvJXrn3RV5oE+pEZEVWDH8YXUqsbbDF
         VYlon/Md3s/gqxPT9e43S5pnFyuKMOCQdmHu7qfchNWhekuCoSn4+klAYmDVDmA3HJii
         n8//4vnhTgcq1Jj/LN+00c973CKdGiE4tPdvq73891Sq9E3f0DC0UNLSLkOCNDuCZTH4
         J7S27oFUykjNnRyckOc8ra6maKzkwRjMBV7SzYP8+30TvzBAMgHzrqfY6Vs+NTpB+jas
         RUyw==
X-Forwarded-Encrypted: i=1; AKwUvBwy77YYw3aHffOv6FfxnkyL/2ol1TbMLd9SOjpioeC6AvEed214k1PdgboXfl2r2i8LVFZQ5gXKXPGPdq5h1GE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnhCMCfsYRbculiJwRsTLhTml1w0FVzKMoX7kfaNGeGlVC5DsZ
	W84Wgx7guKYuXBhKmlzuYsQXXlcY2n048U0IjCopXKe7ooMSPHiNDNT4/4HYOkbBwVOaiMU4tUJ
	MDqix10CNW4vZPNkl
X-Gm-Gg: AYBFou1X9qa0cWQ1GlO57wrG77t2q+leAdgL3lZyqiYTYMUQ7YUYJe5YCzLcx49keWp
	ecakwzQf204sCwsAbev8lXQkanOhS2oqg/hhJ8LWFtNgI1XaDlHqO6NeEnYft4se3540FTpO8DY
	CqwkSNtGMUsNlW9Fwl9lkG7wEuLkZ8s6gTuXDoME+WXbRNHPgAK6gENyd1K1Tg6R3kOoyxi3bHS
	oxt1lDNilwMZBmzY7V6s/l1irMqBuyZrotVXbZfYfAViUDGVcLOvR73/3IgforTGb8FBKXMTHnY
	Q4yaH80MkRnO/nhW3Y6fK7zKfC5oEmaqT/gZ5qBWlXeMJLmRR65hoIvMGjmkcLxqNXkXMi3iqVj
	wSCmaRoma/zLi0jC6woZHDhJsNMchCnv0znsHd3ccVL0Zxpqm5ZaSjl9jCjCvjLOjYRGgbh9Fq3
	sumdcpcts1kQRWvx94VFTuB+/BhakGT7B0ZYaGHl7QeHBiyv7oM1z/EO+zq/qk3/ahaXMrlf6SR
	5DgIXCYjtF480bbDDg5LhMlxgvexrkVZ90ofq0=
X-Received: by 2002:a53:be49:0:b0:66f:c852:209f with SMTP id 956f58d0204a3-671245ff4e9mr3870451d50.2.1789338011698;
        Sun, 13 Sep 2026 15:20:11 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125ea8a35sm3737883d50.19.2026.09.13.15.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:20:11 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tahera Fahimi <fahimitahera@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 0/2] Landlock signal scope and TIOCSIG
Date: Sun, 13 Sep 2026 18:19:56 -0400
Message-ID: <20260913221958.839429-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Landlock documents LANDLOCK_SCOPE_SIGNAL as limiting signal delivery to
processes in the same or a nested Landlock domain.  A retained PTY master
can currently use TIOCSIG to deliver SIGINT, SIGQUIT, or SIGTSTP to an
out-of-domain slave foreground process group because the privileged TTY
signal path never reaches security_task_kill().

This RFC asks two questions before proposing a final interface.

First, should this be classified as SCOPE_SIGNAL under-enforcement, or as
part of Landlock's documented inherited-TTY limitation?  The "Current
limitations / IOCTL support" section says that IOCTL_DEV does not affect
pre-existing descriptors, names TIOCSTI and TIOCLINUX, and recommends
closing inherited TTY descriptors.  That text discusses the filesystem
IOCTL_DEV right rather than SCOPE_SIGNAL, and unlike the two named ioctls,
TIOCSIG is not CAP_SYS_ADMIN-gated.  Commit 4b80320ca7ed fixed the same
effect-level class for SIGIO rather than treating the retained signal
source as exempt.

Second, if this is a bug, should TIOCSIG use the existing task_kill hook as
patch 1 demonstrates, or should it gain a dedicated TTY-signal hook which
Landlock can implement without changing other LSM policies?  The prototype
is atomic with process-group delivery and behaviorally narrow to TIOCSIG,
but calling task_kill means SELinux, Smack, AppArmor, BPF LSM programs, and
future implementations also mediate this operation.  The series does not
claim that cross-LSM policy change is settled.

The demonstrated generic impact is low:
CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:C/C:N/I:N/A:L = 3.8.  Scope is changed
because the effect reaches a process outside the sandbox authority, but
the primitive is limited to three job-control signals and no independent
integrity impact has been reproduced.

Patch 1 is the behaviorally validated proof-of-concept fix.  Patch 2 is a
minimal regression test; further test polishing should follow the chosen
interface direction.

Validation used the same userspace image against the affected and patched
kernels.  Across three boots per image and 32 iterations per cell:

  affected: 96/96 cross-domain TIOCSIG deliveries
  patched:  96/96 cross-domain TIOCSIG denials
  both:     96/96 unconfined deliveries
            96/96 same-domain deliveries
            96/96 scoped direct-kill denials

The regression test separately fails on the affected image and passes on
the patched image, with exactly one TAP test executed in each run.

No external report or patch has been sent before this RFC.  Guidance on
both classification and hook direction would be appreciated.

Christopher Lusk (2):
  tty: mediate TIOCSIG through task_kill LSM hooks
  selftests/landlock: cover TIOCSIG signal scoping

 drivers/tty/pty.c                             |   8 +-
 include/linux/sched/signal.h                  |   1 +
 kernel/signal.c                               |  30 +++-
 .../selftests/landlock/scoped_signal_test.c   | 142 ++++++++++++++++++
 4 files changed, 177 insertions(+), 4 deletions(-)

-- 
2.55.0
