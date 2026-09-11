Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32F44F540
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130735; cv=none; b=JZJ20hAaymyMp+zxXy5s9YSHjXRsEv8uDALBrSf5k73a9XC3rgIH30XKTEGw88GRazSw5pVnd9d6H6HYjVqWhrWGl79mMu40FGM9wX3rzdmS+ASXNuRICvgY3VpQUapQyQXzNsH+D+jPQwo01XgqTtAjZtnJstpoREUn4bpspq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130735; c=relaxed/simple;
	bh=Cl3LcxVT8UQmoIXm9PgaZHBPSx2BFaVUbDNNdhxXJFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Je1toh2BeilgC2aWFfmv5THVNIz+CUrIma8w0DYxT68LRKUIvHkfhVi1JtH2mEyd8lwzsJrblPNxof3EHTQ2fy6NBpUxtpfU1Kx/ttxk53A/w2re0SNlVZRlUwQo8spKx02SfokJ6rFlt9hVAT7oxdGar2VWVOQ5Bh9K2NJTDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/X8KRqM; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/X8KRqM"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so250712f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789130731; x=1789735531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stX4u/q9+UX8srql6LxNnbXBhPlMhXVPibUjinvI7Fc=;
        b=Y/X8KRqMz6XfNdXa7zDTQ7tX+aaw2GR7bHsC3CjSioT9K5toMHmq3RIG0W7tW5fk5r
         LA1myiaw0d3QIkhMDiTZO+TaKuw/gDVJreZ4gTSC+bCCCpLFog9mc+sUO/4/zRLrtmrX
         hby2OqArzwpXWe9lm0Qu9jsQ2ZshZRoPh6MgqcOug239YzwUX6na9WsLHwz0ZmB2mELY
         AhrhbcYe0uHbYhTc7F5K1c6olALpOeyN9ugqNmfVO3ggSlFXWTj+CpEvyxOh5JYa/Nyn
         USv4uIR55asx6MupDwzHTZ2fPOyb2NSdOEMH/iaXSpdT+p9GS3KItiGfeicWQDYQrznG
         akCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130731; x=1789735531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stX4u/q9+UX8srql6LxNnbXBhPlMhXVPibUjinvI7Fc=;
        b=N+lnK3thep6dn+txLF8BXR2eMlAYpmfTGjjy+H0j7SHOo0hsD3a8dKwjwgx0+7ZW9j
         NHhHgj1q2bTK6VqtyBdPr8Bg/CpTqP6wKZ8l62r9IHVIU0poCdza7cEdAlmmytM2be6D
         EQxGiQFXrfJs/bOFjB9U/kD6pACCKV1rqkLIvDSYhsh8xzWC0QjzT6jRjwFuvisXPXse
         Bpo6DysnfQpnMVyqIufXaMX1vcOaKDgFdWh05wLDdvIs2O2B4CUmeqzS/msdbruraSjG
         0QggfJ1DLuIBANysE/CYG8anM+QqnvYkmPqw40HwQRJPXRQEv7ALdfuKezjrWuDpb9tU
         Q6xw==
X-Forwarded-Encrypted: i=1; AKwUvByPSUdt8eYw1xPz5FSumCZdbEOjLWXJRegaD+ArOF8cuVgLjW0qMKojm/SefWLw9H1pnP+9KyOUwhTYsGq0r28=@vger.kernel.org
X-Gm-Message-State: AFuF++k1dqo5vjhcNuP/B6KjGITD5pgEL1Dc8g0u+A14qCouPe6qlRVN
	XRry99B2t1MHr922qToRlYzKTzCoWUcEtYbbnHRRuv7dfcWTBegi49T3
X-Gm-Gg: AYBFou0kCTln7yQ69EKXEyXPHmIfkLpxTw09yuVfsg6and1GRFkd2TsTN1xA4xSGYPD
	pVtGG3lT1dr+L3ejCNBmP7Xpt6JqgEwoFUbmMtv8XPob1O1mLbk8Mxz8AfQpX1aii3/fs6oy7Yp
	Oac5BIiU4Q1OYT2lpMEzx+ACEnYiIIFaLpTjdqvmiJJ1OKEg6iu5hlFNOBwP1tl93cJXqYhCHAa
	hEHLP12uMYy9Nm6dp6wS+ezg97YBH/BT6E4pu7qFebfNollOJYLkULFN7mUEnaoaJHQkGIvtWmv
	ohEgRUUPsesbZYuex2wfZAeRoY1hAJZmgd6flJnzM+RQ7AJN9pcwHT+JZee5hHRYfAF8+IglGni
	ycHTHYwyzERX/Nbvu+haBliqebUxfJmCqDlZMQ72ZRwFUzCtuSUApbrJNwPN9IV95PaQc0ALypi
	h3SbApqgzGGDHP+/qArP1gYDDUZ7auNk4RzSj3uYEuNU2qGPUdZfBot6XTAoJe7ua8l+qHw/X8k
	LICnwnRZKG/kwsxnXihESymUXRU+n3cvxKixnQZo+MHNvAKm78dW5OISiqn4TdU
X-Received: by 2002:a5d:68c9:0:b0:484:3310:710d with SMTP id ffacd0b85a97d-486eb3529admr7227286f8f.25.1789130730835;
        Fri, 11 Sep 2026 05:45:30 -0700 (PDT)
Received: from jaeyeonlee.eduroam.tuwien.ac.at ([2001:629:3800:12:5380:8eae:5873:65c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm5902298f8f.29.2026.09.11.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:45:30 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
Date: Fri, 11 Sep 2026 14:45:17 +0200
Message-ID: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com>
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
because the path variable is always set. Check that mkfs.xfs exists
before attempting the XFS setup.

Assisted-by: claude.ai:claude-opus-5
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..6315b67b6733 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -415,7 +415,8 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep xfs /proc/filesystems &>/dev/null &&
+	   command -v mkfs.xfs &>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}
-- 
2.43.0

