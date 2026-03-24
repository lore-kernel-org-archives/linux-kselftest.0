Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05281E868
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310767; cv=none; b=NvnxCcGyuDbimhRkB6WEQ3J6d1N4agoqe/KdRKRtASNQYf8delbGRWGQUDIteFfq5EE9Y54z8q1M1JvhVzSXfNWZ2PhMEOWjaACMAlP9FyazLuqxgiel0m8HkFmdcQhb9e4SyUyQ+PzoJDaEl1jr/xjejIAzquCClw2FcgPc9hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310767; c=relaxed/simple;
	bh=MaAPKugqDqodvD5nfGMcExHZcfYC5GJ2oq01drG0C6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx5pPG7t7skMgYqoM4G4ieA4yNgL9Tkc/k5Z6Sakvbc4WUbNik+klrgxTq8pqyhbQ4S87P92IY3B1bBI6VQU9gR2TtZNZ248LG7owGFqyYCYq13FzNjXV9Aarbv/MabM4qXmJO+qQ8Ao/v9PEt/ocXBtcIIp2oWs7Vd1qO/YVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2HD3rX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2HD3rX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAC6C2BC9E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774310767;
	bh=MaAPKugqDqodvD5nfGMcExHZcfYC5GJ2oq01drG0C6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X2HD3rX7Stftvw/rF5B2bhz52615w6sKe4xNmr4e0mrSMG//80RBokOF2CnGLFr9M
	 3NKhzoN2K3BuYETUwuuZwq16hdKIMdYycLtD3T0MKBXrr7X4s61TPIXcuFju9wW+uF
	 /rWhci3P2IvNhRPRLmY+ab++VzylLY7SRThRFLus2+mL6WXxd3YIc2y273DY4je35g
	 BQfMu/cUQL/HuLTZtvjyakLaBnAVutOH0SEUdP5AVgnot8V27PTNLC1uBaEsn9I41D
	 r5r+XNIbAteEgmpaF/5CEnNv2e7ePUk/E9nJM02LtO1vV0gFb7JDANDsPnAXUSCScJ
	 Bn7DWSnNnZYrA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so106217166b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:06:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN4Oeq0GjQZnXbmEoaPX9DH+7PM4bCgjSBsbv2upbOsTFn8fUkVcnGngpNb3aqElznDLQQLec4HD/ypvPWRgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnd6bBlq/yz8GwrnzdRq0spOQwhyTQAbYTsMeDKtWAHbvzLi9D
	+Z7uQ5BZpMfzNFPKmmimDxWKNIyXTcjy0WcSfAnBXGwggrCaZPXIzY6hOttjpOhogGuaBvyiIXW
	tcovnCbHVRCFQ7rvnTycO6As8Mgxk1yI=
X-Received: by 2002:a17:907:e10c:b0:b97:9130:659e with SMTP id
 a640c23a62f3a-b982f24517dmr643307266b.3.1774310766076; Mon, 23 Mar 2026
 17:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322061038.156146-6-liwang@redhat.com>
In-Reply-To: <20260322061038.156146-6-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 23 Mar 2026 17:05:54 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNCTrKBwDZBiequ6qY9R649H983ACqhbXx1BM=7++G_OQ@mail.gmail.com>
X-Gm-Features: AaiRm52ZVutXfSJTDOeT7WDCsAt6y8LXJOUTwVDAufe4Y2AugS55tTO1NYysUPM
Message-ID: <CAO9r8zNCTrKBwDZBiequ6qY9R649H983ACqhbXx1BM=7++G_OQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] selftests/cgroup: replace hardcoded page size
 values in test_zswap
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, yosryahmed@google.com, nphamcs@gmail.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com, 
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, longman@redhat.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 11:11=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_zswap uses hardcoded values of 4095 and 4096 throughout as page
> stride and page size, which are only correct on systems with a 4K page
> size. On architectures with larger pages (e.g., 64K on arm64 or ppc64),
> these constants cause memory to be touched at sub-page granularity,
> leading to inefficient access patterns and incorrect page count
> calculations, which can cause test failures.
>
> Replace all hardcoded 4095 and 4096 values with a global pagesize
> variable initialized from sysconf(_SC_PAGESIZE) at startup, and remove
> the redundant local sysconf() calls scattered across individual
> functions. No functional change on 4K page size systems.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
