Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA7313E2F
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098317; cv=none; b=d5Zvv/IjdkubpdDCZmPiI8npUQAbjTM0Bld3PqzXdlFo0eDUl580kdDB+TA3yVxxuvyqTaAAFVqw7pBdJI4jpU2EJxGRWXvzDdITvngYOy6gKfrU6BAOuIpB3CUb5L/MaGp8/dCAhP1igslOPFFyoInE0dybwgx8N2Qu5AB/rH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098317; c=relaxed/simple;
	bh=7hlfsR+NxVR84wDC2V+k6SQPH/xZi5y8H+6CYmBY5BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlK7FQ3FSEc0ug8eOKI4KP+GJHHRb82GA57RumbQSRUWSN3DrQ+UHfKzCEYMHRtCbUnGwCTiwCatU7FOLv8JvP5NftSzBK3Ahlv6cFmAtcBek689qFyZB9/W/2cLDxlTfUqD9Mskw4JSaGk8j1MNicy6cXEKGSROmPv/lzNQDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp/73ine; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp/73ine"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732e6a123so165165c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772098315; x=1772703115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTO52UAvVAs4B92EPIjRgjAEaywnmDEV4QBGIv74ZP0=;
        b=Pp/73inevdIICPttkoXbYjTFkamREKn3uSp7qVa4M0hDGAuOJbJc3OrDfqLz9znFyB
         vAX4jWbJR6Cjt6K4Qnw294Yh8FqpmPvHlZ1HU5knZlFm1ZkdJSgb7zRmpEQO67tsa5RH
         41DjmqNdTZkUXzYxAaz3gEgtRv5LHfnZyK677ZeFV+EtLkSSjsDUMYHCQC9I/RhBuMLL
         oR2xjL62KRP3AEI32FbjkdfqEfI7DZoR+Ry6SVsy4J3grXj+Y9w7u7ozESHTCMU/dJYF
         JHIpap+EMGuQlWtaQwTjURmlqPdriseRfpSMUHt3svgIueCQfsBeMHRpY4y+lGDEGxvP
         ijNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098315; x=1772703115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTO52UAvVAs4B92EPIjRgjAEaywnmDEV4QBGIv74ZP0=;
        b=eTB+nov4aMLCLPo6i5zGL3cgVmxcZkUY6xbcajhZ5Vi/OlRZfWP1z6jpp2YRI/pPyy
         s0ZgOioJ4rjSrilzjw2gnOY2rHS7QTDGLFKdjmIpWQMpvwgqYORY2O/1WqtsrSQBGGR4
         oAh4zO0BqH0s9VdEgURhFmulaf7n+psitnpu/zm9OvJbPLYNLcRS0zre7hGNlAVXVoav
         fMkyjOeCnUbcWY5kXSF4+zY+HIXHKsNjvOdmlO+8lH7o8ymcVgjdCbCcfSEstpmHvr0P
         5ouFnMAotsUvx2pbdVAh74EGrANzmgY9w8+hMnU90Q+xQMC2tf0spk7iCqWtc4jr0JYL
         vqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5NEshvQW3efIycRg92LZW575nqt9aiomqmEOSssQgswMe5V9qepnTLtvq9NJpbLKYimViMAWv8wfllEziZqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGPyJYG1HdaZSgsBJnS69DO5uL/D+SABfhRKKF7FP4YMrRzD3
	LN2mjj+adgg/iPAnvkmzZz9iTb6jR9jhrdZeKupZgt2oaevWU5LG4neT
X-Gm-Gg: ATEYQzy6jzipiXqkJRyT2JUBv80erhzjzQlDaRzHFEOhnvwgrjOIlETHVpBFYZlgMOj
	JA1MKJaDazEXWFISOKEzwnzP1Q4d399H2iJU8n/vrjtwF4kJjjsuWYHrykWmU00t2jD+UeMrp6W
	ojsgYFJF3QgNFyGPL+LZ9nKxB5+Ef+Irk0fwvh2XSbkhgUEmesyNOPTA8XqbIjpfliwK5eDDbdZ
	R3vyXprNg0htNIx++ftLusGilWsq04JtzjR1a01jcF9uaj3sidRvQiKuYwLzssIwCHJCIzPSGWF
	FLPxXb6zySdSTWT974ZS3VBUaLnHr/IDK+2IW/F/NoHS6UkLkyu+Qdvzkfe9T4KHZ3kvdL1Uh3h
	NKG9cQT7AuP/cxxrmsE8A3ovweR7yBYBrHWiJB6teXdK9IXtMoSF+OXCv39yxFaYPQ+L0WLUpzo
	uxeA3/we3SQIwoAvdgrznTjgkrgvIEFur62pVqsNPQ9JzFd6dTfwnquTRdgn/Jx0d/SAjadqJGc
	xNaMSssIE7PDc/1PQgoYRY=
X-Received: by 2002:a05:7022:238d:b0:123:331d:bdbb with SMTP id a92af1059eb24-1276ad6277emr8587660c88.22.1772098315212;
        Thu, 26 Feb 2026 01:31:55 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm1771904c88.14.2026.02.26.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:31:54 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 2/2] selftests/bpf: probe_user: drop serial restriction
Date: Thu, 26 Feb 2026 17:31:32 +0800
Message-ID: <20260226093132.437206-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
References: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/2 added PID filtering to the probe_user BPF program to avoid
cross-test interference from the global connect() hooks.

With the interference removed, drop the serial_ prefix and remove the
stale TODO comment so the test can run in parallel.

Tested:
  ./test_progs -t probe_user -v
  ./test_progs -j$(nproc) -t probe_user

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/probe_user.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/testing/selftests/bpf/prog_tests/probe_user.c
index 280dcdb5ddef..930cded1602f 100644
--- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
+++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <test_progs.h>
 
-/* TODO: corrupts other tests uses connect() */
-void serial_test_probe_user(void)
+void test_probe_user(void)
 {
 	static const char *const prog_names[] = {
 		"handle_sys_connect",
-- 
2.43.0

