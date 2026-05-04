Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F94263C9F
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919705; cv=none; b=bHfQaSFiqWhithcdfj1fUlXP9GWru6EQNwlBGpO8Jrr4IA7MuPYDp8KmSFfCEH8/79Owv+A7+aDbNE5zK38mCElK4UJpQuqrGqZu2ejMVYbjhgv23ouDQgKCpqQL3iIV8MoK+sUz3KraIx+qe0W04wjsqrZ40TsGoe6t3IUPTHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919705; c=relaxed/simple;
	bh=ZCXzVLh7k8zrxOkjneqBq8c3or63s58jUjGXB11l9rc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBgYTLWf1n04dDCxzVtd7QZx9+2vzGpP3TFukmiMYfqBUonbIsvzeCf5+f0KOzMIl6A7/AYmvIJ4Z+hhzNe9YJefJ8OVVg3zHhQN0sM1BjK/MUEXqHYsujMl4g431UpMW8L5LQQworbtv9D6rb6Q9r5+PqHNfdzCWMFRTF10lv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=arjgYJxT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="arjgYJxT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so29227045e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919702; x=1778524502; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYU5gYFLbPPaf5T/z0eHuDOOHmWqKUG7f093weSaqao=;
        b=arjgYJxTcRnA5uO9GCLh3iTIoisqWT3QCiwotvFMgh57kwxkxK/3NAbq0VaNh9SUHf
         6z45+PttjAXzKxJ1mIVLB/vhj0qw0kWPFyTMMWIjMJ2btO77u6wxrSClgePaXHVOAh3y
         OtKH9DK5+DrDVJfW2b9NaC7jHIqnCXfZ2Kj0tIUHdksb5m3YW/wYJDssVujSxuANYW9+
         Hiyts2ApipT4gb0ulc/hNsljYCiEZTVs2eq5lemWfRLwvl2GDg3VFrvqpu/dYz+W6D56
         xZ2ARV907oVDymwwD6wqUr5s3ZYPYhgqqGv5xVc/++jQPAxe4d7FT1kjx6+XB4dI5wXK
         XFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919702; x=1778524502;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYU5gYFLbPPaf5T/z0eHuDOOHmWqKUG7f093weSaqao=;
        b=dWA+b6KG5+scIaEbhMJAVBjkJcLdxiJcIJiuIQKHgWPdFvJPzI8P8M/lRTUd1Xu35m
         8KR4p1bIR8jdrasrTa6jb4vnh/h+q1NdOEfIVt4MSqU9nEEkgkobxNWxZjty/pnz9Xz+
         vonxBZx0n3Avr6SzvOHNn4gatGrYHj/SADZGUCmZieMkWgdkJq37b8q9LIst5jZ3jLGC
         Z0N/1YP+dAPVuWhoUXIbL/oT6T9Rca/sFfh7oRisqgI4q2ZlGkFm0I7YfDNLtJofRXhF
         cEUBxyS386MeHB+Gn3k73HzDV+F5398XGvcnQE3e8OsEKxYj4EUTAO8TrKjNy9ZplLKx
         E3fg==
X-Forwarded-Encrypted: i=1; AFNElJ/ObPJTR90eH7Q2wzaw0rX5D6MCl/UPQd1xVqsmU39el7RNaya/1hXu4zCf4XzPYrs1YXdWjxaS/zKl/kkI80I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xQ5DofiioFWQHibrNKgDpUqc9DX5+Y5UfzbparMEqRtabzcz
	I9NyJR/hGf9V+i/Te9gQDLfDcfP4qUrXEPdCRuud/q+ydZpqDdyCI43z3qk5bYQkc+g=
X-Gm-Gg: AeBDieuMQzmo4Z7USKik1p3j7Webqh3B1b9zqJNDH7m4DEdsnXk0Wgv97G8yETuHhaW
	Z0RaTduA7IQUGH+IzcenBvYXN8MG6ZHRdRB1d8LoFfYablMm0e19Z6cliSyhmCqQ9ezqf3xg9ZE
	Bm03i87iBbNCKxCmbCCymBLoUuVXmd6IanQO9fsgR6iLrCyQQ0yxogOHLxEs+q7AjdHgK0+vLAF
	Rcxm+DRbbXpYQy5Geyi4D51K37Eoe3fvgZjXCSmN3OQHfe3d2LdFRgY5B2QrMk2Gpw3bapdKc+1
	9pzR16ta07QpnsYQH9CID5zKk2N2qBLLsEM5YgcLHwTdqT7LmDYW2/qyxhhKi6lvKT/v5gU1dv1
	CvEC62HmMeYhbEyCXQ8MCY5K0JjwH8D3F1r/JC4q4cfnoFgv6yAorjMHnDCbKoj3u2eL0UaPQXN
	0gIO7svOdaDiY+4S9nWrKffLduptwvLQntrA==
