Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g4ZSismX"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655A1C9
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Nov 2023 14:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701295917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8tAo/jhWZHKemdFMhhMTV3K6TBojPxmRv8xo7iH8yXA=;
	b=g4ZSismXVwDrKzvzHslHNQKVe/KinpODxwDZqVC8WyCMpc6WMGmKmPXLL62/ZRnVrUEH30
	yoDFA+MdJegc5cuH/jsHgo+D6I1gMlCK68dizWr6lyCNTLXs7uXfPQXhofAF9K1S1OtQY/
	tRXWI3KD0qvG4T8/Vo9XIcuw+ZKKfKY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-B0Pjic9AOkyvXSB3pOb7Qg-1; Wed, 29 Nov 2023 17:11:52 -0500
X-MC-Unique: B0Pjic9AOkyvXSB3pOb7Qg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB13811E7B;
	Wed, 29 Nov 2023 22:11:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.22.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 641B6492BFC;
	Wed, 29 Nov 2023 22:11:51 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: shuah@kernel.org,
	akpm@linux-foundation.org,
	jsavitz@redhat.com,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] selftests/mm: dont run ksm_functional_tests twice
Date: Wed, 29 Nov 2023 15:11:40 -0700
Message-ID: <20231129221140.614713-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

ksm functional test is already being run.
Remove the duplicate call to ./ksm_functional_tests.

Fixes: 93fb70aa5904 ("selftests/vm: add KSM unmerge tests")
Signed-off-by: Nico Pache <npache@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 00757445278e..c0212258b852 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -334,8 +334,6 @@ CATEGORY="ksm_numa" run_test ./ksm_tests -N -m 0
 
 CATEGORY="ksm" run_test ./ksm_functional_tests
 
-run_test ./ksm_functional_tests
-
 # protection_keys tests
 if [ -x ./protection_keys_32 ]
 then
-- 
2.41.0

