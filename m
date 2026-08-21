Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28063AA4F8
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352044; cv=none; b=TqJgF5/Dr4X85gnRhhjNYLtI9V+19+jrbI/o7fV9gQ5GUOXxpHKtaRUz+M5Jh3Rwopmn6mkIA61qyli7c7bY0die0cRFKbx88yYAzvTcfroBdzqoqQimjmAK9E4eqR56jEyec8yBy7uxnCJYEUFWUohiO0/QZvG7VqCqx8a83W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352044; c=relaxed/simple;
	bh=CT/Gjo2eneEjO2Ue0I4TGs9z+iX8TPRLUGz0u+8Gko4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVwXHdGjZcVpTQ6l5mmaEMAFaADCvu4fQ7nT+ujArmWwbAVn9v8rnm1PRCytT+iOinn2wp2lqN6MN7Zx6LVqaiE8nU1R92PcJnrNVnwASd3PEzift7zXfjesfxdLE3tKgAXTWX72dbXXPi8tnuJczOjLZ4DiG6rZrTrV+levCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jeVeeEY+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jeVeeEY+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E9D01A1794;
	Fri, 21 Aug 2026 22:40:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F010604AA;
	Fri, 21 Aug 2026 22:40:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D69611C77708;
	Sat, 22 Aug 2026 00:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787352034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0kQP0GmtHe4QERJ/pQao5qjnFU1LNd7sa5g7wyCFZaQ=;
	b=jeVeeEY+DzYJqpEwEq4PERn7Pw9RIJXJVToLHzBGZ5KLmHRVIIJLmV76/uXKOT3j/pM+ro
	6l5OrSp4HrQ0WVukMmHzxy1VjNxd+6toNPZV+Qiyy8R9xlq7U4veM/dwr/R12MmDOVPoQW
	BupGr2WLxsdKlrkxrZDNPKbgKMcTg4nPnZ7vckGMFwSfqPVkdujTCc11IdeJssWr1QLkXH
	3RgjxPv6vl8wU3o4Nxpp/l4lJKO6QHGBnDs4dP41+Ift+jkqnOowAU1O5KytYSrOEeZf28
	QEcGQTMkeOkAhkNoZnyQQaI41mABponOz2yt5EvCBZDa4RoLVsO8JGJwGWO1yQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Sat, 22 Aug 2026 00:39:47 +0200
Subject: [PATCH bpf-next v7 5/9] bpf, x86: enable KASAN for JITed programs
 on x86
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260822-kasan-v7-5-99afee6ef7fd@bootlin.com>
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
In-Reply-To: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
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

