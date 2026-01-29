Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAB36606C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721961; cv=none; b=RNLOc+c0Co9m2H/RJgyryZd5rIcTkIp4rvqeIaaOFL6GYTftf345r4PPbrib/2mM2kfIp8GfkCZB/8X6C+rWpo8g75sgDH4irc0pY5WsCSbNrJC2wh6NJJOplX9xEDOhsqfz6zItrU9jrwD3DSI2t3ZmL7/cYgZHQ/MsCKVadJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721961; c=relaxed/simple;
	bh=FPm4HNnNzdGsASTEmXYmmsAPSB4aul9GWDReAyxeCCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R1h8MWs0ZkMFOKY3mVm67BiqhwGv+At9oNanuA0N6V5ZUeqi3VjRpwHCg8vwTXzpQGPUB54+YZMnn7S3+zXtEhqtMWgRzh2o2wQeXBpaCJ0jcnbjGCC7IZFT8/LKtY+oO3I9tOFSeCij/yEPAYzxucaOrMVf0YXxnlIbgJ5j08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jeUpRM1U; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jeUpRM1U"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-81f53036ac9so1263974b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721959; x=1770326759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=idHpW3SDccKJdv6+7GcWw8jBEpKmDKEMPgP0EwwfxqU=;
        b=jeUpRM1UNmTsBxYdioDrYyaaBwCFGiaoczwyCBJZM67st2YYKUK208OKLs7RYsr+D1
         BJBExVhnR5YILu3UlQ3Ik9nU/V3io0yTjFysavSShZS6Zi83Moo6S/iiOg9okaftHKTG
         /OCM7VqwrAJ1caIGChnC1gcg4HOBFTLLhphWpuY3BACjk3dqIz/7O6mFsy/A6PPjLunC
         ObFwNqzIUX+EtQiMLStK0f3Zvp+ugXw9XHCOG10iSBdzrs/04Mf0Pl994mDUK0jvpWBt
         kA1Dh67dlTNA3ioHsoQdQlnsjWivaZ3NzH7oihtDOml5t+98mMjV8eXnd9FeNtdw6B7p
         xneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721959; x=1770326759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idHpW3SDccKJdv6+7GcWw8jBEpKmDKEMPgP0EwwfxqU=;
        b=BmIbK4liZRi+rX1Q5HFZuUJC99p9hBvUrz4AA7AOQ181vluxM5yiz5iBMsmqjSoaGJ
         RDOjH8sldLbxToOfWtmALIcpRrHuxo31X2pa1fZXyIHZxJ+IOWlXRf0uTWZYzh2DzD6B
         JwOSP/6lKJAn4b4cMNkKn3/TtddAFWbyHKWWWBqCkwBp2Je4Mx3zVIg+nu8VlXEuZbqw
         1PQ/BXK/PpeCQH60UBzgkVm2ri+9+T8P1tkFqFFycSSvam7A/ghpM0RaXhMkwgVAln91
         1v1UYZWEr/pSf3UCXWMB5tjCaXVoe68c/ZxuAXezpis4qWTmDEJoIe8Jk3gUIy4WYJA1
         4fPg==
X-Forwarded-Encrypted: i=1; AJvYcCXX/978tGeRU95Mk5UkMMa3Ah2ORTzkN8aEm1XmE1VRf1HhDHlNefI9IXpxL1f6HiU3cZlc5/XwgQEiIJ36Quk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kbPqrnOawN0Ge0SrAALC8aDzYT3AzBK4/CihYr0Fa6ug9b/W
	M6pM/vRf4yKy2YavhNUHAP+2mM170aMdLXo5c9q9bNbqE7IBOjbSBejdaNR+iZamBOhigV5l8dP
	r7f9hK0tU0ezmDg==
X-Received: from pgdj29.prod.google.com ([2002:a05:6a02:521d:b0:c5e:d16c:917e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3392:b0:366:581e:1a11 with SMTP id adf61e73a8af0-392e0148145mr472290637.57.1769721958852;
 Thu, 29 Jan 2026 13:25:58 -0800 (PST)
Date: Thu, 29 Jan 2026 21:25:00 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-14-dmatlack@google.com>
Subject: [PATCH v2 13/22] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

From: Vipin Sharma <vipinsh@google.com>

Add helper functions to preserve and retrieve file descriptors from an
LUO session. These will be used be used in subsequent commits to
preserve FDs other than memfd.

No functional change intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  3 ++
 .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 4390a2737930..4c93d043d2b3 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,9 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+int luo_session_preserve_fd(int session_fd, int fd, int token);
+int luo_session_retrieve_fd(int session_fd, int token);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
index 60121873f685..9bf4f16ca0a4 100644
--- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
@@ -54,9 +54,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	return arg.fd;
 }
 
+int luo_session_preserve_fd(int session_fd, int fd, int token)
+{
+	struct liveupdate_session_preserve_fd arg = {
+		.size = sizeof(arg),
+		.fd = fd,
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg))
+		return -errno;
+
+	return 0;
+}
+
+int luo_session_retrieve_fd(int session_fd, int token)
+{
+	struct liveupdate_session_retrieve_fd arg = {
+		.size = sizeof(arg),
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg))
+		return -errno;
+
+	return arg.fd;
+}
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data)
 {
-	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
@@ -75,9 +101,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 	snprintf(map, page_size, "%s", data);
 	munmap(map, page_size);
 
-	arg.fd = mfd;
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+	ret = luo_session_preserve_fd(session_fd, mfd, token);
+	if (ret)
 		goto out;
 
 	ret = 0;
@@ -92,15 +117,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 int restore_and_verify_memfd(int session_fd, int token,
 			     const char *expected_data)
 {
-	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
 
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
-		return -errno;
-	mfd = arg.fd;
+	mfd = luo_session_retrieve_fd(session_fd, token);
+	if (mfd < 0)
+		return mfd;
 
 	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
 	if (map == MAP_FAILED)
-- 
2.53.0.rc1.225.gd81095ad13-goog

