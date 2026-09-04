Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C83472796
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519093; cv=none; b=VCrlM7VtkvhHU0/5qjTdEeSUcocAcfqWu/o3qNVc4dU4bBvJNuV367ruT0s3rCxyAGmHWwZqmmYIufBHBtJAHvLWyfjCdW64XcoWuCGFsLUyG7FUnHXxq/lXs/vEM/PCWjCtmC6yIac7V9bY5B+E/q71BMR4T2GpjL/+wxzYigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519093; c=relaxed/simple;
	bh=N5auCAAX6JttEiw3mG/TYR0m/xuN8LLYJ8Fh8xM0+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBYW3jWCVo7ut6a/d/ekL1fdLBqEn5ENLMuXsbXlQjRMrmkxjSgox3q6e7PSmU23JQ4yzUb3TeIMRXM4TcbkHXEDFOOlyXJszd9XjRR450LAkwsW5dB8I3qI9CbHqHH10KTslKYL3J1I2DAQAEMbtdKvCTvLXjxA1wYXnWP7Gk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ccd10wZm; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ccd10wZm"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso761479a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519091; x=1789123891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=Ccd10wZmUSJ8pN0KKarBAQmLeodpi8wYAEgYAQH1sNMAWhXUAfbSq+rhX6ZwiTFFxE
         MsAJakRI8su/duhyCX3E5Njac3f4PfyApFn/y5HeVcc6pUSUW62iXg10+85HyKK3fyz+
         md7PQ/1LejstOTAmTAIfd8vPkK+Ulg2vuje36oxatgFoOyRu0jv2lhvbnzKxiOEt1/f3
         Z3EXp75DyQjboBrwxBksHW1na5rUy44Q+i7TsbI6t41s4tK3uKKbm7128zyuVmd2PAES
         mPlixIPTYga4587ukm47ZEla6+07IMOwTn/j3jNZj4hgH72hJhOmPBqMWdXqpbXNEa10
         0rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519091; x=1789123891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=Mo8YLoRSxcSvmInxqEJyq8vYfW09/mIMlrIEOkhHEStntlceFvR4iCICcpMh7IK1kt
         koYrvyvjB5dVVGoZG9kFdFATLnv27xQ7EDvNGksW/cpSLHRbcq+87B01q3mFg6tjdnq4
         AvDz+/4lUmHRXtoTJf0GBujVTrFZBK8yvPEf+fySa8G/zydJAD4umACEWDrrcpTvS8a8
         7N3vOQO9BZXxWPsstvg0rAvDPXlA/hdjXYY40VMHuvt8Hdi2RkRR8pRFYx7IYepcLhxw
         OPOBehVmy39zRtbbecJvBUeuXymklQuAF82wmBxJtV7dUn0La2KTvchmdjQakelKXzDl
         XvgA==
X-Forwarded-Encrypted: i=1; AKwUvBzNI6D7BED7ySnJQk+vPKZ8f2atO6V2CNadj9uBnaiy9lF4gQGmAR273JIaEd8e09V842KwEhr0U+wVtiCpI78=@vger.kernel.org
X-Gm-Message-State: AFuF++naM/D2qhLMrLtu+/40bZCOX6ced2J9e7Fd4o9HmtFokWHZewFe
	UMJ3MmfbL0nHMBkGyEfp9iC6+xj8jy4Z+6HgUCGWsBqSGQKYaBl/Pm+u
X-Gm-Gg: AYBFou0XLnWVawMmCfw4PHQYzukfJJrHCTGh+R/MYPljfWuVxMANl5WBND/YvRtdCgy
	gscdpOG+YhTRuLVJtYeGLoVCcNcDl4wyqPU2bj5dP4Hp4UmmXwqgY/NetMUlYVB3Im6pa6/aZXg
	oZhpRvB8UDl7tNkdwlN5zrEygUy6Wy7IgIRC2rCyhRp8hj3xzCDMTa85dp010Z8FlUv3neK7vgz
	Cc+deVhuC32nIywr4YmE6ao/87yHJmz0HJwQJ3w54fyvKywd39VkcI488oPDdQNzJLQ2TUG/cmj
	FAR+oj1ikR/r7lc+Q5BT57evosrdBfxIgZVplNCSVabh/4nkx1qrJZJPKNLwqVaRGD1vvB9Jhv7
	zx2GW+VRNhxVhhi6Rxj3lxUKu3v5ANWSWTBYCs4j8lEd0D825yI6KCFsVhwi3e6w1AebwEJZRii
	WjZqTikUCJvaobAHlIe85nYvgD7r9yL3lvB1+6rKmW77U6zmm+tu89oMHVeuJkTYYd2kqfjQ1J4
	PonFsTQkOSJvlPnpslIe2yM7Q==
X-Received: by 2002:a17:90b:1c07:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39b2617ed8bmr8372452a91.9.1788519091308;
        Fri, 04 Sep 2026 03:51:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] selftests: arm64: fix typo "hander" in comment
Date: Fri,  4 Sep 2026 16:21:09 +0530
Message-ID: <20260904105114.29474-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "hander" to "handler", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index e1ccf8f85a70..bcef280582ed 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2021 ARM Limited
  *
- * Attempt to change the SVE vector length in a signal hander, this is not
+ * Attempt to change the SVE vector length in a signal handler, this is not
  * supported and is expected to segfault.
  */
 
-- 
2.48.1

