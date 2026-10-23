Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785666;
	b=I739HFcFkvlwfAyfm4sFh41YI1xOSfiey8hdFK8mzGNPip1HLUUPh2kZ008cftu1JJYL
	 PGvQC7VZsgi0Ccu4+0IVcaCWi02AHAnUvhpx7Jo1NxfRirDyO+SzK9MPJyLNuAEDcWRQt
	 asOPRciRAjQgbjGaezk8vCpIFzCFSI9WXkvd0cJdL2RPeA2sEaR6oXlccrmpKWnhGHdOh
	 mocbGAo4je0Xk6Y3BKUvKKjR3ljYRJLvIIr1yIdNSZx6XEr9EXcmP/iFMbBa4BaDwuSXc
	 rmWWHGcz2qbr2nL0A7cgfZm57ZNSyRkgjWp4Ib7n161hocnQhn04XpbdOFbBkpN2UTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785666;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=eHJlwnQsKCIXal/ZPY0INEZh4Dk/VmnivrDCPE+YXYQ=;
	b=DzL32GnkZxdXL7wmeytb3f2fFaX0WM6Ej08b6b4vIlSqyeGAkB2rbcT47+4d8EK5JeDl
	 wK7dZBn778ZWug6MJZm9cTOEcr3OSOrswtk7uz8/AfJMNmU29H7e4PuuWRVfaOkAilDlj
	 uhf7tbwTF6JzI7gevAsDBHcFzRqXKSV4oapRN1BVP+lElg+SqkQNCjHyKnorn3mhYFFHy
	 osFrhmU0IV9P0VpBUSCqN76PvRbg57uCzx7mgmjPmvSstpJ2239xwgAtFEQD7GHwEFxGK
	 uzkBZoAesjRrIDow+pWPR2PpBceU7Eymq8Q8HnyCrxxncziSS0gUUtUZcoTnIqZDQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C90uZvp+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155860A262F
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 20:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9155860A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C90uZvp+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792785664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHJlwnQsKCIXal/ZPY0INEZh4Dk/VmnivrDCPE+YXYQ=;
	b=C90uZvp+bHfKhv0I64mCynAPyYFjLFcxsFThBTyYE5Kfn6QpUQ4HfhmKQwC0brctBz9rYq
	4qrV1ZAk7MDB/B9Ggu0xKHghPC/j7myQDsgz5BGqDKc7xTmYVG2WtK8AgobdDiuZghDDAu
	kAb4fjjxA7EYNz2JlIhDUopJOCUcNg0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-2Vp7OvzDNuGPjlUHqJgHFw-1; Fri,
 23 Oct 2026 16:00:59 -0400
X-MC-Unique: 2Vp7OvzDNuGPjlUHqJgHFw-1
X-Mimecast-MFC-AGG-ID: 2Vp7OvzDNuGPjlUHqJgHFw_1792785657
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACF5D1955BD0;
	Fri, 23 Oct 2026 20:00:56 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0FC721956088;
	Fri, 23 Oct 2026 20:00:54 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH-next v2 05/10] selftests/cgroup: Check for a single range nohz_full CPUs before running test matrix
Date: Fri, 23 Oct 2026 16:00:31 -0400
Message-ID: <20261023200036.60560-6-longman@redhat.com>
In-Reply-To: <20261023200036.60560-1-longman@redhat.com>
References: <20261023200036.60560-1-longman@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Commit 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full
housekeeping check") adds a nohz_full test matrix that will only be run
when a nohz_full boot parameter cover all the CPUs beyond CPUs 0-7. The
code looks for the first and last CPU numbers in the nohz_full sysfs
file to determine if that criterion is met. However if there are holes in
the range (i.e. has ",") the test matrix may be incorrectly run leading
to unexpected test failure. Fix that by skipping "," and anything after
that to make sure the first range will cover all the remaining CPUs.

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Fixes: 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full housekeeping check")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index f4eb984752a0..3c9f67f91366 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -111,9 +111,9 @@ echo "" > test/cpuset.cpus
 #
 # If nohz_full CPUs have been reserved at boot time, they should not include
 # CPUs 0-7 as that may fail some of the test cases. On the other hand if the
-# set of nohz_full CPUs includes all the CPUs except 0-7, we can run a special
-# set of housekeeping CPUs exhaustion tests to see if the cpuset code will
-# reject them.
+# set of nohz_full CPUs includes all the CPUs except 0-7 in a single range
+# <first>-<last>, we can run a special set of housekeeping CPUs exhaustion
+# tests to see if the cpuset code will reject them.
 #
 FIRST_NOHZ_FULL_CPU=
 LAST_NOHZ_FULL_CPU=
@@ -124,7 +124,7 @@ NOHZ_FULL_CPUS=
 LAST_PRESENT_CPU=$(cat /sys/devices/system/cpu/present | sed -e "s/.*[,-]//")
 [[ -n "$NOHZ_FULL_CPUS" ]] && {
 	FIRST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/[,-].*//")
-	LAST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/.*[,-]//")
+	LAST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/,.*//;s/.*[-]//")
 	echo "Boot nohz_full CPUs: $NOHZ_FULL_CPUS"
 }
 [[ -n "$FIRST_NOHZ_FULL_CPU" && "$FIRST_NOHZ_FULL_CPU" -le 7 ]] &&
-- 
2.56.0

