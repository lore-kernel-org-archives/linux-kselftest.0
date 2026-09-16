Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CEA4AB3C6;
	Wed, 16 Sep 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574170; cv=none; b=XhSUpT6zGVUmrEAbuv/19x93219dui99mR/Pch3vDweWgPXp9FP4u6R75qNZVMft5tJEy87Qik5/zWvWNrnbuX9IYHEYLaAKRkZd7tNobYUY0sJJOST4MOy4328ho8lC/8XpjrcVotHbDtVhuaa3dKBNmPvuSXPPVFzp6bocTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574170; c=relaxed/simple;
	bh=uMLJBD9Kv4j1nt0LixvB8eNP1+A2sfNvXCh0Ue6yQcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpQcLjjCr/9hlshDGUr2O1W/v+FMSLgJNV0wfjw/CS6XarA5CoVtLmThOFhDMKCcc+9bDmwj1xzuyT1pIRXeWod0dsnErXEWYnZPl+tyIZlDDnHBKyUHzEdBRLpYBlqSzrcalJnQViSz3rVpuXr7zeojqVfoNU7hOuQk7aIG7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YbjSxQYd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YbjSxQYd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=1ujvHLceBOFHXCHnX203gkfVGTvDsHWbfSLb1csGpk4=; b=
	YbjSxQYdnN2XScla70/61s9SPVmUuuKYpO56eKtVXcZygKKlhARPpXCZBJlRO+YJtvirPIxn00Kl/
	8iLMNhEWOWYS/Txl1LwQPI6qtyIGbXeYTs158hlXWzAO0TYyhD6iMLanydaslCsGI2MXohR/C0YWL
	3JbR0pTK4d1sVAydhI7nBPP8ij/FF4diJaXUeWJLNyeQ1qU/lwJUQlQ9VyGKKU6y5CRrMyhErsA+v
	V+nJtjVJKbsOZyfiMwPn7TjVCMUA8Y7vFABFi8u4Aq+q/JC2jQWmXR32aGOx//Of62uJbIdd3xz9l
	1tmtCLkgHInPikLJcXbi6GAlRZVvSlKs+Q==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryx-0031JZ-2F; Wed, 16 Sep 2026 17:55:34 +0200
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
Subject: [RFC PATCH v4 3/8] selftests/fuse: check that fusectlfs is mounted
Date: Wed, 16 Sep 2026 16:56:24 +0100
Message-ID: <20260916155629.32421-4-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
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
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
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
