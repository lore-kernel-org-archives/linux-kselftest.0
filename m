Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150406;
	b=3C++7lZGOdYaFWYNEuw7a04ZNUIOvH9n+VZLnl3b7V0zUFUbQ28I3Il86+9kH/TsdMOG
	 Zxi5KRfudGzCjB13qZQ9eZqNUG+PE1VWRkeO1eJwv9Ycy42VabTZEqKah4zBCHEnbtkvg
	 jS7rSzLLqkieJ7vUQYBWv/39Gxrar4Fjr6CLvz17RIfIltKIqC3kPw2EGC4jfzDx4ehP2
	 48KimhBicqoaQXpygA5cCENwbu+r7InJlxKPK+w1Rq4uywxiwaCjf1h2eTDvteGK00BBH
	 GPEXflflatRj7xKFlh0HP/78bQShdoBUTZESPg7/A2HEYIo3qeXYC/WEsudV7EMucsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
	b=emWIWyxmglTk0f+s9UmJG5akD1LW1R2zkIlKsv8tmoCAjUdRWLQ6829bPGpVTxSsf9bP
	 CBqZiLf40Gg7MObu3lD/G0UfRUm+Ch+maSpyKEP8lDzrZvHQFpS+eo6faV+/6/XOrIAUt
	 IJD5ppjjhMqIuRll6Q/2Kgc6tuP82YC3LqUHFsP6uLzQEW4QwRb2tgkor5LWg8IgMKWSA
	 J3H5IK1JSBFs07xAlq5uFDW7YlT9SHwfa/26NMhxgKkrQjzU32U7kn/tAXcnWh+UJPHql
	 XQfJ2eooG3QVbxds1qzpvUXvt7HD0sutVs7s9kqv6sAfxOJ82LVzRzQxNt41Ds4VPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYuptatW;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B6606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 01:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYuptatW
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso245324b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793150405; x=1793755205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
        b=cYuptatWk3AIwuv9NVY3j83Ne4A61NfgI8j3FYTY6xXx/cFjxGfsLVtWCjrLpzKhWp
         25pnxHwRFPtQANPLPSGH6YnFdmPfUI1ByFIlZWoMnzHMztZ/lVvNe2lFch8ihM/BdsN6
         FNlOmF2TkRk+aBvX4uxxQfIaYJXgRnzmG2F5ajawitg5FWu9W7dR7yTKR7GC+WqhGEZT
         ETGOsO4n+ZVDpYbADgdtN5+dXKuTPl6KIeqfT6ijS9xdocn4JqhBpSZVnQixv+DE98XD
         ARMp0gSsgVtXbopws1pGy8qq5vbCPhsXYbXHbbAywwhPtySTAYQULmVzvZ3pHY3rdMA8
         oJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150405; x=1793755205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
        b=RXwlEiK/w9GM3WB7/NrHdEDOzMGjQQFTtscx1qkZootoek06NijXkx9xqyYm6uKYB6
         ami/rTbxYGUwOfqpQLb3F0YnpxIbneDrXkqOkj/teVPXM27KTvoaCWYm9vDZP+BgplbZ
         4uScC8sG5uEOg1TOjgojDRO/EuWAZd7tiWEJdcVXJQFH9c1cGiJ0J4FYRLmpVho3tOYD
         CJLeKwhz2zpaEUmGQ/eezqRFV3bu3Oq1A1zyYZsPoybYFiYN5SmsucdapoxM4k9l6ueF
         BCqKcHhpuS33SFtAXlECIbL1tA9hg87rhNF89KL84/mUuSmInbdFeb4mvdwpir5+7SCs
         blwQ==
X-Forwarded-Encrypted: i=1; AKwUvByRzniMIG8QVG1F+w92h63G2YhQhr1WJwS8N7DGrpexLjLiMUzFSFzsQM95n8uNdORSql4xubrLa47Y3H65hC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQ8D32SWUtJ+//POuqxplX92QlZQRxeTYfppf1I2QgKhvUBsK
	VItsU+jxq6Jok6J6+SeJOLPCbWde8IXx9TWqmX0kQicPMbL2eMKHpmk8fwaYrIe2E0w=
X-Gm-Gg: AYBFou10cINJBnZl/g57Gfajp/c9i+43QEExaqZCU1NwlyNOw3M85+316XDJbiE85RX
	NWn/wUaAL77ibAtfaCCXEZQrSOt3bjvCs07iFghVZNjpDuHJzLUkdEQ2er0wFA7RqB8/8R0N+j8
	3+kHHwfSTUN9htqwDCkiIZe6mtZvgUuP9Az8995BEcLTHOxYGHDGA14F8D/s2f0F+3jqjpMsh2e
	Dsh4SDVxHk9eZJMSweGLuuMsGK+BLKthXhCsPr6fxAfPy6L81y/r5g203ZLjK3MITro94DqYim+
	Yrdup0WYHtzoRHF1uOPulg2NIsg/HBd3QgEHRI9ZqEchm5w/N2DUjp3geEMVAspwWIkRJlmvqbM
	tbhMdoK0LzqUE0y+0e/+aYW2PXIe7WCKvrxKu2UDLe5Bc518ByCqeTCK96VqF4zp548jcPSdqpq
	VrzDbbUlr05/QOZFBcLM/ZTX5QD+R9EzT7xB/uecVaQMXGC6j88HPxOQCmgeBUB0CMRBi17LLdA
	TbhQPmawwOnDaZJ1bvqpn5wErOwo5HjpyeeySfKXoo2W8a4vLyxHcDDWIs7bcKyrN7nV7vl9Hc/
	pDlpvBvjpoA8S8ZGGmJ4clxsR/1beyZfjaXoiQxdl82JWtCciA==
X-Received: by 2002:a05:6300:49c:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3e902392eddmr613544637.51.1793150405474;
        Tue, 27 Oct 2026 18:20:05 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc8f97esm3272997a12.19.2026.10.27.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:20:04 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2] selftests/ftrace: Add missing spaces after ! in probe syntax tests
Date: Wed, 28 Oct 2026 10:18:49 +0900
Message-ID: <20261028011923.2050009-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025075044.1750113-1-jaewon8868@gmail.com>
References: <20261025075044.1750113-1-jaewon8868@gmail.com>
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

Add the missing space between ! and grep. Otherwise, the shell tries
to run !grep and reports "!grep: not found". This always skips the
conditional checks without checking for kernel return probe argument
support.

Fixes: 25f00e40ce79 ("tracing/probes: Support $argN in return probe (kprobe and fprobe)")
Cc: stable@vger.kernel.org
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
Changes in v2:
- Add Fixes, Cc stable and Acked-by tags as suggested by Masami.

 .../selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc  | 4 ++--
 .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
index 384209968325..70751573e8de 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
@@ -33,7 +33,7 @@ check_error 'f vfs_read ^$stack10000'	# BAD_STACK_NUM
 
 check_error 'f vfs_read ^$arg10000'	# BAD_ARG_NUM
 
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read $retval ^$arg1' # BAD_VAR
 fi
 check_error 'f vfs_read ^$none_var'	# BAD_VAR
@@ -100,7 +100,7 @@ if grep -q "<argname>" README; then
 check_error 'f vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'f vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'f vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read%return ^$arg*'		# NOFENTRY_ARGS
 fi
 check_error 'f vfs_read ^hoge'			# NO_BTFARG
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
index b0e6b80ccb01..06efa67e01ff 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
@@ -108,7 +108,7 @@ if grep -q "<argname>" README; then
 check_error 'p vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'p vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
 fi
 check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
-- 
2.43.0

