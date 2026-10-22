Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639062;
	b=q7Fd80MfniHNP7Me8fbMPFF3+n15lviEit+X9PlPyTYNXAfNVLEkMEw5wW2DSUphHv+U
	 SGJSFu72b7bsVKZXJ0p3pu34Wd54QuD1eNjPjNc9iuiHTHi0MOdDbPizOond1ynqsbsLW
	 8Xka2Y5Q/lG7QWPCTmqU03PnAq4VbLpZ8I16oLcbl3XxUaH3OZVey0jk6fkMlUn49HKKa
	 WZO/lkHifAhrhw+yJKmsxHtiwh4Cylx1CfmMBhMbalwsT5ir+MIIenZsMrQlIfCAa314u
	 D3v/tuYoX9Pr/cp6pGUTQ8MoW+aGKhwPV+bAtmVUf41AaWw/eR81dO9LT2lb2EunBpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639062;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=RGZ8br21835imo+G0zDR3G2ix7ITkok4YNbrTgrQSBc=;
	b=eZTwWE3cS4CN97LpM/MmU3S6/6s3/H/uv8rwDZ1PVgp1VbC2UUwxXdUfrECXxBcrVQGa
	 NtyZoQPzBGGiATzaXn1PWntbY0N1+DyxVg69oCoss5W9uZApkp9pRRCJVe/nYcZiPz7oU
	 JzLFCgkn4vd5/kXIB8cb2b7zyDN1cT3J8J09v3VUTVrRCpIR9sdjUw50njHrLUuRcaRni
	 bBweOsVGDVRMyhv7yKxQSoUkMCFrbLm/YgOvqwa9/B2vyf/RmJfS/RUCw/CLWS1FiZ9rC
	 dyXJUlDvkwmVUVcT7S0bKTasK+Q1HYFTfl3zE8/suxLTooNmPZJl/vhWaiqp3b2ZlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NpXvRs/b";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAB060A4ADE
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 03:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAB060A4ADE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NpXvRs/b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792639060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGZ8br21835imo+G0zDR3G2ix7ITkok4YNbrTgrQSBc=;
	b=NpXvRs/bdhPGlEr34tn+IDDEu1Wr7tbjtZvZpJ++/W13ZPd+dMCzyLGNwIxt8EPr/pOXqK
	HAip0QyftmD5KPXLLl5xgfVmKU1W9avsuOPoVvd5lM+CMtGES8N7Y446uyLytp77uMba/a
	lrWscAw1f3Tx3MTqZOVLD9ASAhNKgaI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-CKQslshwNoepTp3RLus3ng-1; Thu,
 22 Oct 2026 03:17:34 +0000
X-MC-Unique: CKQslshwNoepTp3RLus3ng-1
X-Mimecast-MFC-AGG-ID: CKQslshwNoepTp3RLus3ng_1792639053
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24A551800562;
	Thu, 22 Oct 2026 03:17:33 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 779BB18005B7;
	Thu, 22 Oct 2026 03:17:31 +0000 (UTC)
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
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next 5/6] selftests/cgroup: Check for a single range nohz_full CPUs before running test matrix
Date: Wed, 21 Oct 2026 23:16:42 -0400
Message-ID: <20261022031643.1351877-6-longman@redhat.com>
In-Reply-To: <20261022031643.1351877-1-longman@redhat.com>
References: <20261022031643.1351877-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full
housekeeping check") adds a nohz_full test matrix that will only be run
when a nohz_full boot parameter cover all the CPUs beyond CPUs 0-7. The
code looks for the first and last CPU numbers in the nohz_full sysfs
file to determine if that criterion is met. However if there are holes in
the range (i.e. has ",") the test matrix may be incorrectly run leading
to unexpected test failure. Fix that by skipping "," and anything after
that to make sure the first range will cover all the remaining CPUs.

Fixes: 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full housekeeping check")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 8595b6b4b7bf..5bc144836bdf 100755
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
2.55.0

