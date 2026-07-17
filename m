Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C87369D5E
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303365; cv=none; b=p+1VbX0DdFvTVX8RBFzqLObR9yy/PS7VnZykql+K3KTnhM0g00pbhftzPlhw1vx/Q76o/O6JGC1G3KYDbPQJSw/HotfUUfvypenZ2ALzE+Cp9oO/bGcZ/kFr30ARibhAhQ7Iic1mKb5YWgnbLlbdM2POpqWsFnAA5XdWjakAJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303365; c=relaxed/simple;
	bh=5mZjwLR92JiFfHeXEC0KRUFmzTs/lN+oUYBXLWRqzGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCp24pceotGtw9y8Mn7loYNfP+FDx6Yh4/qPtDxl4E4L8nBasPzitIzMkBnzNgOvdxjlKG/v+L/O7EbzFWnMryN9jUtjHDjxo1x+nhIj5D/HL7VJ7xVAwKul1PPTz3XZlRT4re1YXYueNG1rlk4X8YnfcqUXJsxZ8M2HY8bn7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/2wBqZs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/2wBqZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784303362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffO9XxsfjYQtotnpHJWX40bTrTSixy4ttiScoP34Oa0=;
	b=h/2wBqZs3M4ISsYLflc/zaOt0DwCRtTz1vgSFj5LUoCwOkuRTAxSaiE5ZcuAdod7mSge/X
	9/U4qw6Ii7hEEa/Dp5xYpI1BvcBktJQo7V6tfiI7jPTjZD18jvIPxVIH54zslGGf8A2NXf
	nwOvLO8CQ1IaRS4wIHhRvF4wjZDkFGE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-Jv2lIa1zO6CJpLA_0Lrqsg-1; Fri,
 17 Jul 2026 11:48:33 -0400
X-MC-Unique: Jv2lIa1zO6CJpLA_0Lrqsg-1
X-Mimecast-MFC-AGG-ID: Jv2lIa1zO6CJpLA_0Lrqsg_1784303311
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C87281955E75;
	Fri, 17 Jul 2026 15:48:31 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.local (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80FF53004181;
	Fri, 17 Jul 2026 15:48:28 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Wen Yang <wen.yang@linux.dev>,
	Nam Cao <namcao@linutronix.de>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Tomas Glozar <tglozar@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: [PATCH v4 16/17] selftests/verification: Rearrange the wwnr_printk test
Date: Fri, 17 Jul 2026 17:46:37 +0200
Message-ID: <20260717154638.220789-17-gmonaco@redhat.com>
In-Reply-To: <20260717154638.220789-1-gmonaco@redhat.com>
References: <20260717154638.220789-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The wwnr_printk test expects no reactions in some situations, after
fixing the bash assertion, the test is failing because expecting no
reaction after a previous step had reactions is flaky without making
sure all buffers are flushed.

Wait for reactions to be over when expected by polling dmesg for an
interval without any rv message.
Also simplify the load function to stop loads as soon as a reaction
occurs, this limits the number of lines to flush and makes tests overall
faster and more stable.

Reviewed-by: Wen Yang <wen.yang@linux.dev>
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---

Notes:
    V4:
    * Wait for dmesg to flush all messages after reactions

 .../verification/test.d/rv_wwnr_printk.tc     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
index 96de95edb530..37d96e1ae93b 100644
--- a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
+++ b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
@@ -4,23 +4,40 @@
 # requires: available_reactors wwnr:monitor printk:reactor stress-ng:program
 
 load() { # returns true if there was a reaction
-	local lines_before num
+	local lines_before num load_pid ret
 	num=$((($(nproc) + 1) / 2))
 	lines_before=$(dmesg | wc -l)
-	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q
-	dmesg | tail -n $((lines_before + 1)) | grep -q "rv: monitor wwnr does not allow event"
+	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q &
+	load_pid=$!
+	timeout 5 dmesg -w | tail -n +$((lines_before + 1)) | grep -m 1 -q "rv: monitor wwnr does not allow event"
+	ret=$?
+	kill "$load_pid" || true
+	wait "$load_pid" || true
+	return $ret
+}
+
+# loads may flood the ringbuffer, wait for all pending printks
+wait_dmesg_flush() {
+	local last_before last_after=$(dmesg | grep "rv:" | tail -n 1 || true)
+	while [ "$last_before" != "$last_after" ]; do
+		last_before=$last_after
+		sleep .3
+		last_after=$(dmesg | grep "rv:" | tail -n 1 || true)
+	done
 }
 
 echo 1 > monitors/wwnr/enable
 echo printk > monitors/wwnr/reactors
 
 load
+wait_dmesg_flush
 
 echo 0 > monitoring_on
 ! load || false
 echo 1 > monitoring_on
 
 load
+wait_dmesg_flush
 
 echo 0 > reacting_on
 ! load || false
-- 
2.55.0

