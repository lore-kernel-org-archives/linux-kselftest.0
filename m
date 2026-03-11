Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB93D6CC9
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227146; cv=none; b=njagcJ7+U1RO8LNu3Gp0oTS8/1fqo2NCxBWk75NZLft8cobxJ2pJa7oKWgkAEQKWis/PuUjsFTvdfxbu2snIjf1ox8mn8L6zK0YCV6aUWvrkWl9PgbVHPAFa6xWXwgJt0IVPkEVCJznbyJ9QSg8YjHwsswVM1QefNhiNxFXxN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227146; c=relaxed/simple;
	bh=Hj5N+L2XYZKo6huM6pFqNdQ3tPjB5fdhYefLo+5H6eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a3ZDH3wpIR36xjH10f5/xSsLZyXamA2FOA9MCG1AMDke3Zs5yMG0M84VUKxmO/ypwqMyvCqTGNv4MzRjzsp265Z7+6Ti2C3PX2SaJEnI+kmAHkxMNr8Y6skAyQsNtYzm2QTA+JwCfWGJEtCiEGUaUzaezCeIivps3dw/XZbDEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duz5YKpz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duz5YKpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773227142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sed4Re6GN4uugIRwWKcjTOf13jkp6kq5XzAIG+lyY2g=;
	b=duz5YKpzcLsr+0swfRqxBZE+riYvJyQ+NBPUX5ieTXB73IXru0/h0Hz+rm4tuDUPJb/DQC
	NXd98cVG+6M0QjupalTUXfmh5OTWCz3F50Pbmo+WD1aINxzH6Yl6ezGtmcJhFGgVZJXCi7
	WB0IcZEI3J/OUjdzB7v/lpJ4jAmTQ3Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-Z6j5M8V1Pe-F26VG3WsYnA-1; Wed,
 11 Mar 2026 07:05:36 -0400
X-MC-Unique: Z6j5M8V1Pe-F26VG3WsYnA-1
X-Mimecast-MFC-AGG-ID: Z6j5M8V1Pe-F26VG3WsYnA_1773227135
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 983511955F2D;
	Wed, 11 Mar 2026 11:05:34 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 981F01956095;
	Wed, 11 Mar 2026 11:05:28 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [PATCH 1/5] selftests/cgroup: detect and handle global zswap state in test_zswap
Date: Wed, 11 Mar 2026 19:05:19 +0800
Message-ID: <20260311110523.26624-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

test_zswap currently checks only for zswap presence via /sys/module/zswap,
but does not account for the global runtime state in
/sys/module/zswap/parameters/enabled.

If zswap is configured but globally disabled, zswap cgroup tests may run in
an invalid environment and fail spuriously.

Add helpers to:
  - detect the runtime zswap enabled state,
  - enable zswap when it is initially disabled,
  - restore the original state after tests complete.

Skip the test when zswap state cannot be determined (e.g. unsupported or
unreadable), and keep existing behavior when zswap is already enabled.

This makes test_zswap more robust across systems where zswap is built but
disabled by default.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Yosry Ahmed <yosryahmed@google.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 77 ++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 64ebc3f3f203..1c80f4af9683 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -594,18 +594,88 @@ static bool zswap_configured(void)
 	return access("/sys/module/zswap", F_OK) == 0;
 }
 
+static int zswap_enabled_state(void)
+{
+	char buf[16];
+	ssize_t n;
+
+	if (!zswap_configured())
+		return -1;
+
+	n = read_text("/sys/module/zswap/parameters/enabled", buf, sizeof(buf));
+	if (n < 0 || n == 0)
+		return -1;
+
+	switch (buf[0]) {
+	case 'Y':
+	case 'y':
+	case '1':
+		return 1;
+	case 'N':
+	case 'n':
+	case '0':
+		return 0;
+	default:
+		return -1;
+	}
+}
+
+static bool enable_zswap(void)
+{
+	int st;
+	char y[] = "Y\n";
+
+	st = zswap_enabled_state();
+	if (st == 1)
+		return true;
+	if (st < 0)
+		return false;
+
+	if (write_text("/sys/module/zswap/parameters/enabled", y, strlen(y)) >= 0) {
+		if (zswap_enabled_state() == 1)
+			return true;
+	}
+
+	ksft_print_msg("Failed to enable zswap\n");
+	return false;
+}
+
+static bool disable_zswap(void)
+{
+	int st;
+	char n[] = "N\n";
+
+	st = zswap_enabled_state();
+	if (st == 0)
+		return true;
+	if (st < 0)
+		return false;
+
+	if (write_text("/sys/module/zswap/parameters/enabled", n, strlen(n)) >= 0) {
+		if (zswap_enabled_state() == 0)
+			return true;
+	}
+
+	ksft_print_msg("Failed to disable zswap\n");
+	return false;
+}
+
 int main(int argc, char **argv)
 {
 	char root[PATH_MAX];
-	int i;
+	int i, orig_zswap_state;
 
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
-	if (!zswap_configured())
+	orig_zswap_state = zswap_enabled_state();
+
+	if (orig_zswap_state == -1)
 		ksft_exit_skip("zswap isn't configured\n");
+	else if (orig_zswap_state == 0 && !enable_zswap())
+		ksft_exit_skip("zswap is disabled and cannot be enabled\n");
 
 	/*
 	 * Check that memory controller is available:
@@ -632,5 +702,8 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (orig_zswap_state == 0)
+		disable_zswap();
+
 	ksft_finished();
 }
-- 
2.53.0

