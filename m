Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9B372EF1
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721403; cv=none; b=CVKReBYhBfCbtWcIlJ0KvWkGYUHjUdITwa3vxNS3zZhdkJWVLhTQ4fMyUMA43nFttLLnBcewkweH3Zl3lXmsRv1jifl/DyJU+EAg9S4kz7L6tmOIv3gS5jfBGgYPr6VDPo+EaZIxWv2rvpHsl2/DHRcYaYX0bIYEg6hz9GiSNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721403; c=relaxed/simple;
	bh=6lkAv+z1VdbJq3O3jTSPjcCfj4Q5wG5BSAJJAOcOXHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6UouwWj6J0COZUo54ziK6Avtv3LjPWZAXMFHzjbjQ3Hs1JgrrqDpjKFzHgHs4XZYW+Gcl7kcQLEyWUpt33DlTPyAotNJ3ZbYAKkiiaFQUpmWeLwB2tqJlom7xxWvCyI5lQIw7n5buwANciK00CAfwovINUKBVAhCT1ur2YMDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S0tI3mbP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S0tI3mbP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso8675455e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783721400; x=1784326200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzUlPYC5qPANfrz/AaLisWernv7XLVGLrQnhU/QY2L0=;
        b=S0tI3mbPcygfc3OSyYX7yza6E53e6IPoU6DnHzkKppI/FxuWIssCLORe9s7IzhTWiF
         HFXTr4nQek69yYuMmQQ78z90awnGxaAqLkKtwqWqIMEJf4KE7USFeBDhXSAuPjomO5vW
         q2YajYYlSTkXmQp9xi2xPTtChMqhbaGEjPO4pEbMHvWbM464zhz2DOz3uVVBK4Fxggzc
         API859Iioy/WDMaR4v363l3yFj6SdzsmX1kcqP0t/Q0QTQe8c/BDRhnA47sHfuDe5rmv
         x2j42OECujTon9b6S/Lfp52kL38MnRegsF/P7yqGv53JW3Y8wEkfES2WwNOQYU7xI9cF
         p2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721400; x=1784326200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzUlPYC5qPANfrz/AaLisWernv7XLVGLrQnhU/QY2L0=;
        b=K0lTedNi5K6H1+bTA1Z5JNkvlJi9AhAfCZtEokSTNWZnZYbdgT8+/hKbalWQ7hS+0G
         7vrIw2g9C2qQR4Nk/NBwFwunmsJjZKVvknUNKGlNTJ64ZDYFSqtv3ymo57Qn4ZtZq537
         y0uwb+yZG18hB1kzTTKmM8nyJ5d/uIZ7c3wH1VZqAwrTRsZSrgr/Zd7u5TCbsCWfrWfm
         9Bo1MBfsnTxoiTtW4SNb6v/ZIcfMY9YMyDvoMMEpxocnzqH8Yi37HbYAHnnIALCwMrxM
         sx8aCHhB/wPWvcWPjnDwNkwKlGZcCA04oZNfWXS1VQ+jK+M5CshB+KB1mml/HF26H5Ux
         6syQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE/y5o+HkwsZw3W0A2540QgUfatyzcYixa2T+VzGCQBXaICLmWExcyxqPh0jh/ask3ikCHIKNlzxv72od2vxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2s3tHcgWcqKUKC1iVB6As6GqzVcu5GwUmdi0RrkeI56x5aqM
	cMvVKI15Ef72TPxCSG27VpwgsfZU6uASWi6zJLcRRO0JE7f2HbxVxAy3pnMbMfDETDM=
X-Gm-Gg: AfdE7cl1FkfLXQ2ZdJP8eZWv9oyhdf9oMhWLJ16r2qpDZ29vkby6zbCZo+V+3p6ij2X
	iNrXegG44u5xeokayb9zEwEor1zu62R0c/S6bQeBlfDGpPk1kRQZYGjcl6IIKO2K7gHl/9OY1L/
	z3854GyH1Mu2QgYJG/pKTOPEUPXcw9oLZ/pbbegq9VZp+ifopThUf3yd97E+oMoVDEGE1g2UbBi
	K/I5IhxsaK8+9D5WMK6JzvByM0eLFfCQMAjtd5NzsFrSt1Hd4y8IhytrviC8TEthIRWsWbtVyWr
	Otdqsd6Bk0iPv7k/BPKHdjy1CHmx7Eh2+fsPJ0v60J6kbhnni4zyib3PGWAr8J2HW+TOIg2Clqt
	iNme9Bk407PZbIGPxOjiNsABtsdW3BHcNIQfFMxurOuLD12L2F0AR1hvRX7GG23rkHJ8e7vs1lR
	f4gA==
X-Received: by 2002:a05:600c:4ed4:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-493f881f0fcmr5699615e9.23.1783721400302;
        Fri, 10 Jul 2026 15:10:00 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:157e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bef1bdcsm57774077b3.12.2026.07.10.15.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:09:59 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 10 Jul 2026 19:09:40 -0300
Subject: [PATCH 4/4] libbpf: Search /lib64 and /lib in resolve_full_path()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-selftests-bpf_fixes-v1-4-aa24dfd6f4f9@suse.com>
References: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
In-Reply-To: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Christian Brauner <brauner@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1783721384; l=1278;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=6lkAv+z1VdbJq3O3jTSPjcCfj4Q5wG5BSAJJAOcOXHA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFR/tut4OCyvgDwlGseV1WK7Te9XAEVFFha7CXAmadILbP0Na3iXB7sPAJthSMsus23eA2gfg4K
 BR9Z1mD/LWwA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

attach_probe/uprobe-lib and uprobe_autoattach selftests fail with "failed
to resolve full path for libc.so.6" on older non-usrmerged distros, where
libc.so.6 lives under a top-level /lib64 or /lib rather than /usr/lib64 or
/usr/lib. Add /lib64:/lib to the search paths, alongside the existing
/usr/lib64:/usr/lib and Debian multiarch entries.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/lib/bpf/libbpf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 1368752aa13c..1ab939dfb7f0 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -12973,13 +12973,14 @@ static const char *arch_specific_lib_paths(void)
 /* Get full path to program/shared library. */
 static int resolve_full_path(const char *file, char *result, size_t result_sz)
 {
-	const char *search_paths[3] = {};
+	const char *search_paths[4] = {};
 	int i, perm;
 
 	if (str_has_sfx(file, ".so") || strstr(file, ".so.")) {
 		search_paths[0] = getenv("LD_LIBRARY_PATH");
 		search_paths[1] = "/usr/lib64:/usr/lib";
 		search_paths[2] = arch_specific_lib_paths();
+		search_paths[3] = "/lib64:/lib";
 		perm = R_OK;
 	} else {
 		search_paths[0] = getenv("PATH");

-- 
2.54.0

