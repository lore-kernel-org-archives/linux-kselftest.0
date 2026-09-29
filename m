Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFBA296BD2
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 01:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643650; cv=none; b=PIUZHkBHMPrS/7sFKsK+vrUhpZwFXJg9HtUQE1gTCdKxuholS8MyVLnT1yuCrzyvcY3LzJpv/ikXAArvdAcgIswZXKGWE8LBsjz0XOaVGdUyr8QRsnn35xR6kaRcFxaVofnNeUVpvFdZunBjmrlr3YM/zXU1UdkhmaIHozaOsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643650; c=relaxed/simple;
	bh=tTvzke3DfKKWtYV8+SwzyB0UUAV5X0AJTYUDzhIU7pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jM5Yl3w5u4okJi8lcymdDDrFDS6nHTBR9WTE2N+txQZEew4wzBiu3oiCpSFbqUSZkXvELpqMiyOHMisz0xLuR/RjUL9EALDFFu+a0edOpmjWqOz7VA5/XRs5Q2/ieoMWGM/ObvljyLPUDXMSHZIbppsvVaA8i4dBjlmC18ltbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoDDDKpK; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoDDDKpK"
Received: by mail-oo2-f38.google.com with SMTP id 006d021491bc7-6d89a3ebc93so378998eaf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643648; x=1791248448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6it+SmeVeHMYo8qun+39zeU0I/4M6Z51mplDGX3Lxkg=;
        b=AoDDDKpKwmXEmG4TjHmmL/aw293eFXnAK2hSnhnZPH72muSYcqOQQTj37QaccBGs93
         uw19NqPGroF8JVWNDhdHfldDqDgshPT19+OX/bzHXKBYGdiTTDTplPetWaNrd0BnJWks
         bSJd8Ts2U2ln5CJ9KYM/UJl7RFN8/gq+LDeJCN+9xXswFhq3fBSerWdEnHrT11vTwUjy
         QnHfiCocnAV67fFyl4lliq970mT9C80BO8FiWajGhj8kTvj1smNoDhnNmmF7LhtGWbAA
         cP4mwqzAMUq0WTobVnVczCpvJ+zkkf/XGwHXESg5EYBSZyUYwWcvf9tpPjt8ewLwub5C
         qwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643648; x=1791248448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6it+SmeVeHMYo8qun+39zeU0I/4M6Z51mplDGX3Lxkg=;
        b=Z/w4S24xwKeIxGeHjD/bEf0XjwG6iAz1vQCBBXHCX6uu+maYdlMcmjzXhxrM7nmS9J
         Y90fcY7n3TDzHwSi8XF6RLwt5Oi2ozzRvo0TiqJ+9wkRECOr/pB/w0QZDb1NNqYQoRpB
         NUQbZKD2uy/tkgVeEpEEPaQwLoA6hffbHa/8y0pN5E40RM7u01MbDAMWxfcbZedSBDPX
         Rvnj/3a+zRrLL/e1c/NwsPuQfXiniqOh2/Z5uxRsMZ+IXkt25/F7WfWZZetAyiQWWYht
         eC+4BxYqpsQx5M4JsAr+JgQNkzM3g8VhvGSMYkt5KLQIvO7uRBhIqLVNETbtz3mBqVyc
         GEWg==
X-Forwarded-Encrypted: i=1; AKwUvBy3AEuoIvry9ytg+Sm9xxvdeXey1+Kj5c4sNivXVQqB41wfzYAboKG5PuTs/MhsNUHfS+/Cq0FnXx5sD5KrOqY=@vger.kernel.org
X-Gm-Message-State: AFuF++mSHgLzm/CyZLeOZRc+t30Ie9eN9ogJXAgT/IpMAO+uWhFkfhfp
	8l0IDi6G6resasRWFzx+4vNAhUcUlN+x/lIlFMxIAQQORHlz/Iceh/hC
X-Gm-Gg: AYBFou3imyAW85GdOewVl3JVArnMhYg2lLGkMb30LDN2j+ybSjnWj7Yh7wQNUcsIUTu
	xz0ttXJZlexqXfk/vJG9QHKqKc7QJVcSghrVdjXWseagH5Mk1vz12TF6fLZsHYEFiPrTECEO5id
	BrDDA3fq3BMHl6Qwkdr/3U3rbE1j/b/UvK0mOpaDi0eL3IE0tXpp1yts+4j76ORjA5tmmzI0IX7
	NByV9xktzCyb/Bq1ti+oh6xR684MVo02LmVZ/xdU0prUFlGjkYU6J9KWb+J8vLFRdm+s2mdtWVe
	kiZHPWqjEBIKPRxQ6t6u0mLMckRWQ9ex2hcXS1J5Y+Qxg8yxO5Cu10JdnSAHGtJKwLFlGgomiTB
	Zn0tGk+4K0Yc1ZWbYptt2aqeL0iugeawS145LguvVtQyGvggPixyscVUAJjHtYW2YaANQbgiMjT
	J85DVGEfWX0e1T4r/I/Pnq5YKEwUW5I+bXRMHwuRxjuJr8K38/LsykoccWqmJwXD+eHRaJ9O4X9
	QEubUlQvh4Zlg0sqyt34BrCeFQ5A4n10L86eeb+me6zjv3vyk8=
X-Received: by 2002:a05:6820:827:b0:6da:9dae:a22 with SMTP id 006d021491bc7-6da9dae1613mr1713830eaf.62.1790643647899;
        Mon, 28 Sep 2026 18:00:47 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88358bb8dsm6410092eaf.14.2026.09.28.18.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:00:46 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests/filesystems: expect EINVAL from overlayfs in fscontext_ns_test
Date: Mon, 28 Sep 2026 20:00:44 -0500
Message-ID: <20260929010044.5297-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a518e63c3775 ("ovl: return EINVAL instead of EIO in case of
mismatched user_ns"), overlayfs refuses a context created in another
user namespace with EINVAL, like binfmt_misc does. The test still
expects EIO, so it fails:

  # fscontext_ns_test.c:208:create_from_descendant_userns:Expected variant->expected_errno (5) == errno (22)
  #          FAIL  fscontext_ns.overlay.create_from_descendant_userns

Expect EINVAL.

Fixes: a518e63c3775 ("ovl: return EINVAL instead of EIO in case of mismatched user_ns")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on next-20260925 in QEMU: fails as above without this patch, and
    all 3 tests pass with it.

 .../selftests/filesystems/fscontext_ns/fscontext_ns_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c b/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
index 0f30a3e6e197..535bf1f4e1a3 100644
--- a/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
+++ b/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
@@ -193,7 +193,7 @@ FIXTURE_VARIANT_ADD(fscontext_ns, binfmt_misc) {
 
 FIXTURE_VARIANT_ADD(fscontext_ns, overlay) {
 	.fsname = "overlay",
-	.expected_errno = EIO,
+	.expected_errno = EINVAL,
 };
 
 TEST_F(fscontext_ns, create_from_descendant_userns)

base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
-- 
2.55.0

