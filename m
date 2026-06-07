Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AAA22370A
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780826268; cv=none; b=GBvE0K7bwb25G1xlcbv0lOYMvE+dpMR28iojRLJIw39ln2yOjR7mFfwsL+PjRUNsZGUEi6+HlwGOCj//xkyZ0Gb9Bf28b7KyxJv2kf4/7JKAVxaxROB4DdU8GjbapJ5lWGbrSOZU8ilpCZgRRuQZ2ga++PLm2ZKNwgnA/CzyXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780826268; c=relaxed/simple;
	bh=/AJLl7TAW4jnfScW7lJQ1Ius0LjgiyPDlDG8ytEvnAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYAQcdYjOqxxmJxVfbcH9fXVHzcUkZCqXDddYem5L2J6rNueQfCRlCJ7n93x6bdtAyXgzwZlid+Vl67z1Ijp3ckxg23pIgwi864Lna5Ld8gQxWl7a3llW1CLVa9Z7fozJRyZCEDaEo2IC2wvJ4LeWTplPj0UextExGYxb8xVz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUvnzHN1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUvnzHN1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0a5354da1so26887045ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780826266; x=1781431066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyyh/F5nRQCXN7Ux6s+nTV9a5ThuYqK6lhUEffWvYyY=;
        b=CUvnzHN1fVkEidr3QidBO/CUGZZDPtjv3FX+Zpp5Dm7Oz9TufsYapAyhdOCZC8iO1D
         +2r7jQa9tau9YuRLLa0u7U52kjL/Fil1jMb2LUc6Yo0vKgFEp+FqyLC4QmUwJV4UQaD3
         BBrHPb2mJyTVflpAMDe8unIX8KPA/21JR4enDSk0VDdLaswuOwFL5gOzjm/Y+tS3bdjW
         eYOgmERpGypRD4KQ4K76WaHG64G2p7H5b/MwofGFgkGMEAxTO1B33Id2pVkAIqhotnvX
         CSaBJaQ/YzJGJ3aJ01hRLy66BqqSUg5VLNzEQmkEr0XZlzXFjYT3/AKLqRRtfMEJbyfn
         72yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780826266; x=1781431066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyyh/F5nRQCXN7Ux6s+nTV9a5ThuYqK6lhUEffWvYyY=;
        b=TYoQn3jo8/s5B+Nll/5zzNR9Rnnlva02KkKeSbbNfrMkV87y7cjk+3BdV6Rejy+Py9
         5fcUfdIlolXS8yppyYDNMU968o0ccnLLOrm0NTXXYOinvpnENz+g14IrWGslypi7TgpK
         PFay91UOqGqOk6PRPuZvIyqN0hH356CJlhKRv5CpUSOOBi1kyBdBbuzVNgWStRWDth1N
         YwhklO9HPo+qyAJVMXamVjETevEE4Ev0CBP9BbCuupHbNhhU6ahWIY3f7SmeroAyce4O
         tU2t2iXMIZ4ePZ5Pg9OxM55ki+9bMuKxffmRO155cNd3/tqjVyKm56Ob6NUAPVvvDolb
         jI9Q==
X-Gm-Message-State: AOJu0YycGPt3YYGKO/nZ0kKAtd6eMxAjIRYQz6nuxkfA+O/ab+YQJHQV
	++3r9rHPDrBl2zl9Y7N2zL7pRBr/rCY0JhxkQjg7UPs9c/Ziw8POxdnO
X-Gm-Gg: Acq92OGpywg8adqhmqy/afuI65bbPyTVIESx8pBOSwow2200PD4cb4DDsN9f9SoD9AK
	qdoHaf+tdeQ8w3rfpSTLOxSHpCdnKME1KBYRzzsXKjrrqExQq4w6P31v8UwPX4zWxaIC0ND0wkr
	JEeocX1JX2jzd44oSdzFO/RsUoRij35+Gk+4O2nlG5IXBSsgAU4vqlA6AcQ6ZktbcYtDVuxkmEB
	PPWeoTUOvBCcEVefVflejWMNIr/jlLfCXC8joj//bvc10829D3Oizzs4tjj655X4fk6kkGtGgmV
	U3mcchShEUKrwYpRwzmoRzCWwxq1PBiQM7Zz6+bY4/SwFtTC7zCp7gMdQesqvNu3pRd/a50rCd1
	YrVgFmWFp8a28ol+OjZ+21dDedGAhn0Nv+4C1/sEpwTCKF66VH8E3OBUuIAKHFEK9d2v5hxkmtj
	zVs6LdpOCUA/NvmhQGtR+xnd8hgA==
X-Received: by 2002:a17:903:3b8c:b0:2bf:361e:3edc with SMTP id d9443c01a7336-2c1ec3f61a1mr90984805ad.2.1780826266430;
        Sun, 07 Jun 2026 02:57:46 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm143188635ad.67.2026.06.07.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:57:46 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH] selftests/zram: fix kernel_gte() for POSIX sh
Date: Sun,  7 Jun 2026 17:57:32 +0800
Message-ID: <20260607095732.71823-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fc4eb486a59d ("selftests/zram: Skip max_comp_streams
interface on newer kernel") added kernel_gte() to zram_lib.sh.
The function uses the bash-specific [[ ... ]] conditional, but
zram selftests source this file while running under /bin/sh.

On systems where /bin/sh is dash, such as Debian, the following
test fails:

  dash -c '
  kernel_major=6; kernel_minor=1; major=6; minor=0
  if [ $kernel_major -gt $major ]; then
      echo ok
  elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
      echo ok
  fi'

with:

  dash: 5: [[: not found

Use separate POSIX test expressions joined by && instead.

Fixes: fc4eb486a59d ("selftests/zram: Skip max_comp_streams interface on newer kernel")
Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 tools/testing/selftests/zram/zram_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..0d44d83888f9 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -37,7 +37,7 @@ kernel_gte()
 
 	if [ $kernel_major -gt $major ]; then
 		return 0
-	elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
+	elif [ $kernel_major -eq $major ] && [ $kernel_minor -ge $minor ]; then
 		return 0
 	fi
 
-- 
2.52.0

