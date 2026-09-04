Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FF34AD7CF
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536486; cv=none; b=TGL5azRu3j4VUvJ5iQaGWpnazQnK6tfyll/QmnUZbh7ZhNNJJAuQwawqdUcODgXkixKWzxvAy4VeKALvl0TyRaS4sPxThxWaZ8b24C+4Cw5IYgRdYZBpU0Zr/gWohaRrD1N9GgWZxScHbfq9JhoQhItxWogzazotrVucoKEffek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536486; c=relaxed/simple;
	bh=lWjHP6alA8c9bfJKDwOOPP5dbXqNnIjRZYB6Isxoog8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MGj3/S09Ex1Nk9bSoh70XwaJmCJxVhgYnblWAcB/ye4ogkMo1qbfaArFlKAqfctgfeCnNNTge+U3Pjv09YWrgpQfqCKJDJ1pmIpMBVkIrycsKJQMe+n7maSEdHWmr6YaL2/cLEYuoAZEzOejhYOgj087kfTsJIfWz+DuG0se+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkHMSSsv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkHMSSsv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso8733035e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536482; x=1789141282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=EkHMSSsvR4nCtFi2868GfW6A8fuo/RlIkZyw92xRmd26rh6cRQZVBbqlX78KjUpKWr
         f6loln11kyYdPp/LfWanh5DZHQKcMJmDZDKsKVpZkgfce7DUZlCPQfyZP+pOiFbnR0Ns
         DzTQejzSHS37UEbMJOsTNt3zTcF1YESm8VUX7NUlJHMAtfnJ5/SiEuUvyhofXIlFDzTU
         BAYSae7Wloa6PMAtoDUlDMBcDquB/YzFbck5qHpZXnWm9JfsYM6Z67TWC0rMHk0PatdW
         h+hefLt5KHlfNNu2Vug34cS/0VCsIgZUz5eR/W8wm60xiz0CWlm8ZN9c+0LOV/BFyHYE
         26Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536482; x=1789141282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=h9Q1oG7uOqcZOY4CKa3r5VnckqARE2ZdrPJaS6l12+fWQtoa+Ug1ZB+Aw8gajnGq2I
         B21j3q2mxdyCQayIsylYHF3qNXG83CpECDo84lxf+bZWEOKZT/eiQIFRTiijvinQyE/7
         mOp1Wwr6EHvc2WI5RKq5e8VnLe7r5aK7lF5GMKYWexvuqn3uH1Ct8Y5RKHD5UJljkpY2
         d5Xue52WW3rzPWRBcm2lYclcVu71wmqgXyktY6Us/OLcnE8QV+wGjOfUKjCF6SBAlVjH
         o48pkSGREratHZrExF3ZiZMRmopJ1w13jnS2x3WNCJc7ub1Dqt7LQy/k96cHju1NyfWg
         PEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnHUiB7oLMYyBm/SlTRjJbDhWzkDTxr+Hl7s4XYbJcRuKoWRsjBfrxa9DwKqFwNAtZc/QzS3m0aYDNu9GRMTM=@vger.kernel.org
X-Gm-Message-State: AFuF++mOif7GIPdhEZuIoqA+YaoMACHlmIGOJ4lU4Nw66KnK39xtW3md
	KEUUGcCiQkk/pFJ9nAJNOSxqFGxBZVuugC6UUNxkgfcRfbUDXMUOmzpGB0ecTbcX
X-Gm-Gg: AYBFou15+an8gZ0rWcPpLZeBODVQpDHRuF5hHS4w9SvJUyXzmEbXCzDC3cpoOwm3D7w
	ii7PHSLv2swexdwOIjjKT9rXxgRjFuXGLkIbK4hksHWyWHYfykUxqR1MHDkDNnYHb/ZNsVbAP3j
	NIWvxge0ZS17pZTN7lRXdujlpOrD3L64EZQJA4Kz6HJA/f/bF3foDGSpj+WEu4Xv7kIEtj9S3+c
	gWPdPcTuZrjB1ikKV94CfxxRjqnuoZz7N2vWhoL09oW8lYU67qw8LtJoXcYLKXrIOY88U0v1taf
	jQkiS5VyYzjDxQWa0ZtZea7f65RnrfVdZk/7WfkGCKzBP3UQ/shAnh8f8At6hvgH4zf3t7yxIsK
	4Xi3lnpyqzQKTtbHhEz3jZ0ejNdYwtD4e4X3F8Xuj3AqC0ngJwyL2MDsBq4sUgTbxXo+QmRLwTy
	pWrtK0mm+g+Mfqb73XeZEJXsiHYryr6OTceU3hrR8Y7w3Ip7GBtY2Pni1tKW1A8kuTzR5K8g==
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49cf8244260mr66326485e9.10.1788536482119;
        Fri, 04 Sep 2026 08:41:22 -0700 (PDT)
Received: from fedora ([109.77.55.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm5959525e9.11.2026.09.04.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:41:21 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/exec: reject zero as power-of-two alignment
Date: Fri,  4 Sep 2026 16:40:57 +0100
Message-ID: <20260904154057.160753-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The load_address test reports whether an alignment was found separately
from whether that alignment is a power of two. However, the usual
x & (x - 1) check also evaluates to zero when x is zero, causing a
missing alignment to be reported as a power of two.

Require the alignment to be non-zero when reporting the power-of-two
result.

Fixes: b57a2907c9d9 ("selftests/exec: Build both static and non-static load_address tests")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/exec/load_address.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/exec/load_address.c b/tools/testing/selftests/exec/load_address.c
index 55fd3732f029..e279d85e8f19 100644
--- a/tools/testing/selftests/exec/load_address.c
+++ b/tools/testing/selftests/exec/load_address.c
@@ -92,9 +92,10 @@ int main(int argc, char **argv)
 
 	/* Is the alignment sane? */
 	pow2 = extracted.alignment & (extracted.alignment - 1);
-	ksft_test_result(pow2 == 0,
-			 "Alignment is%s a power of 2: %#llx\n",
-			 pow2 == 0 ? "" : " NOT", extracted.alignment);
+	ksft_test_result(extracted.alignment != 0 && pow2 == 0,
+		"Alignment is%s a power of 2: %#llx\n",
+		extracted.alignment != 0 && pow2 == 0 ? "" : " NOT",
+		extracted.alignment);
 
 	/* Is the load address aligned? */
 	misalign = extracted.load_address & (extracted.alignment - 1);
-- 
2.55.0

