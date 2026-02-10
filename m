Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07D1F37D3
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 00:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683907; cv=none; b=FUD/du6m+6O/hWCMxQ4t+Xx/t4p+N6H/EKrY4G0xmf45l1r4ISuL1FU/xF72Al9iGLgtQ7Kbyd+K6FqgUfybRlGOGui4cLXwjemmZMuMW7I6TfbNtDnYRHKt2S0UgLzfh2sIYTlG+nHDWoXqWk9P/2TWixoxr1TgyUJBSIQs3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683907; c=relaxed/simple;
	bh=PJxIqY9BILo/Wb6xL9poQCQMqT1HyNX/z+OFEJERO1Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aRCoQDIeU7gtwDP0O+uNqt/OzR9dXJHh7goYIRj+mV6axkAdve9kwAUPlh3zc19kw1QZDXUCxtSmsuGcXEOQdba7sqNMj6bkXph45MOFewZjcv2kiDwgowf0FgkgkRoa+E2wudR/1kwp59ftjxdWJHM4jkTb/yauZwB7POImkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLw4EY8Y; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLw4EY8Y"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6097ca315bso11004154a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770683905; x=1771288705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ToFxyLXirio/gELGdBsIPVriUiQfEmrOHh3uciwjmrI=;
        b=gLw4EY8YbDYOxFsFmnop/KMtvNp/xz+nLw4AJ478/ud95s6Sm1Z2VX+jbiVhBZ1K8c
         TZuccQjIv64QgE0Riul/h+nNZId5YBu9vafootIpTxKQvf1mAY5Cg/X1ilSA3dIC18oJ
         x1ajEIpwi0BiPO9HavUT8f9+iCTPe7107cuGbq1a4fXhV/GcDE9lnoPXCppr2U0TawPZ
         PdDcsIL4XD6aw7kZpfbbNlqKAQKVLCYP0m+nSPTKN/vDsxSFXOP8x/hmEV/oBYhGW2Dv
         pue4EBA2MPSBc4IqqvMGfBLNliuPkwZCHuj5BBNSYVOcn6POimpZWFmJtp2ZWLJQVeFj
         vLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683905; x=1771288705;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToFxyLXirio/gELGdBsIPVriUiQfEmrOHh3uciwjmrI=;
        b=FCGVa1z1q66C1hzLH6Kh919vT8lsDbUHNpPPSE4rhHd8lvDe1MfG6u4khLsiZU5P+Q
         Mad4y/KA/a640y/CYywKNWpyB0OABXHE7k2FeuEmnZt0fcbe9OOb7VrQG+z7MTnlFgK9
         iWghWnJ4VK4TCb41fpt8YG8SiE4f33s/X5881jKxDKdmdM4CoqwGK4/bbfb6L0LW2CBz
         FnY6YNYm0Vr6ALQWoe7lB5TRLltzP47Koe6F94V5Zmwc5LYDjoafBnmsnLh5/jzmjHBm
         O5Qr76uPtR+irEnuGCs0qtiAKQhbL7gjUW/eMibOVhl8Bl3hDIwvP2lICKIvLET0uply
         Zs2g==
X-Forwarded-Encrypted: i=1; AJvYcCUBFq+IWEhQ5FFLoWxFO5/Y2+IAUtbihdZ1qnjWh3YB0qRVaXopP5DaskdJtw8wWlRgS3U93dWed+JPcxKl4DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyrpI1YjZ6yBlpsJECYZNrdrKJWsEut6N/ndwWxmngdVtbMtR7
	aGwYGIWIE0881IvUvA2Mx/HQq6/B6T+9mxqbMWwiBXvY8jVpV1h+VrrNa1HYZnwlEsmnaJTYEle
	N+OE3Mvw0OnEICvxjDQ==
X-Received: from pgbee11.prod.google.com ([2002:a05:6a02:458b:b0:c66:e5c8:842b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9c9b:b0:35d:d477:a7d7 with SMTP id adf61e73a8af0-39417855226mr372906637.7.1770683905284;
 Mon, 09 Feb 2026 16:38:25 -0800 (PST)
Date: Mon,  9 Feb 2026 16:37:58 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210003801.2834976-1-tjmercier@google.com>
Subject: [PATCH 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED support
 for files
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
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

T.J. Mercier (3):
  kernfs: allow passing fsnotify event types
  kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
  selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
    memory.events

 fs/kernfs/dir.c                               |  21 +++
 fs/kernfs/file.c                              |  35 ++++-
 fs/kernfs/kernfs-internal.h                   |   3 +
 include/linux/kernfs.h                        |   1 +
 .../selftests/cgroup/test_memcontrol.c        | 126 ++++++++++++++++++
 5 files changed, 179 insertions(+), 7 deletions(-)


base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
-- 
2.53.0.rc2.204.g2597b5adb4-goog

