Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A444CAC1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060175; cv=none; b=ELY6ZbKB1rvZrNNxT7cIeu84+C3F3jjZP9MgRIpJiujgusZijqt9YsZNpGhb/Zx7S1VL2lsz5X+25smViemwzkLL1kc9LiZb46MBseAjOJ14LOfR3/H6M99II0Sxbw0Q/wjPStQMmyNIcJb/qJVXUwhfkZBE84fedqjJxNXwh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060175; c=relaxed/simple;
	bh=yVagyWKvjPbOTMFBAGYFdTOqwRpe3t1YiqqD3RZmsw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO3dOBeapIGtW1FseGgFkY4gtBtLlab+mpvXe7dQ0Ufhbyef4kYjhsbFmR+lYi8BfKmgN02P45U9ZGnW/dykwv0eUrwGENyG6pUuKQbH4zbIazaWu3HyB+RdAuyk0l/9atPKBrzKp7H73ArSYO1YYdwNfCmCp6PTQmYEvmCkxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OyIRog/E; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OyIRog/E"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so1870071a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060170; x=1775664970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FvjqJGRUGf5rvJLMczRoDDubOCSWcD2sRCL5wLsrmc=;
        b=OyIRog/ECRzZPoExYO7DKJ58u+Hfat7TItfxQ6a3CAlTJGaKaFLw/+WdFx2g6o6tOs
         RPpm7cyjQbjjTcOIUhAR0JzME1mUfhro+KHhOz3pmgXkSo+kCWwsivuz80vtjGbGXH/Z
         XgwEZlMZecFlr5nTQ1JLf38GyiLf6I9xlAE+Zdm0yAIKA4HL7JGwacPST2ukJGwLCmO2
         s3tIB63tnv+xQ1WsD311pjPkZwwksCF22oJFITVGjylFUst4ISGbEOPbyWS1MXsWXlvp
         DLsgDESrww9urcI4n7/lcnUpanjfv6OefIDyjwS4L7S+VlsL4prKYldS7a21xobU2kNw
         lKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060170; x=1775664970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FvjqJGRUGf5rvJLMczRoDDubOCSWcD2sRCL5wLsrmc=;
        b=jVZpNR5hKVpBk9f8F/lQbb8QTBnVKOHNvPFB4DsFxKnqa91NA4wI0cfctpWoItWtEE
         Hd5njC40gTUjffvm2i8GPsutgSEfqMPmF0OkelQ5DCMKKTs63cIW5wNzpD8aI9Lc/iu0
         XL9vqo3CwPCcU5NVEktgaSwZmfpo8oI6ooYSjjNDI48wv7rNrXrGEtHRLKCufFxp++5Q
         QnyVKvADB0n/BcSpgDduAuC5vAWs0hdQyy5dgs8wxL5IlSAGtE66R1hUoAsgQXMquriE
         ddT9Ipj76op/he8rEqsTx9OQ3BjDz5lJrmSMTwSZnaQhXi1eJZUrrSwL//rOIZ87a35J
         +JVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXclOtr8LOMKT1z9b560TIcofUmrdWxDBfcT+oedZSecNKiHrhdzxNw7e21wr2nt/U65zRTmT0ZhyCtXLd/nZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6MNRHkdbhCm9CpU0ghymPDmOOgQRF6vLUv/i2TQh/+mtX2xX
	vr7U5FK1AxwAsPEIj55u5u0922pftKWZE4bkhn+Mdv5hwIDmobRnqVgglVSI6pu8wrE=
X-Gm-Gg: ATEYQzzGbqUh5QU4PY/rXcEXh+zv0FaECs17xZLC7HPiRTIAypJq4Wrm4ncm24pQYA+
	rswb0pGGT0M71Jf1ie3C45Us8sbMcSz4CsBhXcaZH1jTbJux20qBHkdHIVD/3UrXIw+5jLiE7Sd
	HXE4gUx71FtCeZ42lNceDDOzn4SGgBAhqIASu03ZyCGcydKY8OTBUkOUp/Nk4IbNDg6nkZUXyh+
	9rYoPDQmf7+5zyAtcgHvoje4hPfwAS1d27rfkfmreR9OLIrMEA5wEDG5BdrbBbuCAo9NKy+T/ED
	pnBsrlVR1kR1reoINQLOs8C/X86ZYquosih27n7NmzLCAMx0Fh+iLCdwUNJ6Xd7MeZcQ91yiNrv
	Y5kyHHqd16qOXHFGXwQib14EgjlQf6I0AK5dE7QD1tUZY8Gyk7Foop+oVuRfy01oOEodpfnu+uy
	yDBMebS+NQ
X-Received: by 2002:a17:907:80d:b0:b97:b88c:386b with SMTP id a640c23a62f3a-b9be88fea21mr486276566b.29.1775060169798;
        Wed, 01 Apr 2026 09:16:09 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb4fb62esm539517241.0.2026.04.01.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:16:08 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:17 -0300
Subject: [PATCH 10/10] selftests/bpf: Tolerate missing files during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-10-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=yVagyWKvjPbOTMFBAGYFdTOqwRpe3t1YiqqD3RZmsw8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJqWMuDkW7CGJ4c4k1sKyalpyIqTV3VBzKB/br2/xyUcVyk8o5hnm2bUhNHeFiX5vKvdQ7v/CyK
 tdCTirSltDAU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 3d5b88435446..ec24bad44017 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -951,6 +951,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0

