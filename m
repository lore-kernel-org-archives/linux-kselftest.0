Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB73E7148
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813620; cv=none; b=tMF8iOz+puLlrbCPsJ9ZJqv89DbrCVb/6iGCNz1B9ksixq5phlM8dbiKutoNUr32/vuYquaf/b9wobxAprUnTt/+Dh/fioam3rK1hOCAxOxLuNpop/rPgWYEZlb5eVyOhvpr07WQlLmQcTzOBbAH3bk9ROl0Ij9VLUoUJCC3vAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813620; c=relaxed/simple;
	bh=MXOtCZMxsfDHijoxtxkoRjFvX0AqG7us86qHveio4sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nf4+PadxqkJNWaz4yDKtbmPC+02IpzdGg4lfQKM80HPTYZ8lGNOFo33bQtfA1k6cD9XrIwHtG3KZwunjwnD4KoQTDDtN4A3RchL6jc6UmkBKoz9nUWaec6cNNCgSw3YAF3gYJDZ0ckyuaDlVxeoRJPQDi3va0yT/03w255ZXoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQv8wKxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQv8wKxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYUhUcPVkT/WRHMuV6chDisV9g6arbR69yzhwqgrfkE=;
	b=FQv8wKxRrzrIhkZeEcyrtspDiaIIyyslmiONOSZ/CnOc0WGvp7pBkoEuqMmC9qWIu/uXtQ
	lyDdWnyDZ2LjOe2wtN8jvPMPq5TUPl6VHZ8ogN4kJv9yiaikv5mgYlwC3nuX1gKwmUln7p
	FFhIxOTu+TYNlbQNzy4DJV/cCeYwjbM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-8LnrB05qN7ih9snMrK1IoA-1; Fri,
 06 Mar 2026 11:13:34 -0500
X-MC-Unique: 8LnrB05qN7ih9snMrK1IoA-1
X-Mimecast-MFC-AGG-ID: 8LnrB05qN7ih9snMrK1IoA_1772813613
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D18C71956080;
	Fri,  6 Mar 2026 16:13:32 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AAED3003E9F;
	Fri,  6 Mar 2026 16:13:28 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:08 +0100
Subject: [PATCH RFC 3/7] selftests/sched: Integrate SCHED_DEADLINE tests
 into kselftest framework
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-3-2b23ef74c46a@redhat.com>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
To: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=1708;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=MXOtCZMxsfDHijoxtxkoRjFvX0AqG7us86qHveio4sU=;
 b=TifsLXEcWcIHmDxSHhpItoP9zVsWID3JNnDfIMM1CYQG55byQVh0vo//tvnlRupLWM1NR5Zkz
 7mBexaxN5APCWFo/AFVtO0tyZrvk8sNRNT4eaPQqn1JZOcFViw1HREH
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Integrate the SCHED_DEADLINE test suite with the kselftest framework
by adding it to the parent sched/Makefile. This allows the tests to be
run via the standard kselftest mechanisms alongside other scheduler
tests.

The integration adds deadline/runner to TEST_PROGS for automatic
execution during test runs, and deadline/cpuhog to
TEST_GEN_PROGS_EXTENDED as a helper program that should be built but
not executed directly. Build rules recursively build the deadline/
subdirectory tests when the sched test suite is built.

The tests can now be run using standard kselftest invocations such as
'make -C tools/testing/selftests TARGETS=sched run_tests' or 'make -C
tools/testing/selftests/sched run_tests'. The deadline/runner will be
executed as part of the sched test suite, providing structured output
that integrates with the kselftest reporting infrastructure.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557a..8ee7620cc214c 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -11,4 +11,12 @@ LDLIBS += -lpthread
 TEST_GEN_FILES := cs_prctl_test
 TEST_PROGS := cs_prctl_test
 
+# SCHED_DEADLINE tests in subdirectory
+TEST_PROGS += deadline/runner
+TEST_GEN_PROGS_EXTENDED := deadline/cpuhog
+
 include ../lib.mk
+
+# Build deadline tests
+$(OUTPUT)/deadline/runner $(OUTPUT)/deadline/cpuhog:
+	$(MAKE) -C deadline OUTPUT=$(OUTPUT)/deadline/

-- 
2.53.0

