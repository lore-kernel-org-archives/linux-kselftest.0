Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B041D628;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975906; cv=none; b=t3U7aUHqOLKA2veEKoWf2AwOYRE8hqCrpzGE4b8rSzZYCERretg9T+7HvDQ+HG+sqMOdscQXwneHxl4J1lmtR8R601A8ogTMW3/hlptCZkn1YxNmDeKIXlgOEqT5VW3s6Lo+I6Egf6FUxc0aMjRdSMSZo1YNNv7V66mg0qcEiVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975906; c=relaxed/simple;
	bh=gzdMPSY5857b33eoqcvliN4DZtcbHYo5tfiX4/6mTiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHf6b/EkzU2HyJW2SrzaEyNs/l3vPDcL2TCc7B3U1KpAVkFPaIKiMIC8jsH5NEI/gJL5BseFCG9kB4fluxaxrsffHrdGHvABlsq7He1Yr9pT/XpbqOk0O3QZQpzI+MzAT7kWjHhE+0i3PtIzf/e4CSJAjPDpPc1c+RxY3NyiUVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rpxXcis0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rpxXcis0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=YxrwnrFhtOfXg8AzEHEtSrO2yR4kSnVVGUJ2cFKcvN4=; b=
	rpxXcis0UvU9CK5L6qSwYGL1Oqn9s+UUloY3QsuB3IGb3E/V2taQWDq+likoAy4Hyxyw7b9fns912
	Udj6Cf9k9kzmvnEXp9iX2PpP0zJohpy4O5++NpBULew00hs5vmQWYGxcgXRuJv0FdFt4PCcdFTtjM
	kJQaUbjE5EfjrPH/ffgSM0KA4xeuVC21PG8i0SxYxXAEB+eTD+ezigucPYXSODVsVfzN+mC7BjHQx
	fTwTen8Q/AcUklCW0yDWNcguPXOPwLvqrkWnf99MumV1JIu3A7Gvdq8G+TkMWRF1LknDVuM0RlxpL
	Kd73v4YEFre13cCvBYQovvUW0DTxLRrcXw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3p-004Xy6-00; Mon, 17 Aug 2026 16:11:33 +0200
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
Subject: [RFC PATCH v2 3/8] selftests/fuse: check that fusectlfs is mounted
Date: Mon, 17 Aug 2026 15:11:51 +0100
Message-ID: <20260817141156.6079-4-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
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
 tools/testing/selftests/filesystems/fuse/fusectl_test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
index 0d1d012c35ed..2dcfd3ebe0d5 100644
--- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
@@ -48,6 +48,7 @@ FIXTURE_SETUP(fusectl)
 	uid_t uid = getuid();
 	gid_t gid = getgid();
 	char buf[32];
+	char path_buf[PATH_MAX];
 
 	/* Setup userns */
 	ASSERT_EQ(unshare(CLONE_NEWNS|CLONE_NEWUSER), 0);
@@ -93,6 +94,12 @@ FIXTURE_SETUP(fusectl)
 		     strerror(errno));
 
 	self->connection = statbuf.st_dev;
+
+	sprintf(path_buf, "/sys/fs/fuse/connections/%d", self->connection);
+	if (access(path_buf, F_OK) != 0)
+		SKIP(return,
+		     "fusectl doesn't seem to be mounted: %s\n",
+		     strerror(errno));
 }
 
 FIXTURE_TEARDOWN(fusectl)