X-Received: by 2002:a05:600c:4b1a:b0:488:8be1:ca3a with SMTP id 5b1f17b1804b1-48d142726f3mr8222095e9.15.1777919701737;
        Mon, 04 May 2026 11:35:01 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:01 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH v5 0/6] kselftests: livepatch: Adapt tests to be executed
 on 4.12 kernels
Date: Mon, 04 May 2026 15:34:41 -0300
Message-Id: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHm+GkC/3XQ3YrCMBAF4FeRXBvJb2O88j2WvWimE42olU4Nu
 0jf3VQFi9TLw8x8B+bGCLuExDaLG+swJ0rtuQS7XDDY1+cd8tSUzJRQldDC8+OF90g98fbY8Jj
 +kHj01tYB1gjKsXJ46fAxKHc/v89M13BA6Edp3Ngn6tvu/9Ga5bj3KpB6riBLLriTNVRNDFpZv
 aUr4QraExv9rN6C+SKoIujKgYNghajih6AngnKzgi4CQNTgRXTGwIdgpsLsm7IpgvXBOyP92jd
 iIgzDcAdlZHgniwEAAA==
X-Change-ID: 20260309-lp-tests-old-fixes-f955abc8ec27
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=3566;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZCXzVLh7k8zrxOkjneqBq8c3or63s58jUjGXB11l9rc=;
 b=gXqdpOaKgu7MoxLhRVsNKp5jGTOcZw7OA8dCObU23wSMhZ7QeQZHbKDJo7eX9c2+UUEVPZnBp
 r+Olb9yDqXDDT4gJ9138OmL35+TxzgQO8JsBLSJAXRvT3ssECiUKsJs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

This is the fifth version of the patchset, which fixes the last Sashiko
comment, about overwriting MOD_LIVEPATCH global variable and using a
local variable to avoid module load clashing when an older kernel
don't support some sysfs attributes.

Original cover-letter:
These patches don't really change how the patches are run, just skip
some tests on kernels that don't support a feature (like kprobe and
livepatched living together) or when a livepatch sysfs attribute is
missing.

These patches are based on printk/for-next branch.

Please review! Thanks!

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
Changes in v5:
- Edit the last three patches to avoid overwriting MOD_LIVEPATCH
  variable, using a local variable. This fixed the last Sashiko report.
- Link to v4: https://patch.msgid.link/20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com

Changes in v4:
- Patch 5 was changed in order to address a comment made by Sashiko, where
  subsequent tests rewrite the variables that contain the modules being loaded.
- Link to v3: https://patch.msgid.link/20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com

Changes in v3:
- Patch 1 was changed to reorganize the ifdeffery to handle multiple archs syscall wrapper (Miroslav)
- Patch 3 was changed to rework the commit message and to address function naming (Joe)
- Patches 4, 5 and 6 where had the commit messages to include the kernel version where
  the given sysfs attributes were included (Petr Mladek)
- Link to v2: https://patch.msgid.link/20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com

Changes in v2:
- Patch descriptions were changed to remove "test-X", since it was polluting the commit subjects (Miroslav Benes)
- Patch 8 was dropped since it was checking for a message from an out-of-tree patch. (Petr Mladek)
- Patch 3 was dropped as should be treated as expected failure for older kernels. (Petr Mladek)
- Patch 2 was changed to use y/n instead of 1/0, since it's more natural to use it.
- Patch 1 was changed to handle ppc and loongson, and error out if dealing with a different architecture that sets
  CONFIG_ARCH_HAS_SYSCALL_WRAPPER and haven't changed the test to include the proper wrapper prefix.
- Patch 4 was changed to invert the return of the bash function to return 1 in failure, like
  a normal bash function (Joe Lawrence)
- Patches 5, 6 an 7 were changed to not split the tests, but to only run the tests
  when the attribute were present (Miroslav Benes)
- Link to v1: https://patch.msgid.link/20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com

---
Marcos Paulo de Souza (6):
      selftests: livepatch: Check for ARCH_HAS_SYSCALL_WRAPPER config
      selftests: livepatch: Replace true/false module parameter by y/n
      selftests: livepatch: Introduce does_sysfs_exist function
      selftests: livepatch: Check if patched sysfs attribute exists
      selftests: livepatch: Check if replace sysfs attribute exists
      selftests: livepatch: Check if stack_order sysfs attribute exists

 tools/testing/selftests/livepatch/functions.sh     |  10 +
 tools/testing/selftests/livepatch/test-kprobe.sh   |   8 +-
 tools/testing/selftests/livepatch/test-sysfs.sh    | 219 +++++++++++----------
 .../livepatch/test_modules/test_klp_syscall.c      |  27 ++-
 4 files changed, 153 insertions(+), 111 deletions(-)
---
base-commit: 712c0756828becbfc629ff8d8b82deff5d1115e4
change-id: 20260309-lp-tests-old-fixes-f955abc8ec27

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>

