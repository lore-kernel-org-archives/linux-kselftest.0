Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6A471271
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305826; cv=none; b=JpI92uWar28l2MYcX04GyrZtn6y6HB7zYKzioRTcYvsFbnzKYzsr9+Q5IJJgXmMei5GO7oEPpa6MHrbSWOoSqzHYLwmqyxXnHZaXZKcUDq+sZqQ6KKENjm2BGcz6Pp5u7rbPk5Xb1nyCrjojYUBTHKacQditJ4sS/zE+ly4wcKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305826; c=relaxed/simple;
	bh=2iJo9WF5vaqoUN6UGjOx69LFPjrRXH6eZvTQxfvbTOY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=V//sVqIRohc9VTf2JMuqV0HjWFULWXtrgd1cTQ8N3Y1lsa4Z1ZqZaCOIo1ZsZT7IBZVQc/j3whoPMCt2uBo5+tDIuarRmd5x4gug4xTgj9SsaHZLyUj2xwYcxtAP+jtWLNr78y/K1eBISkSxUOqef6kTlcbffmVXam2kmH2/T0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkcWGbKG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkcWGbKG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso703564b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791305824; x=1791910624; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iJo9WF5vaqoUN6UGjOx69LFPjrRXH6eZvTQxfvbTOY=;
        b=UkcWGbKG+ili90+PMqAHg/RNm8HBm+PCxSGbfIpGyfTcTES7VOnDW53seNzNnjhlF+
         +ORQ6IMH0585mlEmkklqAtRSEjjFn2Z7YZBxYIEU5gh10etMZ8NygiPyLX90A3VMdtzO
         5rKWuM9AwRP7QDnIytvrWfx9ITTVLtB4a8GUOxJrgqaQRhuhhvAcFhQeuJgo42iFmPYS
         bDxBinSPyBF2DraKTXwBXawurW98jZ6sCWTb9lsxtVeNhGZuzJdgzigy9GWL+2XfnHKR
         /FrgzZfyfAuyVYHrue4Hr9qrZCC+rSrQEDdRMhDhmFLiXs2pXmfyUfJzxDkr/mpMdmHy
         jyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791305824; x=1791910624;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iJo9WF5vaqoUN6UGjOx69LFPjrRXH6eZvTQxfvbTOY=;
        b=rhmRjjEruZWlf4C0k+KpLWlJEY5ep7IxBk+FKxOBrf5qZhUIFhFTdp2v+3V6DpYAL1
         IdfLHGiWga5cdZOSkVL5u6zfiLgp8KqRtn0bUAT0XQ+RaaDHc//AEgPdCksY1fomCLDp
         eGzsa0fISv8E2pz+GLjHr2XXgs4raC9lp1E1n1ezN3vS2jPqv+tyn7H8IEp8Uw+G9kjK
         L1xdfMnDx4ojUE3QQCG6304sGSviRGQzQc+3Lb6f8Ou/YscO2YQPMtUWjbcWeNl99iib
         x4fS70RmtjqJsoPQC8QeAz0PaYnrKkJYV7CEkWvjpL8gWZLpS29R3LZRVOqwpuhIpyQd
         ah8g==
X-Forwarded-Encrypted: i=1; AKwUvBzktI1aaoJMalrYoZ5P2QN2MSC89KgEgyoA8cPEAfm6uxEx4Im9F0rMnQVThvLcGX5ppvBoexhLqRhK7FRqnFo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGZ8JTKjivorKmTllgW8khpqYsjmDb1747xLJFevkZvMvfi+mb
	89LVIXF9Xd2+J3hBFTqjUiKx/ghKIUxLi0L2NC+95+Bnk2b2Jl3jEpLI
