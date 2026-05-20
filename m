Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C7370AE8
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309254; cv=none; b=TJiejJgnXgiVxAFQ0+0dB+zrMd3JBCj44A4WH/m3a2uiFbw0M0oPhboxWjiuR+fILYkQaZcR2CaPoWUT0g/6uHmgyxPbWN90r7T3LTNmT+zj4q8zZGKJZHGcE4nuxyKNGFKWf0xspJjbd5aju4wihZ/2H6IbE+cwu3IXDLF5iSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309254; c=relaxed/simple;
	bh=dy3591KAoddrcRCeSj7NDuxGxv74bfjtV5WlTzlf7Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwwyZ1fGPgCKx759gSEr1F/xHMYbK095oIpTTueln7tBiysT5xGq506Q26+UNlepr3GgvfWzto4OJBXX/iX0EraYFnejMz46sPzKYMOPtBNSxpLKJLR6nLwH+70ZOYcjmpYAH31CYVe+0e9MhZrvjiRERuensyjnoJL2ZpXr9yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZNZEdXq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZNZEdXq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-83945063f70so3035846b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779309252; x=1779914052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iChxZzWfiNaD+hAkHjNeNDXclaERmNaIr1r1RbO6iYg=;
        b=OZNZEdXq3IrdEdKNUYm5Pi7eD567cvE6JYSdjW365WXUL/vz1h5B6fMVwxUC6azPzA
         dOfi6PXjQQZwl1d/z6aPinziKVXjRxDW2bzWiQeT4TGi/bmjEB887TETT2dbQQ9+k0Yz
         r/bMqn4I+blpP9SIXRoGX7ZaEPR3BS/V2lr0dbhVy2F45onGx3jUwlh/ede8qls3SK/u
         JzHGdc8ykVWfLQb2jPRzjiJZynpN1PRoKVyYUFQdqw+chyNMNhSl8CkDGViIThIrtZWY
         e8wstjsbR/VzFzkMHvQmNSaLFItloJ0SYOdsQekytBe1BFMlZQ3C2Ex0SBJjLom03dk2
         IDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309252; x=1779914052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iChxZzWfiNaD+hAkHjNeNDXclaERmNaIr1r1RbO6iYg=;
        b=V7Ha9IQqu3EENceFWosjdx3OLjlyPYZekFTNhURU2FN6/F1YLwi43aaFXPw99/Pa8a
         6LWy5yU/qMyRa8PCxjIWVxd9gCnwlgku3Oc/ckhpr8Ow3gyvvsBTbyk0pc82T/kuC3L8
         nH8Ea1pK97puo309QjOc+ttouzTaGihdIoyAsIMRMhfK8T4Q2Tuwjin3yRtIZ3PUBzOU
         54vfC5eRugHDCAgYsGQFggLIxh61o7zZwCBiP2554zy/R0VTYwePO9KdUiRvQKsOmlPF
         FfHHsGdJqOIk3XqiUWwkf6lcEf/Hf80a7bIseTlVazVExPCt0viaAKTKa2yZkSDdaU5N
         fkfw==
X-Forwarded-Encrypted: i=1; AFNElJ8LfILPRyKrico6SNYFtefuMJeMsKi3UV2+l+5Sr0BwfnTJvX2+ZKsG7/p4pPXL9pi5Jvk4vF9iHXxwfbzLWvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1swI3RavIbA1QM/OeK7dOUE/xZgsrl+9xkaUX0Q2UD8FOhdQ
	UUBVaOXKb8YlTkrK6eTyo/eJambpb82X1s+kyJK7Md5NXfe6QNyi0syy
X-Gm-Gg: Acq92OGq5psNELToRw95p32i+6ShaScyb3AkRu+YWB7QaUnXLe9t8hmZ+J3PcVkpKwj
	RK38MRosshHIsiE+LzKU4AjAjSngZFc2wYMMk/6piBnO9b81K2UOGUtdyLROsV/1sTCA+0jHTeJ
	5qlLqdmhw1ZSZK25jXQvAgqzl2Sm2KEbViBV3kcIGj7qYgzyIwh3RTagV8TXANEHJG0+xoEoTmx
	ITkVHcJSvulkEQqKbkDDNp3l07LaRijWOdLN7k9WIExIfX9APruIw7IsAeit2rgah0fDsIteZSh
	C220OGxAu2gYvi5agZ7jmK3s/O5+X48OtJnddcCcEmzfqWB2nqpQC3QgGVNIesP99kwUE1WVZYo
	uz800VZCi86KMaG6i6AfV9C73wOGr/lkUuXj5gZg93z/Nw7Y1zXZo8Mp2U9i5cqsNqbfsUoZeqO
	TtJ+OaA6m7sZsxucCgTjbxbTdSY0ImxbVaLS2fRlcMeannmKsRFDVC/1DRXxi5kImMj+n/hY/56
	1Op7be8vdXHoeNxGOeWNexnV8zinddDgRvxW8H9jLVcltuZWUP+lQF+fHNQX82G1SMQ9QkvykPt
	nXkmOkVICaNCP+vukqobWLBd5kPD2bsJR97W
X-Received: by 2002:a05:6a20:7355:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b307f88262mr14502637.30.1779309252204;
        Wed, 20 May 2026 13:34:12 -0700 (PDT)
Received: from codespaces-78f0a7.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([4.240.18.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm20172328a12.29.2026.05.20.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 13:34:11 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: bpf@vger.kernel.org
Cc: puranjay@kernel.org,
	puranjay12@gmail.com,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Fix zero batch_hash on CPU 0 after batch_gen wraparound
Date: Wed, 20 May 2026 20:33:18 +0000
Message-ID: <20260520203318.31939-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit fa747e9f843b ("selftests/bpf: Fix cold_lru producing zero
batch_hash in XDP LB benchmark") claims the addition ensures the
multiplier input is "always >= 1". This invariant does not hold after
wraparound.

batch_gen is __u32. After 2^32 increments it wraps to 0. On CPU 0,
bpf_get_smp_processor_id() returns 0:

    batch_gen = 0  (after u32 wraparound)
    batch_hash = (0 + 0) * KNUTH_HASH_MULT = 0
    *saddr ^= 0  ->  no-op, cold_lru miss counter stays 0

Setting bit 0 before multiplying guarantees a non-zero odd result for
all possible values of batch_gen and cpu_id, including after wraparound:

    (any_value | 1) >= 1  always, since bit 0 is always set

Fixes: fa747e9f843b ("selftests/bpf: Fix cold_lru producing zero batch_hash in XDP LB benchmark")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 tools/testing/selftests/bpf/progs/xdp_lb_bench.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/xdp_lb_bench.c b/tools/testing/selftests/bpf/progs/xdp_lb_bench.c
index 13777b3dcac8..816880c1cd5e 100644
--- a/tools/testing/selftests/bpf/progs/xdp_lb_bench.c
+++ b/tools/testing/selftests/bpf/progs/xdp_lb_bench.c
@@ -618,7 +618,7 @@ int xdp_lb_bench(struct xdp_md *xdp)
 		__u32 *saddr = data + saddr_off;
 
 		batch_gen++;
-		batch_hash = (batch_gen + bpf_get_smp_processor_id()) * KNUTH_HASH_MULT;
+		batch_hash = ((batch_gen + bpf_get_smp_processor_id()) | 1) * KNUTH_HASH_MULT;
 		if ((void *)(saddr + 1) <= data_end)
 			*saddr ^= batch_hash;
 	}
-- 
2.53.0

