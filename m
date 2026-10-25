Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914650;
	b=nkRJ9/mOTHTBUJzwtHRHu5EZl3KMDsKV0bOscWCFw9fYUFquUAyOR7RXVbmCGw3bG4UG
	 DAxOUGpIv7gZfZHcuJUKUcJgFU9Hn5z7XG/Y4WIRYNYUX8GqOGWgLXMk/L2DzORcfIA7n
	 rJ/49rqs8d7eEIYoMXxvQnPxnHHZ8AZAVM9KhRaObBaUSbuAwHYAOvGmbSbXHveOo2twt
	 S3cjvUQd4ww3KmrgTstfjbscHTyWpz/N/jLCaNX3fRyUgXbPTD2qPq8hCs4BC92IrUzQ4
	 nQtcVW91e0cF2ELbMipHUWZB1Uq/yuKZblZBrY0UB1HmbZJIi+ALqApk7Ix9IQOdd2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
	b=kBqnOfWiN8UZf5rnuxVJ5ulJ/TxbQSsUolfPrB8kT2GvOiFC5KGTcZJLAvNpKB8rMxZa
	 WRYi+wPqUTYrUIOhVK3AkpBiuGLShOkh548L4iMYd86GTK7hk4l9togcRwS3X0Tz+j0fi
	 ml3OhDKeDobMUjDSa4CiZF8T3gERU9oapXcBoNluR0IZjDj33P4gY2xypaccQeMxlqBoT
	 rKOBgGXWur8wW7Q+zk8RoNxct/2CSDaGwf7BHjHkeVTk4e7Ql5SMAeTGTQOjLg0ROnORi
	 HG24mJ7yGBCOHGgdhQq+jZoUx2Jz65OwQqtpbAWJwsKTXTz315vluMRBHIQ98F9kWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU9D4xZQ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C20606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 07:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU9D4xZQ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so3967020eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792914648; x=1793519448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
        b=ZU9D4xZQT9lRNzJIr0ql9vXLWN16FNvjZngwe3GrKVd/CkwklZ252VjyPTMyxakg9o
         iacgLUa6eSniXyNb41gMlUTdOtXLYcpdyEMYWEi9nrr0oOzXXSPaeJWbgAcwGXJCcjkM
         Vt+d0vAVPMVhR4/Ywl+vs22ZZbKY2KRzAcdbzVkv5iltNWMglPoPuxxZuTZ3dTclNuXK
         s0yQlT/qzXD3IyFmDukHYBfDX9Id3/D0dWEU8dA5tFBcgE0a7aWc5+a8e4wTLA4mJwIr
         nFXzrg/C5StE0K24XJoBbv40rP3Zvu71CA/gm4JFmbjQqRSKf9QcgOizACAZkxUZhO6/
         SQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792914648; x=1793519448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
        b=AN4zW7oyJextersHHcwnNb3hnuwLO0sKd/Ip0M4DKc/RyZZonRX6Zzi4a/+nw9U4WU
         mdJfkxOItJs7WKw4OvxkGixOKqlaSMtUj+/BHuSpQ7ep4ViqzL6tFJ4G0nhvYW25S5zY
         FVx9eqtSKW/NC+yYWm3zyCyWlvuwG6GyvQ/nV8Nud0vEgeyD+MpTo3kvM+X/4yBLvmfb
         o4AG4MWvJ+a75YMWplJM7PiO9Bd3K10SGRMklgz7kg3zwlZWHgZcTHXrFGbIm2QZpeHC
         NV7+TcWx/BMi3UH/hbS+pxCyk3nXGcqBvIodPNKg5W1MeHNMyn2JTQFv7m9HOul9GLsB
         oywQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBP1YzaWFIjXLMiqdk6n5i28QMmSmNfMCegHBdmvztxxIn8jVgYuKg/3iRMHl/5EpD+6UYWJ8JKELzX7YZDyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz3Tp8AfI0e9F7xy2dP5APEsUIx54CuSdwuDj19aRahVAt9GL7
	PZpep/MNtyeQ9QG58viXi4NuBSwvfndVNnrDJnGN7JS0liBL4RzCeV/a
X-Gm-Gg: AYBFou03d2yVM3v7I1SnZ1cnXmKvKeSDjU6PbZ828mxNaDTJm/rATEfgETYA35Go6mQ
	DwQIkp82QYL6gLs4LaVZSlcoM6vkZrE04CwQS0aB7/uktgr66US8NfUukZ3/7fkx9bLGALEfeD1
	v5JZrLnRD4DbyMC+tbbLf8/qWmSpOrcOkcJNL64fu0lq4SMnZreVYN21pdNphkYpdA5OKqtLtP+
	WbAVrM+IG6xOrdT0LbtsKRjjg5DHPDQJhgo8q7Gx8DcRxXlNs8gQjpLWqONMwqPj5LEZzgrYhjt
	QefZ/VPATuq9Sgrfe7kwFIFdP7woku15Cqz6a7tBhncwdJojVEmd+6iSdh/qMfkhvAfP8OXpW/J
	8pa3mggh1leavPql+MpFoH3MOi9/ieKic3/VgbK+uTJedX0knmv8a+r22rwMRqkOVabN34OKSqU
	5NsJAMXj1SP2ePpCYChrGveJlCq/4MK476/vNoKnzekncSCQ1dTKwriGMqbEBgnoulLErApbtym
	PXAcTgh7xQN2ydcjbAHxvMBWLroEfCnvWV3QBfIpBUYfn6tNi/ajGI=
X-Received: by 2002:a05:693c:880d:10b0:35c:ceb0:8bf8 with SMTP id 5a478bee46e88-369e849280dmr5082964eec.9.1792914647783;
        Sun, 25 Oct 2026 00:50:47 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c572bbsm14791299eec.2.2026.10.25.00.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:50:47 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Add missing spaces after ! in probe syntax tests
Date: Sun, 25 Oct 2026 16:50:42 +0900
Message-ID: <20261025075044.1750113-1-jaewon8868@gmail.com>
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

Add the missing space between ! and grep. Otherwise, the shell tries
to run !grep and reports "!grep: not found". This always skips the
conditional checks without checking for kernel return probe argument
support.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
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

