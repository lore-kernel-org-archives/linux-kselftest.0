Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6139A04D
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048774; cv=none; b=irxCTMkjP3pQ1bqeT++Jgrh1eqj+neym9UJUCdxiGOfPhGY08PUnPvw3elT8uiyqcMgZcWqrf5RCUdz3ktHSxvr6jNZX7BXJ0fEX5fCa/ORZiZ+6lwuSfNGHQnWV7I+KEYy6Ew97cR1v3tXeahel/dD4km2OrU0/9jpRInTrGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048774; c=relaxed/simple;
	bh=Y6jWV6ZpYD55iJx0rXT/G22pEri5CwgcxUksOlBcAeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6JvXTFMy5Ko5CmnagfbZeA9IP0nRVMcU2lrOc/Nd8L5NE6JVJksMOcw2iK9lYKXwXtXDQka+qO+p7qg2NkFcGUuamgUT3u4gb9FsTMsa7WaisMHFbLS00IFJP6OvusvcgCIh0wdrmY/2qRe4E2+gNZnwjEkduxhj1PUgGaaRfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/0hSemO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/0hSemO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789048772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1GxlXop5BNMoKQi4jo+ZeUE7mc82UQ20F3V6hMG+loI=;
	b=M/0hSemOeRD6uU7jD5MCkAVGQ1NrSAOpgna+y+COYNsjIeFnyeQ/eqHlFC9sXDJX9leU4E
	ike/stO/2iCtfeOgTiNfbQcIvVKj6iRWK/+kBCG5v4YCfJ+RbJ2ZjQX5xf4sA4XEo3WwsY
	vpgirSV4P77QKVHswMvY4V0JNCHDc+Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-dGqvfRB9OYy5zpPFlfNstA-1; Thu,
 10 Sep 2026 09:59:26 -0400
X-MC-Unique: dGqvfRB9OYy5zpPFlfNstA-1
X-Mimecast-MFC-AGG-ID: dGqvfRB9OYy5zpPFlfNstA_1789048764
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64319540D4;
	Thu, 10 Sep 2026 13:59:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 870D346E;
	Thu, 10 Sep 2026 13:59:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org
Subject: [PATCH] Documentation: kunit: Fix bad debugfs path
Date: Thu, 10 Sep 2026 15:59:19 +0200
Message-ID: <20260910135919.435500-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The path of debugfs is /sys/kernel/debug/ and not /sys/kernel/debugfs/.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/dev-tools/kunit/run_manual.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/run_manual.rst b/Documentation/dev-tools/kunit/run_manual.rst
index 98e8d5b288085..59c3313a6d15c 100644
--- a/Documentation/dev-tools/kunit/run_manual.rst
+++ b/Documentation/dev-tools/kunit/run_manual.rst
@@ -87,7 +87,7 @@ the ``/sys/kernel/debug/kunit/<test_suite>/run`` file:
 
 .. code-block :: bash
 
-	echo "any string" > /sys/kernel/debugfs/kunit/<test_suite>/run
+	echo "any string" > /sys/kernel/debug/kunit/<test_suite>/run
 
 As a result, the test suite runs and the results are printed to the kernel
 log.
-- 
2.55.0

