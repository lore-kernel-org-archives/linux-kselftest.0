Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89828376475
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244962; cv=none; b=nZCmXr3nwHeGQ4DQmIXWXwB+HnDrTyPyJtBjwcb86wW1vsvlpGm5aZwL0lQaVZs340eYgPbqLQ2Xe+dQMKUEh4X+mx+NbjqDmCC2+44scxWK5pm7ok9LIbjOTZn6dHnZ19VYA/VJ3owPN1dv8J1CyTeCxYNmJxxx2OLuBtN6FcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244962; c=relaxed/simple;
	bh=C2mnvvxaeziNBLbh+55aQxwfOxeoafKQAfN1hjPSxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoGkOixGVvS0Yttjwitwzfw0PHTqhqvRu+91tbfq8argJ1XYQ9VQu1aUxcBhpq00WXehrHsAAh/afUOWgMFjEFSsr76TzC5gcq2Q8hotQAJKqjS9ew1I0sSg89VTnu0ub+h+aceX9jbrfuYqxa5edQbBAodNN7FfqpyYSBPwYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/yb6mEA; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/yb6mEA"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so644491f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789244958; x=1789849758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csmfesBA8dGwPUVlvGofpRltARmcJI/ixlG1I95VhFk=;
        b=i/yb6mEA2oQNZdin6cfq67biVIpMJF1Q5IjfG6JDvCfuTThHVMfFQWzP7i3NEZheCx
         2ft/ePv1yeyXBqkKw/9rVkXxbAFY6wcSkq/sfcurCa0s/6ha0lIL5EJIhCndu/1aoU25
         +T4YcdYD/M/sQK4gdc9tdCzXxUECiKGcIdbgytaQLEW4TurqRVc5KOcwTdHmC/vEr8Oe
         2aKZw559R27e7Gxqe5+d4uidaZjfS/RcCjrbNModxdB7c6fpnLGiYYTbtq+x1Eido635
         /kcgknoIt0aF+E3srbfe5iVW9DyZApax4DMnBVah4qrGqovvKC16CYv3nckEeybPZ+9a
         4syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789244958; x=1789849758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csmfesBA8dGwPUVlvGofpRltARmcJI/ixlG1I95VhFk=;
        b=NtakLur7H0Z+smAmrio3jXTgimutO86Xg3v1s0qPSbXrPF7zrtusphhyDCnc9CvAna
         hdqdw8yq3R7qZLcWlSACIC79G/fmZRauwxO39FQC5NXT/ABTpp6IeI7ykfT5vR1A4QN/
         AEtUV4lMWmZICnb+8D28Sc5rSonJKfH9gz/h7sGDsRUaCXbOEcoHin97uMPm9gkrp9A/
         M4sknDlFJxEl5PW73EMOs2/8C1w1nDYumRVmN066gDe8ZayJoRgP1WtFxJNurVa7/lRI
         uKdX6x+K9Qg0m8hZuGa+uDtO6MkX43BLhqppiabg0Vc8btDUVRxRmGB7sw56lzxjQHIr
         GIqg==
X-Forwarded-Encrypted: i=1; AKwUvBwDChCk+HJuEu6vV4x+A4zrxwI5yunoLzehJlEheSCVPqX2adLDc4C4qnnppeAQSOZ2HsHbJCYRARuz81bWEtE=@vger.kernel.org
X-Gm-Message-State: AFuF++nf3N3YFXBCqK3lzDFg6dGRBkCK2TzPU96IkAH8SpLGNWua0h5N
	4cSkUYLlToFZIo4SVaaWa3nEOywtt102dayZfRf0aK9lfh5XYym9JgeisKEA/a3J
X-Gm-Gg: AYBFou2QZ2u82H65JhVzw7PS7DSEXCLQbliDZqoM3QoYipKecS9SAc693/68yZE/fvF
	PSivCdJnbOvHkHSv1h7Z7wuN3wZm0k86bO7VeklbqdlvfuNAtG/D1F/I175jIfgN4R1T1Y187zR
	3bNnrTeRUlSIDgZFnJOIpC3WuVPmq+uNgXfsVQlC+ehBAUhsLgsGlVggczBrrhIsvsxNhdsEbC2
	i/5GmvN9EPchm4hXFisa2Tevf/CuFLuDP19ZhqKal5soWVcxiOj8cOA0suGib2Kg4bEDDLUAF3i
	74eCz3GSs8eof9UlpVaIK07Zj3l0JOzzGf9bqz+x3AD6nSeVVoO9DS9ui77VHyzoCvL+0Y5ggPQ
	KwjxXNwuuhq1r+5DAKX/tBWv3YzYnidTgDdgzF6JPBQ/yq5Wjg9l8hljjfRcvEG4ayt5ElHB3fz
	1FHMnuvIwQ4IK6TE1bdUsiOswdiVFeuBm9iY+nQMCAieKd8kY59FvBmK8iWMSkndzQrUgU140H5
	Mlrc4I0X9413x16QgjZbQ+mRZw9+5rliWROF7yV08Ar9BeY1WZQO5zK6TgptlhvDIbxIC/k7JrC
	ELWKs1MlC4xaD6XUGAuSH0XhvnPa8DmDzW2rziSUDJlKcxLLOwAFLDFeFIM=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr192931035e9.14.1789244958264;
        Sat, 12 Sep 2026 13:29:18 -0700 (PDT)
Received: from jaeyeonlee.telekom.ip (2a02-8388-4003-3780-a532-8e05-d6c6-f4a0.cable.dynamic.v6.surfer.at. [2a02:8388:4003:3780:a532:8e05:d6c6:f4a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm238050975e9.10.2026.09.12.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:29:17 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v2] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
Date: Sat, 12 Sep 2026 22:29:03 +0200
Message-ID: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XFS setup for ./khugepaged all:file checks that the kernel supports
XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=y and
xfsprogs is missing, mkfs.xfs and mount both fail, but
SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
The test then runs against plain tmpfs and six subtests fail.

The script already has a skip path for this test, but it never runs
because the path variable is always set. Assign
SPLIT_HUGE_PAGE_TEST_XFS_PATH only once mkfs.xfs and mount have both
succeeded, and remove the image and directory otherwise.

Suggested-by: Zi Yan <ziy@nvidia.com>
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
Changes in v2:
- Attempt mkfs.xfs and mount and fall back if either fails, rather than
  only checking whether mkfs.xfs exists (Zi Yan)
- Fix Assisted-by tag format

v1: https://lore.kernel.org/linux-mm/20260911124517.63714-1-jaeyeon.lee.dev@gmail.com/

 tools/testing/selftests/mm/run_vmtests.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..b870d21c055a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -417,11 +417,15 @@ if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
 	if grep xfs /proc/filesystems &>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
-	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
+	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}
-	    mkfs.xfs -q ${XFS_IMG}
-	    mount -o loop ${XFS_IMG} ${SPLIT_HUGE_PAGE_TEST_XFS_PATH}
-	    MOUNTED_XFS=1
+	    if mkfs.xfs -q ${XFS_IMG} && mount -t xfs -o loop ${XFS_IMG} ${XFS_DIR}; then
+	        SPLIT_HUGE_PAGE_TEST_XFS_PATH=${XFS_DIR}
+	        MOUNTED_XFS=1
+	    else
+	        rmdir ${XFS_DIR}
+	        rm -f ${XFS_IMG}
+	    fi
 	fi
     fi
 fi
-- 
2.43.0

