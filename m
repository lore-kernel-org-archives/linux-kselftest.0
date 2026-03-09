Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9CC4014B8
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073595; cv=none; b=g7+h/AMCbzs0wxZxFVGzlXicYD6PN2Cfy1NpdRsGfIJZD4h2qE4spalWAg5wghIeG96Px1FYEfexnP+jhZDUbYPpEaqaCSA1cCo2MMz/+jpKZGkEhRZ24d/Ivo5YuZNAuvoisXrsm4bLJ0WbeX9Qx6LEDlDj2bmK+aTykuF8C3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073595; c=relaxed/simple;
	bh=dn97yqhM5JULZE/7AhmPFYcp2Ky9Bl52SQiCDggGIbs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nfqs6JB8RiHzDPwyv3CudPbSUFKUcL3B0qfO4t2wvQbaLzxJvc8HfCi+jGhoGGvvl/5TcmeGq5YMT9CZ9JRZhF+N60aLU7usrDOD6az7AubqG5mCmeESpliNhKml0gxQwXnd8CYnMbB5xiZUbru0Ltjv7yJ/VO/QWImOO/v/qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3dyAMCD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3dyAMCD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so99246815e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073592; x=1773678392; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=u3dyAMCDbBQjEOM8RqVqbbVO9XzYa6IEryTQBD8qWIzc5T9TLO7cq9qr2mxcsNKHmy
         AyvaEfq/HZ/zoTOWDdhWCTYTpgv314bIfUfDXMzdKvPhkLp1B3oUZWI+MAJIyfwRZHC4
         A4Ep1l7M1x5jV9X/TsKHnAN+RUvrZxIIldyPleAFACAr4tLJcWyoia5Pla4uDb3I93ba
         RHmKVdsURl+gZnwB3EPrd3+9MLbwo1LYKbRJFaRKjvyO3mxrg9EHc7A4lgXJpj+YJp1G
         jLqEuUgfYOvA7NeBCbPjzwyWy5e6NyzUWHvZOv3jqYT65yGuapJ7hShdJ2d39y+7qkcu
         ljqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073592; x=1773678392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=L+D6OS0gUuOaUgN8dhfHvPGZnx8GwDlw6bqTR9uouGvsx1e5TX6wbQ7bYP2ehBAXAe
         1mAtJ0OqeAQucM0r9T7IcegMyJyJM7NS+FM29y9z60fjx8XK9izRxvZVyfULdaXC8T3j
         VrCI/U+djs3+tKMFU/Dk9B2QX/p+tx2Vn5pB+c0ePRS7am9pfD8JsYkKsJZQ1se6L0Yi
         T+bbSTwzMm/20cuPuVIUbZV5DqNBbpDIJWwmbJsvrUwQnzWgcPKNvlUaEIW6Bu1OzQ0c
         M/oMn3ByMKnzv1ndlJWFEG1c95YbwvIal3x7s0ne6u9Oq4WGx18zDo9kMcQvEGMjTYPm
         RgJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqqvK9R63O3TAP78v2VAoDlxvi4LtVjnPvOHeTlr4hfiUMSKnG8+VRmUcVxfKAIssRZ88qxVgHuJQGsOPpHMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgKlgbZ1DV6AYpKjRFZfmB3DbOxblEMLeWQMi5k+/rddANY8H
	Jt3j26MAPIngWD1nQ7itu8JrudeaVqY71lKowfGWf1GTbdbTALBZdCcN6pgN3BCoWQkusUtFyqG
	wY7LirQEDSGppNJM6KtIhJw==
X-Received: from wmfq22.prod.google.com ([2002:a05:600c:2e56:b0:485:318b:96c6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b13:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-48526969359mr225784865e9.19.1773073591541;
 Mon, 09 Mar 2026 09:26:31 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:16 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-31-vdonnefort@google.com>
Subject: [PATCH v14 30/30] tracing: selftests: Add hypervisor trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Run the trace remote selftests with the trace remote 'hypervisor', This
trace remote is most likely created when the arm64 KVM nVHE/pKVM
hypervisor is in use.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
new file mode 100644
index 000000000000..64bf859d6406
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer size
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
new file mode 100644
index 000000000000..7fe3b09b34e3
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer reset
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
new file mode 100644
index 000000000000..b937c19ca7f9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor non-consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
new file mode 100644
index 000000000000..66aa1b76c147
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
new file mode 100644
index 000000000000..1dafde3414ab
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer unloading
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.53.0.473.g4a7958ca14-goog

