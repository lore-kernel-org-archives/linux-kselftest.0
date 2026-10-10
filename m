Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08D3806D9
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612931; cv=none; b=TkxKc8Bn/3pNT9uBItVcieWvJIldxgDH6QT9HAp4/EFfw4Or0bC4Hwd0C5SCTMTviiEAyh5Tg+rOvMqSV3oseAewBIfqOb2JlcqhT5UsJh3/LYOTEv/ngz1FuptNfj59lQdDAtXab2jsvfRSdvGeuJKWDo2ZoMDotcKWdQEryNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612931; c=relaxed/simple;
	bh=TwIv1NPnf52ZhmM9XXPm7/XDI2xCes9eFdq058g6a0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFr/4qotF8WoZKH069IzL5U35jWEf4VmjcUYh2xRUCTrWc1wZS2ZgoI/r2+hOOS4aBAziD1ayjP4Qu8jyTdjrYMXAu/BVGodRMa7HJShEY5y908TvnrrExJXcfn9ZPBGoe6SAJcCvEtMQWhtCD+o7BuPqnFLkLXS4AidJWwotZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReOM6zCU; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReOM6zCU"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so305512eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 23:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612929; x=1792217729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TwIv1NPnf52ZhmM9XXPm7/XDI2xCes9eFdq058g6a0c=;
        b=ReOM6zCUr1d/uLU0JtgRsmO4/DWvuivI6csPKx0XZl+y0MTlYovYnyNA3+heFaopnf
         /u+ggKhLuKr8qNdLfhN/xeebnnRtXPcFIOfvlgBTU8/fsIgLYB8/KMZB8FDXBn1HTYPw
         SOI6hG35a5aQJr4q1tIlpo9QM7flZ+49+NoWmy1OjCRuAy7JRn2RIWENbHzI0S20nLTn
         RwIL81H+XoteWNXiBdcnpc9GhkDZ0mnpYq4XVo0aUQOs0w7ntZJoVwFFThKA2tzQ8W2k
         BmClaZRPWDnfNEZa/Tf/cH4TzeEGn1lpQBxAkX1UyjwJA0XozOs9EJ7D9RfofETW/fvl
         IV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612929; x=1792217729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwIv1NPnf52ZhmM9XXPm7/XDI2xCes9eFdq058g6a0c=;
        b=kU2iPVsySiJhSKdTEzy9n7w+38FpUSq8kFkInexK6DN6ILAcOOmJHe0Tou/kiE0tn+
         THqrTNwOUzp2YqMf4A1lIWXyg38J/zZshI+6hLCKxiNJQebvxAiM3SwWLYZri5Y4C4gC
         ZD+9pi+bPze4n1M++uawDB6cJ0d2Td6O29593rhl27vuIYiP6PuOh3/OgiwFXQZ85Rok
         whZFi2LQOv2B4tPS1dnqo4HuIoAZXgvdYN659kx+1qIjDz4y8Sn1j9Gxm2tpQcfPUouq
         5cQtb63iX3sV/2ATpv9EkwfdeHrJidGcfV59z6wIcL/JoYq59QjQ37XkVVKFGcM4eZI0
         KqGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMdSoAikyj8DGlwP0L6Rgwnmjfj5E+zX6RpWbo3u6+hZEB+0Uq3Z3edBR+mGQKXH5b5AJtTOOh6FgZ9UD1qxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkygKIUqveoUwEcQ7PWl1hcTQs2DZBzjEwztjCE2ZI7nAKYDjE
	n8HpCubNokN2SYVF0j9OQSidtdm30W+mzjl86zFxD4IyAtDueqerrPYC
X-Gm-Gg: AYBFou0WokBHErDmHQKIlSuYnlp1yuA51H+OR88K4R8TlxeH0TtFMSLzwTAXFd81Mzq
	IQ7SYL++HYaQts3cmgSpv1YqPHoUZ6ZeiQluJhRTLxdrp3X/7JBXIVzbm91RHGDHGOkXCOVEoa/
	Kapp8FkNX9xK8lrVhF3SoBNCmWcMsM8kJFR19V7Wyf35xM8/9Z/Dwpu7ZVttBJGO03E3N4NtA7E
	0pXHvObrdhvDxaQApxyd9ykomke+kaaUgHc8ThvxyOG2Ax0QrKj0BxDZQfge0jV74NcsKSVb2Io
	Xbd0z0wmAHTsgHf6Cl4E93zoyc3rHKCskyIjS7i2anXdWhhnuIjG2sSwXjHgODgFKW7/2qsjKhI
	TBWQzmziCU35NzZ/nCV9lbRVIySTWlN4rgyMEkFXg6gp4kSZFlIiQji5LgxcrMEWgXJp4nEY/ju
	pS1ii0/dNTBr/BiBW4gwUUu8gn+hHNgh1Ppi/DWS9SfS3FdVYODRRH0efpxFc+3w==
X-Received: by 2002:a05:701b:2405:b0:155:734:9cc9 with SMTP id a92af1059eb24-16a131cf188mr4972254c88.16.1791612929280;
        Fri, 09 Oct 2026 23:15:29 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm12663786eec.20.2026.10.09.23.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:15:28 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: bot+bpf-ci@kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Amery Hung <ameryhung@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>
Cc: martin.lau@kernel.org,
	mason@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer
Date: Sat, 10 Oct 2026 14:15:21 +0800
Message-ID: <20261010061521.390089-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c1af496987bd30766e332358e26b3e1256fb0cdc72e2f0412ef0e116b0c5223@mail.kernel.org>
References: <20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com> <7c1af496987bd30766e332358e26b3e1256fb0cdc72e2f0412ef0e116b0c5223@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 9, 2026 at 02:36 AM bot+bpf-ci@kernel.org wrote:
> Should the late dissociation be fixed in bpf_struct_ops_map_free() instead
> of only making the test wait longer, for example with a grace period after
> bpf_struct_ops_map_dissoc_progs() or by dissociating before the call_rcu()?
>
> If the flakiness started with 5db69b0fbdc8, is the Fixes: tag pointing at
> the right commit?

Yes to both. With the window widened, a timer callback of the struct_ops
prog returns into the freed trampoline and the kernel hits an int3 Oops,
on the first run.

v2 [1] frees the map after a grace period that follows clearing the
association, since dissociating before the call_rcu() would take a mutex
where bpf_map_put() may run in softirq. It adds a test that catches the
map being freed under a running .test_1, and keeps the test fix of v1
with Fixes pointing at 5db69b0fbdc8.

[1] https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com

Thanks,
Qiliang
