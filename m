Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794426245;
	b=3KQ1fCN2IKmXPPxAblaDT22tQFQLpLEJH6DEi3O4nmsl9gLzyGk7aPF0Wh6pyji1F8ne
	 ftez/mNf7ncpqHykPKQjyWYiQ0dVhiqO3oY6YJXxc8FOHgW1U1g0NDyM2BmaF+8XqB5Ea
	 2rJj6IiTlDdTzt4E29HWkQmDWJ/exd348qOJAtGG0K7tNbqgz8c+8QsvEVhANoe6kjJRM
	 34QF7eaTDutx3xKtX7bplr0o6Qz2z+ToY0OGKlvsuKF8jvSArn2A25FXCBpyCH9mezPnx
	 7L9UFWcIo+zmtXlcGV9rfKgCKtCbdpi1F59qXBB2PvTUhwE8CzCLxJWsyLnMkkJtTaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
	b=MMAX6qqebBU4b9wrihZ9JRbTi2Z3fHaAV5E+1E2VWjw6lUCmZ9UJkVRU4CVjLZir3cn+
	 kLi37I1qxrKOXml09DDEUbGlNQFzBIo5TMqwOrIYH+FD9axyKekCkbeX1j8Jp2mzLFUmx
	 zRFe7ERo/sgd4Ke/a0ue+rG310yhBoSWBcW0ODsPITsf8EfITTAoAmwUJfwUPsQcRIQH1
	 43XfLf15iSyV8m9bQLOUpIZ2rv4uD8W+ooFnfITfDLDMr1dlQ+38ax88A6QXdJIO4WA3X
	 55efPVsTTUevt+Gs8sZatK0EQmujilOiIByhxUvbnfHooQBtmrXFlY75AawG5DvefVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Szh2okIx;
	arc=fail smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907B606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 19:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2907B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Szh2okIx
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae47b00cso623285ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426244; cv=none;
        d=google.com; s=arc-20260327;
        b=Irez5r+aY4RsbWFmA0V0qdBf0GqTIkJ3tPKrBrG6kxjATTgKgA7+gtJH7Pn6UEA2Fa
         CLpEGuGPow9KJ5V9sbzJLSHxgRkiK9ekgdxOROCThRWFZGBkEOB1GWh3d5g7aG8LospW
         FCA+j09VDJ4mxUQ6tl+TJKyjiFi+JGL0K1jcRcLXCnd+SNcyOugXQYPi8oOYgmhdKye/
         Ovfc3DFn4bXGv/N2vNH0wVUhb0c9uuk+yWe7cvj6c5RtOBfHFCRdI/zr+94/2m+uNsyN
         AB5mqPM/URLS9l/aCXq+3HOUczFPzkBNOT920tO/YVSkWBfih/0cuutmDBBIxFeiRk8G
         HPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        fh=Bq70tiPEM/6kC1FauUBKr69OU1lbuKp7KEz6ZBiL7Xk=;
        b=hD27k8lcly88vWIsE2/JR+KcMDgjXvWLgEhlLQBEMr0C9laUwEO+6+err0i0cbvh4y
         xJ8vgCEpVzhuvV3hBrbtcNMsgvKx3vPp8i9Krz24r0Ibmv5vP29kKM6/VP8chNEPyqO9
         gnNa1TqKmWVIM4HRfBevk7B40qksQ8tghMKbNfmecbMn/x0jlZlwYSlMpKLDaMPAgpNI
         7Fm0xdLP7Nl0Ig6e2EQhzyiq9fUirz/np3brc+foNBqUCSJYvp9E8q26JZtuR1NhM7fH
         z/ypFbT1cGnsF16uemYfCnJAjuVbOSTkxSPrZxBnkYODpND0rm6ruCMjYK/SGbEbbjnn
         I5ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794426244; x=1795031044; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        b=Szh2okIxPn42DAW4rJdqCEHxXRlzlWdQUlKv14FIT8XWsBz5vjlzjCzgn0FaVZJDaq
         39Vm/RZA8ElBOh5u7Mzw/+Py5wvddWw8SdG8KrjG/yyy8Ut6dOT2nB7Vyod/G7kRfDo3
         NEPXrzu6FpqalSZZElj1FedVp1EH7SsGuZAuWq/Fc+rmSEGHijFtFUjVehCGYQrVNDMH
         KupkNOerYb4ew7Ip/cWcDzIG7fjaaPi3kqNlFlLTFMK4PJIiWmJFryJmJWgX6dVYAq0t
         Beud0aSkg1ydIKiT7aLPx46cS4KidcnGADP8iFP6WwLwMu64NJpW1IQiHuhhjYL0ooA7
         u78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426244; x=1795031044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        b=eyCcAQgGw7UXAtjtkQ0BnN7rmWmrYnU3Na3sP+ktpAN8IbL7+9gVZG5+m/HFT4kcvH
         InDsTXiXXYlfSdCT7LnpQfNZWtrz3z4pttV1zX0RBUbJ1XzTiSRuy/idtCd+4zMUFZt2
         3nlXoYWjuDlEyQJ4kS6yK1j7PL9GTtoA38W8nhqobAZdjM8nFlUIbXot7Jm7vTKPP7O8
         DjoJXJlUBL+W84LsPIlRisRH+SCeB0HyF1Mvg+bkqKyNP6R2dhH4gCTWHlhTZKYFlGiQ
         mSBP6ebvv47QaRe7OTciyM4ddBpMnIkJ+FPWK32t4ir/Fdt3Fc4pZineykBCRzz8tsNf
         Hnpw==
