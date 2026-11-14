Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639494;
	b=VKNrnvmeTjQVfioTP4nWGQ7Tl5amPaAkGOZ0JoSmGXltuYh0+iwLbawB/wKW7CQlLk0t
	 KYwVZ/Py9t2/srau26O8WJhI8wkp5lc2Ik0TzWaR7y6t375axLWgSwdl9q3i22fXaqx66
	 QzjKkCFkTrBrR/q9zT+saySUKrjBg/3zXr8rr9VN1r2NOjnM2F9q/QfDgqR3ODlmpeKh2
	 C4ZLT+J8+mgxgy8LCEKfpFa9qUuq1c/xo0QB6qyal1TWMf4awxWUuRdrtCk6Kod2PGppw
	 RV40u6CmvtWxPLW82XA6qgkgXIjl1L/0decC7RyCGtuVzOFo61lqM1sUgh1CQLAsMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ERt19hwTl9KdBsm8dTCky9arS4UpYC33CQITUvUy7Fc=;
	b=2ai4p/pP7xyYj0AkqZqoCqAiWObTVPKLUpsNm93lPyrFZp/lQa5GWeMYGpOSxzpNo7Zy
	 MbhofMg2vwMDBLIHtv6BPbUv3EcrBhBbjWb7Ao1GXf5fNviJr5pcmU5d2ulwwG+WeUUiy
	 AHy39el7tuBKREGh5p3HB50D/MPHxJuf8Ah3VbtTjqdzLqtHJLlVdoebCtxb9UrSQcBff
	 yUjAiwJBbcOPOZtcnVGJ6s24F7fWtUlQEhBTXSbqmCcJbQIuaUhaLTC27Y9e4cx30Szdl
	 izHwd68KOK9R80pKRQKmelmlhuv0g8Akg2MWBob92h65jjAv00BxHgeB9h2kZJU+yVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4ky18Nh;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE2606A329
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 06:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DE2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4ky18Nh
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so5111264eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639493; x=1795244293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERt19hwTl9KdBsm8dTCky9arS4UpYC33CQITUvUy7Fc=;
        b=Q4ky18Nh1X8Ybygkod2Uz/LMgNUzOU1R7JirxOS/qz5/CiwuXEODFxK5G7qD7NNoM2
         UyTrfz5mlPvT35Fh3pji9fQnBQi8b+PP+cNJAV/Y7ihbtr2FEpMGjyB7J86f1E5ksS4r
         xwI0rvjqsxJp6Y0kxt4OxItj3wyXUUW7MM5tLSEzUNb+vcf/IdplHYubJ6EHmkLHIwGl
         Lh15DuNLqLHVCeorrxXLnBPMogKUll/vopmmAPaz+0sLF4guJxZao78fSLFhMmvr4lTR
         7p8QdqImrg7KPKl9Zy9oF6UJfCmcggeH9MzGj8dLDW78rls/BP4ZbIBi5CHv8ovAFtRv
         eS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639493; x=1795244293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERt19hwTl9KdBsm8dTCky9arS4UpYC33CQITUvUy7Fc=;
        b=NtWwc98gU1R91M5VA5hqBuhmQI331gd5vnU1UBLLAqSP6QIyaceTo03cp+G95RsCcx
         qB9hWWVcSFsJLDaghwIi3jmQdbZgw3lwWnABdTspmen/NtzGn9xtJTpyljhvpDvfZmtx
         Z4V5n12ZzrhgYyQ5O/OV2Rx+RlzCykjmwb8IwOjdZNWRiA8qjJEXAJh2v2GugcMjR62l
         pL2MdW9beGmiL1yggqg2ixjMCpTLGziDD1hSg5hGXfRov/Inrp7UJiKBSoGA6nYRSOP8
         YbIp4GJ/KLqCh1nRhJSO5yWAFjFfQxdeO1WkQkGpR70e2IpkSX2xwL5JGItSzJbgOret
         YjGg==
