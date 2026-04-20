Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE193A0B2D
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688168; cv=none; b=iNY7efuQ0AGmq3QTu/Z3175J8Hg3o42SsWaBH1bUozeX1EgkNwVKmRPeO0IRDIDqnrQqeuFsLAmTYopk37JOMrKPKwxchqn/t8JwfjZywElXegGcV3f1Bmn5yWgheL99aasL4Bjs0EBYrmlFX/TuWOOMJg15E/M6WoprUJxLFTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688168; c=relaxed/simple;
	bh=zZnQ0VlElyX2HJ1r9qLjSAlH1p2ZV3USi55ESS5GWuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dbz7XxTNGPiqNIy/SydBEWIeGcrXIvv3mu6EbJ9yT/5gKTyDudO9C8c42wHbM1l5xjZ8XdVbMdQ8HC4pAmJyOFJx0quF+T+mrhHK8RTlrrWfRAZJGdHeXYhhjSc0SYpCt9YXLN9UUWxjeJF5tG3K+M/h6xzog0frkmmMfoEzY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hd+259sp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hd+259sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776688166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eC+Gw15PYY2xMCVGISwvaMfqiq/SdhUQydGUlDgpOjE=;
	b=Hd+259sp+qw08wNbATIuE+P743sMBiOS2YJfCYEG28XNvQT30u3dfmNc54RJX56ikjXfnJ
	qKmOIXSZK0aN7LF15uZBQtWWYLdDppIfynuUFvbpZ4DK1cdL4ZpxbFAHMTK+Xc1rMLPhWc
	n6GwUWcZzL53UD6EZl8PyzP5a0t8Or8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-jGrVKFOPNCSD5jKV5mRJEQ-1; Mon,
 20 Apr 2026 08:29:23 -0400
X-MC-Unique: jGrVKFOPNCSD5jKV5mRJEQ-1
X-Mimecast-MFC-AGG-ID: jGrVKFOPNCSD5jKV5mRJEQ_1776688160
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B6451955DD1;
	Mon, 20 Apr 2026 12:29:19 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAEBF1956095;
	Mon, 20 Apr 2026 12:29:13 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 20 Apr 2026 14:28:07 +0200
Subject: [PATCH v7 5/5] kunit: Add documentation for warning backtrace
 suppression API
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-kunit_add_support-v7-5-e8bc6e0f70de@redhat.com>
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
In-Reply-To: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, peterz@infradead.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Kees Cook <kees@kernel.org>, 
 David Gow <david@davidgow.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776688120; l=2318;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=4lfzAn+gO6eKqXz4dSBewHEkwDQyO+2TvU94oaKAI+c=;
 b=+ZaIrx/JeqPsEIaFDyLvWFz4pvg2lbnhOY5zt6oosncq1QDT0Y5Q0/25t1JHOMOw24diZyoFj
 vqfK/ASGW5lCGqqXJLSNqwsl+LQanP8755c4a2aGKmzwc++v0RYLD87
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index ebd06f5ea4550..76e85412f240e 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed with **task scope suppression**: while
+``START`` / ``END`` is active on the current task, the backtrace and stack
+dump from warnings on that task are suppressed. Wrap the call from your test
+in that window, like shown in the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		KUNIT_START_SUPPRESSED_WARNING(test);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(test);
+	}
+
+``KUNIT_SUPPRESSED_WARNING_COUNT()`` returns the number of suppressed backtraces.
+If the suppressed backtrace was triggered on purpose, this can be used to check
+if the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -1211,4 +1239,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}

-- 
2.52.0

