Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9728A1D5CD9
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686014; cv=none; b=qLUzcmmxxFXD9XtAVHPGxS877m0b6hDy+xgKOleT/IWIe+o+MLGKh1AkPdw7mx5HbEd31zLxWJiiJs+FIYozR/las166zrO3GKaK8vIJ5JF95mDOhf6PCUZesju9lZ/P3ajTImRi3qm89pXyOPr3t1EkYi2jRpkIuyXPoqXKaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686014; c=relaxed/simple;
	bh=QvKBTacd5z2P43CbYauz1u/x08KHhA7f2Nkz0BaL8og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8rsZ2FEE3JpCgHgraOUrzbdhmpS5NZzxq1L44SsM/zSz54SVHBxynOB0dNmPnKH5wNH35+Pl3mBLHR5/DLulOHnSZx19nIGAVs3X5K9vJNMpDZGMmBFPNulF0tNqL4UkE0vG68ORsWuhAMmTpDzqQROs8Jg61Q2NZ6i5LaahAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeNXLvmH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeNXLvmH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab077e3f32so12518715ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771686013; x=1772290813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vj99fOR8e2nvanig9cWTi+niKOe1ygt4TyyqPTa8nU=;
        b=FeNXLvmHrHIpmt8JXR2o2hvWvgxiyIex4tVLvrjE3FRE4sl++ff9yZ/qZmqpwsOYIW
         g1n8gI/uv8OvdjIUtWywKvA/oh+AXVq/yft5jaJ4CpuCc5TUOGGrfiaCzxjgll2zJAAq
         MpD5M+uoHRsVHvZpjPpbSq9WeaiQCKm4vwri+5n8T7GUiWkjmGrNWj0ji8Wgc/2YC46f
         5wwIoqLv3P120IVhu0diTpsk1zRQvx5qIai+uDUWI6nippTPpsjO3h5VpY2pU2u+uthj
         fy3IldQtY3hhl5V0lGwpTL5MNaiBoS43OzXeaLxnXRVe177jq+SlzwhKs8BC+YMstGss
         NrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771686013; x=1772290813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Vj99fOR8e2nvanig9cWTi+niKOe1ygt4TyyqPTa8nU=;
        b=VuhXt8ccSYbuahXDwOsCI6MTP33lg4iN6Z5sQCjDyAZoWczYKQdwjKR5JybMD8ms/Q
         N10+bl5SMq0+r98zhe+DII1FewIpFLnBgxIXOx4P9TbBQROXREe9OM64ZtInYnccaP+Q
         XxJvAHwp9JzHAJNm2QE6ie2yv2fmgLsvGgU53kpQkqI7dK/FpZHyzqN6eM1eTOgLsyZZ
         Ixo117nnhTFToX9PtABtNq05KUE2fm5SAsrxmPOC9JUZ83W+M0c+2hWwr9J5DwmaMb90
         6j2iKIT7NmmfPSkmI34gobGH9brtYLrMswD5Mz1yTnWDpMpsTupTzLM/u7pZeBvDp/ZX
         wzcA==
X-Forwarded-Encrypted: i=1; AJvYcCXdYFGBTlic5QHPVtTxNr54n8mreLMpXXWN9P06eUbkjD5zn7N8oB1nM3EM72NnQ6/N9ZlKdv7V6mC0csJ38+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrQWQ13H+R3QfB8ZEp00kc+XAFskDXnlWrugZtXjQHuz5BdakF
	nkroU+n/BgcAKzvJ2mglWeZkP5rqSUoRiqhLvWsLb9keta006Iab+mkw
