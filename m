Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D92DAFA5
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892507; cv=none; b=u6QQRrKeoksyuzKV5bsfRw+vnY/9EZj5mbmtOpx9hZKPbr7r2deXyTz8sj58TSwLBsTTN4qICYEB/gbYu/mWZWo1uy+3CX7+lY+LNM6lAcnAI7q+To3B0SQiQ00xINS1SP+EUAfkDRGDC+a3aSx0H0uip0ft+cZ1lHjCRhwMZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892507; c=relaxed/simple;
	bh=QvKBTacd5z2P43CbYauz1u/x08KHhA7f2Nkz0BaL8og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auNqHAs5jAq8E0Y4gCPGrVi2xW9IxUNn9AHUjeb/FMVzamErd0DomL9DJQr7GIgrYlaFdiF+6h9NaQhX3jr71Nvm97+lLkdjgN1q9ug+m8sMSaZ+oHGEKRAXP08cN10IDLtBJs7eappDXy3iI4TZ5Abd6J2eCSfqDwLTYUbpFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j//Nqssx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j//Nqssx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-829865a8471so2913829b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Mar 2026 06:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892505; x=1773497305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vj99fOR8e2nvanig9cWTi+niKOe1ygt4TyyqPTa8nU=;
        b=j//NqssxmhWBwW0YhQ6oRJKXQKgH7Mm5iRu1CkmB9uAJThjy7Ri+Hm5kgYVax8wgxU
         +UiSCPbRDYmh9msupkwRVd+MrCY3KmKJ878jDQZpUKiuXCsPJeRY7PuCigR1DNraTI5p
         z/WHvvdCakWKH7pHOzGnWAWuDlban3rOoSWXObOlZXonYOBQOka2Nh2H7H/LUaGJvDR0
         9Bnm9J9A8yJGqN5yUcPhNskNZFnMQCuDaYUoXhhovrbijKW/LfR0WS40gyVoFsFoZihQ
         68emMB2bbpGFUnPqT/U76/ZLZZdPJhB81OYDfiYC55dxiZ5FysUZjZVK7t2DEiQDjAsa
         4DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892505; x=1773497305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Vj99fOR8e2nvanig9cWTi+niKOe1ygt4TyyqPTa8nU=;
        b=bKbiEfc5D2VTbwFq42EV9VXZhruWp0+flLvMil5GP7AZUNOuF7YpYWCWExv55cid25
         dachGDWHDhuE8XQfosBm3XhFjdQDV6B2TAI56NQXLctns7dtC3kBQwy3dpjq0mjD56fl
         n071+91RKyWy1or5bMudfzp2/DdUe8biFI3lhcs7cZtwiP17NMjEMXzEkYJ6uMw5ctYO
         PhQ95eAZsgOulHHT2Ekr0LzQjt4mqqXAhVGHc3kxjbhjHozzUwfs06k2cg3TEPRD4E/c
         K6NU2PC0gKtyUIWosaG+QRJtEeMMbp9Ya//1x8Kb11fBLhj/YJryJmArKTRPxDdRMGaG
         oXwg==
X-Forwarded-Encrypted: i=1; AJvYcCUohtaJmd+xeOtG/ddtokV2+B/V7IdPjuNbxmGo2NP2zSD/KeaLX+iuFmPfrqPW9aiKRwWOBVLnsDk+p2ld+GE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVIg/6T7+fB0dvKvJr4wPeOuAl6JtvRrhK/m326q+1UJ6HlxU
	8ua7VIq2UZ/uPhjxYvCpRXM6IIfjHQRIjYlcZjC67e0YexFCv4NlnGW6
X-Gm-Gg: ATEYQzxtI0yNTRc2BL0J7sq6iJ9GchaAUFCGERK/lHiw+DpB2rUInG3KNsPFnZhpfSQ
	lC45dCmoNOcO4YkuBoyEYQXNRTsl1IiU0Thaiknfj1ED/14buEB3bxry/AkV3L1uwcRNshZU33b
	JxPQlOW5SN2kRiLl4BHXj3CZma/4KqxyVte7a9NX2faFoKojme26zGiClwyxqf1GQqj/zRqZiDN
	GRSltej+8OKNugbcE8PUXmAmDqQxKD3zNSLn4SuohCD8F/opzy0P8w6HrN4bYT5+f501tXENsyK
	18+f+hz1O3rb2buXN7PrUauAXI51PxK++L4It7ydKTCeOijBi+NRbGpRRDQbV84syx+AQ54Sg7S
	xbD+c3Zqhd+L5jVqJo2uLzZXT0Ltw6PJR92XDYUJOS2/BNHqAMmxpq/JI33cp26MJz7NVkxYuYR
	drzlpDYIf0xvnFDjBGm6SRYXE9Z57ENMHfcn3u8vUNxvFPMtnQl0TnWrs=
X-Received: by 2002:a05:6a00:1c87:b0:81e:d7c3:2f3a with SMTP id d2e1a72fcca58-829a2f5a754mr4767475b3a.46.1772892505338;
        Sat, 07 Mar 2026 06:08:25 -0800 (PST)
Received: from toolbx ([103.103.35.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm4747313b3a.56.2026.03.07.06.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:08:25 -0800 (PST)
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
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
Subject: [PATCH v5 2/4] kselftest/openat2: test for OPENAT2_REGULAR flag
Date: Sat,  7 Mar 2026 20:06:44 +0600
Message-ID: <20260307140726.70219-3-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307140726.70219-1-dorjoychy111@gmail.com>
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
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

