Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1223CA48E
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612822; cv=none; b=oL9L7q+pC0VpMdMD/jjBE3t3wp6m+wIrz3lkZGVgbK9mSlfwrgzIEO2G4b6/zbM5vKMccuiZmSrgg82ql0I1xwwvrZOcsRl2ga7OVbgfk9p5WRv8PPYEg5zNLp/iu+bwABviOi1R2GRsGCcz0PEPDuOmgrNeOQxlAzAR1GV/2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612822; c=relaxed/simple;
	bh=3tC0qAT+CVd+RF8Hct750EjxKbKvOcD4v47TlmDBV+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=He0jgSSjO281fYhYMW0cqjI8gtkMk/h0lMT+n+lHtftJL+qCti5IBtyONPtiIiKa79yqtabUye0zs95j9xGx4ehI5K+SsbrPHADQ8Oa9KLLyLHCK4wXqXYRgz6HCpmV8UUEFsbGXsR9UkwPuqnitdF0hVm6GkFn4CLNISqcMjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS+Qzkte; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS+Qzkte"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-150f88d22aeso1075573c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 23:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612820; x=1792217620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ5e6FUZGJtnIHOPKyZPtYyAv+tm/f3CHm8oVn7shbM=;
        b=OS+QzkteZco3lw2I5sD5P7eQWlzaymwC+FZd7g/EnAUHjMRSbRfxZVKt0oOYRP0sL6
         8Nsd5mePni8qOvo3V6bCSaStsXYVoSUdUoogY/FI0wQoosY5EpSEoDU8c3NzGLuF1qjX
         vcNq+1LBmLEw1HGWExvQiBv1KHRxIkHHAPgGLWgDnKT4zL1+XksO4TDHIJKeaRKY3WQ7
         Go1zUlP8NyNSsYzVkFJDBzGMOin8fMLC1jwICe9K2ijHX7IA51ibdQDir1GGw/5pWKBN
         aqNAfshdpDw6bQWGpkj6YLmlMb2pDBzHiVQkU9PCvIJS0ZsA1xrtduch6CXJJ5ih7ean
         oenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612820; x=1792217620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ5e6FUZGJtnIHOPKyZPtYyAv+tm/f3CHm8oVn7shbM=;
        b=rsd6AtTvrywSqvfmtRR9V3iZNWg1DrxPAq9rR4QSBMAB69VKDxNFcMg2nXNsjxgs+g
         PBCY9c22Q/4nX8JUSwobybJ045kcBaCXLQzE2d77661QDI76NGoUhs6GWftZmHusHnbg
         UZ4zj35yHmCP0JlccM2Tafgmt0ij4q164WQy8NhqIe04rs5fLCwvcesPaO+1lVdtpdjL
         INW6ZvJcxauHsOMH5A4PytveYePYBpJxiSz+pD4X6YVbjfs9sly6jibdw65oI2Wj7hSK
         toFEnxwaNQ3YufWcIhG15So1FKaOnF/JqvZZYCLV64BLl0QMBP5odc3TOpkl8Vkgg/Ju
         BVHA==
X-Forwarded-Encrypted: i=1; AKwUvBwKqg8equdtVnwMvwOwg1w7s+wmME7k0a31Bp2gZDhQypt0S3geVCpuMiBaUzC6UzVQaQqw90Ihph4TxRo8fIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZq4Of8LhrF03NoDEf3L48YDDPqafha1rU3RDYP1ilMFbD6A4m
	2Y4pu2FQSJP+v3AvaypHqL/S7i+XSXcK404s8EgVy4pOopPaY97/zh69
X-Gm-Gg: AYBFou1EGeyFAJiQIWU2jiv2vMJAHIE5t/MDKZbez23HLQGs/8Sg3A66DRX7r9O1wIR
	FhB43jH+7EaKJLbu60NtlrP+SoNq3TEPgH6upxKEoEyPknjuZKWUBdmuEBU9hbikgnkV5M3Q+hb
	wl++cLDfQXvoZ0DZYNeCAS3NpdkWYcy7kvfK8slNb8pCKrBTpVo8UnFKUS3B7j43cl7E4CE0sFu
	qtrI8E7HDXtO9SPyydDt8bRsRvtsrRFyJAz71jM3iIc1TWHfu+t+y14GEoKfjfRlTOqx0Xp6olQ
	znlFwWFNAht0z77IGo0IrmRKg0ymRDHSPdrO3VyK2okcf4NEj2y1ykpfz0azkaHgZ1Cilt2CYda
	U/6s4kLVWtK32im6/v9w2yDpPT91lykMYlsm0+jd78IO1ZBvxihdWfS1zkZrdz02JzOrymN4xg4
	DrcdPz+ltS3eec0hdSbo4QG0zsR6zP6cDL+X/M2/+BJyJg8mzTQoRUZmreSeEmtGgFLg==
X-Received: by 2002:a05:701b:450b:20b0:14d:cb67:afc4 with SMTP id a92af1059eb24-16a65356abfmr5200067c88.41.1791612820363;
        Fri, 09 Oct 2026 23:13:40 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a5866477sm10558036c88.22.2026.10.09.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:13:40 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 10 Oct 2026 14:13:20 +0800
Subject: [PATCH bpf-next v2 3/3] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-3-d7a43896dbf1@gmail.com>
References: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
In-Reply-To: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref runs .test_1, which starts a timer to
call it again 500ms later, drops every reference to the struct_ops map,
and expects the timer callback to find no struct_ops associated with
its program anymore.

The association goes away only when the map is freed, which happens in
a work item after an RCU grace period. With other tests running in
parallel, that can take longer than 500ms, and the callback still
reaches the struct_ops and gets MAP_MAGIC instead of -1.

Have the timer callback restart the timer until the map is gone, as it
does for st_ops_assoc_in_timer_free. Calling the struct_ops through the
association until then is safe, as the map is freed only after a grace
period that follows clearing the association.

st_ops_assoc_in_timer_no_uref run 100 times with test_progs -j32 running
in the background, on a KASAN kernel with the fix, x86_64 VM with 32
vCPUs, before and after this patch:

              before                       after
  outcome     2 of 100 failed (MAP_MAGIC)  100 of 100 passed

Fixes: 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period optional")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 987117091c676..10fd294a0af3c 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -184,7 +184,7 @@ static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
 
 static void test_st_ops_assoc_in_timer_no_uref(void)
 {
-	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+	run_st_ops_assoc_in_timer_no_uref(500000000, 1, 0);
 }
 
 /*

-- 
2.43.0

