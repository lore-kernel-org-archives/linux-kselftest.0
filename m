Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4D4B203C;
	Thu,  3 Sep 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443543; cv=none; b=ngRGTUTXr7PwwGv3G2kib4FIFW14uqanZvb6lnjctG5cnlsDyD2KAwPaB96YqxXMt6dp5upHxi3sGNgP7tcFt7zSB9JExquW8Vq/3Tw9v/4ZjnrAeYDADZwiu7o84zY23fm48CIyPo3avps+O5Fj9lbhuzhRwyb3zjtElMe9jtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443543; c=relaxed/simple;
	bh=CT/Gjo2eneEjO2Ue0I4TGs9z+iX8TPRLUGz0u+8Gko4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScPA9womDT4JRhcSiYvAe0gyypLn0RrH9z+H66b92otCZ6t5hL4XwqnR9Kc8FAGDy06F8sYBsiHVYLPxty2l7K8b0/b8ckEslg/6xlAaa8Gt8OX0gbgPjGftdkMiokh1Gi8PndDmUh72rUhIwURQ4eYoO+6/0qPc43ZPKSSgHM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vWNGQu/5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vWNGQu/5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE5391A1981;
	Thu,  3 Sep 2026 13:52:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895B6602B8;
	Thu,  3 Sep 2026 13:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8161811C7A19D;
	Thu,  3 Sep 2026 15:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788443521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0kQP0GmtHe4QERJ/pQao5qjnFU1LNd7sa5g7wyCFZaQ=;
	b=vWNGQu/51uNxtfGaZoULLsc3883K0pzcC8ClBM4WxAcJKY6itggSzbgIW1ZBG1poxEGWee
	zW5SOQh3fUwAq/vldBNQdynOFMFeDaYQfF8Hjt0yXWjWaruu92l92uFnASrqlD5UcVhdIQ
	KOM7EpBcdggDG+GFDQ7eWGFc2wMpsKh0RrAhrjK1Gk2S4gLMVZqyvX7BBVPghGlSBMArSt
	kc0c2wh+jMkhld0NfsDOg28eFQ2h4/O9NMGoFuionX3t0odUNFgNwYKUk32o3zlHU2vn+z
	pBk0KgqpD4DlLCOmyTy9ePa7Vy6FuU+i9OGN2iWnWawPdORdM8ZtirBnZ0kBSA==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 03 Sep 2026 15:51:34 +0200
Subject: [PATCH bpf-next v9 5/8] bpf, x86: enable KASAN for JITed programs
 on x86
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-kasan-v9-5-2407fe99255a@bootlin.com>
References: <20260903-kasan-v9-0-2407fe99255a@bootlin.com>
In-Reply-To: <20260903-kasan-v9-0-2407fe99255a@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Yafang Shao <laoar.shao@gmail.com>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Mark x86 as supporting KASAN checks in JITed programs so that the
corresponding JIT compiler inserts checks on the translated
instructions.

Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 48ccc3e6059d..745890d91e99 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -234,6 +234,7 @@ config X86
 	select HAVE_SAMPLE_FTRACE_DIRECT	if X86_64
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if X86_64
 	select HAVE_EBPF_JIT
+	select HAVE_EBPF_JIT_KASAN		if X86_64
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_EISA			if X86_32
 	select HAVE_EXIT_THREAD

-- 
2.55.0

