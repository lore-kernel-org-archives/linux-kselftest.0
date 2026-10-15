Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7862436493F
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028173; cv=none; b=NIG791B9iRz5V3LW/dv4IB3ggE2NQKzSrJoNBHIwra/eaLbe5/kNeIhHMsPXhO/25Tp2VsrsxrHWo9/n0BnZTnDlgfWMEjZgLDudvjnX5HD3sSSvg3ais/HljaxtqOQlhwbHxHZLHy7nUQGPr/K6DqUkWrpvNKhCeIdouM0sxSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028173; c=relaxed/simple;
	bh=1NL/Nz0Jize5Wp+cr1ElqPZeQvkJvvX8dyGuc9/PMII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnL+OdTVmOa+b5rBEd+g2p7npaIMbV0+aREg1/GxEVg9x/xVsEC2L2ZzIuZqNUjdlfRlXsUk2YJ596rS6myTDTeHyHZ3T5GYp8JVTDjn/W3kByE/qNyF/waBMdbXb+ZZRuyMK7/c+jIzhs6bxAjOSTUrLjwdBYCoUwBGfXh3QWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd3Qh7hh; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd3Qh7hh"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so6432028eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028170; x=1792632970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kg3c5RYSHRIiTzyj1QAovvIQRHBFLytxM/uGv+1fIrI=;
        b=Fd3Qh7hh/dSuThaTt2n28zTkHeeJEe/NREiAMvjh+vd3ipnZn3l4O62fEQ2SnBdUrz
         GUu+Y/I2lXSSo+7YiIlNkSu9fUU09w1bmXK16sLDbwyADnMska392iHCPoocjQKTMA9o
         DgcH62iZXzO0Zv0LkFslgBTbEwgRdged76ISW3UDTX9J1cijjFsx82VWCNaTiKSsLF7Y
         GtpiAVO7eWgP5+E1H/b7+/+uarhcdDV6WyQ9eZRIYFa7V010V1369MhJVYHWisAySVmD
         FJ8L9ylIX4lASucY65ntTQUaoX4GNvf+IzP+CKaizpl1baXah3as6Ca6QoXpB6Pw9e6U
         iWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028170; x=1792632970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kg3c5RYSHRIiTzyj1QAovvIQRHBFLytxM/uGv+1fIrI=;
        b=v1Jh6I8A/0//YRE3ws+z5bMU3zDGbRcpmHx4DksTvorE2U2/sZ55gw/+JDr1CoFM7s
         PpQ1B4ve1ZGFgcnGxrNwwjNWdazPPwJ4FElIjS9RcroFNvQk+q4ivupuKGISUg0EGfOI
         g1RntS4a1Vu/ftivzlrlvsVf+cZunUvldBmsjAsspTgcqgT2gW0yrgZClzT2234lcvOg
         zKDKnL2IsY46UAEtsoeyCLPFZ+F0yqk2xw0rv6+jj5iWWIMKYXc7eHj6tetJOClIDnbk
         XxnL5OEo5Fjf/MUpV06y9iCONGfWlul79xwOGt3GN8aFB2ne6Rp9zM1Bv3Vj44YVz9t1
         A59g==
X-Forwarded-Encrypted: i=1; AKwUvByNbTSrP/FZfJdr9XVQz/2qQLNEyhPdMhuqO0qCyJmaHmM1hjHzxjUa6D4QVmcIN5HiyMUdFAdYpsWGFcIsdg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsnM4D++ricV8mmer7VztK+TGdOQ30UQIwylc5PpG9/EBkmHdo
	qKMlCFRyjeq32BiO+8WXJOdukvtqXboMj4ghOgRvlp2DuRZKtZxNiWlr
X-Gm-Gg: AYBFou2O9U2ZxcCiH3bf2lobiZ0D7tzMk2pGa2gHOw0bPQ7wO4Q9kCMdnKbM/FOmcL6
	RdFYJLwGnGCsiTQup7fq7BvBcSfeWYZOiaCd8XHMR8WgOyDG3yp1ZVEJ/NNubPEPF44B84bc2Wj
	QzFN3ici0k4L3hihQ+oRbvQdMaTSIBi46KbPlhHLGo5kOdJMJx0cNMCYA70ucKDuzzERYT1VPCs
	h01uQV0uYkSJfux1cnlYZ8AjzsJc2yPXqtIG0u4kwTfPIArUJ9iJWQHbSFserpaHLeKfTn46o3l
	E1XKS0GRKlWz5PMdbadBgkPT743cNRG+7bb1mqw8GfJooaVGAI8kUC05+8/b3mLV50j9/xN5W4B
	EY9+qpssYnvYqHIbRv/UolU1SKWrd7La6BkrYBK2wG0nHO/jLEicvddCLmbgMXUOb4S+kB3rrUI
	YzGR1lJu5If9B0jwh57I4H8BSpxqt2m5faORFtZVVPPzuHZsr5lQPbbgqu5+3IKLFBeVicCEL/b
	+J1
X-Received: by 2002:a05:7300:2216:b0:351:28d9:4908 with SMTP id 5a478bee46e88-3537db99e8amr32571607eec.0.1792028170228;
        Wed, 14 Oct 2026 18:36:10 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm47863101eec.15.2026.10.14.18.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 15 Oct 2026 09:35:52 +0800
Subject: [PATCH bpf-next v3 3/3] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-3-efe643d4b2a3@gmail.com>
References: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
In-Reply-To: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
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
  outcome     1 of 100 failed (MAP_MAGIC)  100 of 100 passed

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

