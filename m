Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD513DBD55
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519240; cv=none; b=aHFx4+P6XyuySXHc3OrECiFeCCDVNqQoLIa/YBYVwd7X4q1k5TtQ4hsV+3P5FGQpk8XdnnE3J6Aksz3sOESfnkI5Cm6QoJPZ1t2kU9qtUGGnZzDx2liHwwjdmMTjTPAPLBUldS383ysflhol68K3N5hHXbGSVUdUxPvJc6diBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519240; c=relaxed/simple;
	bh=ttyzlAsQV2LCBXMCefThV0JUVjJzRehzxN0uxmPQx3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mldctw5e2YycF0Q0OjwO5qixBPb9Uy1QNbJjwJ0XI5pvdaRh3MYk9cYpKs735UCdBiPbgtivspBdPQzTIdxrwT6K0DD+HcdU6arw0Tr6T1xo5yrFSMkouLeGchABOf73svFlC/PTh4MR/yltsD8bzYQ4eUMdgsdZDqS5lSvtKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an9J+f36; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an9J+f36"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43496e6a964so3380430fac.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519238; x=1779124038; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuqFpulg8Nqo7DOFhcbTfsrDVhgNxZLwGvrCkArInQA=;
        b=an9J+f36HD8PwfYW0Ir4GuH815hrAhaeL6N8MUZKQiDRqK1vWyenuvvAXwPim0PZUX
         PBGKfNzNNBuaByPVVsAgiKV2Iuyh2GBFweD7xiIjZwYf0d9KyrYHlS6J57w5vYXDTx6+
         12z/Y/6KYr1LbyL10cW94Qgn+XfnavmdAZEk+dmJRwZPmRoK/IkqLPNsiRi63hGkahEU
         H+iG9SUlhESH4uWHmtiJxuFSygMP2N+Sa4u0Xb7M3MnmpDcaeGqrm7LvvMtgX25rv43J
         F/uJARN3hjZVeQV2R6cVawNxlerQ1J0qfGDXX5cyqN39vNnuDC7taPrEiKmMuEkFcOS3
         /5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519238; x=1779124038;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuqFpulg8Nqo7DOFhcbTfsrDVhgNxZLwGvrCkArInQA=;
        b=Y6fjfmKr051Q4I5y0NydlyxkxjQj+cpcyN1ZnL3ckU05dQWhrundafyrik5P8IGAvC
         VFv8J6Hw5RrjiIIAN7XDEXPBf5q6USdWvdFHDvcBJH4UfBDJ0QepMzHFSPccu8LZ77zJ
         OUsmhvhBPQ/xP9TFxkCXsx/T2yAxMDE2HPN9aPWFeBTlsM0Aq83kA2AAdXXV8KrjmlHr
         l+6t7ndXfJ2HILG9R+Kx+yRWewBxs/Dc1aBZ8zSwG8fFVSZpzhZZmP1PUxKOL44V5IjI
         FTYKBd6nOX5EKPEGH4lTf62c0qaz198/CFMtqARc/DrntgUZBnhoE0nQ/Bz4TiFN7NR2
         MBuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zRkwrQ7DZuCJdnxVgkciOiILcsmDqKGxAtKAQBrFuvRML37VLfErB4dLYPxQhc2V9Zsmf6T1fzw9gWSDgKf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UThc19wKEicWZWeMycGZ66u2AZciLU4oBLFgOlUuLBE2x6Q3
	2udExiGWKz+mfRhNEfX40kOgtVi3cQN4zw0QHeqeQc0iPIW8pLS4uOlw
X-Gm-Gg: Acq92OEjuKDEwjzWu3KmPfEpDY1RbLTrIuwB65dC2rEJqOJnl80H/ky7tgHTiXdjQsz
	QgPabiW6NXQpqsSggXWd14tiay8IXdttOsv/KpFCkPz4uFmra0qvoCZN4mZP4YGb2asMW8VLPb0
	4n0FKtTMv887R6zrhUOp8tsjUuev/l51jEm0j0OIAiCsL7c4h8YuJCMorq/owiaD7Dkze8fP9Ow
	bcIlcFuRzE0/ia/MarqQ5vcnp3pDBMQg7j6KcTUqBg1WFjktjLd7PWJcGyndAMGOuKJxhJuf/hR
	G4ESKe1+b6EWNIH8/9EiufRG061tVstNsjEh5scnlvWyIQgjM0gMOu8kUBAOF3MQPh0o2Eh8obF
	fpraeBhMNpK8u7PD/1d4q7fwImdeFL/t+MKf4jErNk2iy0S2uO1wpqsnN88Le3mK5mNebOojW6P
	FD6hkjfUgON0NAX7yITHUgHclbLSMK9lwTOS0w3xMgpmOVX60/e2WjFgCJ+xU2oYgB5xG8sykLk
	jtvo0B+glB6QEMLIpSEn6wzZng=
