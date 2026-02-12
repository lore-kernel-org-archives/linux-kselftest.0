Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60EA3570D2
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900586; cv=none; b=OBV+8qm3ntzq+uxvEvVmc390drqFqxtlwap/UMyWhd9yuOM47LC4ChoQqCUBnFOCNf/ISFaQ8yHrDf9Bla1qJK1m7gDftIk372GCQ/AudwpUBZeai0e3+MNviMnlPvwt6++j9SvntYqDFY6FzWKwRqTmKonX5eJogeyb1Zx89ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900586; c=relaxed/simple;
	bh=Q9rwnCNF6xl3cTc3D5vT9BqSI/SsnIagXqKB/xam+SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SK2Jjx6utNaLvuY6S9wVdcmy3pNMIjy99i/LLCnLy8NLLWwmG6NFa4K56yn7+841maDN52//a+WAK32dcSH8aQ5GXaVJwUW7GyUpH5Lo+rafnngYP+RSRyD0CdviOQQFNRFy4GA6ZjCSpUvOUMJZxz1fqqf2GdLtzu64H5OgOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ha/CqyEY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ha/CqyEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mUo0gQwIqPNU9R/kZzDp0f/U84FL9/zC5A+f15msgTw=;
	b=ha/CqyEYKV6HoDj0QcPfxIt7WRyp/FXIIID9yejDkclmfXBaehdcB/Nwi/oF1hzmwNbHzg
	CaSB2oeKRwduWGEkqwa+ukIartDzxmmAeIaVb05n+5DdKKkYp/DoOAbi5TN5PSwQjFpqvS
	LopvkSsxeqwLCEH0g55wrSTRyoV21E0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-ffetXpVyO_6xxqiGsxf1rw-1; Thu,
 12 Feb 2026 07:49:39 -0500
X-MC-Unique: ffetXpVyO_6xxqiGsxf1rw-1
X-Mimecast-MFC-AGG-ID: ffetXpVyO_6xxqiGsxf1rw_1770900577
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E804A1800365;
	Thu, 12 Feb 2026 12:49:36 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1546830001B9;
	Thu, 12 Feb 2026 12:49:30 +0000 (UTC)
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
	gpaoloni@redhat.com
Subject: [RFC PATCH v3 0/6] some /dev/mem specifications and traced testing
Date: Thu, 12 Feb 2026 13:49:17 +0100
Message-ID: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

RFCv1 [1] was an initial proposal defining testable code specifications for
some functions in /drivers/char/mem.c. However it was not clear how to
write specifications according to the format and wording used for them, plus
tests were missing.

RFCv2 [2] proposed a guideline explaining how to write such testable code
specifications and also added kselftest for read_mem, however there was
reluctance to accept the proposed addition before having clarity on who needs
it, who is going to maintain it and for which APIs in the kernel it is
needed.

RFCv3 (this one) proposes kernel-doc API documentation according to the
current doc-guide for some APIs of /dev/mem introducing the concept of
traceable specifications to KUnit tests.
For read_mem() Kunit tests traced to the corresponding specifications
are also introduced, so that in case of test failure it is clear which
specification is violated and it would be easier to review incoming
patches agaisnt the intended behavior of the code.

[1] https://lore.kernel.org/all/20250821170419.70668-1-gpaoloni@redhat.com/
[2] https://lore.kernel.org/all/20250910170000.6475-1-gpaoloni@redhat.com/

Alessandro Carminati (4):
  kunit: add visibility helpers for static inline functions
  char: mem: expose devmem helpers for KUnit testing
  char: mem: add KUnit tests for /dev/mem read_mem()
  char: mem: add Kconfig option for devmem KUnit tests

Gabriele Paoloni (2):
  Documentation: extend the 'Function documentation' with expected
    behavior and constraints of use
  /dev/mem: Add initial documentation of memory_open() and mem_fops

 Documentation/doc-guide/kernel-doc.rst |   19 +
 drivers/char/Kconfig                   |   21 +
 drivers/char/Makefile                  |    1 +
 drivers/char/mem.c                     |  211 +++-
 drivers/char/mem.h                     |   17 +
 drivers/char/mem_kunit_test.c          | 1323 ++++++++++++++++++++++++
 include/kunit/visibility.h             |    2 +
 7 files changed, 1584 insertions(+), 10 deletions(-)
 create mode 100644 drivers/char/mem.h
 create mode 100644 drivers/char/mem_kunit_test.c

-- 
2.48.1

