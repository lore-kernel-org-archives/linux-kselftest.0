Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8A282F23;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516269; cv=none; b=i3p8ZNqFHlvmnay2H1EZGslfccw7Dw4cwZJZQ6gMD6V73LZicQYMVlndAOZRwKT0BlDFuDvH8aarZXHlPETCFdUvAxYjB54o0p/Bv0rRjo5A9234JgsKQkJ5sqGiMARcGBibWVGiUKj1E5Rgnm4k+c20kbF8Ko/1LPfzEVfYXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516269; c=relaxed/simple;
	bh=udnNtLkfB9BqdHfUBEIhaRjLFwbvu4zznJS2a1LCyMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DB0U/qPhKIWadqOa8OQkhMySJB0fMQjrBxXt1gxz1YaCfInSeRdujDwNG08rokrxjCmcOOJ0BKe6atbWotj14GXcwfOZkqRdJhMQP3SRzhUexlxh8nGCg+xIavw7k1c4CUdmMrChu8684kU6kKioHWsSfUS9jIkK5zlp+jig3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aY4GDM4D; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aY4GDM4D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cHIYdXHobaBXrw3rsvLdZX3YT8MmclFHcsXOjSYcnlw=; b=aY4GDM4DAH6cHTXoAmMJdgtUj+
	4nwFeJ4v3R/Br5fCncg95MR3TD+I20mlvFSvlXJXVkLg960gqpi5WMEcBIkNf2FD9Yb3i5FJ7XPN9
	uukl5Z3DC0TcevEkCzjaoqX8bJGi7iDgg+5y/7aCt7aqfNvA7Qf14/Y0P8xd9G5wPK0BPZ8hlz0w1
	1ujHJI/Nz82CcUGnwfguAhcxWWec0BL/11ZEWx2Zfj8YAElKcDbiFaAZHO/ayPmSOghd6ZP+Kg3VR
	u9RNslIlSHJJ0jOC00G8r6kcV4DlA/ZpfT6PXuPW4M7dzhUUwILEPBNec0tfh/c4qmA5eJDJyx+O6
	ZDl3kKIw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3K-00BiU9-SL; Wed, 08 Jul 2026 15:11:02 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v1 3/5] selftests/filesystems: check that fusectlfs is mounted
Date: Wed,  8 Jul 2026 14:11:20 +0100
Message-ID: <20260708131122.2917-4-luis@igalia.com>
In-Reply-To: <20260708131122.2917-1-luis@igalia.com>
References: <20260708131122.2917-1-luis@igalia.com>
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
