Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA13AEB37
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119574; cv=none; b=uvdozamlh8cOsyJULQIEqc+jUqdXBv97iDkpX4nWBiS4Nxl7pBR7d/i9ENAknI+NweBmACYHktbYnzjyskXz/DsOd/pqH/2Sjp/fDQvX7AxgHNjS/R5JHv2TcxfhWGsb8PKtGEsZeIJuPwD3+j2xgXXl23+V3F2xsPAp/IrN+Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119574; c=relaxed/simple;
	bh=zwamoSKtnp2UIoIEAdgjm1Ked6nmzXmafaSRA9PS9Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KrC0RTa2RP+GzZG6/AoMg3ZGcELMzBk1DMXkIK8RzsBayYpkEfHJA+dSEt37smvpmLjCFq2H+lcRiLaKbTbL2eDJ8M87ODjoMoGVaZIlo5/HO3j8wKe8oS+3s83JPQ6Ik0pXqVUdyg1miOcb90Zq+Nc/o5PjgSdjIZtch8jwJt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dloiu5C4; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dloiu5C4"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3550c917fd3so3701426eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119571; x=1792724371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uk30+yg2ty9iM02IzOtK74HK1wf3XreTyUXpv5e/KnQ=;
        b=dloiu5C4zFsSeHsbu2QYuL4U6cnQNwz5n071NRbGPWE9lYL14rBhELTriwOnfC+395
         XMbYTWrK5W8lacVHSw4iwSVI1JIkHngx0L76o6uUiI2DoN+sf8BjftrVMBj7jLXBmYI2
         e49Du+GZQBHGNoahRIIB+/Rtkit/bFiWeYnu5PpebBL7AQEjsMOR/e4nChPIwYUb3k4A
         oOmwwff315MghuQbA9J870dmK3rIc8gOzt/zVoeaMgg/yBwuNN2RI38yFsNEpRlIVRw6
         AHl+kBhQSG5xgBRsMhQ8EtAmHwdVWhgjhH24+XWwM2iEm25QtDtj/rPCYBfYF1OU+2R/
         +s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119571; x=1792724371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uk30+yg2ty9iM02IzOtK74HK1wf3XreTyUXpv5e/KnQ=;
        b=PKe83bN50OcS46AMfd7Y3OWxYlei+5cWXz5V4FYvduRANkGpjdr+oSvjPoQ0R0DMnY
         wKGfETmaOxk8IZelYrMjmPFFyy3+xIxuFXi3KmzugGmPSSVlmN1s+X9kmOAVGyEsjDuE
         H4yq9PInfUzfK//iyrsiz1jpFWWjefVsw5w1Jk309OwCWuyquWBK5kF1x9alFA21F62c
         ZWwhggWePJgsGrGGGhmRh6psZZWXH8HFDrA64YVB/KSPKZYBO7Kdz9flWcbBdNy6Ojk5
         PfkTjny3+2Bnggz57uAmfxmPttkfPn9i+YL5xByeh7D6VFC793THfrMONbx+ODF2zFfm
         nfag==
X-Forwarded-Encrypted: i=1; AKwUvBxi6jC9d0minWE0w9PaJ0miqSxWLhzz1xLKqNUizYKvbuFf5cJ2H4+UxZkc+vEOhQpFL3LIPYIvGEToFVJWDkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFvpHYfQ4W5b1GLef1QMYuH1sNvINiAfxxRhN0pWp+aplCACmx
	KKipVB3EmwDVnfooskFzwt7H5KM7t74tvu6CnSSCQmoYfzKoFE8ZVgLN
X-Gm-Gg: AYBFou2SHECoAMrsx6yVkb5K/JoSSmKpnrNM4aAXL+Hvrnmi4j7J6W+mP2BACJT++t9
	hpwhdFQqVKF+gd16upzcs2PBvltYk8zWi0TazHN95thP6V/xaZMh4xWlhjAmG1BZX+6YzLxBuSu
	jA2xCZ0YwxEH2qWR42aWlUsp9wximMU067QEpb+ZG9nL1H2xxSN7rX765K3QeLyKXdx6VBA0lvo
	ZLf4GcZJ2m1OffgYceXcg9z7WjxGy7fxqM+PLo3+XKE9OKyJayZQ5kcKr7mlubUd9hKuu7kiuEE
	tSoOljiAanL4+PA0LjLB4w4XzEvOAYt9UHqvHJJin7jSC2+gXWdtPz04v7jZ2wUSn6GN6ZFLn1A
	iMJ8Iipnw9ZZ4gtZ34ncPi0IODIHywXGmyWf2nrM29SNDumlKCycoBicar4gqlCTRrOPuAYmBn1
	wsQcHslEQnLoh741jhlVRjYmJFwjUTzFfyVFs2QdybxTvqu8mI6Kx8/9w5wCjAQFVjoA==
X-Received: by 2002:a05:7300:ce94:b0:345:84eb:7153 with SMTP id 5a478bee46e88-3537e033341mr28255195eec.11.1792119570559;
        Thu, 15 Oct 2026 19:59:30 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm2481261eec.3.2026.10.15.19.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:59:30 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 10:59:08 +0800
Subject: [PATCH bpf-next v4 4/4] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-4-9ad31c21220c@gmail.com>
References: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
In-Reply-To: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
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

The association goes away only when the last reference to the map is
dropped. syscall_prog holds one through its own association and drops
it only when it is freed, in a work item after an RCU tasks trace grace
period. With other tests running in parallel, that can take longer than
500ms, and the callback still reaches the struct_ops and gets MAP_MAGIC
instead of -1.

Have the timer callback restart the timer until the map is gone, as it
does for st_ops_assoc_in_timer_free. Calling the struct_ops through the
association until then is safe, as the map is freed only after a grace
period that follows clearing the association.

st_ops_assoc_in_timer_no_uref run 100 times with test_progs -j32 running
in the background, on a KASAN kernel with the fix, x86_64 VM with 32
vCPUs, before and after this patch:

              before                       after
  outcome     1 of 100 failed (MAP_MAGIC)  0 of 100 failed (MAP_MAGIC)

Fixes: 0e841d19263a ("selftests/bpf: Test getting associated struct_ops in timer callback")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 9d56e8cb5675a..435653cb7c908 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -187,7 +187,7 @@ static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
 
 static void test_st_ops_assoc_in_timer_no_uref(void)
 {
-	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+	run_st_ops_assoc_in_timer_no_uref(500000000, 1, 0);
 }
 
 /*

-- 
2.43.0

