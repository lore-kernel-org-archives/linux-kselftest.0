Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EAD136358
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772080269; cv=none; b=Ni9UsJgNjXQuEXJzMvEolTC6aua2fGqtwd/Xt9Ez/9Zzns+Dd4Zaw22Ip2dq3dnc/8Ps9NSuj+E6obpNtTRXVe8Qkl2hqWeCVolStD8crNCYxJwTe5Ox9jD3NWBHV3vwD+rt5CAUVWqSvXrxzo2crXlYxfPFs1yQgMbgpVYg9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772080269; c=relaxed/simple;
	bh=8EcXOIfbxB7R08O7d8G9wK5+qWq7+MR2cpJanGaLWT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXkYhA4XBCHjum4tJ2hwn2JlsUdfVK+pWX/lTLUtno0jF09DiI+AqOeziciLrylTj4aR96y1PGtZF3AQBDEke4AFc13TpHJlZ5R1h4f61SPWrBkpC6n62CdEOnzdh9wsoL2oxTY6JwF0y1u8+ElTUGMj468gh4O4Nj0FiD8OzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk36eV3S; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk36eV3S"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d513bc15c7so461356a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 20:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772080267; x=1772685067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYwfESLjaCDRSRMKB4RVN6Z8w5OQLpXEkzl6yPxOR/w=;
        b=Vk36eV3SWC7hpBZiRmwr6w3f4QgaGXtYMCl7L5VXZNO9fF8Nhw62Y73MDbratIrOPA
         +Y+X08ZDW4/QxAqumMdPEyjIZcAahcG9g65YPgouYznAjzeI+H4asn7cl8M98DdroZgW
         N1VjLH0odpwkrV7iWDOSpgaGBgDEXIWNHGASImhMafDT8Yd3RNMeRwjjAsFo4t8Mr09V
         Q5I8tyiNCBePLo4OrDDWeJ45Qfx9Ojqun/Jv/fe8VFe1HcRMJTfrJgYEtyeqQ0sj4J7l
         Cpd+NiibBi0sTBSoF9HTahKVjCv8c/KeAPpK1ETxBHFkUJQ305QCrX7SnroXDMNlVINk
         OatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772080267; x=1772685067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYwfESLjaCDRSRMKB4RVN6Z8w5OQLpXEkzl6yPxOR/w=;
        b=DjUOaXuGe9WPXJ5cL2ycgMb0WGsU3EX30HJ0R/jb4QVlzE3FFOmUNM3k/rD3SnsaK0
         5FYfUQeFz1q2bL8hKklGZBvv1B9dvL4qgr2uefo6+PgCuJJqOryiq+CYZjekShgCcxhe
         hEYUDL4TbFqQBzPmBkTtYxt5uUC2Jp86x2F+rs2+wAhWQjf956e1yvZDCmi8smksnDce
         62C24lwQU5Vcta0+22zejWRGU0sXeKHaoxdfv33YjEhoOmfjcCQXQsnQ7vMZC6/AcsBU
         swJk82sX42bGwhRV+TUIatXDAA5fQS8dzraYa5NOlAKO3pxAak276+bVyL89gqUzvii0
         x/ag==
X-Forwarded-Encrypted: i=1; AJvYcCUSdWoLQA5mE8jByQ0dEP2aZFKP03elHC87HDiMJ/lOfD2aTGkI3t0rgGOxPVY5UevIyjm8hdlu13S1I4816wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFf+FyDM+OCqJxgR7hel41CiXLtkJbkxKXdMXRwAsKEztl0OHR
	KcC0rWOQXMUvMH7Mv71vtP1/69s7BuORLJzF0R9PhyCvHbS77otI1pCE
X-Gm-Gg: ATEYQzyqVJ2cg4BGQiIHysWP5YT8puEZvMYYCOKEcnLXucy8G1xgbJzzgcfdo7Ofi5n
	z+cVhIHAVf9hGwBa3Nrtfc8LCUOwJGze8wf6M0OVjNr8gML2TDumTztxk0A3sIfJsgAOpsu9Mgr
	oV0B7mbJ2QqPOvvz+MoWR8qlhO3vqbnT2CySp8zGJ5MjB4H4C09deX/TNNMf8RAifHAW8QNeHet
	DOrAzCNChVPP4Rr+EJSZyBAKMZy8wBkATHk0kD+wgXgmHwDG9saRA6nAim4vNUlcU8HSXaR+4wt
	DBPNomc6D9feuKok/ukPVT1sYMS1AVUf5pqyfUshkfuemEOPaQhL1exjXPU7NN+RnukzBPwNzba
	yqUAOhkj0I3DSWrFxnOlrqpf6jmMMuNg1LG1NrILLyPC2tWlpZ+GLowvAU+XtSpUFGGgSOO0Kl9
	v/dq6/9T83H7JFqjmsLpIZS+Z83j3niCJjPB0b+l8i5FEPTme3mneboVOwNjeviZx8aTtu6R5kj
	3D2ANaSxJlTCLm+gfXQ5P0=
X-Received: by 2002:a05:6830:3908:b0:7d1:9832:4796 with SMTP id 46e09a7af769-7d586eb9657mr684628a34.16.1772080266855;
        Wed, 25 Feb 2026 20:31:06 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm806659a34.23.2026.02.25.20.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:31:06 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 0/2] selftests/bpf: make probe_user safe for parallel runs
Date: Thu, 26 Feb 2026 12:29:47 +0800
Message-ID: <cover.1772079741.git.sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe_user selftest attaches ksyscall hooks for connect() (and
socketcall() on s390). Historically this could corrupt other tests
calling connect(), which is why the test was marked as serial and
carried a TODO warning about cross-test corruption.

This series makes the test safe for parallel execution by filtering the
BPF-side instrumentation to the current test process only, and then
drops the serial restriction and the stale TODO comment.

Patch 1/2 adds a single-entry pid_map and checks current tgid (process
ID) before calling bpf_probe_read_user()/bpf_probe_write_user(). The
userspace test writes its PID into the map after loading the object.

Patch 2/2 drops the serial_ prefix and removes the outdated TODO, since
cross-test interference is no longer possible.

Tested on x86_64 (clang):
  ./test_progs -t probe_user -v
  ./test_progs -j$(nproc) -t probe_user

Sun Jian (2):
  selftests/bpf: probe_user: filter by pid to avoid cross-test
    interference
  selftests/bpf: probe_user: drop serial restriction

 .../selftests/bpf/prog_tests/probe_user.c     | 16 +++++++++++---
 .../selftests/bpf/progs/test_probe_user.c     | 22 +++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)


base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.43.0

