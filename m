Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0BB46D579;
	Fri,  4 Sep 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518339; cv=none; b=fIQsNGXxqIK2OYctPsXqTVLPd9hWAO64AKis4gmOrOA6ZEFpEmjJNF7q//JlQ7ZTWcBZ4HL+6205nRCGWc9IdsRlFlUVWuYhvF7YjQ0M/7okwRHcxE5jqTb27BgfY4x6gcFYigYH5+QmRgN5/TcqL6J2N34wYQvLHt3/vK0mZn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518339; c=relaxed/simple;
	bh=QHq06vIBI/zcCiYamSeW0cj0CU94kxJhrIBliQgxEL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fv/0rUCKv+WCO6jGigX0UX82qoQHpbjgyrYG4LI20jdD4AZ5lIIBOtWEwG2nvV/qL4xGxwE6XPu3/mO5hsBSL5iGY2GziJbaLH1rh0GN9KZl5qJusfSimcDBKqgZClRXqb4e7mk1lszt8gO2K9cf2kuLt2D94XllkH6P/ZxSoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JB09mUd+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JB09mUd+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=i/McfkNPYafi7JUieLT42Z73GlZoO7bNl/Ko8hzAWGI=; b=
	JB09mUd+VtNh1OIyZGZT8PoRnbLb5Bm+w2KAIKsojPCfalJPNF4Ji1tbAZE8Rhm3SVYQK0QLM5swd
	bRkIQSpAeUZfpvLBexZxGiwNhofQB2Mkw+ilh8yfadWM5BQ4aKXj4Tt363eB3Tt9CHb31bZokqmCZ
	bO2ZQr8NOzSaCwDdCxf6QMD7Mf8bFgDXdV+V3LTizPA7CGfB/2f9cVI1HUty9Guu7xI5YQb0LKXu1
	8cuQQoBgHAHGVayotn1/f5xHDoTH3uN7OHpCoaVl5mMK94HjygtV5aDtkm3nPAP/NDtgkLQUwIFV5
	vSeI3mf3iB7dEv3lvNh6tVOXHxFkj3YbEA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJl-00Eq0p-PM; Fri, 04 Sep 2026 12:38:45 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v3 3/8] selftests/fuse: check that fusectlfs is mounted
Date: Fri,  4 Sep 2026 11:39:15 +0100
Message-ID: <20260904103920.4471-4-luis@igalia.com>
In-Reply-To: <20260904103920.4471-1-luis@igalia.com>
References: <20260904103920.4471-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control filesystem for FUSE needs to be mounted for the fusectl_test to
be successfully run.  Skip the test is that is not the case.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 tools/testing/selftests/filesystems/fuse/fusectl_test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
index 0d1d012c35ed..b828173c01bd 100644
--- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
@@ -106,8 +106,15 @@ TEST_F(fusectl, abort)
 	char path_buf[PATH_MAX];
 	int abort_fd, test_fd, ret;
 
-	sprintf(path_buf, "/sys/fs/fuse/connections/%d/abort", self->connection);
+	snprintf(path_buf, PATH_MAX, "%s/%d", FUSECTL_MOUNTPOINT,
+		 self->connection);
+	if (access(path_buf, F_OK) != 0)
+		SKIP(return,
+		     "fusectl doesn't seem to be mounted: %s",
+		     strerror(errno));
 
+	snprintf(path_buf, PATH_MAX, "%s/%d/abort", FUSECTL_MOUNTPOINT,
+		 self->connection);
 	ASSERT_EQ(0, access(path_buf, F_OK));
 
 	abort_fd = open(path_buf, O_WRONLY);
