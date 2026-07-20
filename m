Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22398400E0F
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546006; cv=none; b=cwRWUh591RZhWULdsOdPnUASBEpagTOLns5sqXTMILDVEZ6TZDQuod4u1L/r9G6DOoqsufux1E5UP8R8mEOlmcEILo5pbOTuIZxN1Ws4GoiFDJyXi2SlgJ/rN5h3K77fn24ps+WCv5YM9Iw8PCNGNKqKD56IJuJ+Z2as/L84Dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546006; c=relaxed/simple;
	bh=XLOtvvCv66YQSGuoLu3eRvzMzjzimYKdjqYj+ocM9dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlabXvVBtsF0ePYF3x16dnURtZ4l+HgVUZ6ma1hmv14Bt+0GgF2XroioQLcsrJsFZfRSHI3F/24hc/aaFNN4Skvbe2bC9YX2a0b0AHzn8my02OvzwlggUC6nN5NWWoY4p4Z4rNsWzYqxMSCMfuviuG6V5zNgrSEAi2JivSHFu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ge6OkG3T; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ge6OkG3T"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso18873595e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784546003; x=1785150803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN6Sa3FnT7k2MKcUIt4Usx9BRVJXnBuQBTO+EcPn68M=;
        b=Ge6OkG3TP92/iXi07TiwUwlyIaiHvPexNobUh2rFQy7SYb/p+Ik6hIPUy2kwyxhnjN
         TAH3nzkTV0oIXFfJV1LO03NsyP6pRrHkdyxvo6BhA4UuYpJR9IS0Ocek3dHF5fOQbe2M
         E+kmsRbYFRMZAvUpUhr0AWmnwO3vUFg2EIl0Ldury4DhMMp5YbrMDdwu28PHJKibxUo5
         +bGDnh55LrP3clGIESdgHhqCh7he/NfTDR3dwjcSegYyI5aSpSLLKEFbC+RoLe9YTy8L
         ax6lzqQwMWEWACTsIRNqnkG1otsY6sE9K+jgtJgWAyXeNII/nFdq2haVSLqZIjDkdNh4
         eaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546003; x=1785150803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN6Sa3FnT7k2MKcUIt4Usx9BRVJXnBuQBTO+EcPn68M=;
        b=dGkw0DfYtm7JAFrvpHS+Enq+LLRSlHHduSYUkiSeGFf2WefOGaCBLGO3E90Edum57O
         mpjTzhOBGIos0ZkGz+DUdxBKpTpaPTUI7wI8ZtDz2zzp/h7vUVDN8pqwtDF0LEmz1Ey3
         XfpNGadgABSffeRg3v2jepQHDMrBjMQYG5DP2pifOddZF0ttamYapxVPClgxXOUjj5ae
         l6OundBSRwrXl7Baz6X5rc8f2liaLUge7yukxPUOu/qrozR2CZkopFBA67/97AfmocWr
         jOxO6x5KCKd7znz4lEEfqw+wDbdFzp56xetuMPTU4rK6SoCNgIOg04AIlSbil9v15nHe
         81MA==
X-Forwarded-Encrypted: i=1; AHgh+Rqjh20DX3LLS4+uKsfHDb0zXNvmjPJAk2uGcw6FhEIofawT7hbRf/db+0xA+pGG5igm3d+6ZdDTUdd6Kw5KlBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPTGg2WXJjRLspftaaPT21D1xcNohBHcgUmh7Yal2l/IrEtq2u
	kmapghyBhsqAkqdEOTUQN3o/ZpAS9q+bU3u1II9ZH+BWCngLOnvcfwsVxOWehpMB1tw=
X-Gm-Gg: AfdE7cmY4RqfhlkcbiEEGUDAe6fBmwmGYCDNH6s8swQk+4CXDNAmIubTywuoyHoMgk8
	K1Mog+R0L1ncamcnNxFFCdB0I1BQ55arhXp4RW9BnypZL7UbOG/06thTQgtuXgGzuyEe3pwfQeW
	jZQ1GnHNT0CVVHTn5FBmt32CdtLMLYWLW6F2S141WFr7Vd+I/Eniu2S/RCGObgJa59lIjU41IEv
	j5yGtyUeIrnEAUubfI7aLaHFnCXKKVkeZ3Xmqjhc0CISa01ug4iixDhZVqaoVd0Ng0uTIVeAxaQ
	AXOYKPX0Xw8FYRPWtqHPhfW5NlFw2ktewT9gF0QX83p/VdW0HBLIchO5KFKgqYvPARp2o+R7++L
	Rt9GQ+bTUIssyXfzVCPL8qeXOUhTu739z8GR1TVA5hUhrcQ9jGynzHL/C3OZvqypgGugA+ywEf4
	+m
X-Received: by 2002:a05:600c:3112:b0:495:472c:208d with SMTP id 5b1f17b1804b1-4954a41307cmr135152415e9.38.1784546003305;
        Mon, 20 Jul 2026 04:13:23 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:c3e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eecc8e5bsm9088749e0c.4.2026.07.20.04.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:13:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 20 Jul 2026 08:13:09 -0300
Subject: [PATCH v2 3/3] libbpf: Search /lib64 and /lib in
 resolve_full_path()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-selftests-bpf_fixes-v2-3-b450eda93dfe@suse.com>
References: <20260720-selftests-bpf_fixes-v2-0-b450eda93dfe@suse.com>
In-Reply-To: <20260720-selftests-bpf_fixes-v2-0-b450eda93dfe@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1784545988; l=1421;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XLOtvvCv66YQSGuoLu3eRvzMzjzimYKdjqYj+ocM9dc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAtQoVs8IKXZ/WoGcNMf6XZxbYamJT38nyl50KUKsxxjuXmVJKzag8UU4v/8YhQKRvRJE4sCI9/
 G/ieYJUQyrQo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

attach_probe/uprobe-lib and uprobe_autoattach selftests fail with "failed
to resolve full path for libc.so.6" on older non-usrmerged distros, where
libc.so.6 lives under a top-level /lib64 or /lib rather than /usr/lib64 or
/usr/lib. Add /lib64:/lib to the search paths, alongside the existing
/usr/lib64:/usr/lib and Debian multiarch entries.

Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Fixes: 1ce3a60e3c28 ("libbpf: auto-resolve programs/libraries when necessary for uprobes")
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
2.55.0