X-Gm-Gg: AYBFou2ITno67ufF0k9XY4zHed9ERKXaCmv7e5KK9LWgg3r4TpPHpJM9Ji7cwBYniGk
	3bn13ng4bW8ukHOK2j6/oRu8rtnrxZ/3qAwY5iVr3TJtAqfcXFxRNFJdiKY7jGPb0gFwy6xq1Af
	8tfieaTuHjqGP/kTCefebv4p28UCyE26XL+ylt5tfm74w4UPhBETazo2/bfZcoL5O6v9hNsr21T
	vE/IJl2F36R9lxxjQgB1FJML9FPa8KEmAaSveleGFvnN9bdOIEwHtP2PTRe8aEDP33Qt0f39rlS
	fp32F64HrOf7ijhJf+AbogvafERTJtIxiYjhrkF6ZqOZEeDOo7pj8YQ+h9aE7Djwc7sBpgTVWlV
	kd4NytXE9i3oOp1z9+/sI6jBFG38lyYn9nlYQMj8scSmRszV0aI3SMvpK6YR+LLWY8VPmFbMAiI
	sve8SXKIbh9bTby724n80RaftQjPgxHlmmLPOA3Ir3m5HpEQ5KF8CPcnkqVMfvkdxv/XvY15jyc
	uw0mu2DcAZoN8BTwl+i6wpifQbCFnVOpir3agTZLlV29q6yKSbYM9yqToADivCVj2FX4/w8aCKX
	onxF
X-Received: by 2002:a05:6a00:3e03:b0:890:a777:1026 with SMTP id d2e1a72fcca58-890d8a4c09bmr1654501b3a.0.1791305824461;
        Tue, 06 Oct 2026 09:57:04 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89186ba2d17sm325252b3a.1.2026.10.06.09.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:57:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 16:57:03 +0000
Message-Id: <DLXWX2PFUOQA.2INDMK72TFKUF@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Amery Hung" <ameryhung@gmail.com>
Subject: Re: [PATCH bpf v3 0/2] bpf: Reject bare pointer for __arg_trusted
 arg
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261006-a3-arg-trusted-v4-v3-0-4619daf30e1c@mails.tsinghua.edu.cn>
References: <20261006-a3-arg-trusted-v4-v3-0-4619daf30e1c@mails.tsinghua.edu.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Oct 06, 2026 at 04:06 PM Yiyang Chen <chenyy23@mails.tsinghua.edu.cn> wrote:
> Reject the bare pointer while preserving referenced, trusted, and
> RCU-protected arguments. The latter is used by sched-ext programs that pass
> the result of an RCU-protected kfunc through trusted-and-nullable global
> subprogram arguments.

Which programs?
veristat-scx failed on v2. The only one I see in scx repo is
cake_wake_place() in scx_cake. It takes the result of scx_bpf_cpu_curr()
as __arg_trusted __arg_nullable.
That arg was added two weeks ago. The last scx release doesn't have it.
On kernels without the kfunc cake_wake_place() already reads curr
by itself. Pls send a fix to scx instead.

rcu_ptr_ is not trusted. The refcount can be zero.
The callee sees trusted_ptr_ and can pass it to a kfunc that is not KF_RCU.
bpf_cpumask_acquire() does plain refcount_inc().
With rcu_ptr_bpf_cpumask loaded from a map it increments from zero
and the prog holds a reference to a cpumask that is freed after GP.
Commit e2b3c4ff5d18 says
"only PTR_TRUSTED flavor of PTR_TO_BTF_ID is supported".
v2 was right to reject it. Add the above to the commit log.

> This series targets bpf, which uses separate global-subprogram and kfunc
> argument checkers.

That's not an answer to Amery:
https://lore.kernel.org/bpf/CAMB2axNnY5wxkTrd3_tHyXBzXYyjJUkqRb1uNbUquwTJ_FLVMg@mail.gmail.com/
The loop in btf_check_func_arg_match() is gone in bpf-next. See
commit 668a51c4ed4b ("bpf: Build argument prototypes for subprog calls").
This patch will conflict when bpf is merged into bpf-next and the fix
has to be written again in check_func_arg().
The bug is there since 6.9 and the fix rejects progs that load today.
Pls target bpf-next and do what Amery suggested.

Also 12 chars of sha in the Fixes tag.

pw-bot: cr
