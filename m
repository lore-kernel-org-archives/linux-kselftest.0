Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AE3C7E1E
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833554; cv=none; b=A2jvIRl3hc6/MzrjHN0qQI2GwLlSBG06EcPl0Caq7kUHim7oDgQyVyPdZljblFFJ39FbHLcHxmHEwQWOPyiaCqzap/oyTQQ8mesef7yU/LiKuQkP9uZmmgjwBNe3rmCtyJSQscSIuWMTDgjFtHdJNp+FxbrUetqc5uiWUF+50zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833554; c=relaxed/simple;
	bh=GAVO22yDoGw0SBaEj0BSp0p2E/UvxCnP6A22HFTCZGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUqZo0xrC9xmiXjPsgeMeLWNnKbND6+B+xxvRMm/yQJxaO9wUnUaifnWDmIhKi7ILklYc06xnG0yAB3dSiOpzQdI/q94/dTZMGUq8xsdti4tTFGLtg3y0f85mhDiBegsmbqsQiV43EdpGaI8H2TR4ZB0YveXURp0pN0MBhoFPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+zE9srx; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+zE9srx"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271257ae53so9470603c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773833552; x=1774438352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngahEQYPHkZNv+yZVK/PCN/gTdSgCME8Ml08zDKTYuU=;
        b=P+zE9srxoTrXqSAXOWNzRT5zTPSTeQq0gxfjFFW2O0NEqXdTl+gQogrEZ78MsHFZE8
         ESKK7augDSYHCHe6TZ+VivZnUrHSQUGrsZV9S/uC44CUKNqAuMtH5S4IWOZN3gxdYmOa
         t4mfcrfkf/NDjfSb1BXxhGeBkNBYZMZWV4/bpPD1u44suiKvOSnUqm+JyEooux9B8b5t
         n7gAfkJbjzQWD4vm1eSKnMMVsJpcXsjG3gSCOozSAoqRCE/pOwLIqEFndGX3nkSyhsO/
         wy5QCVhcefTzyA1q4tNGd0dE6eJtMJlpVfPHKdYm0nkP6W/vQSWZNmSXdyO/a5tddAId
         eMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833552; x=1774438352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngahEQYPHkZNv+yZVK/PCN/gTdSgCME8Ml08zDKTYuU=;
        b=LSDf9+k+syLn2NpWNJT3HRivpswrkiVMbneS8MN6FOEQIDF+yl0isdMhSvOUXg3S1/
         XBcKg5a2/EGOiG13aO0R0a8prktifw+i3T+ZzZbrdK4rHp9TeduEfUwuZLkwj6iU3ESH
         dwX0ERh0zTfDRTzkySyUMSJaEBgNMYBgZP3eZOnUxnOFU4uqHwy8c7qvfyffsjDueREh
         +NeHYhc1P4BPZuZOL6Gm8dteuARYWLTUnXZNSGGGbjkAM+P0Prew6uDF6Fn7UqqHF/id
         sLZrXWHgnlm2uXyuDjvr+W4ch6Gia1JJNu0iBoIa0orJ3dN2oNFCpvortNH+k/clY8vF
         He4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCf04iDnw3reyfBtEdlqn/Su95Pin7Nz+njLHJc8mvuIKUbuPPas8cuw2vkzrPsZnSLAFZyC5XSVQzgIOhRfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gpUUfMneZ0JJsq2TuWD1GbsrcN8amIyhed+wuUfYUT56scze
	RoI5pCzRkD3rnyVF2vsMbDOEotyevMqKH8hzk/bYyAwfKeJBU+pzG7GI
X-Gm-Gg: ATEYQzzvL5NivHGLF7Qeh5gk5fap8uV46etTTLfEUSD5maxoIF5BIQ6dvjQt8K/avri
	uAd/73+tav9Ysb1hlRIXza/eyM8ejt32kuwQ6OdLZOonycOzk8baf1O4cZy1bEitHSCk8ZxHjSD
	7A+s2I+IIZTXidvMP6DIv3hif3hR9S4k/BVkX1f7nwFTB7LCCF7OQnuASroe2dwj24nKbjdmRk+
	4UnNxyz2g01Z4lxZ93E+LqRBUsCzmULdx7LDAzXHqZQ7XSgG0QQlfPbk33I/SonyxrbPgdUSekB
	/sRe5ggcx5iQb6+gpae6AIvcdNHziL/UMnRMQFcFzlF9JhfGjyjQ22U4GaNwjIIXn5fPpxx1QsI
	F2QP3hhMah99T0gmVY76705ZvbY6h8zoKWcr2Q6CjG9Crg4UCxVy93Eybx72C/qXoKcCf6ueTPw
	0BZNolydy7aRo2Un07GL8JdcTKtOMcdEfxo380CfnxmgzhJk9TLbSCTY35bkf0fPz80CXz9cDhn
	Ex4iUspiey13k8qIo5NY/fSXBI=
X-Received: by 2002:a05:7022:4581:b0:11b:9386:a386 with SMTP id a92af1059eb24-129a718ddcemr1365887c88.41.1773833551785;
        Wed, 18 Mar 2026 04:32:31 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b3e8dc1fsm4140623c88.8.2026.03.18.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:32:31 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	paul.chaignon@gmail.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/bpf: add a 32-bit bounds deduction case
Date: Wed, 18 Mar 2026 19:32:00 +0800
Message-ID: <20260318113200.303824-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verifier_bounds.c already has 64-bit cross-sign-boundary bounds
deduction coverage.

Recent 32-bit signed/unsigned intersection tests extended the refinement
coverage, but a corresponding negative case is still missing.

Add a 32-bit selftest for that case and assert that the program is
rejected, confirming that verifier remains conservative there.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/progs/verifier_bounds.c     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_bounds.c b/tools/testing/selftests/bpf/progs/verifier_bounds.c
index e526315c718a..242c3d6d23b1 100644
--- a/tools/testing/selftests/bpf/progs/verifier_bounds.c
+++ b/tools/testing/selftests/bpf/progs/verifier_bounds.c
@@ -2037,4 +2037,24 @@ __naked void signed_unsigned_intersection32_case2(void *ctx)
 	: __clobber_all);
 }
 
+SEC("socket")
+__description("32-bit bounds deduction cross sign boundary, two overlaps")
+__failure
+__flag(BPF_F_TEST_REG_INVARIANTS)
+__msg("frame pointer is read only")
+__naked void bounds_deduct_two_overlaps_32(void)
+{
+	asm volatile("				\
+	call %[bpf_get_prandom_u32];		\
+	r0 = (s8)r0;				\
+	w1 = 0xffffff80;			\
+	if w0 > w1 goto l0_%=;			\
+	if w0 < 128 goto l0_%=;			\
+	r10 = 0;				\
+l0_%=:	exit;					\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";

base-commit: a989fde763f4f24209e4702f50a45be572340e68
-- 
2.43.0

