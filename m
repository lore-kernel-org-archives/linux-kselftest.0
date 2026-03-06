Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EB5372B3A
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786073; cv=none; b=bVzBtymb3IwY6xZ69USNONTELh7RpUqQsL1tYisjoAAf2BTj26pybRB5K6ZTGi9r1+dGnS80Cr6zpnqTqAnDhJyUI6ddtVdQpqirLLCqP1sKr2uTNhrWwhn5NVyX55CyRfjF0o9MflL0gRR64p4VCSEEkg28Ucege7ivwP9/p5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786073; c=relaxed/simple;
	bh=clVf7GqR7W7fSCjiWJJXJAaVwuefWYjZHusO5/YfFSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiGleZOKiKJzKik68K895vTpNsygB+7cB1GMuUf3fLXH5H6dl5n5QRrMC4vNJYHKeeeeKhDEM+y0fFgq8TJdSX88g59T1Fo82eV1qirTw9lvh4VazHugx+/OPQzAijzTtjO6IyvLNVE6PWyFfeHJLR+ijZsK69mEmGjZPN+LMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVYyuL4e; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVYyuL4e"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso6691332eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 00:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772786071; x=1773390871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNnmYE0R4N2smug7XMNMUgUzL8tG2gVRbeEqqmNaiP4=;
        b=QVYyuL4exvfUQB39je7q/FSlDDCOQid5XeIh8+3H69v5Kc5ETHxmuDCVfH+NA6+yND
         M6TQXwJLbcobWT/Lst6wnOqpKjlohEhs3ElwgpkF0gFwk2HCtruRwwErDjP55P9Czlv/
         RVvWe3QXhAaBjyNP0HHnZc4WE6raNOMwPqMJgB9kI7NMLvtGiNbBXvPjH0mnXdFP5eep
         KUZGnUgUI6AALQ8AusrP35mnhOmJhkhO7Sq3P5YbxTYiyYIZQrKKCa0tOW8P3wpOy2dy
         WRnAOnodcmio/At0zxULXri7T5pIhFiDGpt2p9Xgp9g4Tkbd+9DsS4/CdGKTpF66ocyF
         Zt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786071; x=1773390871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNnmYE0R4N2smug7XMNMUgUzL8tG2gVRbeEqqmNaiP4=;
        b=bzyTYRx+RQKTgtQA32B7HcI7Q0B3i99iThxX6QHaoqeVxtK8zZBKdS/DjeLyX2SzPD
         DAASrIr75XNHy7nILtg8TZUufgXn20Yp0u2x0osRZ7WftuqB4gUg3l9UOdq+irNI0zkx
         i7c0034Mhe66E83h/4/qp3arnSRAQ1hb1oJgDKJkHptVdg25gkCBczaCasTg0+hQIDqc
         8f8DQIndKYnhOLfeGIHFgNCC1EEaXpyXNi5in6Rwy0rfErWTj7Ny6LcUhc/Hfs499ZMS
         k5mvP6k3a3DIJf12M93E6LaOxNsX4PcDcwvR8N/TNaV4w63orExBtXTUtIQh0gqDrERn
         gcog==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZymqM6iuztyNNakAvsPLNNeqHFw8k2pLpdRHslEZ67D5p+A185xjPdz+8xDuoFy7Ldr7asd4ZjyohcXN7oI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0BNx026YQwVdz930wzaCfxfRHYP/b6/AHB/Xt/eW6DNcZGER
	ZhhSwLaPdZpJAhnfx8ekBmnjD4Ryf/rAsNE0F/74lj2X6UKmKfNGZJDu
X-Gm-Gg: ATEYQzw/8bLAb0DmfjJEucldEBlso+e27dCGBydUPrQekOgXB4V1QmrCXAw0N5x7ygG
	JI1wikxJs+qa0/GAMrSyTdVGL0gDnJkiSHSaYcH34doAUbZ6VuoYgxmnchWfP3q3woju/EDgtUC
	v7yR9iJw7wfO30x4dVYh99bHVLKzDamw7EOGcAiQGLvkdzBIS9G59zM6YVmOmi/35Fw1ryW3D3h
	C10jp4PgKMdhip0TW+HNqDdnCLWE1ntqaB6OGfKOGccVkglzvCM+idshTCPyqvh3kkUmFO3bbBy
	lRKCejQGrwLvH4Y9HmnRwypjuOYkIIxFfEvd2keq0/azVDdamm7fkZMXRQLrpRGnLMgHC0G3DYt
	QVlS1ehTv94/cgFFnHrvx3EaIDTDYR3SWnC3Ova7GzsX0h7YOxGGv1/5sCW7I3yvdyb1lMLnbff
	11DVDjICY2f3pjE0Q4+NLFrkwTMDd4erTwCjTpXa5Fgd/0itS4fEArZc8sW0PCcLXVLfxhe+KQE
	I9O65NlD7Y+mJcNOdZ9D9EyxxepY4EAKw==
X-Received: by 2002:a05:7301:2f95:b0:2be:e4b:60d2 with SMTP id 5a478bee46e88-2be4de766demr563325eec.4.1772786070906;
        Fri, 06 Mar 2026 00:34:30 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm680324eec.6.2026.03.06.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:34:30 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 2/2] selftests/bpf: drop serial restriction
Date: Fri,  6 Mar 2026 16:33:30 +0800
Message-ID: <20260306083330.518627-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306083330.518627-1-sun.jian.kdev@gmail.com>
References: <20260306083330.518627-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/2 added PID filtering to the probe_user BPF program to avoid
cross-test interference from the global connect() hooks.

With the interference removed, drop the serial_ prefix and remove the
stale TODO comment so the test can run in parallel.

Tested:
  ./test_progs -t probe_user -v
  ./test_progs -j$(nproc) -t probe_user

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/probe_user.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/testing/selftests/bpf/prog_tests/probe_user.c
index b3e17a329cb4..7a9d13aa2c87 100644
--- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
+++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <test_progs.h>
 
-/* TODO: corrupts other tests uses connect() */
-void serial_test_probe_user(void)
+void test_probe_user(void)
 {
 	static const char *const prog_names[] = {
 		"handle_sys_connect",
-- 
2.43.0

