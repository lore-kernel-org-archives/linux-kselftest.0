Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA59243951
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780976880; cv=none; b=k7mkQivua1j1gchG+7lcai7z2UcJDEK+jB8wUeJcbm4YZwB92gXIVLOil/FBm4WzzrO0SUvDws0+uVdL4CK9zIJhFL8GLn4QYvOo3KDb+pbAoFN7esm4HuCw923vFWBXNS2R6C/V7zz/52TVhJdUZEupG9P4YgZv2jE6Q+vNyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780976880; c=relaxed/simple;
	bh=qfsK3KtNdTDf/24y49QdjdKuG3mI9WE1CZdOT6rck40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4UzyYqvdoegdyhB4p45qrAcrvOCxNjro/16HEluf1db0iMRAUVR7YmocxGu4jKz9moc/r+VMgyNwnb3g8DuVgbozMWvPIXNEnpeLgVmeeKFibpRQ8Bj+T/NPNtra3DEi/ZAVeamU49eKjWwp8zlMNYqEv2FoiAG0zALhpW4wz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA7pdWnj; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA7pdWnj"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-137dd4cc208so3185880c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 20:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780976878; x=1781581678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9ypEpJRomt61fdJTwLpnXYjE3sebWbqzR+cTfomFgU=;
        b=YA7pdWnj3pVQAs37tKwv9cRN7AZDDzkbyVla+GvowoiVFbrmccl1VT3Ob5NzhgxP+Y
         C0d7aRisHSgZBKvO2zTN6QCpqaQHLrkXEqgeGd4Dx7eCfhLGpc72HziCb+5bB7uSzO1A
         ZMZoZb5CGMtqsLeHWt5wibzNnm0OS1ejZmnvKzFdXQ6O+Q/KlMpeZNZQtOnBHzDOrgPT
         fCD8jFatC2J0QcnzcCNYkJR+dnEBOePSp6FHxLsKK1VqciNR3Y9jL4Zv67XLMg7sUZKH
         g7gfltKH1UsGyzrUq2HEkRVX8aQig6axNtuywFDt3Ipdg2SBRTtOcf2/1rgsI5HBpaGh
         WDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780976878; x=1781581678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9ypEpJRomt61fdJTwLpnXYjE3sebWbqzR+cTfomFgU=;
        b=QmyEEx1qRYJoWeEV4COqT3VHIrnBE9LpKcho8iewk4X8oHms6MAq/T7ueAGsHNr/Lz
         KEFUomcOFaKQRqOfG0jFJ6wqAz0jFTOdffOaP9RAj2SHsCWbaw+cValEapFndCOzlwFP
         NpJ+kyfJZ8uVwVQklTjmW7HtxGjGvA1lnKHQf+0XPiqvoKGXt2yiY9q/lrLUm0RxRHfp
         kKe7OxkUIHmQwvUkS6QKj7TYPwu8mEQgrMHkh01DDR1XpZ3FIk9p1wo58CE4DAlWNCNB
         sbC4r8m5XMyBwzcJwrHFYza/vc5nb2DPMUQXwDTNuJb9lxBvkwTfKqB6W/vhr2GhdTM1
         9QsA==
X-Forwarded-Encrypted: i=1; AFNElJ/+DqC8yi8QHoBgJuye0GWZZynL7NXP4mmo81GaocookAVv+IogBpoUYmcw3ss/Cm714qjUN4DzwkYWzSGiJRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQioaAJgafrksto5f7wfP2KNp6R7XyaPTNOkRwkzm4jW6jd/u
	tq/kUW9T05QsZ5uYanFyJKynNryK4pc5qsdjJ2fmAWrVrnr8BBA4MBxG
X-Gm-Gg: Acq92OHUrqbeLmeuCYsJ0BrwIhgetX/74Q1CyGirDMi2YMRtzJOjAObkNMOpS/PKUjz
	xProu5zmlv/thJYWgLb8eTDWheC7sGZI50k7BSiFFre7NNNprSt3BA9+z7mW7HikVfnCIA745T+
	F2/KcJNhO3DB8d4aXLBzYwUEBGVRP84uxWIaAZcTI2fbgnAd1HpHEIdtWYL78Lg4aLDnQomHIur
	etIlE+jX2MXfBpRgWJHeid21wiIvg2qt0mbS70GkY93/+jc/2Yqq6v4SlBfaaLz+YPxpfhP6dqJ
	u5anB+oh0WLyKyRWRzHD57t3MZWkoJyQf25ktOnLH5eDMS9rERj12SxLvfsg573UgrPWA9+38Gq
	e29GsBXfr+hs8E3pUR2liGXU/Z3QF7T1CtKvjDgc8WLuPjJtWgfwa/jEE7VhRJaUizUr1kztHTm
	9tF2zWnZXI0BGrHhcnZZAdvdalE6bDb2NTns90TjFLMxdYj0HRok0QodDSR3TgFiYZ7yOrhOV2h
	tuvNRqdvMqwV7AHi2MF9Fzl3hqWuyCVcT9/3uPDr+P1v8umH9LmmytJQSbf+H6vSruCZkaXiORM
	mkZ4A6Fzku1l+HHXtyAsrmr/rW8QvveMgqL2RhY=
X-Received: by 2002:a05:7022:160c:b0:12c:1288:ce63 with SMTP id a92af1059eb24-13807d7b5camr7734016c88.13.1780976877846;
        Mon, 08 Jun 2026 20:47:57 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcad34esm28011373eec.11.2026.06.08.20.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:47:57 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH] selftests/bpf: correct CONFIG_PPC64 macro name in comment
Date: Mon,  8 Jun 2026 20:47:51 -0700
Message-ID: <20260609034754.26081-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in tools/testing/selftests/bpf/progs/test_fill_link_info.cc
incorrectly refers to CONFIG_PPC6 instead of CONFIG_PPC64. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_fill_link_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/test_fill_link_info.c b/tools/testing/selftests/bpf/progs/test_fill_link_info.c
index fac33a14f200..137bd6292163 100644
--- a/tools/testing/selftests/bpf/progs/test_fill_link_info.c
+++ b/tools/testing/selftests/bpf/progs/test_fill_link_info.c
@@ -12,7 +12,7 @@ extern bool CONFIG_PPC64 __kconfig __weak;
 
 /* This function is here to have CONFIG_X86_KERNEL_IBT,
  * CONFIG_PPC_FTRACE_OUT_OF_LINE, CONFIG_KPROBES_ON_FTRACE,
- * CONFIG_PPC6 used and added to object BTF.
+ * CONFIG_PPC64 used and added to object BTF.
  */
 int unused(void)
 {
-- 
2.43.0

