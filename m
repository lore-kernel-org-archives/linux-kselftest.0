Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F673E1716
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389774; cv=none; b=es97Xa2ABtbCJPpNIwFNOQI8oXNQvRE/NKIxhtGpYX0Ff8cm/0845lVTXs/AKGKps8zlqLdL3jJhVKw4G/PtTrcerTqTNZWH3wj70kbTjJ42CwSierf7ji++QnvRJW+SZOUNno0E2/XD8upglpQP1l71ssWXGrecrIddGKO5aNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389774; c=relaxed/simple;
	bh=tJ/xw5GVRZQKYbFiO6KXEF4+CQ2wIT4JYQ+dlPhMa3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvbgKgBa2PHDyXgyz9FyK3SiAGN6XVi4erO7TYgQuneFMTD4IuKlX5+x/eq3U7VePglr9Hnaah5sG8cWmpY5ligrVc9L5L1ZoG3d9OQLt5866lXx7PeR5YriJ/Hp98ELukYbTO7r/EijBdmqU5oLZdAcUK4SVedpB6EZGiIpFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEQ5bzIy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEQ5bzIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782389772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dJnQgOQKp6OC+3AGW4Po8NIKZDtM0ou7WMivXPLk60=;
	b=JEQ5bzIy6tv1x8SesTqQoxB4QCXF3sM1isePBkzST0XiMB1nKA3sniZ2Xc2W6Rmft/vFGO
	3Gcm6BUp5ZX/aOs82AKUzru8f23X0+yH/VVdPRId0ZFpkerfZlE+Bt7O2t2c8XRQ6PZoFx
	e55AaZwGkn5ylFrdUqzNTj+4RjziYR8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-g316YwksP-2xkeEykNi6Og-1; Thu,
 25 Jun 2026 08:16:08 -0400
X-MC-Unique: g316YwksP-2xkeEykNi6Og-1
X-Mimecast-MFC-AGG-ID: g316YwksP-2xkeEykNi6Og_1782389767
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6929E193F04E;
	Thu, 25 Jun 2026 12:16:07 +0000 (UTC)
Received: from fedora-pc.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 69C5A30002E0;
	Thu, 25 Jun 2026 12:16:04 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Tomas Glozar <tglozar@redhat.com>,
	John Kacur <jkacur@redhat.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v3 15/17] selftests/verification: Fix wrong errexit assumption
Date: Thu, 25 Jun 2026 14:14:37 +0200
Message-ID: <20260625121440.116317-16-gmonaco@redhat.com>
In-Reply-To: <20260625121440.116317-1-gmonaco@redhat.com>
References: <20260625121440.116317-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

RV selftest rely on bash errexit (set -e) to terminate with error, when
a step is expected to return false, the following syntax is used:

  ! cmd

This however prevents the test from exiting when cmd is false (desired)
but doesn't exit if cmd is true, since commands prefixed with ! are
explicitly excluded from errexit.

Use the syntax

  ! cmd || false

Which ends up checking the exit value of ! cmd and supplies a false
command for errexit to evaluate.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 .../verification/test.d/rv_monitor_enable_disable.tc   | 10 +++++-----
 .../verification/test.d/rv_monitor_reactor.tc          |  4 ++--
 .../selftests/verification/test.d/rv_wwnr_printk.tc    |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/verification/test.d/rv_monitor_enable_disable.tc b/tools/testing/selftests/verification/test.d/rv_monitor_enable_disable.tc
index f29236defb..61e2c8b54d 100644
--- a/tools/testing/selftests/verification/test.d/rv_monitor_enable_disable.tc
+++ b/tools/testing/selftests/verification/test.d/rv_monitor_enable_disable.tc
@@ -10,7 +10,7 @@ test_simple_monitor() {
     grep -q "$monitor$" enabled_monitors
 
     echo 0 > "monitors/$prefix$monitor/enable"
-    ! grep -q "$monitor$" enabled_monitors
+    ! grep -q "$monitor$" enabled_monitors || false
 
     echo "$monitor" >> enabled_monitors
     grep -q 1 "monitors/$prefix$monitor/enable"
@@ -34,12 +34,12 @@ test_container_monitor() {
 	test -n "$nested"
 
     echo 0 > "monitors/$monitor/enable"
-    ! grep -q "^$monitor$" enabled_monitors
+    ! grep -q "^$monitor$" enabled_monitors || false
 
     for nested_dir in "monitors/$monitor"/*; do
         [ -d "$nested_dir" ] || continue
         nested=$(basename "$nested_dir")
-        ! grep -q "^$monitor:$nested$" enabled_monitors
+        ! grep -q "^$monitor:$nested$" enabled_monitors || false
     done
 
     echo "$monitor" >> enabled_monitors
@@ -71,5 +71,5 @@ for monitor_dir in monitors/*; do
     fi
 done
 
-! echo non_existent_monitor > enabled_monitors
-! grep -q "^non_existent_monitor$" enabled_monitors
+! echo non_existent_monitor > enabled_monitors || false
+! grep -q "^non_existent_monitor$" enabled_monitors || false
diff --git a/tools/testing/selftests/verification/test.d/rv_monitor_reactor.tc b/tools/testing/selftests/verification/test.d/rv_monitor_reactor.tc
index 2958bf8493..516a209713 100644
--- a/tools/testing/selftests/verification/test.d/rv_monitor_reactor.tc
+++ b/tools/testing/selftests/verification/test.d/rv_monitor_reactor.tc
@@ -64,5 +64,5 @@ done
 
 monitor=$(ls /sys/kernel/tracing/rv/monitors -1 | head -n 1)
 test -f "monitors/$monitor/reactors"
-! echo non_existent_reactor > "monitors/$monitor/reactors"
-! grep -q "\\[non_existent_reactor\\]" "monitors/$monitor/reactors"
+! echo non_existent_reactor > "monitors/$monitor/reactors" || false
+! grep -q "\\[non_existent_reactor\\]" "monitors/$monitor/reactors" || false
diff --git a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
index 5a59432b1d..96de95edb5 100644
--- a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
+++ b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
@@ -17,13 +17,13 @@ echo printk > monitors/wwnr/reactors
 load
 
 echo 0 > monitoring_on
-! load
+! load || false
 echo 1 > monitoring_on
 
 load
 
 echo 0 > reacting_on
-! load
+! load || false
 echo 1 > reacting_on
 
 echo nop > monitors/wwnr/reactors
-- 
2.54.0

