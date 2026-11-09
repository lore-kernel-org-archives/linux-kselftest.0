Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252005;
	b=SRt8ODXgFMx9zRvgFJ1hQWOUbHu8XIxJZhph9ujmfJwmKR+zAEgju5lUoQAWF7lv1SKy
	 2BrnPO8cLzwieohYZMr6kft3P6gDKaUUT9BQox48Y4XSjjkMbrngEb6ALep6eaNJDM5Tc
	 NvUYEWMFkvS3rTUBTXR6K7s8Dl8F/3Xc/iCjoEOIcmLSgniNOU1cMqZ2CKVeJK2GfFvsW
	 cosZJiM0TjULbYY69r0MbbZyMy2qOyXYA4pGg27AfKOI12pXz+X3LeCG+rFJugCUcVog2
	 l5RUdlFFyrmve99xgyLDBrhpWPLT/Tp2WAvubXzEMPJMtwErjDNNPxHWG2oTwD2Widg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252005;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pByP64xYjlCmoKt/eNlnc0GMK5oodeNiOFZJqxDUKPk=;
	b=AmDV+jUKmnSeQ768CiM8cFJHj5d+c0HxE3c9np6kGaH5Xd9wODoYwXLADgVAPU/au8Yk
	 vHti9A8VrDHxFo6gKqiLKlHHJ0tp1c/VVbuxdan1dmermD7J6HN8rhq6PopHHlHMRKdBD
	 06OEiYXYPqanHaX/fFMukZnaA1u5lGoJgbZiqtk/3wxZqXdHBsDJJjEl/55Kzf58g2bJI
	 1VEXvszLTB3tuA8c9rH45FAXhw1JPV4c5Lh6tnIuFFgh9XcHezKzZMYtSAWo0GMAB9XBA
	 f2FaXGzA15LFW1egCAvP+DvFAzBfjHn2uVmxqhStPEsJxfLRy7d5wmXCrvVT9dZCVsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=LfIWjz0w;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26062606A31C;
	Mon,  9 Nov 2026 19:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26062606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=LfIWjz0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1794248809;
	bh=v/4GMSFwTdjUInNUT+gg1y5mga28q+gEKxv/5/CU6fM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LfIWjz0wcawGk9tLwhsw02zxwYERtrtcIWhP5Jq8Jg9V5XB+JLngczQt9Dn+zTCw4
	 wCHao6UJIPJ+IhNWame60t4InjRF4W6S1rSM9/AqqRj9ttJuaFHMUv4xGOPTyDcErQ
	 tyiXEUleZxbvlkFbolXByY4Tto9iVU782LRbsnHY=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 7D3674076D;
	Mon, 09 Nov 2026 10:26:49 -0800 (PST)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Mon, 09 Nov 2026 10:26:48 -0800
Subject: [PATCH v3 2/2] selftests/futex: Test tagged arm64 futex addresses
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
Message-Id: <20261109-futex-tagged-uaddr-v2-prep-v3-2-3f5f2ef83138@gentwo.org>
References: <20261109-futex-tagged-uaddr-v2-prep-v3-0-3f5f2ef83138@gentwo.org>
In-Reply-To: <20261109-futex-tagged-uaddr-v2-prep-v3-0-3f5f2ef83138@gentwo.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248808; l=4099;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=v/4GMSFwTdjUInNUT+gg1y5mga28q+gEKxv/5/CU6fM=;
 b=9WvlPA4uRv35Tiu696WHDaHQybRLPz7PE0XaNDkkx+Ygo7MTZM4qACQXkP+j7NG1/2LpoK0/b
 vnyuCL1h+AICqIyQACN+AqgT9nti0XFFzApe0r0uYxTUbJzEt2XuREB
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

On arm64, a thread that enables the tagged address ABI can use a
top-byte-tagged futex address. Verify that a waiter using such an
address is woken through the equivalent untagged address.

