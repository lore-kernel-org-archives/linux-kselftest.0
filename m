Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D03CF039
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787141853; cv=none; b=Y7g1X40de5cBYsew2ch73kVq1l8LTxVG504L1xBVNRWVLH2lanowpIQpJT1cHVwq/MACaRZavp+9v5cWzdsYqHnsRkP4p7tLoC8MR/3CPcuOt1m58dSAIV0lXg53HLRVVDO7QU8ZfwuQBbxkb6g7LokkCNaqFeK5iCDVc9HfEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787141853; c=relaxed/simple;
	bh=QLVmhApoIdTSnG+xl7FWKcVJjdtidrk3TLZpK5AFcnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cI1GAKIreb6U0/3uFFXuALeTbsUmqByzRosh6ZbkQriTj9I5bobqlaYpoVa4G+HbmlCXuGgITByDql9Mfq3Ri3Yrvu2WNfQNXkwncR+SdYgqLAZSkwikvwARlJFHwsOYNGISNksbBv4ZEaMO/QM5zQSiqYadOdI8zicy3crJeLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neXAdWA9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neXAdWA9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1033094a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787141851; x=1787746651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ky3eaerp2FIi8m89t9kDf7IwmRQ42625cuWkd+thIcA=;
        b=neXAdWA90VIXjiTTtqCF+q3jMEY2JtTMlER0VWFbb6sOcswi7keb6W1hI68KgOu89K
         wYEwPpJil8ThzAPobPk6P9hQskjp/BgjVGXG789RdESTOuN1qUYtYG0E/GQ31sZxbrE+
         nQpiUMX9qAp+iqI/Ll23RE0LvbqbNBSPDIMx2E92Pn5EzZNqMBVKp5TRFscn513z0Xo6
         eKr6eEo6ZcbQofmaTdNuw2I1h+v4x9pWpcnNTwJCyCCm8NAbZ0O4e0pixEN10Ve1xvzi
         DDQDKvs+BLerOahbl06XEROHbhd7dqZps0O+sTfZyNGMH3BgM6KT/h2BndVSlID1o8wR
         p3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787141851; x=1787746651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ky3eaerp2FIi8m89t9kDf7IwmRQ42625cuWkd+thIcA=;
        b=eW6lLNuCjziKfiJprxvQc0c4DDyT7jbDFRnesOn6to74UCEi6joCAhCqFG0L9JXJnr
         WK9HrOrwXul8YzUj+yBSz7m13/5ffWcNNQl/HujuwcLszQ1Y3SJ//+ujIEWzA1+dZ7re
         a0UCL/d7fVH501QluL0+uRNCT5Jwu2LQ1eLHCDwVRolS3ROLumVRXttDTj8xgawL5BPL
         Fm6vXiAjz+2cg0QTfhap5NhRM6MgxZKyMUZsa0NYXtXTdft+efUWChH0VLvDrKa25fad
         56DLNBghrTVgBbuT0w5p0kIbjjHIZ7H8zDAgRo/hGVFIi9MqDI87c9GRYIHyeoNJoLSG
         0A1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpM7aZ1o1VfUYqrS1wTcdzj/3eVpnjXk8A4ShPcw7GW4N2n//uWobUC/Ps2ykd0TNETPPExamk4VQf433+spDs=@vger.kernel.org
X-Gm-Message-State: AFuF++lpIwu2uKtFf2lvZlM3fvcXC0S60fXd30LIj1+WAYx86OR509xN
	4Ap6zRg08OUzgyxH2Ds8/TjYz2t4J4R2V3TyvFgjAB8ISVGjm8geEuyf
X-Gm-Gg: AR+sD121fObFJxxZUvX2FsQhR1to7dBmYcJ8tLH9P5hcqUyDcTu3F2wVXuNh6SAxS7M
	76TteYjT3Hjkh/UNlQjjKTWq5+Y5rVTXONuXdk9HbXUXTaurSY//vJBPxRSiUbTNB6h7Ts9VnLS
	1are0BG/BNNjsCB8Bu8+U4lEIGBiv3HKWlQZYof+uroCezf9gkEyLHKOv8p4tugNKwVlmI+iqtX
	2Ue9eGn+GPI3a8c4ZOwDRUbbvHpOzvjJVZapOjeIpmCM6JLWRXirqcWF5H8nRr8/uppuLWZlSjw
	zrZgT6n/U90+W7hMCIM22M/uCFYXnTfMKPzzpuSrGF1sxmthVpXBqbrEE9nUqob3AwsLi6Nj4gg
	Y9xMV869hcpAMF7JiNdTN285JL/S91n5oeYI7DITFX1nBWEnJotcqjfjk2YnNhgQT2VhXSjE432
	lb7jqkNN9V+V3U3DPh80anDEFcZiJ8nY07SqHgKPoLGQ4KgshWHePZybrGJFFcKRugpBo=
X-Received: by 2002:a17:90b:4d81:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39580a7c832mr8254013a91.7.1787141850868;
        Wed, 19 Aug 2026 05:17:30 -0700 (PDT)
Received: from Anshuman ([103.106.200.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm12607295c88.6.2026.08.19.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:17:30 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anshuman <anshumantewari123@gmail.com>
Subject: [PATCH] selftests/mm: check stat() return value in khugepaged get_finfo()
Date: Wed, 19 Aug 2026 17:44:26 +0530
Message-ID: <20260819121426.49500-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_finfo() calls stat() to get metadata about the target directory,
but never checks the return value. On failure, stat() returns -1 and
leaves path_stat unmodified, so path_stat.st_mode may contain
uninitialized stack data.

The code then checks S_ISDIR(path_stat.st_mode) against this
potentially garbage value. This can produce a misleading "Not a
directory" error when the real problem is a nonexistent or
inaccessible path, or, in the worst case, the check could pass by
chance on garbage data and let the function continue using an
invalid path_stat for the rest of its logic.

Check the return value and fail with a clear error message if
stat() fails, matching the error-handling style already used for
statfs() and read_file() later in the same function.

Signed-off-by: Anshuman <anshumantewari123@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 10e8dedcb..2240a9b4f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -121,7 +121,8 @@ static void get_finfo(const char *dir)
 	char *str, *end;
 
 	finfo.dir = dir;
-	stat(finfo.dir, &path_stat);
+	if (stat(finfo.dir, &path_stat))
+		ksft_exit_fail_perror("stat()");
 	if (!S_ISDIR(path_stat.st_mode))
 		ksft_exit_fail_msg("%s: Not a directory (%s)\n", __func__, finfo.dir);
 	if (snprintf(finfo.path, sizeof(finfo.path), "%s/" TEST_FILE,
-- 
2.55.0

