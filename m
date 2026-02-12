Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A542F39DE
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900622; cv=none; b=bztgUnn07KFUlI6OUJii76oqpbDjR5ygOBubnUb+KbVImNDebQh9qAYauxyNQidoq4lHENYbkXkK+MgRMfgECvFtvqIfIcDpsSCC2nOkSChFrs7mXq9RDM4j35RDirz4Psy90DLNXitdpR1llZ3SO9puyjer358Xo5d1DAxX47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900622; c=relaxed/simple;
	bh=KBukMFqHgWtbWUQ4Qdahgi5wHf/wDKbpF+EZPH1NpJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDwfPEXXwX+vyjEAYok3p1wgPQ9c+K6PO0894ipw+dpoN7Tq4BXBvjNs4O/3niV4Bq4wJiPnYNnrMMtJ3ckKABEYH0/B/cvkdv1AELBDSwBKlp4qvhBWCwDAuwDVGhnuxNFA3O0a8TgBV6ilM/BTADUoRxq/29xbt08bPao6nkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRd79G+A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRd79G+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGcCgAZHk66I41sdH+V/InTAwrTE9rISL0Ovf7HhMvA=;
	b=SRd79G+Alrfr8H4gSlwWeQBXtulTf0rxML2GyrMvvRNAeY62e8caCHRKRTrx5luCdMNqVp
	8wlmxZrpeU+7+vuV+0KcKis36sfb8/0ZF2S8WnuIxABEzJh1RQClZrPKNNUN6YdfAKlxSZ
	1dU+IfehLZK/340mCDkCnLrD7jtwCrg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-6JYgwUA6O2Kf_Ktz0zIqKQ-1; Thu,
 12 Feb 2026 07:50:17 -0500
X-MC-Unique: 6JYgwUA6O2Kf_Ktz0zIqKQ-1
X-Mimecast-MFC-AGG-ID: 6JYgwUA6O2Kf_Ktz0zIqKQ_1770900614
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3209918003F6;
	Thu, 12 Feb 2026 12:50:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4102130001B9;
	Thu, 12 Feb 2026 12:50:08 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [RFC PATCH v3 6/6] char: mem: add Kconfig option for devmem KUnit tests
Date: Thu, 12 Feb 2026 13:49:23 +0100
Message-ID: <20260212124923.222484-7-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Alessandro Carminati <acarmina@redhat.com>

Introduce a dedicated Kconfig option to enable extended KUnit testing
for /dev/mem behavior.

The option enables tests covering I/O memory access restrictions,
including behavior under CONFIG_IO_STRICT_DEVMEM. Because the tests may
perform reads from I/O regions, they are opt-in and documented with
appropriate warnings.

This keeps test coverage explicit and avoids unintended hardware
side effects.

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/char/Kconfig  | 21 +++++++++++++++++++++
 drivers/char/Makefile |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index d2cfc584e202..cd3e47b47f44 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -317,6 +317,27 @@ config DEVMEM
 	  memory.
 	  When in doubt, say "Y".
 
+config DEVMEM_KUNIT_TEST
+	tristate "KUnit tests for /dev/mem" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enables in-kernel unit tests for /dev/mem read/write logic.
+
+config DEVMEM_KUNIT_TEST_IO
+	bool "KUnit tests for /dev/mem extended to I/O space"
+	depends on DEVMEM_KUNIT_TEST
+	default n
+	help
+	  Extend KUnit tests for devmem to cover IO space.
+	  When CONFIG_IO_STRICT_DEVMEM is enabled, the kernel denies
+	  access to claimed IO regions. Enabling this option adds two
+	  KUnit test cases to verify this behavior.
+	  Note: These tests perform read operations, which can have
+	  side effects on certain hardware.
+	  Enable this only if you are certain your hardware handles
+	  unsolicited reads safely.
+
 config NVRAM
 	tristate "/dev/nvram support"
 	depends on X86 || HAVE_ARCH_NVRAM_OPS
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 1291369b9126..176f2b8f98dc 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-y				+= mem.o random.o
+obj-$(CONFIG_DEVMEM_KUNIT_TEST)	+= mem_kunit_test.o
 obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
 obj-y				+= misc.o
 obj-$(CONFIG_TEST_MISC_MINOR)	+= misc_minor_kunit.o
-- 
2.48.1