The test retries the wake briefly while the waiter queues, avoiding a
dependency on /proc/<tid>/wchan.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
 .../testing/selftests/futex/functional/.gitignore  |  1 +
 tools/testing/selftests/futex/functional/Makefile  |  1 +
 .../selftests/futex/functional/futex_tagged_addr.c | 61 ++++++++++++++++++++++
 tools/testing/selftests/futex/functional/run.sh    |  3 ++
 4 files changed, 66 insertions(+)

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/testing/selftests/futex/functional/.gitignore
index 7c39d10b38e4d86096d2d1ce5fe8d6036e8ca758..c64b93a683bd6e9f6b9d3e4f02397eb24cc5a0ad 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -6,6 +6,7 @@ futex_requeue
 futex_requeue_pi
 futex_requeue_pi_mismatched_ops
 futex_requeue_pi_signal_restart
+futex_tagged_addr
 futex_wait
 futex_wait_private_mapped_file
 futex_wait_timeout
diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index a03bd5acba50319f08b04ff0904ef155c000fee3..8f7f6730285b725b483787362db4626c459d65c9 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -19,6 +19,7 @@ TEST_GEN_PROGS := \
 	futex_requeue_pi \
 	futex_requeue_pi_signal_restart \
 	futex_requeue_pi_mismatched_ops \
+	futex_tagged_addr \
 	futex_wait_uninitialized_heap \
 	futex_wait_private_mapped_file \
 	futex_wait \
diff --git a/tools/testing/selftests/futex/functional/futex_tagged_addr.c b/tools/testing/selftests/futex/functional/futex_tagged_addr.c
new file mode 100644
index 0000000000000000000000000000000000000000..0b0e350eff11939e42b7b1aca01136b037ed7217
--- /dev/null
+++ b/tools/testing/selftests/futex/functional/futex_tagged_addr.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <errno.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/prctl.h>
+
+#include "futextest.h"
+#include "futex_thread.h"
+#include "kselftest_harness.h"
+
+#define WAKE_RETRIES	100
+#define WAKE_WAIT_US	10000
+
+#if defined(__aarch64__) && __SIZEOF_POINTER__ == 8
+static futex_t futex;
+static futex_t *tagged_futex;
+
+static int waiterfn(void *arg)
+{
+	struct timespec timeout = { .tv_sec = 2 };
+
+	return futex_wait(tagged_futex, 0, &timeout, FUTEX_PRIVATE_FLAG);
+}
+#endif
+
+TEST(tagged_addr)
+{
+#if !defined(__aarch64__) || __SIZEOF_POINTER__ != 8
+	SKIP(return, "arm64 64-bit tagged address ABI not available");
+#else
+	struct futex_thread waiter;
+	int ret, i;
+
+	ret = prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0);
+	if (ret && errno == EINVAL)
+		SKIP(return, "tagged address ABI not available");
+	ASSERT_EQ(ret, 0)
+		TH_LOG("PR_SET_TAGGED_ADDR_CTRL failed: %s", strerror(errno));
+
+	tagged_futex = (futex_t *)((uintptr_t)&futex | (0x42ULL << 56));
+	ASSERT_EQ(futex_thread_create(&waiter, waiterfn, NULL), 0)
+		TH_LOG("pthread_create failed");
+
+	for (i = 0; i < WAKE_RETRIES; i++) {
+		ret = futex_wake(&futex, 1, FUTEX_PRIVATE_FLAG);
+		if (ret)
+			break;
+		usleep(WAKE_WAIT_US);
+	}
+
+	EXPECT_EQ(ret, 1);
+	EXPECT_EQ(futex_thread_destroy(&waiter), 0);
+#endif
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/futex/functional/run.sh b/tools/testing/selftests/futex/functional/run.sh
index d1a681b798bd385570710e7c5f9bb28cca64de3e..620d13ee7171e7cc6061053750c9ff4cf525ff72 100755
--- a/tools/testing/selftests/futex/functional/run.sh
+++ b/tools/testing/selftests/futex/functional/run.sh
@@ -46,6 +46,9 @@ echo
 echo
 ./futex_waitv
 
+echo
+./futex_tagged_addr
+
 echo
 ./futex_priv_hash
 

-- 
2.52.0