X-Received: by 2002:a05:6870:5119:b0:433:ffeb:4525 with SMTP id 586e51a60fabf-434f66bae6emr15403715fac.26.1778519237637;
        Mon, 11 May 2026 10:07:17 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43557109b7dsm9702493fac.5.2026.05.11.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 10:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 10:07:15 -0700
Message-Id: <DIG0G9IFXF42.3O4K6XV8RGQBG@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <martin.lau@linux.dev>, <eddyz87@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <kpsingh@kernel.org>,
 <sdf@fomichev.me>, <haoluo@google.com>, <jolsa@kernel.org>,
 <shuah@kernel.org>, <brauner@kernel.org>, <sforshee@kernel.org>,
 <yuichtsu@amazon.com>, <aalbersh@redhat.com>, <willemb@google.com>,
 <kerneljasonxing@gmail.com>, <chen.dylane@linux.dev>, <yatsenko@meta.com>,
 <memxor@gmail.com>, <a.s.protopopov@gmail.com>, <ameryhung@gmail.com>,
 <rongtao@cestc.cn>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v13 6/8] bpf: Add syscall common attributes
 support for map_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260511152817.89191-7-leon.hwang@linux.dev>
 <fad54bcc2f9363f61cda44680e7189ad7a510d81dc52f444a4c30a3fcd37df1d@mail.kernel.org>
In-Reply-To: <fad54bcc2f9363f61cda44680e7189ad7a510d81dc52f444a4c30a3fcd37df1d@mail.kernel.org>

On Mon May 11, 2026 at 9:19 AM PDT, bot+bpf-ci wrote:
>> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
>> index 8433430dedb7..c15a4c26a43b 100644
>> --- a/include/linux/bpf_verifier.h
>> +++ b/include/linux/bpf_verifier.h
>
> [ ... ]
>
>> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
>> index fd12ad5a0338..62fe6ed18374 100644
>> --- a/kernel/bpf/log.c
>> +++ b/kernel/bpf/log.c
>
> [ ... ]
>
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index 2fa05ba8f161..54b43e16848a 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>
> [ ... ]
>
>> @@ -1611,6 +1632,31 @@ static int map_create(union bpf_attr *attr, bpfpt=
r_t uattr)
>>  	return err;
>>  }
>>
>> +static int map_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_=
common_attr *attr_common,
>> +		      bpfptr_t uattr_common, u32 size_common)
>> +{
>> +	struct bpf_verifier_log *log;
>> +	struct bpf_log_attr attr_log;
>> +	int err, ret;
>> +
>> +	log =3D bpf_log_attr_create_vlog(&attr_log, attr_common, uattr_common,=
 size_common);
>> +	if (IS_ERR(log))
>> +		return PTR_ERR(log);
>> +
>> +	err =3D __map_create(attr, uattr, log);
>> +
>> +	ret =3D bpf_log_attr_finalize(&attr_log, log);
>> +	if (ret) {
>> +		if (err >=3D 0)
>> +			close_fd(err);
>> +		err =3D ret;
>
> When bpf_log_attr_finalize() returns an error (say -ENOSPC for log buffer
> truncation or -EFAULT for copy_to_user failure) after __map_create() alre=
ady
> returned a negative error (for example -EINVAL from CHECK_ATTR or -EPERM =
from
> security checks), does it make sense to overwrite the original map creati=
on
> error with the log finalization error?
>
> The result is that userspace receives -ENOSPC or -EFAULT instead of the
> actual reason the map creation failed. A user with an undersized log buff=
er
> might retry with a larger buffer expecting success, when the real issue i=
s
> that the map creation itself was rejected for a different reason.
>
> Looking at bpf_check() in kernel/bpf/verifier.c (around the verifier log
> finalization), it uses similar logic with 'err =3D ret;' reassignment. Ho=
wever,
> that doesn't appear to have the preserve-original-error comment that woul=
d
> clarify the intended behavior for this scenario.

I guess sinle line comment wouldn't hurt.

>
>> +	}
>> +
>> +free:
>
> Does anything use this free: label? The only exit path before it is the e=
arly
> return for IS_ERR(log), which correctly returns directly since log is an =
error
> pointer and doesn't need cleanup. There doesn't seem to be any 'goto free=
;'
> statement in the function.
>
> With -Wunused-label enabled by default in the kernel build (part of -Wall=
),
> this will generate a compiler warning. When building with -Werror (common=
 in
> CI configurations and allmodconfig builds), this would break the build.

good point. pls fix.
