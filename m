Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934892116F6
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 03:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771384966; cv=none; b=r8ZpNp2f37IDraoPsXv8NEULa+1whnNOi4Z1fMSuyJY/UUNEBhG3h7xL4WDVkaU5cGNO9kotuwhV4l+RrXZ+LwRk9xsGEGmiRijp+mlab5DmkVyvh7F327Y6kOgwcuGlr2oeWANFMUA1b8euEMC/98Al8iRVfTC8tV71+vLjEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771384966; c=relaxed/simple;
	bh=32HF38AOD/I/0DWJn1DNDyTIUijzlwxnIPrqmmhrMEc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IC6RLbexy/AkEsbyLdiG6JTxUYPlXlAdDdOveZAL6nQM/RQB+Sh48IR1ScC99Jffm6dIQKnU18e4RZ/g5OBTtTAsazN278rk6iRUGoE6rHoqzms39PEFijwX4movnmhU51AFtaH+VEl8AO7pOlXP93F9xYC8qPNVVKZhI/zC5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B70JCOX/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B70JCOX/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354bf10ec2aso4234434a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 19:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771384965; x=1771989765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5oh2GGuUIGHttG6QQKJrDgyvg+KF11aDAOaopsiwdo=;
        b=B70JCOX/inNG3gWIiBSuXhyja6cGFpC1aqa5uh1cKSsJ9zoSgkTsWo/Yfa7Ncf2IuQ
         MG+Z5IrLg6kPKGIdW6rdcb+29+6nENjqskyAwVrTluMDZEhpSizkMAF8Ug31mHW+MJBf
         om2pSwH1L7Eiei4ttENGh0gzq4BcYbqLxAhkiDmyt1MtshNulEWqDp84URURMTbnEUqt
         HHq6vG0Ptp7un0tyWN701U+CzWzYLOCjRzHKaeCAdnyVjiv0hKTuxobucFLIr2AHTVK4
         X7+j+wsIsD0eqbKo4tqO+DBEkEmvx47piB+uSLzmzLbja/2at0kHpb2ni7etIZrqXm4e
         R5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771384965; x=1771989765;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5oh2GGuUIGHttG6QQKJrDgyvg+KF11aDAOaopsiwdo=;
        b=rOMwjAy02drFcPGgKUPjkWkIU+UfE9gJJ6UsiQQm6VZX2fy/hrrTjWuUgSLrjRYm35
         gAe1hbHkGiIh0CXT0QobMKy2P4hFJsSr5u15nEAQcGxLHFfCto3aZcAy1g2PY22LFc13
         f7w6wU3l1b62tSES9LSK/YJm+iI0pcUWT8daJuNl9HcUfwK064qStDGmEeEBuhdUc6u5
         WzOSP5o0Bm+EXc98XYExkZjCUJ8xb5ycyAAUSEPCJwr0/BNHGZZ79XvRgS4g7begkgAI
         sQFNt1PY6u39SMwOVlL0Whpa7bEdbhsLeThdJvmk9WX8/svKaSZEtoPzMpO5h8ozBvGJ
         SEqg==
X-Forwarded-Encrypted: i=1; AJvYcCWi9q0YPyXbdxlbsm0zy8hwFr2Ic4gOONH8036yDyphJ6Yq+qPORp9MhzDLdgp87EZMsGlHAmKyc973mRkVp7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOiVgIUkIhMtTbgX1UX+Z64QC53UqesRFpt15/jbYxB4gP8QH
	eDKi5I7fqXDu/nPDB4NwVzB2WTjS/EdTTEovm7Z2ViRVTxnv3GD+xZRlf0PxIToutgC3RwmAtTP
	VjJIUBWNfd2NuItE0bg==
X-Received: from pjal2.prod.google.com ([2002:a17:90a:1502:b0:34a:bebf:c162])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c08:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-35889194a48mr474071a91.26.1771384964802;
 Tue, 17 Feb 2026 19:22:44 -0800 (PST)
Date: Tue, 17 Feb 2026 19:22:29 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260218032232.4049467-1-tjmercier@google.com>
Subject: [PATCH v3 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
 for files
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
events to kernfs files.

Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
but fails to notify watchers when the file is removed (e.g. during
cgroup destruction). This forces userspace monitors to maintain resource
intensive side-channels like pidfds, procfs polling, or redundant
directory watches to detect when a cgroup dies and a watched file is
removed.

By generating IN_DELETE_SELF events on destruction, we allow watchers to
rely on a single watch descriptor for the entire lifecycle of the
monitored file, reducing resource usage (file descriptors, CPU cycles)
and complexity in userspace.

The series is structured as follows:
Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
        on file removal.
Patch 3 adds selftests to verify the new behavior.

---
Changes in v3:
Remove parent IN_DELETE notification per Amir.
  Refactored kernfs_notify_workfn to avoid grabbing parent when
  unnecessary for DELETE events as a result.
Use notify_event for fsnotify_inode call per Amir
Initialize memcg pointers to NULL in selftests
Add Amir's Ack
Add Tejun's Acks to the series

Changes in v2:
Remove unused variables from new selftests per kernel test robot
Fix kernfs_type argument per Tejun
Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Tejun

T.J. Mercier (3):
  kernfs: allow passing fsnotify event types
  kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
  selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
    memory.events

 fs/kernfs/dir.c                               |  21 +++
 fs/kernfs/file.c                              |  49 ++++---
 fs/kernfs/kernfs-internal.h                   |   3 +
 include/linux/kernfs.h                        |   1 +
 .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
 5 files changed, 175 insertions(+), 21 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.310.g728cabbaf7-goog

