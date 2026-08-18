Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0443FD2D
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060054; cv=none; b=AKtwHgFZClpfbRSTJssKWh+nbSRCQAURoyZn4y/LNh8yqRzNlTd5jGN2AejbRWGj35FYUpYYaXn6zdDsk6T9eRR6A6pnBwZtljEk7O25bGMNBuqmAWaGd6XvK7QIZdAMhkj4VDZtF720uzvi9XPK/iTnWQuEMSVkNER35D8luHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060054; c=relaxed/simple;
	bh=PBF5Vlom3W1lzqKYtWUG2ur46AFkvgsc/Pbo23p7+1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0+OLmdrcDNsF/6FtXiBLonag031wFFiNfXGaDgEWdc6ZuOfSU9MetdydqYP3CWpuNFzWJrC2TeZDco1B6VEqHy/92rxiCgzfSpkkNl6kohiIH5sPwKj9/qTCLn6fncugFLUXqfszX6lgTqJi9WdRe+KKAcHDVaH8ZsYi5PxzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsAdOPBm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsAdOPBm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d0407aedd6so55719765ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787060053; x=1787664853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDJI06X+swFMyKE3VwabpX0LpGG6OnS2z+jrHL8keO0=;
        b=bsAdOPBmnUAwn9hRc+f4YDV0UiuGm2pbpmR0VTvZ4qWSHfAINlLTjqdfg2YSOLegaP
         oc2MYgACR5dfc8Z8Jktyt48fw73o97nzekUKfGpNuFl9iSBIrtHVOuYdj8Vbv/T5rQIW
         Xe9X5t6w2HxG38WTAz6eMfnqQJiQECptdRAdycLJg1cawzUX3/hBGllidWKPwCHfoHg4
         GJu51yQmQXX9SUt5lCEVKlt0oxqi0IkGzrWnEFeG1+e6zWIMOww8qphG1WlxwbKiw6fF
         1GHticOQbVgscaKDkiLE1bu7+IrlhPlCpJVDHePzjzZ8IC6pYJFaGJYfXHJBzstEpSR3
         WSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060053; x=1787664853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDJI06X+swFMyKE3VwabpX0LpGG6OnS2z+jrHL8keO0=;
        b=IRSw9qPr9VDeKxR03zHlkKiNW4iMidg0RmE26LAcsvpVmKszvvKy7aMBJmWax8IThJ
         SAVX+wDJ3R8OMGQNF53OpmEZO25tgqIR9WHHCgM/4eAdU1zoYmJyOIluJwcJqnG/N6Au
         1wrP+ejOxFmKQ3g7s/675nfWQmPJyZ3Jozh54h+ywIE527ITuFf3mGjTrhOzT9jxenMQ
         X0oKw/FVJcdv5ig9drht0Cq5YjkZlk0O+Yilv0UnQ7n0S8h6EP2s+MP6jYUcyPfqRGJL
         j3jQ+kI4L34iyG/I+LiJ3O0v5+uKVdaofiYrFawY2HWqQbdpEbMr6b7XG5HnWQTBhEXW
         cwhw==
X-Forwarded-Encrypted: i=1; AHgh+Rrir0y7268sSYM9vxAl3LncSIqDzXUE7cAsfZ6lRXJT7X+PyPLuQvvzn3H+MCSLtoj3bF0eoZlDGsz7uz/XmM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgadOYQVfOkszCTreAsvN9Z16MZZVWUR5oLvH/05g1Q1s9TL8
	lVEhF98mQmalrEvegqfVglca+sLmbJIkowZujKTV+EtpWJsqXdVRq1/8
X-Gm-Gg: AR+sD12mWMG3hixb16ZxBu3XBKTEUOz2Tt1T7DHM+J2Dz2dKi0jjX0bkZTWfHCSdhMm
	AYtcR2h9srfJGxFL1N5ZKHP9KKvEcpOkceEtbAib+0ggGD7GV8nMR8wrzUIvp68gKM9qBKptKUW
	4CgGVmqnUVnmRHi6Ud7YYhIvUu5cJZowm3neD3zoFu4s9PJPSeujyopLBCgG/n0OVfCrkdwx/iV
	YACtxvj0g+A1EumMZ0l7L2F7GlEEMk39FZOauv20I8qPj4w5KBrZU/zjJ9Kr8FSKJzEBO4YjEZO
	L00ccOiNMd+i01ZoR0+OLV5HECFaVjr91iY//adA2bd+jmxP+8QEG3REeRE2GQve8f2XY4iO2dg
	3+wPVWlzpDKX+r2yX6wk1FscISdrH2eImYCLHaZ0IwiCuhLV+J9JCU0pqMU4EL7uf8YZvrq+3aS
	fWVwYurwbcFtlFiHPSI3ck2hdSM5xJUolr3+0e/wUPE4HO9+vroVJKmrnFzcgZEaGCWw==
X-Received: by 2002:a17:903:984:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d3b0cdb21amr413664155ad.3.1787060052742;
        Tue, 18 Aug 2026 06:34:12 -0700 (PDT)
Received: from Anshuman ([123.63.59.156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326793ca665sm19202557eec.8.2026.08.18.06.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:34:12 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anshuman <anshumantewari123@gmail.com>
Subject: [PATCH] selftests/mm: fix unchecked ftruncate return value in soft-dirty test
Date: Tue, 18 Aug 2026 19:02:06 +0530
Message-ID: <20260818133206.39503-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mprotect() calls ftruncate() to resize the backing file
before mmap()'ing it, but never checks the return value. If
ftruncate() fails, the file may remain shorter than the requested
mapping size. The subsequent mmap() with MAP_SHARED can still
succeed in this case, but the very next line writes directly into
the mapped memory (*map = 1), which can trigger SIGBUS if the
mapping extends beyond the actual file size.

Check the return value and fail cleanly with ksft_exit_fail_msg() if
ftruncate() fails, matching the error-handling style already used
for the mmap() call immediately below it.

Signed-off-by: Anshuman <anshumantewari123@gmail.com>
---
 tools/testing/selftests/mm/soft-dirty.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index fb1864a68..a52ef79dd 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -152,7 +152,8 @@ static void test_mprotect(int pagemap_fd, int pagesize, bool anon)
 			return;
 		}
 		unlink(fname);
-		ftruncate(test_fd, pagesize);
+		if (ftruncate(test_fd, pagesize) != 0)
+			ksft_exit_fail_msg("ftruncate failed\n");
 		map = mmap(NULL, pagesize, PROT_READ|PROT_WRITE,
 			   MAP_SHARED, test_fd, 0);
 		if (map == MAP_FAILED)
-- 
2.55.0

