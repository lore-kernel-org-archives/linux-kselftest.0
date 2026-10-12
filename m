Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D703E5ED7
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798579; cv=none; b=ubfsXDamL+LG96oF7n2mTN0BRjQKKND4j60QGxCgDJJZY3jg8EsPfzG4Yv83y5IDHCurYJv18lL8dXuPYmcO+60HhaD3tJcq8hdsEf3i341t51lG3jYI7NWSsde78grfeg9vHy8Vd1KzaaHk9rq+IQsg6qrU9+qZ+hHoa3ujDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798579; c=relaxed/simple;
	bh=/o8DbhUa8w3SHvoeC4yYCFodh4VMe2LhHW/nE5IhWpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVDH5qvnW72C70A+cmqX4y5o/+rTgVgvNtDWNYXvVZWhJ+RiG/vSxHaE4YtXwkOMbPpi8dD03DhzvPfYGlF0qENlGZMNPBgsf6r4fkcAA9pLfOqCNcs1bdcL0fCZJErN07sSH1Z6zV3KkFWSGraWhfglmWUdZi/RghKXNUR0EVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3yHXy3W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3yHXy3W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-885cd98d226so718492b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798573; x=1792403373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcV0tDx3s3vnrx2NYfd9pGnewnwOmP1EvF1UHeoFl6M=;
        b=h3yHXy3WqBIsTWGFXaXvjLfPOLmgJc5jA6yC66ZStJEXLloEjh1TyG4VKjACsLKrlI
         UbHq7w/fbszNbGAYthU6AFm2Z/U3xRlz+2kla68tlgWeZj0IHCzVpgD8Zkdc3dJrIbPd
         7w3MdyTHBv+KFrxouDT+6+sKhdSRUjLbdi3YzcfzynIbn1MaZti9DAaYxnyreInqcwog
         2DL9S79jrkK3qm++n6pfGfFLRNf3nhpOnfmwNi6vzc4JVzaJRfq0EyHhTzWyTWbKHuKZ
         AEsHs+s3GN6sKcu+Zs4jzllRqof5rNSM/6s9yrtL9FsHhq+IFhgKHnabBYWBq5WMIsb+
         5yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798573; x=1792403373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcV0tDx3s3vnrx2NYfd9pGnewnwOmP1EvF1UHeoFl6M=;
        b=o8rAwxOXZzKDIUwupX407GlBPLwiKQJhmwj1eJRQxDDpr3DlylYI+tqDDxOWJfi2fl
         +3qhbvhMpYYD6LK2IUAIN5uBQh/Bq4jafJzfOPmeE9CXqdT1YYQASvzmuKWVlsRwZhQL
         uQ5sw+W4j8F8usjhDQbAQhCKwZLGi9kwssrPfuF0IfqqYaY/H5e21lJ1azO4wquo2vpE
         ufInmiJO/yuZdC9u+SfmUiIIMcwMIAHZIE4dhUStkKq7MabyrKHFiTvSkqEEIn+i8vhF
         oHoPH+MfvaPe9rrUItT1jjWoOdxDHUWGPet0aGPLppCLmEeGTFleTyYKqRQUxU031O+b
         VuZA==
X-Forwarded-Encrypted: i=1; AKwUvBxk3Zs4lYnf+KYY9G/2lKXyLHceADvPNnivpc53SvoAg2QczHI0/S1ePbf4A+HRvMNTyY2heIDjD69nkOB/6Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLekzAkQQtmAkKURS/lzafuZa3GRTTaiT3TGpcdeuY8POsDf21v
	IFf7RcFIRiQ1CtsQIeTq+X2NvVnbP1WS86ixE6Clbfs+EvvzkMV+zDVy
X-Gm-Gg: AYBFou1g4y14TZj76AOyOgPSVakOX+XtyrXfwKL1B7jkqd/D2jt8S3sXNbEikdzh+7I
	sRl2g/sFifJIAgfZH4I41iswfq8RIqWoQlxpy3+IWpGVt1Ef7NN00Ok4RIWCzR4oWkietQtSlgL
	RyVpMUQYRAhzZqDz/Zm2xARPPJHouePD6X1EXdXzTlYFQD4omAiWTEJrwXlFvXvaRj6PzNssHki
	dXfMIOqm0xGXkxqhRndqnKijcxP49WBY9SQG4IDroJjwK3lj3iLqFH9B26v0J+U8WVUaGOUPMjL
	z4+cn+TYanA642l7dsK/1zCxVjjCgz2cjh/PdomlWYzoAs1JuH8/j/4HNxHPyn6HATNwTq9MUBq
	RjrF+mIeCMdMpmg5y3RvBxopWZ5OxEJAjz0kbvGi0R3aCMqnDBDY0FvbNr/MTO1JXRuHJofRxxc
	kBjT/TxxB0vB0RkL8MUNNC4qOm1pr8ZYjjwd9Mj/k4QCA9N9c+DAyYlhAt0Ep0eMrAz+K6xXa9a
	wNHKVFZC4orI9B17yTDnYhlsL2MdQT7eKmbIL5o
X-Received: by 2002:aa7:9308:0:b0:878:3705:571d with SMTP id d2e1a72fcca58-896a47e04b0mr5886470b3a.41.1791798573142;
        Mon, 12 Oct 2026 02:49:33 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm3974435b3a.58.2026.10.12.02.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:32 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org
Cc: cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/cgroup: test pids.events notification
Date: Mon, 12 Oct 2026 15:20:11 +0530
Message-ID: <20261012095011.3188830-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle a failed read of the inotify event before comparing its signed ssize_t result with sizeof(struct inotify_event). This avoids treating -1 as a large unsigned length and inspecting the uninitialized event buffer.

Link: https://lore.kernel.org/r/20261007063516.1192279-1-sahaj123.sc@gmail.com
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/cgroup/test_pids_local_events.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_pids_local_events.c b/tools/testing/selftests/cgroup/test_pids_local_events.c
index fa501e209187..59885901fbf5 100644
--- a/tools/testing/selftests/cgroup/test_pids_local_events.c
+++ b/tools/testing/selftests/cgroup/test_pids_local_events.c
@@ -90,7 +90,11 @@ static int test_pids_events_notify(const char *root)
 		goto cleanup;
 	}
 	n = read(inotify_fd, event_buf.bytes, sizeof(event_buf.bytes));
-	if (n < sizeof(struct inotify_event) ||
+	if (n < 0) {
+		reason = "failed to read pids.events notification";
+		goto cleanup;
+	}
+	if ((size_t)n < sizeof(struct inotify_event) ||
 	    !(event_buf.align.mask & IN_MODIFY)) {
 		reason = "received no pids.events modify notification";
 		goto cleanup;
-- 
2.43.0

