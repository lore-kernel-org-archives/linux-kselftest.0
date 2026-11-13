Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608066;
	b=x7VnUkYjpfPxYhlyxnEBqvQaZC++N6egBkCX4aqKAo1t9+aDpUxqAzUHWBzR/d7j9gD5
	 UOCfEN9lN5sbyZs0wHrc1Vfbsrj4Gbvc/Y7uKumNTgjTSXvz9dU+HLb04X2w6Pjc00qip
	 /wEzSm4IsEMvIn6UXVRjoFqwD/cQtbkevvh/r68gfo9Q1f6FMGLKReG/xhahWJo8o44GZ
	 Mx6w6W/r2Q9z+YlOe/MgDwd9a9TMHp5B1Ip1p701AMWPM2uQIPhWd29+J+elujv7D3Han
	 KwDcV/U1w94THlc+3qAjOjPeZuCxSx3dtbQ21J1qk83wvzAUbA73oRl34bZSm8oPguA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
	b=AccW4FcRQmvn1CUN6abkDAKENaAAX97P36ycgBL4i/1hudG9aTEnPNWMj3B7fEMW2dcv
	 dgNT11xyTRG/g1wviJxtgjcAWOAekfhbt+jCGvPNuNbwEWfrUb8HdbsA/E175dSSop3y4
	 HskmwkuGdfYICwpETl7BNSeO9tKbTuskH+kBGa0GBGI8iMjuY7GYNhoxfqGnqnWxOSOtU
	 4RbHfrluWzjL1wIf3pJpYsk3u6lc7vT2qsZAg1Nq/yxab28CtBYmrYQsiQRw2Yhoz09Mb
	 chjbrUlFemFkacTkWd5OWUhJFnYy3IDF8ThKc1L2c8AlfxCpw45NjADxXKH8/xm2cqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB45606A8A7
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB45606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso1909906fac.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608064; x=1795212864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=fjMOIPEujQ80OPuCk/2PwfPYl4muqyhEYEkrnqU2gj6MiPamTimEwjYFMt/H/9w7Wi
         UTuuENUdduvK1Ox2OM9j6e9GAJEMPHdc53tzSSDAj1a6+ARSpQiJsqLxzv9iHK/mIhuf
         S7bDxajxb9GFPHBWxjr2+Cfgm9DIP4GdAUYAQ7eGXov/HX/WKBKO8Vtt/FaZMGUFO88G
         zMbzVQgLhL2PpkBGRoAQhEpGUZU/UEjt0UKMkpAYQ9N6m2bW/Wte6R88jCKB3aczvlkk
         m3wa2cFuDRz1ah8RH2GBQgPRgT6KSKqZSiMGkxEnsF2VUy7YKRxWdFGIaSzdaXSeadYS
         e9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608064; x=1795212864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=FJtlEYWCrdZV3VTmAXWZeI/QUggExgBiTFE0CSU7+Lc6NwX6PwlqCoKwNRddcc2pie
         hZdtxYCJlJTqs10obeAp7/t/l6ig7dUlEwkJvLELBt2diB7Ua43izdY3CRl5j9IRQ/Zr
         +yoolNgi4cT+uIGYAchNF/umREqiB/RTAO+S3M4Hxm9IPHsDHx34KbaKqRmaznrqkofs
         lM/np3625ligBQC5jPHExf6BOtGpbaCAqnsojtOQHvjT9TnKMhEGPtBlKu9FOY/1ni64
         Mbto9wNxFd3Fjck9Zpp0xUAClKc/B+QCSMkd29r7vjgbfeSaDQb1x8CeAvT/DuQV3wJO
         qU0g==
X-Forwarded-Encrypted: i=1; AL+hErGdqomx06LS8otI2ZnxBALw9f8qcGJc8y9L0jpnkdCjuOcju+U3MTh24onpC5znd0gbGnMQGQsCA6nc+1DJtSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DlCyhUHmED73xEtFLvrUjukvz3SADa4R4CmTwatpnn5xJOzUG
	wf7MPplPwj3795nmxutYcBpK5sJqZeLAJrSDdGnN+7eZkFe163dl0BPfEJZm5KsJgHTF++5plCW
	ix+bCWn+pIdlg5w==
X-Received: from ilbec7.prod.google.com ([2002:a05:6e02:4707:b0:53c:f2dd:1e17])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3505:b0:536:611a:7fd9 with SMTP id 5614622812f47-56e6015e8cfmr3125630b6e.7.1794608064235;
 Fri, 13 Nov 2026 14:14:24 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:50 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-16-wusamuel@google.com>
Subject: [PATCH bpf-next v3 5/9] docs/procfs: Document KALLSYMS_QUERY_* ioctls
 on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add kallsyms to the /proc file table, and a short section that refers to
the KALLSYMS_QUERY_* definitions in include/uapi/linux/fs.h.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..442aae9ebd9e 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     All kernel symbols (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,14 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+kallsyms
+~~~~~~~~
+
+Lists the kernel symbols of vmlinux, loaded modules, and dynamic sources such
+as BPF JIT images. The ``KALLSYMS_QUERY_BY_NAME`` and ``KALLSYMS_QUERY_BY_ADDR``
+ioctls find one symbol by name or by address without parsing the text. See
+``include/uapi/linux/fs.h`` for their structs and errors.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.679.gc527c65306-goog

