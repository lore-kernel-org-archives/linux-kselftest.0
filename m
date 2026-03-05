Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C72E3612E8
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749336; cv=none; b=IpAMYJvROJexUTGLvRIXlMrh85RaqD2yhANkXe7cUPzcNHMVFNYu8U8fQW5cnEGeLDTIh0vLkms1kRwrLLEF29GanYMdHs5lSwGnusVkDuXSvCOKF9q8hXBRwTsASjAspakyqVbch6jLnVVkD0pzqzipc2P2spUx4x6IqcVPrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749336; c=relaxed/simple;
	bh=6KqCPewtq1kiJ361bvKaKNjRbb67s/elQW4tfah2P7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaspaAjvDU9YYGMs69X7DSXPyagpe4QZzKAmMjFRK2ePNkstKvbwg3gLYo+8TEv0Qk95dnXMI0ylv+fFHw0ZWuGSo0mL/Leh5fILp6AhQU4sJAOzy+dCX4QId2TuNXBnVJvPilxGLUXqS2jJl4dzbLiwJ/hMwutq9yOxbaoAcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCoG4gLx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCoG4gLx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2adff872068so41762095ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 14:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749335; x=1773354135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYeE/zgQPJDLRLKshUZvrTFJR1CPgxz/WOMLSdHTUVY=;
        b=lCoG4gLx7IDymG3IHDEQG3H5ZNI7Y4c08Nz3xGlh2ApEryLNaSA9a3HqaTETy+Yk+6
         xXbTP5kegsjA3OfjS7cXK5UCvS1eCNqX3txDk6P823tjVbLXLnCC337q6Yu77ZB23WFA
         wyzWQ5VONMPlwV2bLAaJTEtIJaCsCfphuLr5+n7kzdoUftGwnQx0+KLmcvkB6uYUATWa
         8tOycPWs7Q4dJBxo8fcv78H3IHlsDebVkyxMhsC4i1b9wHwdI8O9Kwe2aLsXeS6YWXSx
         MoXM0YMk4fTDMgf462uTmh/YTx5QlAmzb+HOz12alTg59yKeRucC+YiJBy0L+1iSotpy
         HWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749335; x=1773354135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYeE/zgQPJDLRLKshUZvrTFJR1CPgxz/WOMLSdHTUVY=;
        b=DY6wdRid2ErsympWLUB6eadU8WPUXhS8rnsf/vToGFFKs0+ssOQ8Tk27j6FVKjC5mw
         j/rz7Rsm55R8zpSbVu49mwtOIaHbtMP0NGx+FVJR3zIIDf3j04xI2k5EzNKhW9idvWtf
         RgEW2uF94YUK68uQ5R4S5poBQ2FdTTegCJQWJMjAI1I+ay0aI8wEjd2Fb8RbMdAkEc6y
         bZpfH4kYYNIL/hrTlo0l5aSuy/pIn+WhouR1PrKc6TIZH6aLh6RilhW6fDaBPcxCsDIm
         CkZijD6QE8Qq1NP0Kg73t1Ru+0fwU1ZIsRgRvi/AXyB8Cc2a4eheoPfwcagdAC4lskJr
         t0zA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdjYH7vsmnbCRBWCaMcEzGsqV8nD7GS0AdtKcj7Tm6V6rMg8RpLusselhfgChgTF/tLdg5Wxc1kw51vDI/9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbM8OVSRYLka8Pyeo4ma9jMnnLfatGvpdcnnyGIkDY8iSTgX38
	0iTcLnSd+9Ysi7ply3kawaDafdj3XBouiwqQfWmAjG1PLxoAAcZeOGTF
X-Gm-Gg: ATEYQzyshxUfDYCvwnDP2oqschaClQGNslHdGdxgTrlXezjlc8sIAWXAwLqL5GleLPu
	EclNgoSc/+0EPDXesiM5RplGx/Wju3s3gQU4RAXj0VzoLQyMbtJ7s9PxTpSx12MztmPBsdB4Jny
	gc6V2v8L24u/xUdkbkW7kLAxjHHRANwCMiPEm+UuiZ0EkP3RR4OZNaNP2PiEgDk5OjnVaaxUVRQ
	bKVR/uQDeWxR5wIBxqpQC94RuKjRT7BIXwhvPE9yGM0oenvyA5OELr+Qjqej55uy+TfF8fpW6+s
	+B1zyVf6TvMKExBLju9Jr0/LcSbCG0k/AFUZ0KgtZC4+tk+J0KVUhXdithdf8qCNAyzEvzE2q5q
	cOcT/CrgQcvLJaLRBIt7qyXv+77SlPD/60VIQ/zBVOqi8fUQmXtpg5oiKlVZRIFKQDbopdoQ/FA
	aipTy4VO4Sukt7s21CTSj18vb3NqkJBTPtyMl9VhBeQzL8jvfuBolwMxH8At2jJVSUJinJ
X-Received: by 2002:a17:902:da8d:b0:2ae:5848:baf8 with SMTP id d9443c01a7336-2ae823681bcmr1026315ad.3.1772749334618;
        Thu, 05 Mar 2026 14:22:14 -0800 (PST)
Received: from computer.goose-salary.ts.net ([2a09:bac6:d7a5:11cd::1c6:11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f25esm244421305ad.47.2026.03.05.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:22:13 -0800 (PST)
From: Varun R Mallya <varunrmallya@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	toke@redhat.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	song@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next] selftests/bpf: Fix const qualifier warning in fexit_bpf2bpf.c
Date: Fri,  6 Mar 2026 03:51:32 +0530
Message-ID: <20260305222132.470700-1-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building selftests with
clang 23.0.0 (6fae863eba8a72cdd82f37e7111a46a70be525e0) triggers
the following error:

  tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c:117:12:
  error: assigning to 'char *' from 'const char *' discards qualifiers
  [-Werror,-Wincompatible-pointer-types-discards-qualifiers]

The variable `tgt_name` is declared as `char *`, but it stores the
result of strstr(prog_name[i], "/"). Since `prog_name[i]` is a
`const char *`, the returned pointer should also be treated as
const-qualified.

Update `tgt_name` to `const char *` to match the type of the underlying
string and silence the compiler warning.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
index 23d933f1aec6..92c20803ea76 100644
--- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
+++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
@@ -111,7 +111,7 @@ static void test_fexit_bpf2bpf_common(const char *obj_file,
 		struct bpf_link_info link_info;
 		struct bpf_program *pos;
 		const char *pos_sec_name;
-		char *tgt_name;
+		const char *tgt_name;
 		__s32 btf_id;
 
 		tgt_name = strstr(prog_name[i], "/");
-- 
2.53.0

