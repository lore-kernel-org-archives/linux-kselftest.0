Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E47B32D0D3
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566910; cv=none; b=uasET01q5l+mhzcqO1HHG7qoWR3MK9Ik4TxMj/yyXKmcQ6aBtqXOzy0+JPgKiTk/C4virmWjIP9a/ngK7PmHgKJhmGZaK8PegSFJxtRi8bz0bM5hqaXh22ZKF+MqvBuSBkyTEN0iqqzqeG4E8mtHPQ11e3okaxODR0EvYalDcYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566910; c=relaxed/simple;
	bh=SETEcec1D+mm0BU0dgNl2Gb3HG9APdLtZ19G+u8CMQc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=B0XoI1Saf1l8QINNYBnZGJJ5sKIVk2tLNNfvvBiFl18db8plXay3QKJGiSUf920S+5lUOqiiJ3PqL6cIRNcJPF9zhfsI7qBqnzC6Y/FH8NWp/keaZvXVVaDU7V3niEEmaqn9FQmWEdjwxRjwBFFFA7Y2RtiWy7sgGNBzXfO/p1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I4ja4f0L; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4ja4f0L"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso1499762a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566908; x=1772171708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PhOr9xc8hsjU1exlkJ9o+lRZ6CwgWrB0En0qqwGcrsk=;
        b=I4ja4f0LlfshNDN7PredsaOvaI4MSfe7fyNx7Z5nCKc6eVnE0pLROUbjX/FKA93rTG
         SiJL9HkpuaKQzP2UO6X7TIrDKvl28KeKYHFz+Wz3kd52ygj2K6vQjmaNoFfyd1Ax6+Jk
         M0xAYnn0DPVM2372e3Pd9CnjA6MziZ7Z8/lNv3IXn3St2NxpQo5a5NAmyUs6ozELbO86
         /XxJE6iSMHcv8hV/b0BPNQSgI2RMmtn0vXvOkgQQa22bSYb9XuSiwVHSAKzpPp+2D8WY
         3Avsga2DUGOWica3gKQ+wzNITJW5r4Xuu3Cl4IXxZRFPyvNeMXVEpK0uHzvIrFh/4tdt
         Fazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566908; x=1772171708;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhOr9xc8hsjU1exlkJ9o+lRZ6CwgWrB0En0qqwGcrsk=;
        b=bFeQZHnvo6YJXY1SU5h5CFVJDjm/FGyCNKBqZzKGKojMxXlemUnDIUR6R+pyPI0KAH
         tdIjFxPKmaoUeL2kIzBjo5GoNKXk5sZsfRm7eC/ZMCbpdGqev5RHUPB0Hh4zbCHquYHF
         v2ZKIH090PoHPNAQ6c0DlzhxyPgOBU8TtjJ63Tu0ls5wv/CU9y+HjtZ6+F4sAeeGxPcL
         fK2vuqwU7CgjGgqIX/vzfgOyBxI8NTCYITn/GHPAuZliVSDxikDrmFw1pDePuY4W+VnO
         pytdRnJ14GAFWneDuP4da+36NmITKocNFBZItkKuEuZfdUPOybiTS3Y8sqdkxbaqkxeO
         u7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCURlPndQSOdQOJ6G/oew/ifj6YKwPEXjthErPjouoZrOInO15TQ4vfMx3hhXyymWIpCcQfQUF5cp2aP/Ny5PfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMLn7E5SrO2hLy1O3ctJ2VbHSk76jB/7VeZTi78GXteVXuwiO
	iVVbePBH2NUUT3FBe1+mTDoPcgweHbTMpa/bEumgpbnh4RbrvDgCCqm+Flu8MDZHLLBp40A02qJ
	LyxQEA2sIU5os+lgNNA==
X-Received: from pjbsj6.prod.google.com ([2002:a17:90b:2d86:b0:34e:90d2:55c0])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:da86:b0:354:a9f3:68bc with SMTP id 98e67ed59e1d1-358891cb92bmr6358367a91.30.1771566907697;
 Thu, 19 Feb 2026 21:55:07 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:45 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-1-tjmercier@google.com>
Subject: [PATCH v4 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
events to kernfs files and directories.

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
Patch 1 preemptively addresses a race to set/clear i_nlink that would
        arise in patch 2.
Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
        on file / dir removal.
Patch 3 adds selftests to verify the new behavior.

---
Changes in v4:
Clear inode i_nlink upon kernfs removal instead of calling fsnotify
from kernfs per Jan. This adds support for directories.
Abandon support for files removed from vfs_writes.
Add selftest for directory watch per Amir.
Add Amir's Ack to selftests.

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
  kernfs: Don't set_nlink for directories being removed
  kernfs: Send IN_DELETE_SELF and IN_IGNORED
  selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED

 fs/kernfs/dir.c                               |  32 ++++-
 fs/kernfs/inode.c                             |   2 +-
 .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
 3 files changed, 144 insertions(+), 2 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.414.gf7e9f6c205-goog