X-Forwarded-Encrypted: i=1; AL+hErHWUXCSTzOYUJHqEZINiiu2RfLINl99dsYGeX6jFw6cpAGTwiX+MWYE4JgCzAgKdy0oR5PqaQbDrBVhgz9cVRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a23oII0LcVaX9D2yD5TpEl85MUzZS0bJuz/VDJfbp86KblL0I
	5dt0Cni2to1T00Dffq+R5a9m8+iVPzhEZNE3jtOsxAGAMS5UmDhPw5bUScK2M+rq7PSWibIAdH4
	otoXM0KVhpzAwMun6lIMdKnWYqZcJaNN+x3PHJMOINA==
X-Gm-Gg: AYBFou1880T+RjeYlmdQOk1B8LDl5Q/2Fe1sj8LbzOuj7nyKmdESvFj39/fQHt5IrYl
	+tW9jYP4Wmz7j5jftgunQC+rfSi9MzlOQo20Aiju2NigOi0XqQOTRkHRh4V8Wqo3nL3811Yl+Ry
	FE4DtA/DcAMVympe4g1ROQIQBG8KoWqkCGYJZfh1o6vQu5+wYtZ7l6Fo00vVge4sdOPadrqtueW
	4cK2UZmZgkmrDKFk297tmZ85ZuaJobH/+6W1TaNLlsSjEWOUaps+rl+jqAyY0m/qi2mT/OkinI/
	3efmqcsHyg/HPiXqVdQ0jqg/7fVnpvnVCeEFT2KK/gVw/nIdbW7AQPhrXlkhL8++2r/vI/oFOeH
	t+AaZnIqbiE0o9VFhQP0uC8dYLMp9LNI8ijutL6KCUJzUlx2HluZgWhk=
X-Received: by 2002:a17:90b:3d82:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3b182d37a0cmr4916155a91.0.1794426244317; Wed, 11 Nov 2026
 11:44:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-fb8eadbfebab@sentinelone.com>
In-Reply-To: <20261025-b4-bpf-trampoline-preempt-v1-0-fb8eadbfebab@sentinelone.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Wed, 11 Nov 2026 21:44:07 +0200
X-Gm-Features: AclHuK8saDkuU9yD83aEJP9vw27K78S0OdlGm4k94CqvQAsOXBX2ygr_2svCp3E
Message-ID: <CAPnbwjrf-X-p8JSkF2xcxz9weP9XxaLCiRqQLuCd=09pNQxtSQ@mail.gmail.com>
Subject: Re: [EXT.MSG] [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: mikeba@sentinelone.com
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	JP Kobryn <jp.kobryn@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi all,

v2 is out, following the discussion here. Instead of keeping the
programs non-preemptible, it checks recursion per task through the
bpf_ctx chain, and it now also covers raw_tp/tp_btf, sleepable programs,
BPF_PROG_TEST_RUN and syscall tracepoints:

https://lore.kernel.org/bpf/20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com/

Thanks,
Mike
