Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAE2233134
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783163438; cv=none; b=abrShDI8LrsSFZTxmS7UgRPoD1/72Olaw0RVA7XU8WZr84tSW3MfYoYlm1YmzRMV/9RIJWI0QqeHMfVP0f1jSarNjb1W4GDjF2xERCnU4HFylHyIFNyW0zsUuBZ5K9kHvPz0qc3qwOTrHLd4rPCQ84zOakc4mStgBZcSeJuCnC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783163438; c=relaxed/simple;
	bh=VC0lbd93weWWPw0ARHHgPYB9edEsOZyLDpgojPf7rOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZLwoY6MC7qEncwJGZoylRKZk/mAKP71MYd/aPQ9Wa06bBTG+pXMYrTbvigYYOP/jVmOlmhb8JMbsuiaSFwfLF/htNYMZ0S6h4tl4tffleaSTkNCBgO28GMuvZykEIPK5TlMjNQsqnfv9+h+a2Iuqrqo/4otYRCjVo8LLE4OOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi8xKEOj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi8xKEOj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845e47133c9so1285299b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783163436; x=1783768236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARFUOtndToaxiivfKYhDrkkb5hSNxGExw8ndgTKm3ko=;
        b=bi8xKEOj/y3xvuKg0UCthjb6j6HmmglrsNWVyZRM0RyAyW5tqiKSI3Q9cxKLCCm9nh
         mUbGVI+W6w2Yrg6zrjqkkRpF7JGCMRM87pJJwjJf34XFjQ37F3vuWIlOm7BxWpe4CPRt
         1CGgi1yBgMoLBHGL5XJZ8gb7igdFkOlc8gJoIgu8dgVRmdBnNyQa6Kxp7eQgTFqTguJv
         7zD1w3+GwP9KB21I/5T1E9qW+8vZkirNi0ti7us8O530HlmZndFYQNX2u47l/AaBkwnY
         XC23zPJkbZkGGKpU5IlITa8DUOERVekmKAExEA4XAMv7Edm/97Xul0B228m4Q9vZpa/A
         bbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783163436; x=1783768236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARFUOtndToaxiivfKYhDrkkb5hSNxGExw8ndgTKm3ko=;
        b=E2VJYacigPC+0SmSiWToXXXjg4uN7BrhRVfMqzxSokz4q/sVsKmv4gCqYfuwtiM24P
         vr5sb8Kjv6qP29D0+Zy+jF1BbexZCwTurIINXgOsLU0ij0pA/+Neo/BrKA/HCfsvz9G8
         klIZjXrmxN/q4DFoXrnRqkrab2Pg7y7uonGo/h5CFM8XDa3GVOTi/CBsx32uLDIwaD/9
         ZM4k/VZGHUfz38BC+ZbKpvgWp8ShrkuL8V3SLEaYFZqJ2fKd9T5YWUk+Xu3LBRT65Es5
         J9css3X5OQT+ILvSrqQXi0nQICYPf0YkgXv/XaqdglDPN8ACNOGv3JxonQrnWadnNKUc
         1mhA==
X-Forwarded-Encrypted: i=1; AFNElJ9kPl9auL+KRAU2qZrzQ3Nlsd5SKEZ7I0emAFueaNn5w6VbvcOu7t6pG2a1gdpSZGw2RNXyqv2MXgA1qI6aus8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBGHHDtxeQUXLcyJxl3Mqf9z+jgHENAyPNfn+4IyhxA2bGxwP
	ZeEd7VfEGOECJ7Msq6+IpRcwqWd9l9686vvPa6/UODkGroWE1QNlFxrI
X-Gm-Gg: AfdE7cnt7L8MkPhydO78X9a9V2zmgeHvhxBGBl26p2u05sz1mxHfiiWxW6GnLmQevky
	tcMijweJ1Y7CCFQG5R3Sgj931Ms/RG/Yr1UpEOKpVsl6OH3ob8deQeZhzmQwJVQtAx2Eku1dC53
	MGYwKSNrkkqBzksj3ijk6Ql/gZGUa/+zqxEyUX5cXMIZAMRpEIYWOFkfCquAJYjCU5WfB67q1NK
	053ALMsB9njLkozrA6nv2Xm9E8I5rYa6nFVdPM1lkSw1iA6JshmdNk/I4Uq1keGybS6ZXQ2Hw91
	msBZe6g9sTkl8KZu1zDDLXukkafeNDuScjS+mm1NpLkzvHTKIQTaEj3Ksb1zNeGku5p2uueYMy3
	GVG0heBgcjCw9pUvev/gjIBZuamKyqMS2oh2hHhcvNUa2hSAyECBrhkRXXICz7HbNhrx8kWcfYJ
	bf4j79bA5/iZwSWso2rjDlc66GgSUXpAKLiIwfXkbvXmJa0q14ErJYI0P+/A==
X-Received: by 2002:a05:6a20:a120:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c01c225648mr8224385637.0.1783163436124;
        Sat, 04 Jul 2026 04:10:36 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm1695968eec.2.2026.07.04.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:10:35 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/bpf: Fix memory leak in msg_alloc_iov error path
Date: Sat,  4 Jul 2026 16:40:16 +0530
Message-ID: <20260704111016.95816-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In msg_alloc_iov(), when calloc() fails for an individual iov_base
allocation, the error path frees all previously allocated iov_base
entries but fails to free the iov array itself that was allocated
with calloc() at the beginning of the function. This results in a
memory leak of the iov array.

Add free(iov) in the unwind_iov error path to ensure proper cleanup
of all allocated memory.

Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/bpf/test_sockmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index ac814eb63edb..3e6be455d158 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -436,6 +436,7 @@ static int msg_alloc_iov(struct msghdr *msg,
 unwind_iov:
 	for (i--; i >= 0 ; i--)
 		free(msg->msg_iov[i].iov_base);
+	free(iov);
 	return -ENOMEM;
 }
 
-- 
2.54.0

