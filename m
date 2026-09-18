Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A97437852
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753871; cv=none; b=aQ8wv6fH4XJ3fJVvdBoBjBqOyDyLlMr6k9qqJGc/c/6gmzgBZ63U+YjxepdWjezJGYkmydV8IUJrWYY2JS/pmZuoZVBGDps9ZqMuNg8u0CwGB5adBJpJqA5NOS9zhLjltFbDOKWYVmNGjmu99qpPlkf2gHK5Wii2v0CGk0+xsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753871; c=relaxed/simple;
	bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=t3iPkeRV0k9+FY91MJd7HHKPWXoAEa8pfrHffgCB7YP/qigvTao5bRH2JL46W/ARw82FdGxK5RPGxE8Zo1fBs+ZDhnDfOAIhlYguQ15f22C2Cl5kL7o5d3+MTBQCFD7r/XzQSk7PwMmWMlQ9B+qijkgKsTPnsQhKzgbYdYvtbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3KUVXPY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3KUVXPY"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so7658395ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753862; x=1790358662; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
        b=i3KUVXPYLIZpzT+21K9/Hq6wcnP49yNOkGgWwXXwIl0JkdDPRDudjBXqR/jvmZPalG
         oKXnZRsxGwH6kztgjV4qGANk8YALBTta3ZWTJ0/mI/6izHp24mBNlEGTpqmH+AlIGdUh
         U+1UMeE6GAbHC60YPU5nwK/XPl6wctyTHXml7lZLKd71dmrJsqE7rk56RKxKL+VyHUy3
         APDAXBwr8VxxUNXAgiJ8jtzvETC+ud8Bj4pF+l6T8PWPzdq4PXQTsPCA/R//e6lyNOcM
         DnGMRHIYnCQOQGvZlyuQfUh1fMXfHNmfdhIvgLUTJpkeddntSkXZ/qrpv0SIDGLXzsGW
         nNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753862; x=1790358662;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
        b=QowBiRaaC0Xu6xQyvwTs6VjyGTYejZXE6ZME1yZddjvWTD0hD/B5rzmMSOAvX3bTVs
         kSUkWsotJ0z4hvW/Hm3EICWK8ZbYKdMDEpdcgXRHXYsDs8O83Sn3abjUOIRCo7yeOols
         PgIm8xLfB0v4M6bscbBAQH+LgiUKsSXyfbZV8QUJsCyFTDmlT9iCHzhUomNspWxNcH1o
         KXLMJ9POzuxT4jpr69v848GjgSnkIK2tICpVbW0+JEJkoDM8uWsfFIvVIVwGXdKKWkes
         FnwSzdkekjH+pRWdflclOepvvz7nAkRvXjZ7tY/Qs9P8p/WhVcTIRGANOufuitf8Ex/F
         MZDg==
X-Forwarded-Encrypted: i=1; AKwUvBwrgkoB21lQrf/Djd+kLNgqVnhuQMt6qZ6+Wyh11gBGp7gEqJt0IlhpQHS6MRCg94+wk8V/X0/L4eYjeorGK5A=@vger.kernel.org
X-Gm-Message-State: AFuF++kvdiyqRogIkvfqC43nZhfk6gv1dtkLu2q9rIv7HijG4QY+zget
	b2hcMkhlnDziOQeeh2yDcXzYd4swjF5jbbaa7YrKLlHacraPpIhRrkwh
X-Gm-Gg: AYBFou0YqpkpCZ7b+iKB+mTOj3FC+IEws9cmFLYTj2t9xDwCp0j39EUr79fFsi4NXkr
	bYhsbbbn8eDlH1P+l8ZjUlS1yzX+93l5alkEm9F4NoRRIy55faLzgb6XXASO7phUd5+APgbdOwP
	JnghHd1DBLzMCg81MQLEBBnENg8meHBqi5gwroJ/qFFJb28hyjfn2SyU1d3bBjxWzhpD3IqCpJV
	fMaqro8xTaSxNbzMRbJm88JfytIDZyOBJtYLenXqkmlJvJrQbLq5CXumMLi+45yAZA90MoiGD2J
	YD5KOCn1mY9EVRpSRKVJs3VA8pQXJGVp6JwLfO8/Ic7rQ8sM3fCbdsng64BTatI7a4SdvjuQErd
	K3j+QwvWH2oS9Y04W0tU6sN7F82rmW0owod05o//ZkizuMonCLjD/CrOb/Ll9dlkVHlx91jY+pn
	53cncVw5gH7+w+K0AHlWxsLl4kLx+Ege8ae+knOOHbQNZGOuYk5Wme6VwiQHTym68dFKB4qi/Rr
	OfCwCA3B60ran1juzJJZ5zXXuUrM32bokiZD+0uWuLnxdBc3bVVyRZNx1yr8T1m7ftlBMzkpfAp
	Ks7M
X-Received: by 2002:a17:903:2990:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2ddc0538431mr8558415ad.44.1789753862316;
        Fri, 18 Sep 2026 10:51:02 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm421205ad.56.2026.09.18.10.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:51:01 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 17:51:01 +0000
Message-Id: <DLIMSLBJKPTP.30HFFHKGPF2R@gmail.com>
Cc: "Yonghong Song" <yonghong.song@linux.dev>, "Quentin Monnet"
 <qmo@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Jiri Olsa" <jolsa@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/3] bpf: Report BPF_F_PREORDER in cgroup program
 queries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Su" <sh_def@163.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20260918172407.3459188-2-sh_def@163.com>
References: <20260918172407.3459188-1-sh_def@163.com> <20260918172407.3459188-2-sh_def@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Sep 19, 2026 at 02:24 AM Hui Su <sh_def@163.com> wrote:
> As a result, user space tools and query callers cannot distinguish
> pre-ordered programs from standard multi-prog attachments via
> BPF_PROG_QUERY.

[...]

> Fixes: 4b82b181a26c ("bpf: Allow pre-ordering for bpf cgroup progs")

That's not a fix. Nothing is broken.
The patch changes what BPF_PROG_QUERY returns to user space and
existing bpftool will start printing "unknown(42)" for such progs.
That shouldn't go to stable.
Drop the Fixes tag and resend the series for bpf-next.

pw-bot: cr
