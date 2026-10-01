Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19640A956;
	Thu,  1 Oct 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873307; cv=none; b=iiQZ8vO0Om1FMx3KR0P4TkcuisBiZe9HwnlpOivJhm0OPtYsgVkI6Io3DAPEm2Xm/+iwqCmJiaLTYbjuQGxFJqvVYzSAN81T2J8qhC1XYxqXV47WWNTyFjbtaN1rN3fuNLzWx5VcKVE3v4nECOcWRCU3MoSGPAMQ0m4Bb59trgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873307; c=relaxed/simple;
	bh=uMLJBD9Kv4j1nt0LixvB8eNP1+A2sfNvXCh0Ue6yQcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roMcuEvcva/ouaYn3H/cQPnwSulAPOa1PZ84S8jyevmoL9B+oVaQbTsA8XYso9qEFxngYwnVrW8ZliiGDTj9ewuYymotkEUD6GzPbkgoZJna5BvthtnhEhUeC+ex6VGoTNlcJ0Pjhgty1Fpf+ncvP+5Ac/4xD415hD69a1/IIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Wi07Z+9B; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Wi07Z+9B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=1ujvHLceBOFHXCHnX203gkfVGTvDsHWbfSLb1csGpk4=; b=
	Wi07Z+9BdVVIaCoIwpwWgVMfTDbu1ippE/XsH+kIqpWm2r2hEljIwXCpkkmpKtm35Rf5jXdnOdOtB
	t53EAR9zf2AUKhOgUG7tiuL78C/5yf8zqE7Oj3WN45h3Vqs7CUpgiBCeLnrbEaPe3vXqjCwNUpOKc
	Pwu1/7/n5pwcJNu37dDqNqFQfd/B+2jNrBgv2v0it5xPmY+KUT75GTAM1xELmHnotRa7dJpCvpLok
	i+UXvtZBQW25tqDwCRqPeyI7ZrnBXwFWvFHlDfhnKn5EiLjIOgp4zU76nYm3WSNK7kz/M2eyBN/1/
	gsS43ZGSmRfX5Ju4A6riEZgJyl+1jCTAdQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJxA-00AD0j-Oq; Thu, 01 Oct 2026 18:48:16 +0200
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
Subject: [RFC PATCH v5 3/8] selftests/fuse: check that fusectlfs is mounted
Date: Thu,  1 Oct 2026 17:49:11 +0100
Message-ID: <20261001164916.15311-4-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
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