X-Gm-Gg: AZuq6aL3L0mNewONGzPGkwbzGJkx/3n9jVBn2v2VOJEd6Bc0+ORLYVjJIIbdutQSuvk
	uJAkHAk89x0SX1kLPuUSIJFsTMhDyu4nxKNtSjtjrwPfDgPsxDH2Ubv5zusVB8VYxPTNN/YT/QV
	zgXggSxAvC6qWFWSgyNJGCsSKP9Z3X5P4mryeDw5TCihR1sDKXZkkrwlhSIYtDt9J7pOCBnSp8E
	6hu3JQ1Bt3iMC3QsQa5Vj1Pvwa6VoCeVXgnH56ijehAblzAil4gI8E7NxvyeOGlJZ9yxYSUwxV9
	JXEx/rys2gj5P7r0KePqmWT2MMOkjwYv0H7aZ3wwa1LJTk3VCipb9SNKG3cOdsRpAG76BlvGpEc
	/gWZfJ0+0HJlyAvO5575bkFFDLgzuDeuiNV5zy6/FVhnec9RCnzGXRyddwAwcknN6Qp00ZS+LjA
	OHPQgugJjyPYrG9yOOPhkrxMVy40sQopuAhRYzh5HYzjm7pfgy47dUbNo=
X-Received: by 2002:a17:902:cf07:b0:2a9:322e:2473 with SMTP id d9443c01a7336-2ad7457e58dmr34715235ad.48.1771686012796;
        Sat, 21 Feb 2026 07:00:12 -0800 (PST)
Received: from toolbx ([103.230.182.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm23730205ad.79.2026.02.21.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 07:00:11 -0800 (PST)
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	chuck.lever@oracle.com,
	alex.aring@gmail.com,
	arnd@arndb.de,
	adilger@dilger.ca,
	mjguzik@gmail.com,
	smfrench@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	slava@dubeyko.com,
	agruenba@redhat.com,
	trondmy@kernel.org,
	anna@kernel.org,
	sfrench@samba.org,
	pc@manguebit.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	shuah@kernel.org,
	miklos@szeredi.hu,
	hansg@kernel.org
Subject: [PATCH v4 2/4] kselftest/openat2: test for OPENAT2_REGULAR flag
Date: Sat, 21 Feb 2026 20:45:44 +0600
Message-ID: <20260221145915.81749-3-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221145915.81749-1-dorjoychy111@gmail.com>
References: <20260221145915.81749-1-dorjoychy111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a happy path test.

Signed-off-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>
---
 .../testing/selftests/openat2/openat2_test.c  | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 0e161ef9e9e4..e8847f7d416c 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -320,8 +320,42 @@ void test_openat2_flags(void)
 	}
 }
 
+#ifndef OPENAT2_REGULAR
+#define OPENAT2_REGULAR 040000000
+#endif
+
+#ifndef EFTYPE
+#define EFTYPE 134
+#endif
+
+void test_openat2_regular_flag(void)
+{
+	if (!openat2_supported) {
+		ksft_test_result_skip("Skipping %s as openat2 is not supported\n", __func__);
+		return;
+	}
+
+	struct open_how how = {
+		.flags = OPENAT2_REGULAR | O_RDONLY
+	};
+
+	int fd = sys_openat2(AT_FDCWD, "/dev/null", &how);
+
+	if (fd == -ENOENT) {
+		ksft_test_result_skip("Skipping %s as there is no /dev/null\n", __func__);
+		return;
+	}
+
+	if (fd != -EFTYPE) {
+		ksft_test_result_fail("openat2 should return EFTYPE\n");
+		return;
+	}
+
+	ksft_test_result_pass("%s succeeded\n", __func__);
+}
+
 #define NUM_TESTS (NUM_OPENAT2_STRUCT_VARIATIONS * NUM_OPENAT2_STRUCT_TESTS + \
-		   NUM_OPENAT2_FLAG_TESTS)
+		   NUM_OPENAT2_FLAG_TESTS + 1)
 
 int main(int argc, char **argv)
 {
@@ -330,6 +364,7 @@ int main(int argc, char **argv)
 
 	test_openat2_struct();
 	test_openat2_flags();
+	test_openat2_regular_flag();
 
 	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
 		ksft_exit_fail();
-- 
2.53.0

