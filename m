Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870A2DFA3A
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Jul 2026 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783288514; cv=none; b=ps8vj0e3VH9U3OvyWni+71EsS2kCdyLzIBOKmK7JAA+OxjudUJPy7mjBoudbqD3bziXC1B0hOmUYrbYO86kV4T6GJu5qzESVZEejX/ddfh5KiUfQxzfajl/DZ+xARj0bmp24sz1vK1QugGYBYTvP5glSX28Bn3lBZZN2DCB+eYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783288514; c=relaxed/simple;
	bh=2MsExnvuYrMO9KVmvVKeJb/z9uFAjmtZIrAajNnEKSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDMn6npx2ppvwCNPUREG1rLHY5dDGAqOlaEtmZOHvgvqmeYj5+mWL9TolJ6Fz+AMyqMbW59uZHvuB/78ArQyrGZsGt4bgrKXZ+X4G3VR5cplzEQ0omVJHV03hMtq3YPGzqtocy530/8+/DG+zwqfJvPw4ZLrYSSezG8JDZCCEGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA+liGlU; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA+liGlU"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9f6b94a49so1296651a34.3
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 14:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783288512; x=1783893312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BNmO/nSJ/zuyfL1He4LEsZwukmVnEntNkbHxW3ZPa4=;
        b=cA+liGlURb60wiYQfOch7UjpYLFu+TpqPRA5nsp9lV2MUzNjXXMMj2vao5AP6iSigm
         s+nNoIhBJHbXu1yZ8BwW+eOZ0HTNRzVs/PPqE7UpS+/YahcAliKsKF9E1SbVga4WcXFs
         6ZMagF17kJ5L+YVjJXPla1fjk4gdr/TaPSAyessrpjUpunBvntaSFKFTG+fZRJj2uQ2b
         tqoIWCvy7eInlJ6N/cJqyTFNx61OhyH4k8OvrhfByRKbYntcRS7gR6b4la2qUNLoyzfn
         MxYVqfrfpFEF8T40YeL8CsbsvnGOaoH1YdRueolmP3KbjswdwK6earkep6jIQN0Ox6ZA
         0v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783288512; x=1783893312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BNmO/nSJ/zuyfL1He4LEsZwukmVnEntNkbHxW3ZPa4=;
        b=krLOAkZJsPyNjHzTsT0EjpQnbLfEs27EfB2i5oOpVeljX4O2D1qd9SXaEP70gG4rBy
         k0sNUx7Oddier89xaDYfp9zzhRrqkUnoUJ7qX66o0RWfcLFVOmnoEPuKsLrQiTo2jp6C
         fwPoXlEwrCLEFkpkGDFDG307rGEjMDIHt2m3a9z+dUfeELJybVHFvGqW+ED8bd3zOhGa
         BAqWBmQgxXnUwACbZ3qB7HUYqNbxlGumPdYmChxRhyPgZ1Npnd9HkWVj2ibXcHERPncA
         sw2fljc6XygfcLZYPt5Zo1G8xgNeM7RIJ+oji+W4W8VVCYbK997NKa1TTCOIQ3fukaUA
         /2QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IJV/vUILOPtfTzdx/iyrnNnfReC+QauYlLNGcbkSp0As2bXMR3dWUi4Wm2voAJHAt/7xjesqDjoGC5MbKL1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFvuJbdxYXKEMXjtNqHwnkK/3BIG68NY6rwpyPtN3COdzXkwn
	VHt/ziCl+Hi57CWJh6XN5P4iTR2mF3kDUwktgkHSrieiJthoKesHYPm1xQGySmgY
X-Gm-Gg: AfdE7clHBL2EGt7ZpLtSbaAJqlE1zoo9fHJtGSqWpU3B+lBLYZKslMZRQbe6R9UscS1
	w5qJ/uhRIP4h/ujPdQoi1LnRn96DCNDI0b7yvQa95VlOm80gTjg4ilKOCc9prsvGXskZW1kDr9I
	5pv/q++xE1+pPqk8Un1QKvN0JtQTz30aJjK4yEMGxvnB9/krkhhBKySJHnWd77geF2IFzwyzA5X
	iOOoGsh4tpeiPJay3+z7ClB/TZ+UeNLxcUP0AU3aHwlCSMDDHUi8HNUuzv7vKCtFDKPBa0iDUZP
	E8JFmSaXpytrSfKrHvm0AMVnLr2avKQjuQJsKnS0A+3xm/RZAkQ/hvCdsok5CX/mnwxBrQJ6//i
	hauFnUXWrPdlAzln9ZKyohKgpgNySIjJpgbAsrPom4bTGR219MK9Jj9gl01lAiTI+HzRVUpC2Ov
	gZ84a684eU
X-Received: by 2002:a05:6830:82bf:b0:7e6:c9eb:535a with SMTP id 46e09a7af769-7eb7fd0bdf3mr4798640a34.6.1783288511994;
        Sun, 05 Jul 2026 14:55:11 -0700 (PDT)
Received: from fedora ([189.146.106.138])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm9955434a34.8.2026.07.05.14.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 14:55:11 -0700 (PDT)
From: Cihan Karadag <cihan.cihan@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Cihan Karadag <cihan.cihan@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/rseq: Add missing test binaries to .gitignore
Date: Sun,  5 Jul 2026 15:53:40 -0600
Message-ID: <20260705215346.1132764-1-cihan.cihan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

legacy_check and check_optimized are built by this Makefile via
TEST_GEN_PROGS_EXTENDED but are not listed in .gitignore, causing them
to show up as untracked files after a build.

Signed-off-by: Cihan Karadag <cihan.cihan@gmail.com>
---
 tools/testing/selftests/rseq/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/rseq/.gitignore b/tools/testing/selftests/rseq/.gitignore
index ec01d164c1f05..9b6eb6c3922f9 100644
--- a/tools/testing/selftests/rseq/.gitignore
+++ b/tools/testing/selftests/rseq/.gitignore
@@ -11,3 +11,5 @@ param_test_mm_cid_benchmark
 param_test_mm_cid_compare_twice
 syscall_errors_test
 slice_test
+legacy_check
+check_optimized
-- 
2.54.0

