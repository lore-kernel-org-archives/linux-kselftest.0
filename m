Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658941;
	b=xkMg+hYQsqipxp8LR/K6vLIma7JtsJqVVsnTDiCR9Sc3lGcggu6FteeLbz0T/fk8LD28
	 MN/xVc06nK4tWehQBdKz9+utJTaKb7xDClZH4afcTQIkSB/5xh0/EpLUqCU3OLtDOkqXS
	 7Z1RIUo5owVvSHchHixi1ZcUp488ASm2GsMwjDrTtCYhTV0bOQk7EG8T7l6R7JUqiUWkx
	 n7NknJX2bsE3T2aazLuag5ki8bDuuxozEvHN2bFF47S7IWLpd3mtmeiLDBc3lVNlRjbmQ
	 JCYscYfA3TCNUzwea9DeSy5yYaN85DrbjwSdbhoTv5rrzrUeZkgNbPlOpbvmme7K0Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
	b=EM5YlYNJZimJwuQ/pWcxe5ESGWfkIdm+9RzUns4h/HJJSkKLHDajthZq5CTlEw1dhFD0
	 HOq2k//RC0eK3E+KfVmf1TyHQSOJBrPSMkX8AEA69n3luqWMOv31k4U0Ai8U0zAtN8qpt
	 Kdstg6gCDfpbOqYFO6YJ5CKrUWWJ+2GIFagprBjxcbL6vBDljyib3JyzBVWGGw/OUQ+XJ
	 15+/U3UlACFpRubag0F7DdFXsaFpjZlLo3xhs9oG9t5onHhXj+HMjEQSZyfoR7W2cf9n0
	 k6lu/JlLriXho0IvgkFUi4RX9nduWLZMRhPRhZy0pE0H3fmreBOh7WjeO2AP5qWQwyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqvEMzoT;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E5606A31B
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611E5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqvEMzoT
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2764515eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658940; x=1793263740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
        b=KqvEMzoTtb28KuqtFbbWU+sfxJbpAPus7et3gw69bOMr4KMcDrvt8gV2nK08PFGy2M
         TeLBhAtTesCjBdXBxDzmjkeEZ+CZ+NSk5V1vXI6OqwrtlPHCJvKonKG+7uZNj8bCSS1M
         Q+zVGrihb1JB9pr9AuZM/t6MvkIvciTngBHxIYu71m3FE1N0Y5wQVik3scOnBAt3yEIi
         Q4wfuL9oiRDqSe82LqmrIwUPhao3GZm+2lb3uoZIQD2dltyBH5GbWGSC95+1rFo8SNIO
         vAzxIq+yrTFoLZ8O1ZjPYubaYKrxSvBpWlvb4fnr/busXJag567rwut85t0anfsTr0O1
         hBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658940; x=1793263740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
        b=B86stt82DiocnQYAn5oMyV+i0HTOmevzTRspE1so/FSktXpPbb0Qmmz/Aqxs0WKVD1
         tBNzqjXUUU8tOtht7TyiPkxkWPtPKxecDq1ItcWGTLpBfIZwBLhw/WfrasVO95rLRPMU
         1QBT+UqGFJOJhwi1Lur2/Y2pctfLfZa95Yn++GdC68LtHeu8478gTsgYUFk2w85fhLJL
         9cV/DvJKVUJIavhcgbAoqdqEH3S1TocM6LeDc0UTxxHC/zJSLbsTCDmjJ6urTh8dWAI1
         XgxkaXV4VKcCaMvcPjdLI3ThGsBDWMhrSRYcbs8qeb+hJWW/jNhnSwCdW7pwJ4vOj7yW
         uHBw==
X-Forwarded-Encrypted: i=1; AKwUvByVEJdEKhXLBvyART0SYucIqa+c+6/eyEdTZS9GVF6MR0YlSavmLqxQAAtvErzR7264G90gX0PiTTokpZUlJek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPeODBn6t7zMhXtLcBnZ3i3Yx5YpGkAHGiyhMGqMGgBMTDo4Nu
	jI/BW/Ful2bttZhgQ2Cneff/XRG/ndbR4d38Zfldf4Y//F0nkap334p5
X-Gm-Gg: AYBFou3sXQYcWe3K6yVCLn8krzgF/mu82hIzJt3C8MyglXYmo+DzByofAO0SeJ4Df+Q
	4DWgiyp4EOgHv3FFGF4I99Jb6RxQRPqq1dX1QtPtmMtFjAUSkNRtQ74hQ+tJNkTGmy+0f9Rvl3a
	zMb9t3iGygjV4YCebi/IygheBj39iIyuU5VBGUXyKGS6HQS/xjGOY66Z9ksf5Vacj0+8vC9l+og
	MIsBsVAtVc0S2r799k6FD7JaMi+96I8j8gbY3VdFNFioBbfe8AG92ObA3FlXV6o3N+LvAxAivpY
	gXxhAFAhaJJoBCwC2CRXCW04Z5ZLEqtYUi6ivQs1UwuG9parf6Dg4Xetwpo4cUkb0MzOz8C3WXO
	q0nX44iIovj83T5Dj4z77fomQ33j2ddqc4AfzLjukjNUSVWuf9uNYhstSq92Fog8ipkzn27F2cR
	S7pQYXMY49z/vTFjlPqzygbUx1UB8RzWioGJ3b2z3YPyz8WsKRUY1xm0dnmhaCZ3MqLzTJEHITz
	DarL7TzBXXLVK3cRAVkMDUrxKNxL+fD3u1y2+2d96Bv7UrDbzXzhyB5kTseWCsMT9XbKty4
X-Received: by 2002:a05:7301:2706:b0:353:5b04:8d19 with SMTP id 5a478bee46e88-3674c92e2d1mr6183474eec.9.1792658940316;
        Thu, 22 Oct 2026 01:49:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:59 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 16:48:39 +0800
Subject: [PATCH bpf-next v6 4/4] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-4-2c0f18e82582@gmail.com>
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
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
  outcome     2 of 100 failed (MAP_MAGIC)  0 of 100 failed (MAP_MAGIC)

Fixes: 0e841d19263a ("selftests/bpf: Test getting associated struct_ops in timer callback")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 6c85d368bf167..9b646d134a45e 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -188,7 +188,7 @@ static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
 
 static void test_st_ops_assoc_in_timer_no_uref(void)
 {
-	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+	run_st_ops_assoc_in_timer_no_uref(500000000, 1, 0);
 }
 
 /*

-- 
2.43.0

