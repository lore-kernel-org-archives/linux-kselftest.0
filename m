Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509E4A387D
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014259; cv=none; b=YE9Wx7/MzOVRnSQecWbU8aOP5BKKRz0bqP1G2zMc+dt4KtoS+c70QvSTl7nV4jKcOFPcgoIZ5J+3ElkGWC3732uu74xcFnlOPXK/aUHsmzUJG4aXFHG/N8+Xo2+0wGzb+2ue0MHJy1aimzFmdLqm20/M2hHPVV5xV0XatSfuTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014259; c=relaxed/simple;
	bh=ZlsnNdUfOVho9jmT6Hnl5zvOQLLi6uv8gJyum34DEYE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtAih9CWEBHFNQWdxeuslImssO5xR2S4dkUoLpg/2iwcdxVBAFOie6ozoLkJAz2jYU1z58XgdZDzis5iZEgEUbErbA2FQSCrdM5NiYpdJUSDWw0e/KuPv+Ckw+CcIAXEY+XRQuLIeZr5cBa+rC1Hv7yZ+HDq+ez4F0yVmuDmuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCs/NXI8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCs/NXI8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so37204995e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014256; x=1792619056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cff983+JIMMydZYhp9A54f/c6x1XpQzAnWFKZyZ7iSQ=;
        b=rCs/NXI8euK/ZK7HX1EnkZvgdG9BVnllooU4kf3BE/44kmSh7X9dP7mH0+hJuaH/3X
         SHHP6fXkK62Ro3qBm/p0OdhOm06qxaGj1MFgHrm6bP+BKRvcAioDWI2u0KsnGkFGVMei
         lTcFILxkLxLxkvnKwyjPTV5/TgRbDhhMgVU5dOaEP3J32gdVDZ2jf4QAMWXsdkq4AcsW
         w7wR7DQovTlvLKaw/xsWiaSJUdPsIzalOMnJQHZ6ul8rGevMgKGjTQ6mUdG5fc1w6Tcx
         8W8nWg/2eQpgS6vbh4hApd44mpP1yfw+m+Fa1j7sDsUj+qudZe19B/pf76R1dgMiovB8
         2u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014256; x=1792619056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cff983+JIMMydZYhp9A54f/c6x1XpQzAnWFKZyZ7iSQ=;
        b=br3REqyZ4cZ3wFQbIlbLM91XzAn5cfgcz2FbSQ9XWpkvd9RR0Gfyl1ufQbO3FFC67+
         JxolYLrryy1M2YDvFpEltwZpA3Hk35nPCQuGy4VpgHvtds24NEaHTW4jpw2FTIm5/UsB
         sgDCI2LctMttXRNBXilzDfFFfShxCcu749wGpKKonDa/nWB/N4k+yHF97KM/f3IJPKfx
         tKfuToee++DuCxBum5A0TD3MqgpjoGHNplXKOGtfj9n3UQrLczleJUuP/LlJKDHF0BB+
         L0Re3DySY9A6JDzT98ahVlvzqaL0jb/ijaMDGjF3CdtZQ47UGDlL/sDlgI1c9Nesur4y
         WhzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzafcLR08TjFqhe3Hf8ohsk5qkh95eH/7h9bT3Q1nQSODbQ1E4ZLZnDoF/GyFzaU6npIZPHoNjjI/0qCzKNfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0ig0IXYSRU9SJinlZ1Gaz98fVVLX6j5LHKRa7yVDz9DERHCV2
	fHxjY70Dsr6Vmyq6FSjPfDPgAo/HDl0Iyn6drV4pSGdnMIkrGYVhk8hc
X-Gm-Gg: AYBFou1AGPmcJqwNLSFu8EjpmghvJ4TiVUDwCMk0+BPStNNmUHWOdy1+yrOhiPgNHH2
	6BcjTZhlapOJ6Sax5+WDuc3COdagVSRXeEYGkQWsI2yRIvFCjO39O0VOFkzVgT15PVsnK/t5J/w
	ftR2CPjXZj2ngCUPK1f4AqayfAMz0EpJMk/hgojCqr2fMzz6lUwX5Vq/HF8sKMObduYBh5gzrCF
	p1KDRBvgz9as4w8M1JtYx3bdUYyyOzg9w5CiPWcUaYNFm2TZ3l0eNeXUuuZPpv+agRJzNFKQJAj
	+kQp5afgK4iL2CR7x6jyO6OmkgOcx0yZyS7zdbc0JWC0mt0jIzMRi1FG8omLIzLcoBPuGUMmVBi
	qVG3+WmiAGJaKk5MCYADP/PpEH6F8veyRgbKbMtbpPhY84FEGlC/RekcWVkWi+3bjQ0noYakWTS
	sp6eGcmXH/DXfH5BKZwa3PvnFzacEDlioCc7QmTPdaKEwvETtYOQWo7uLTcg==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr348735225e9.33.1792014255987;
        Wed, 14 Oct 2026 14:44:15 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm18835365e9.14.2026.10.14.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:44:15 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:44:13 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 18/21] selftests/bpf: Add tracing_multi bpf
 prog rollback test
Message-ID: <as_3rZ5ToLjzQidZ@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-19-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-19-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:20PM +0800, Leon Hwang wrote:
> When rollbacking, the prepared trampolines should be reverted.
> 
> In this test, the first bpf prog will be attached with the trampoline, and
> the second bpf prog won't be attached because the bpf prog has been
> attached by a fentry.multi prog, that causes the rollback procedure.

there's rollback in bpf_trampoline_multi_prog_attach and in
bpf_trampoline_multi_prog_prepare, would be great to cover
both with tests

jirka
