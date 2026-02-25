Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E82248B9
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771979762; cv=none; b=VySWKJTmBBTWpOdQn7oG7vTYia5AE3fv6cLULwrW7FpPFQXqZlZIf0UqrOAfSZZQERhmk1Yci4IT/Bj78nl0y2stY6Enp9DflZp+rqqGloqvrDK8Kgdi96EM7+P6hcPmzvMsqdZNGAXOFcN0PRgOOXtM3PZVfUsl2cehEvbr9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771979762; c=relaxed/simple;
	bh=stRsP1O+9FA+35G10yuqDVObn1O6DuV/lsK0Cj70acA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Dn9KY/uHXfQxNlfnJiWgAL4BEnvoibxfBwN580UzvjJb8IVCpBtXbr4KCkt0XWg4BfrODS/KaeTN9rJJdHyIaSYCWpq9Aa6bnPxPT9RZ0zmZUifBJEPMSzxdK+gkITmzrdYbEGZZe1M+PbyM1r8lU7OebeR0DzKEi7AeCHNUHT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wY6MM4Vf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wY6MM4Vf"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so62471565ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771979760; x=1772584560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lpd6udhqVRoi/VjnEJ31/8jqYQEWSxtwTa2nqxOPIz4=;
        b=wY6MM4VfHGKhSTROXPQsjCFvvEnWluspb7XarMrn5/vGiX7mWALxDjcO6M/OJNFmLi
         5CZt0DB2NJ1BIXEBT3slB47cx3ag0OhiUNF8RovWZxC2l7CgyL9HkHnZABgqVYi4eGBx
         gK9QLap9WoUS1YG1W/6xCEJQ1Yzd19R53vhN62tZbfXkopqrERxeJdO18OcFe718KYxQ
         GtRKS/NCazQPA0UKhjMCEFn0bW0JoetO51K7tQLxeEqIHWeyY/khINmn3bY3/Y8aD159
         J4OKg6SfjwhW2YlF8vp2DYgbGBP5ONG8yWHLKgpea4KVEWnyz2w+84jG0PsKCax/C1Z0
         76lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771979760; x=1772584560;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpd6udhqVRoi/VjnEJ31/8jqYQEWSxtwTa2nqxOPIz4=;
        b=iV+uwnlmwz4R9Fwj9aMlLl/h/BP/o9syx9y/EsXB3URkYwdDxNgjKyIcYFwkTk4jAp
         xyS2A6x0dVI6Z+pzYb7eYIfkQSR1HIPDW3FRmKYZ239t74f3HVUKxu/153DneQY9ix8P
         DrSYTQQPG0OQvJYZvLDJ4eIIkbRF4wOnjkzJ20eDx2a9lbsIeK3bvxIlGuLk3924IDMp
         RFkM+aMf2lxgQuS/SCF1UbWoAtSR1ryvWh8e1AP3H+mBkod0RzNc9egDFXXIszb0sDOB
         r1VOqxlfsuZHRKGU8Q9aJYe8+Di8T8blpspAFWAaJgfABrXUWNQIbw8GQkZpqOAFsUR6
         fffQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP2t/pl0rwUbrmF2MgfBxOk4bbZISvRNRgpPkLIVskoPBVOkBB2I2yfnNFR1ErD33+tnJTY3jAyF6ion7b5iM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzExnVkF7PYJQWEor11EhrzhZ3sws06gokv8JyH6+wGilDMHlKi
	LA6XIqak3PbEerQsEZNZAqYdBhW44IqjKCAPUkfUGzXdiddWrmmP96+X3GerEKU0smkdUdIUotJ
	3EKhLToP9MviksTxcQg==
X-Received: from plwh12.prod.google.com ([2002:a17:902:f7cc:b0:2a1:1059:442a])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:228f:b0:2a9:484c:ff30 with SMTP id d9443c01a7336-2add13834ffmr4836965ad.26.1771979759424;
 Tue, 24 Feb 2026 16:35:59 -0800 (PST)
Date: Tue, 24 Feb 2026 16:33:48 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225003349.113746-1-tjmercier@google.com>
Subject: [PATCH bpf] selftests/bpf: Fix OOB read in dmabuf_collector
From: "T.J. Mercier" <tjmercier@google.com>
To: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	bpf@vger.kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: quic_sukadev@quicinc.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Dmabuf name allocations can be less than DMA_BUF_NAME_LEN characters,
but bpf_probe_read_kernel always tries to read exactly that many bytes.
If a name is less than DMA_BUF_NAME_LEN characters,
bpf_probe_read_kernel will read past the end. bpf_probe_read_kernel_str
stops at the first NUL terminator so use it instead, like
iter_dmabuf_for_each already does.

Fixes: ae5d2c59ecd7 ("selftests/bpf: Add test for dmabuf_iter")
Reported-by: Sukadev Bhattiprolu <quic_sukadev@quicinc.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 tools/testing/selftests/bpf/progs/dmabuf_iter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
index 13cdb11fdeb2..9cbb7442646e 100644
--- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
@@ -48,7 +48,7 @@ int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
 
 	/* Buffers are not required to be named */
 	if (pname) {
-		if (bpf_probe_read_kernel(name, sizeof(name), pname))
+		if (bpf_probe_read_kernel_str(name, sizeof(name), pname) < 0)
 			return 1;
 
 		/* Name strings can be provided by userspace */
-- 
2.53.0.414.gf7e9f6c205-goog

