Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F12DEA75
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772080276; cv=none; b=q1/aHSfPF/Q0/qrmhr0p7GW8+Op/4YAD3g9GJLYcsQkPY2A7GX393oPD/XOSK0NudALB73x6eOB6+gBh3oheu1Ddhn/6ieAQyvvtjdnI02f+SrglaMEOvuSNjORt1gsJlKOvh2HidSmIXz+FkOyF0YursK8WfZyMyQASgbjczzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772080276; c=relaxed/simple;
	bh=nK8qcsqNVsBEnxLUHyrMO6wpcLRHMcNreNEXj4ei7ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ38wULE9cIIGeAwunA95FN1v52iPYHEUmoU6e0axlV2ycjefas1JeXiAAf4QCWn5xCE5aCckQFhF9lP8WB8/shSk4jLMadboA1UnHKUweUWv09bU55QTkjo7GuoW9dTra8JRUXeXT5jG9JihXEcBtqblgxwZx0AZ3AA2Iu5dV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDvt4FKu; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDvt4FKu"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c7d04890so157757a34.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 20:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772080275; x=1772685075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c+X0lwtAWesW7kcgtGHzcZxnylsx7SbXmwTh5mC2Kk=;
        b=JDvt4FKuNOWOmh3M6EukUfOqPnH+ItAbxtDPHAWhZhReAb9ODBVWkf0qtC7+DYZ88d
         IkU1wzeOY5M6KtZkoqStFiUrh1KvyEOYURkhwoT7t3J0Po7/4vpL5K7NjNRjFMgvLIoc
         PxvSP7A9FZNWmrYkacvxL2scbHOaWSTkASa7nS/cLedyrx3rSyCJClp+Mg9FlvjYvIYL
         dVAIaY9KZ8Wyf3WOQMJ8ebqhFqUtlcpPurRd31oT8V1DmR2dgWGcNdVNCLROa5mvfNVc
         egcnAGJMVQRKGiO86SMMOn8cHmiSn/jsgTYav/eHOQ3g+2fFOY4GcUOyHGt1wykgkgFL
         Fh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772080275; x=1772685075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7c+X0lwtAWesW7kcgtGHzcZxnylsx7SbXmwTh5mC2Kk=;
        b=OfCKVB4DCXrFiO3oF9/+FUdXHq9cwqsxXHCTv+48iLfZgKdOqyxkFsfcq+YwrTmPFA
         jBhecWQ4oVyddGgpTO4dL/GNnkjGkanM42+TazRS+8U78BAAFHUfpVuC13X459xCFjn0
         0BgAjFotlXWD+7HpixlhJic5nO6BkVDFuuR8lqHgeK0CgGCMDhY8GQ3V/iWPgSejNL3D
         Zkd6OThF5DU4e2ty5Ghwe39ua1JhCLFA6o0SpHrz+Wj/t5uGMnUjoKgksMcySxrukn7I
         6N7M4QTyLFY31qT8b6iUNgbQ9Ua2zcgo+qGA4vYenYIb9fURhuZOfRmGW0OtZBq8fwI4
         JZFw==
X-Forwarded-Encrypted: i=1; AJvYcCWxXbIt9B3IZ3HUP2E5EztEofK0ADt5iTRkja0xUmyivqBVQkGMQUrgoC69M6RUNM1mwNVYyDNF9OTRTKTuITs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQtPo19URz0UVr5CLBIrDTk2Q8ptEcZnIB6W7kPYIE5IQ1ami
	oZp58ysNoXgzaLM8cdMw5fw6qRPkI1rgOmIif/1uQMhpO2zVHsLu7Twp
X-Gm-Gg: ATEYQzx00nN6rMYr+u/RVivNHArROC7rEiKLCyQKgmsCEtw+tazzSDh9bBfLhATro1W
	J2AjZp3eDGwTjKMKWckwNCfLgGakKDmW32JXU9SsdPHcp7pYXg3pWINDDvZkI0Itqj/KaxEtKE4
	doHfQt2l8RtUVKRXKS3ssVtGugdRU+G3ISDdWkB6J5zxrLdaOdNxd9jgI/uxT0JlNfbShxZ0Kwv
	mRJVUul4Sre4KRkC+GToki2ojlt6CQc2iAKYZadukpWnbX/xcJGUl2wlEnkqVbLv6cbGI7LUFYK
	KOUz5/cVTaEefutybKzKrRX2uA7CAjP8W8fndwI/jeTvQsaKPzVNIHVQdFJFFcrhSGW4MADWAkL
	3r3/iuJEpB7N+rMhBBhvFkxaMoQhzr/gyrs66yqE8OfEKk/703xwSXPhj9gnGQ6exmq88WgUHBt
	83D+MHVOb35f7SN3rW/J30R1VlHrcvKyyBAoCtuxykdkKpX7ZHaQvuJlePYxQm8Mm+sNmX1HaGs
	I8Jch2mSAGtY/QSHgXiOlo=
X-Received: by 2002:a05:6830:6419:b0:7cf:dd63:3d52 with SMTP id 46e09a7af769-7d586f37d0emr502232a34.18.1772080274771;
        Wed, 25 Feb 2026 20:31:14 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm806659a34.23.2026.02.25.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:31:14 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 2/2] selftests/bpf: probe_user: drop serial restriction
Date: Thu, 26 Feb 2026 12:29:49 +0800
Message-ID: <2d193ef21754e23bc915645d9c54d3be8ccf4186.1772079741.git.sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772079741.git.sun.jian.kdev@gmail.com>
References: <cover.1772079741.git.sun.jian.kdev@gmail.com>
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
index f50ee4066759..0ace1cf157ca 100644
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