X-Forwarded-Encrypted: i=1; AL+hErFnrAPYoVeVqhDjiuQAOSKlaJSSw/QOen1ZhwBcseBW3CMmZRNp9u50PjEaGJjBaE7GRGuQkjFE303uCxTeDSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iHXKnZ14oMiw6u0kD/TBPp/q7OhHn9GmtikkzgrJbJS5q5RaS
	+CDZEKgHInvEtp/8/q6dYF775sW3791Oj0U+kdiQQwbG79e/S9+WSprl
X-Gm-Gg: AYBFou1585aK7VEU0GX2Ej6Vzan4JZFCHvcQDVkrP7eoMUpG5kC4dkph1SJeZ8P7Ok6
	UtR/B+CX6PSytUV6m1ta0Zl7UAtcr6xFhWOM1BUeDFKx1ugUTPM6HAvPqjm4kFyj+Ify5QLhTB2
	5FEBsL19GDTYbP3y+u7lOaC+wc/474skTZjslH66pvQSE3qaU9Y29vV1Tz4wObBy2SQzd7sMAkO
	LzxylE2IV40ibnsVx9YCKMLyWAYkjcr2dr9zJOwQt4UGVaq9i0Yxo2mter6opB74o15uyiu1HTs
	sDOViPKm3ZnOw6Dr4Iw47NjLt8CqwHJI8CnnQEJNkSY8TN1ser7U528JOAuSfRccyDQpdc9R4PT
	5d0/uTL1e/GyyoXxyqDT/VtU6wtMBenQdJEXcg1Bgrbs8IIqiCILvi5LSTAkGLLCcA7LiAXnj7/
	EysvmyP0NUcDr+HrFg97y5YqJVzWgublDrSUO2ZX0R5oojp5mfg29FsCMVeL9ZyQO+hGL6/5jyW
	f1ArPaAn0gxJMfo/J7FyPmqHPA7y9cnT6SNrFE+EmXlyKQLhOvzKECD+40zQKmMePCnIUyaGoLx
	LkX0dGtdITpwW4XBOsD8Cesik9/JBt3iBcx6zweD74wZ
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr4824571eec.32.1794639493190;
        Fri, 13 Nov 2026 22:58:13 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([182.253.124.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm17823905eec.19.2026.11.13.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:58:12 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: emil@etsalapatis.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Remove accidentally committed default.profraw
Date: Sat, 14 Nov 2026 13:57:59 +0700
Message-ID: <20261114065759.46263-1-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

default.profraw is a 160-byte LLVM raw profile data file ("LLVM raw
profile data, version 10") that was committed by accident in commit
86426a28c52d ("selftests/bpf: Add buddy allocator for libarena"), whose
other five files are all libarena sources. It is output produced by
running a clang-instrumented binary, not source, and nothing in the tree
builds, reads or references it.

Delete the file and add *.profraw to the BPF selftests .gitignore so
that stray profiles are not committed again.

Fixes: 86426a28c52d ("selftests/bpf: Add buddy allocator for libarena")
Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
---
An AI coding assistant (Claude, via Claude Code) was used to find this
file and draft the changelog, per
Documentation/process/generated-content.rst.

Not runtime-tested: the patch deletes an unused build artifact and adds
a .gitignore entry, so there is nothing to execute.

 tools/testing/selftests/bpf/.gitignore      |   1 +
 tools/testing/selftests/bpf/default.profraw | Bin 160 -> 0 bytes
 2 files changed, 1 insertion(+)
 delete mode 100644 tools/testing/selftests/bpf/default.profraw

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index e318a38035d..2a7756b7226 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -36,6 +36,7 @@ test_cpp
 /uprobe_multi
 *.ko
 *.tmp
+*.profraw
 xdp_redirect_multi
 xdp_synproxy
 xdp_features
diff --git a/tools/testing/selftests/bpf/default.profraw b/tools/testing/selftests/bpf/default.profraw
deleted file mode 100644
index e865e87829f8662aa272b0d0ca779c890dd26a70..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 160
zcmZoHO3N=Q$obF3009b6n${E()B+JGExb|ZcYWo}X~!y4U)Rnyov5~~E)paK05RPT
AxBvhE


base-commit: 1440a14a7ed58d5fbc3b9170b68fc977939b4985
-- 
2.43.0

