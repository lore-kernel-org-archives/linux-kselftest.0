Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240578;
	b=QnYJHANDsWFiFWhQm3pG6u8hbRpU/3NSLvXg7ypw/c5AIU1xcqOy/zyhrRvRjk2qyiXj
	 Wcj3Qsv03LnxW1FsS2NLdFuA8fYOKonArfHgu74/IkzI9x5Uy3EX5fM8r5w0iiLyGY+k3
	 ZWIe9RTd2xg70yGw37n9dlustOrIM8m7MWVz+/n/pUStLqrOzme2p5N2kSQP7s0qW75JI
	 9Wr18x/vS4G3tCalHBYbUy9vPgpWPoOQkDMLzEGxR8wm3g1yAuvqlvpS2uzIVy0zayWkz
	 5Maz9xFVT+PZ/0eceZ0ag2iX4Dt9YzACjf2rBLHWvaBYXi9CXhrAXaVbYF1dStI1xnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240578;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=c8hJ4Syg/g0hE3TbMaMdcwj/ifhECY2wBJ1FoLYtHZY=;
	b=NxmjBmI4bvdzS1iNSVC5XI3cYmtUGkKgA7b6Grcx+OFTlwUEniWVNkoujnrkFMW+Jhqw
	 OnzWouQFUiWEfpZpnVSvVXwJ9wNZhrD1+JHHGlFF2ousMEtPiEeQrXWrK4qvpdnjEdNVu
	 vXpMDa2gKXqEzZ36AC70Fo5juOsiw9tsC6gAnA3onDk499zvW4dSn5+LsxfbrH4PU8aAr
	 5y2BWq3C5IWn0YEoncq+ILZ8wXfNCa/xEUZiNMOoNwWAIERAmByrNmykZz2Xz6PgHiLsU
	 kzicq+DoJR1zLT+h+/Ghudot7g+34v8Xws052O235P5PHJ7LOIcKwBmPcAu2RgyMYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U2N8Xg0K;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F2606EE85
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 16:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97F2606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U2N8Xg0K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794240576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8hJ4Syg/g0hE3TbMaMdcwj/ifhECY2wBJ1FoLYtHZY=;
	b=U2N8Xg0KrqfuYWrMvzeaxZMa0PjyvS+kIRUCiXPRabhFxvP26DF/cWn7fEbWfMT6YCVaJI
	kkZVkmn4M8OHiWJNBHQQeaNgQUqq1/geGhUgVTzIckIdns2niHPlFjLQHOJI9tU8/hbsmd
	R88s/d/+GNow17qpyucEkI2wHIbUoq4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-ntnGMztqNzK18mHC-Wg46g-1; Mon,
 09 Nov 2026 11:09:31 -0500
X-MC-Unique: ntnGMztqNzK18mHC-Wg46g-1
X-Mimecast-MFC-AGG-ID: ntnGMztqNzK18mHC-Wg46g_1794240570
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76732180065F;
	Mon,  9 Nov 2026 16:09:29 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7210339204;
	Mon,  9 Nov 2026 16:09:27 +0000 (UTC)
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
Subject: [PATCH 1/5] selftests/cgroup: Fix "test_cpuset_prs.sh -v" failures
Date: Mon,  9 Nov 2026 11:09:08 -0500
Message-ID: <20261109160912.1369897-2-longman@redhat.com>
In-Reply-To: <20261109160912.1369897-1-longman@redhat.com>
References: <20261109160912.1369897-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When the -v option is used to run test_cpuset_prs.sh, it activates the
use of sched-debug to determine the set of isolated CPUs which will
also consider 1-CPU partition as being isolated though they will not be
reflected in "cpuset.cpus.isolated". As a result, some of the expected
isolated CPUs values have 2 different set of values to correspond to
these two ways of determining isolated CPUs.

Commit 6e4834ba8986 ("cgroup/cpuset: Fix incorrect CPU accounting with
parent's effective_xcpus expansion") introduces some new test cases
which fail when the -v option is used. Update the test cases to make
them pass with the -v option as well.

Also remove an obsolete comment in update_parent_effective_cpumask()
of cpuset.c.

Reported-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/lkml/886a562b52b1c5094142d547a8336457@kernel.org
Fixes: 6e4834ba8986 ("cgroup/cpuset: Fix incorrect CPU accounting with parent's effective_xcpus expansion")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                            |  6 ------
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 13 ++++++++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3052413e41e7..40e7d33847f7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2157,12 +2157,6 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			else
 				part_error = PERR_NOTEXCL;
 		}
-		/*
-		 * When both cs and parent remain valid, parent's
-		 * compute_partition_effective_cpumask() call would have removed
-		 * cs's effective_xcpus from the parent's effective_cpus. So
-		 * there is no need to adjust parent's effective_cpus here.
-		 */
 	}
 
 write_error:
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index bdca6c471f87..3835b97f7a8b 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -534,16 +534,19 @@ TEST_MATRIX=(
 
 	# The extra CPUs gained by a child partition when its parent expands the
 	# exclusive CPUs have to be taken away from the parent.
-	" C2-6:X2-5:P1 CX3-6:P1 \
-	                    .      .    X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P1 ."
-	" C2-6:X2-5:P1 CX3-6:P2 \
-	                    .      .    X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P2 3-6"
+	" C2-6:X2-5:P1 CX4-6:P1 \
+	                    .      .    X2-6     .      .      .     0 A1:2-3|A2:4-6|XA2:4-6 \
+								       A1:P1|A2:P1 ."
+	" C2-6:X2-5:P1 CX4-6:P2 \
+	                    .      .    X2-6     .      .      .     0 A1:2-3|A2:4-6|XA2:4-6 \
+								       A1:P1|A2:P2 4-6"
 
 	# Both expansion and contraction of parent's effective_xcpus will be
 	# correctly handled in child partition and the child can be invalidated
 	# if a populated parent could lose all its effective_cpus.
 	" C2-6:X2-5:P1 CX3,5-6:P2 \
-	                    .      .    X4-6     .      .      .     0 A1:4|A2:5-6|XA2:5-6 A1:P1|A2:P2 5-6"
+	                    .      .    X4-6     .      .      .     0 A1:4|A2:5-6|XA2:5-6 \
+								       A1:P1|A2:P2 4-6|5-6"
 	" C2-6:X2-5:P1 CX3-6:P2 \
 	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
 
-- 
2.56.0

