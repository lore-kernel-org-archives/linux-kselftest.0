Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA013B19D5
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660096; cv=none; b=pC/sB/u47xjANCbcdikqb6+jCREGbCcGi+mI4R1AXYv0jSWMZXb7ccfhiSHaF4Yh/1/RPvsdwm+zpAiYgC7tS5s6LabLH0W6mokOEyLa+ZA4Pq13R4/BoON9n2e9GRP/yzszsHmOWNKHAV2drqW+Eh+p2u4FnASwIQuZsVTRq3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660096; c=relaxed/simple;
	bh=wvkVBIt5AajrY30Uy2bgLVAvo5bOvIGha+cMCzRnjUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eN42dUyuFWZLjuJb/KtkD8/w2W5J0YJRSMO7Jv1Yf2FLLlXAs7FbmIYYw9uckW2vLc8V2ZHk01WgY3cn6PKYBWAYWzfbiCIdHlammMEpvjXjeVcj61MuLSC4h/0pe7u8Le5b3djpywi1EUzTUKqUd7cILZDM+zinofFps5dqIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4g4iKtY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4g4iKtY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso5439725f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660093; x=1776264893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=baKfOAhSwE8l4WQ1pZT4bGLMLb7Y9E7/47saq2sORVE=;
        b=j4g4iKtYlKCmDaqbu5PTJCplL+pGHnGxoSJO0uaE3i5sYygs8pEIHkH9ZPJ9gNpDpE
         o1dxdmLmS0yp4xVcjlrku0kmarZ1yUyQTE5PZfUs+BGnXWR97cJtWvyBTEE3z+2dAM+Y
         IQpGC6XcQJynsC6WpV1/DWJ7/dAgCncyk9Q+5U24kBCKwA/lqPfLsV/PPK/0R4bUt6+P
         EmWyxtwVpiwDs0/7reSoAk+HmQ16xxToXEZuFGK6/3qM/qQ2GasYpJ8YHvHKcgG+L4oP
         HbA6zuPUdG8Xtxj1DvqhneUt/0sEL6Wa/4hxz399ndvM+hLb5Sb6hO2TZ29zYAAYHZ1D
         /2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660093; x=1776264893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baKfOAhSwE8l4WQ1pZT4bGLMLb7Y9E7/47saq2sORVE=;
        b=jzE4eCBZPwOJNj8xeSnfIRPrxIIdSJYZC3o8btUQI68WkzUrmKgrU5H+2t8vlEuv6t
         Rrqhye5B9OtGiv0SxdGSpKpSjpbzrMYbXxCPg3ErRzNSdIXfMwb8st6AvddXPFXQMS2A
         9BN1iVw2tVGz8DmeFhLb6vuMqq0BlROac9mW59RQMwIHuUda6biPhm0MgDhkDIYOsw6L
         HrlFrf9vGVQbw96CNntDer+CbG6Vh288acsxf5ZRlcxlJ0LH0tAdLsh/pn8XUTD1fq96
         552nAJpVWVSMEWvNuUIpAuJhvVEJHl9E/oCLm5eoJDHB9v350mboTy/eTJp/BHD7ta8M
         P20w==
X-Forwarded-Encrypted: i=1; AJvYcCV+FX5P6vVzR1iOC7vGa7eKCd/mgzvyYOJZwcMoDec1hwrebci5g85YXD6Z2hI2ad0E0ox11gjfrDsQnY6YUzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMOrn8OJ1aRFgCK7RObNirCvMtQorroMrVlkYn064yf1cDfBx
	nZY4fTzuQh77pM9FpAqXgy3i0QvfXd+QyIrQw9vazawCQw+/uprkXqBT
X-Gm-Gg: AeBDiett28S/a6T4M72j1v7rAuMtnMRwfOPluydw58ZcnudKrPJXWdQbme4CIbIKrPF
	0W+ov8mLG6ogji8PycqHpq8isbxUMbSovyA/Kql35gwZFws7lNcU3Nfnzd0cxQzuGsJ3hT6/otn
	I7rVDxfV8jAmw4SC50GPGKs7rf1FaO5TAKySlEoyz9P7+cuvfBTXDsy++OqxHuemk7q4zivzstz
	qSqifJvaqtMG3/aWzVqNhHU6iL2/A4FQ8vtpqsL4aeVHTrLFVzaxUxcuDaRhqj+q7loXRriae1v
	WNNvN+pW7QLm2iCNbI/eTIeNF+0/Hb/sZclcrIHixG/wrKWlZ+EXz6Ut0OUAsuT/UvKV2zZCVpQ
	QGDss1Egh/CS01zmT1m5x2BfDdD3DKdEnQl/pgTRWXTM7Nqqc+FFfVIRe2dJhwHdI0Nskn8RYUw
	9KS2zWT4vv7cvihpmzUkRu+xkc
X-Received: by 2002:a05:6000:40dd:b0:43d:71b:204b with SMTP id ffacd0b85a97d-43d292ebf2fmr33731412f8f.39.1775660093254;
        Wed, 08 Apr 2026 07:54:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::3006])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm55762103f8f.35.2026.04.08.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:54:52 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alban Crequy <alban.crequy@gmail.com>,
	Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH v2 0/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Wed,  8 Apr 2026 16:54:34 +0200
Message-ID: <20260408145436.843538-1-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds two flags to process_vm_readv/writev:

- PROCESS_VM_PIDFD: refer to the remote process via PID file descriptor
  instead of PID.
- PROCESS_VM_NOWAIT: do not block on IO if the memory access causes a
  page fault.

v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/

Changes since v1:
- Expand commit message with use-case motivation (David Hildenbrand)
- Use unsigned long consistently for pvm_flags parameter (David Hildenbrand)
- Add PROCESS_VM_SUPPORTED_FLAGS kernel-internal define (David Hildenbrand)
- Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
  which is not exported to userspace, so UAPI headers using BIT() would
  break when included from userspace programs (David Hildenbrand)
- Add selftests (new patch 2/2)

Alban Crequy (2):
  mm/process_vm_access: pidfd and nowait support for
    process_vm_readv/writev
  selftests/mm: add tests for process_vm_readv flags

 MAINTAINERS                                   |   1 +
 include/uapi/linux/process_vm.h               |   9 +
 mm/process_vm_access.c                        |  24 +-
 tools/testing/selftests/mm/Makefile           |   1 +
 tools/testing/selftests/mm/process_vm_readv.c | 368 ++++++++++++++++++
 5 files changed, 397 insertions(+), 6 deletions(-)
 create mode 100644 include/uapi/linux/process_vm.h
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

-- 
2.45.0

