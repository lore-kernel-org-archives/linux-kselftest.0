Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0639B497
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690508; cv=none; b=rWrqa0TRfdkgWXtP//MROQ/0GG81x9jeQdzM4M8zMZ/hBr8jXepHOM0jXChPuQQjmidhWOr6s/wsZtyJ3BLOCvZyeSAsjnNysxATlYymWYW5+TA6/Nl1PkDe2JLF++geUuCEilWXAVySNgiqPwmrODEjLLcIQCcdC5odB93zeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690508; c=relaxed/simple;
	bh=Qpr3XO2rxFFX6hw2+sXMysT4YY8wb+1oEA/BSd+p+r0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tschbRbNd0sCT8ySrI7NF9BTtM2u2+BunhiK/FL6k1DPq6VrN40s+Ocv5zpepuhc1AiIiSGdH42UKXetAfGML0xyA5WpF6GAkoHf+ECnkoEG5rlEOcKIcVWvIyWwMMLa9c66WuSA0dflq68M4UwFfpeunJCxUKJ0KOQTZFLgVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TJY4PHJq; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TJY4PHJq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hy1vnl/axXCuEJYWaxw1gEfqOcge1HsYtjEucBp1X78=;
	b=TJY4PHJqDlB3R77odWscnhSPPbwm9H68wWAZvxNyZIAtIklolvIxjfMXKeb+NlAfpqT5dM
	iEXiI1ZDh46GVM25OWf66JkFgGsp7DlsCDcu2btbWbtLcDL2T03HdRgZPj6yOsrPGbZkUp
	sKLcM+2MPj8jAP+t2bhDr7srZO32iPs=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: kernel@xen0n.name,
	graf@amazon.com,
	shuah@kernel.org,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH 2/7] LoongArch: kho: strip stale kho_handover= from reused cmdline
Date: Mon, 25 May 2026 14:28:05 +0800
Message-Id: <20260525062810.103367-3-dongtai.guo@linux.dev>
In-Reply-To: <20260525062810.103367-1-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

When kexec is invoked with --reuse-cmdline after a liveupdate boot, the
running kernel's command line already contains a kho_handover= parameter
from the previous kexec load.  load_other_segments() prepends a fresh
kho_handover= for the new handover FDT but then appends the original
cmdline verbatim, resulting in two kho_handover= entries:

  kho_handover=0x4000@<new_fdt>,... kho_handover=0x4000@<stale_fdt>,...

early_param() calls early_parse_kho() for each occurrence in order, so
kho_populate() is invoked twice and the second call overwrites the first
with the stale FDT address.  The stale address no longer holds a valid
KHO FDT, causing __kho_radix_walk_tree() to dereference a garbage
pointer and panic early in mm_core_init().

Fix this by adding the new kho_handover= to the cmdline prefix first,
then stripping any stale kho_handover= tokens from the appended original
cmdline portion, so only the freshly generated entry survives.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec_file.c | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index ddf4d0e0e7fd..ffaedd055e62 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -71,6 +71,37 @@ static void cmdline_add_kho(struct kimage *image, unsigned long *cmdline_tmplen,
 	    image->kho.scratch->bufsz,    (u64)image->kho.scratch->mem);
 	*cmdline_tmplen += n;
 }
+
+/*
+ * Remove all "kho_handover=..." tokens from cmdline.  Needed when
+ * --reuse-cmdline is used: the running kernel's cmdline already carries a
+ * stale kho_handover= from the previous kexec load; without removal the new
+ * kernel sees two entries and kho_populate() ends up using the wrong (stale)
+ * FDT address.
+ */
+static void cmdline_remove_kho(char *cmdline)
+{
+	const char *key = "kho_handover=";
+	size_t key_len = strlen(key);
+	char *p = cmdline;
+
+	while ((p = strstr(p, key)) != NULL) {
+		char *start = p;
+		char *end;
+
+		/* Only match at a token boundary */
+		if (start != cmdline && *(start - 1) != ' ') {
+			p += key_len;
+			continue;
+		}
+		end = start + key_len;
+		while (*end && *end != ' ')
+			end++;
+		while (*end == ' ')
+			end++;
+		memmove(start, end, strlen(end) + 1);
+	}
+}
 #endif
 
 #ifdef CONFIG_CRASH_DUMP
@@ -249,6 +280,10 @@ int load_other_segments(struct kimage *image,
 	}
 
 	memcpy(modified_cmdline + cmdline_tmplen, cmdline, cmdline_len);
+#ifdef CONFIG_KEXEC_HANDOVER
+	/* Strip stale kho_handover= that --reuse-cmdline may have carried over */
+	cmdline_remove_kho(modified_cmdline + cmdline_tmplen);
+#endif
 	cmdline = modified_cmdline;
 	image->arch.cmdline_ptr = (unsigned long)cmdline;
 
-- 
2.25.1

