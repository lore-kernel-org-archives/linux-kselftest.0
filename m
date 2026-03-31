Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796F3EDAAF
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950262; cv=none; b=N1UKiAJ+5KjIDU4EGb0lVKeFW3LTi0AW1CsP5qUdM10U+v4N9IQifSaKVc3b2isvfBIdyAllEJ2bPXy5wTZX3dwj3NBUI58E0XcQWr3DL/eVyw0yyEoL+Or0mOoYX4JEBypEGJf1eyhbyEPya+IUaQMlKmNoeRRQ5yiKlmYlFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950262; c=relaxed/simple;
	bh=Y5HYmfo2hrjkYl2etfmR6FyOxfYHNvPpo+PR8dGDbSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m49yevTEYIa03kXp3qwQQEZWohr/6ZrwAF4PMvLrTbDP1Z7VfucykHd0mtcENGBEQWAs3qBcLKswQi0Kv4xh2TH9EeaoeuMlZf12A6bFR634JR7ccZQ39jQxN1LTWCoV9M6fABAhxZrGCYCDO/wG2hxycFcOtsx3YvoGzWFRvhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a7ZGkGa8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7ZGkGa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HApNsJMnQkGjRCw1G9QlTLRX0WXwGT8mBK0arH4RiRo=;
	b=a7ZGkGa8MEc/j9gOh63Kae7qeNDMwyEdrk2CwtDFM1xkB4w8ao3qaPq437hPvfMUKapWsO
	uBMHFTZinjwpxm7uxyOZhzhqlEbjDyWtK28gHDGBiK9ypkqKli0XqxzwMLzFjpHfBM84Kn
	6J4iWC+ZaotXdanLKEDWIk2Ynj1/bUQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-9FjosW1CPO2exaI7I-bw2A-1; Tue,
 31 Mar 2026 05:44:15 -0400
X-MC-Unique: 9FjosW1CPO2exaI7I-bw2A-1
X-Mimecast-MFC-AGG-ID: 9FjosW1CPO2exaI7I-bw2A_1774950253
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CBBF195608B;
	Tue, 31 Mar 2026 09:44:13 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E08B30001A1;
	Tue, 31 Mar 2026 09:44:06 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/2] selftests/mm: clean up build output and verbosity
Date: Tue, 31 Mar 2026 17:44:00 +0800
Message-ID: <20260331094402.144131-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Currently, the mm selftests build process can be quite noisy.

First, it leaks raw compiler errors during the liburing feature probe if
the headers are missing, which is confusing since the build system already
handles this gracefully with a clear warning.

Second, the specific 32-bit and 64-bit compilation targets ignore the
standard kbuild verbosity settings, always printing their full compiler
commands even during a default quiet build.

Notes:
  Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
  to linux-kbuild@vger.kernel.org.

V2:

 - Drop 2/4, 3/4 from v1 to v2, since Andrew wasn't able to confirm the
   patch works for the rarely happening issue now, so I decided to just
   hand on the process of the parallel issue.

 - Refine the 4/4 patch only to hide compiler errors when missing liburing.

Li Wang (2):
  selftests/mm: respect build verbosity settings for 32/64-bit targets
  selftests/mm: suppress compiler error in liburing check

 tools/testing/selftests/mm/Makefile        | 9 ++++++---
 tools/testing/selftests/mm/check_config.sh | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.53.0

