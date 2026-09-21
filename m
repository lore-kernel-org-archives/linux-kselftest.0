Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6538E113
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973784; cv=none; b=HZr3/RJzk84rN7vn4aQCk0U9leeMpyfRIAgpZC9Lw8qmYIKovfvJ7nmWHw/SvFSpFiBcuxgEJ/dnx9+HDyKEn0suqbAguYiXC8AfhSIHRODE27OSOSrhEH1291NwJpuvDQAAa8nTr9BZkJEcdjLITtyRRy+WOFipg4qgxdhwziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973784; c=relaxed/simple;
	bh=EkucCOPz8GZoCCEzERPCc1P/c5lfa7EDa7Hlgmx02AA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rEGU6DkS/l37YTMDyaWo4RiPB4dIY9JYZMkANp4yFWoSXoF2NT71N6EX0sZRpA89lCVnxx1QdUpHJieN7h/B8e8ITQo+iqBFglxg4GBDNlXkKGPFUzXo730HOdrjiHHAirKkvU1eFc466Qxk8BmeITRu0azBMQ4aJ91RMNG9oYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH2XapNI; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH2XapNI"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49fceb35b5cso7295525e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973781; x=1790578581; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EkucCOPz8GZoCCEzERPCc1P/c5lfa7EDa7Hlgmx02AA=;
        b=lH2XapNIbMgfWFe7sTKpWeHxiCEsZbYaVKjtkxDyANXtYz93i0hmg12JbNd1qKYmB/
         o5HUPAboqdnzpOKr+u/173tdXHWqZuP7mgI7x+uj04z5f5YzSMM/zY+qZPufZ0JhuN4e
         8yR5kHNFystMvZeG/gctS/V4zy9aiOi9injSE7sxhp9GWs9+Ww7Za+1XyrDIiOlPfxuj
         vj52q6JrGmQ4b6FqeJj94rg/FCb0vP+++2ca9ismrSMC+4ti65fOIC3EA+PcbnCjyUO+
         dNhY/s87s2h65ZD8CX/ogIuhFt0pnemq1Wu6aieAKNcblHMqeamjICj1DFD/tEN4zWBC
         Bo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973781; x=1790578581;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkucCOPz8GZoCCEzERPCc1P/c5lfa7EDa7Hlgmx02AA=;
        b=ds4xQdPiDW57kEnsrjnDAVZn+S/L9zz8GCWaJG2D6MhTHPBLzYTAhiliUV1IFi41uI
         NRJo+KJbaYbi4ik5X16WzPmYIWFuxLggAOPfVgGuLGExzL9hVmIm15GmeyCb9N24y53Z
         gdGCP6fwunUAkZzlcHKGRKfd2luyiOEhGcGecPlZ3vx0W9/c/kDrZahVftsOFGAvA/xo
         b4sweW+gVm3lqjmTm9HjD2RNSQThy9ROoi2EMo0MkyMno6QSne7yI81wOk3lMMI0/ZDz
         rf1jTgbOYvOb5yMSD9TvSItT4rMCGIyC86JBmYWByZXTEIYwX8n7c0RZoH87xya4/63D
         9dmg==
X-Forwarded-Encrypted: i=1; AKwUvBzsFLqrl1Hk9J7M8sf03lU0FF9OsGqlF4aa+42EJtvADizAwoT3KZM84GuhqKs7qJ4l3jYQQugys+k7Xu98KS0=@vger.kernel.org
X-Gm-Message-State: AFuF++nA7XrVf/IvZcTzyoGFa17vMBtV1CdS0LI2flKdVV74ktp9tF/M
	sTvIHaHuGrFtLfrUGYmuHQ9wcaygWK03i48HacGU8a0Q7Ty2YqWglypf44dXWH1n
X-Gm-Gg: AYBFou2tyB/21ghonrUeNXXITwb+zHkgwcc9Ek91COMAZN04bvh/C0+fv9GjafdnOTG
	Hs+oh2R9xVfAiI68swRBQzBYtJ+n+ITHqayzpDv68Wtdqe6RA7fKW3o4KCDKCvJ98zwyppJRWUW
	AVadHU+baH1KIw1O1auYoTRSSlRvn/PvQEkwqDgnnhyGxB878ox67lsWJRWmtoMhYZBFY44Ffyt
	AWPdG4Z71rgQQzVNRzGZUX0ORX9Dz4RMMflJfz1S5Ic7N3/+6Hvj7OqJTTQN3jg/GGZ2X767hP6
	tBzS8aj0spofNy9Af02qBImGmAXtDvPClJoDWGYq1YZJdSeTGDxuwEo8kSc4ugKo0XO/3fjHFDD
	X6uMM/ZAKhT4ibsHgIOyIM4gtvQRyJ0h9C5VgTjLlT65lwWLiEWYdh4xjUcLKVG7JP76wPiu1M/
	n7S+K7MG1Znu6HI6nChEduVHq8TKti1Vl3YdlImS+iyYQS+ycaSnWZPEkgqzLIVdxWORwMEtA+m
	7vteppJyzMfnUZXN1n/CAKnjQwDPNii75LuA9HxPwOcwAQXbWNCKLlvxBVCRmGxAcg/uqG/SI0u
	Wjwo1YBk5vf6Foy6NdQRQzOQ54iQ3MbCie0CGiX1v5CXX+1f
X-Received: by 2002:a05:600c:83cd:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49fc56f7a11mr113732135e9.14.1789973780380;
        Sun, 20 Sep 2026 23:56:20 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068124sm201507435e9.3.2026.09.20.23.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 23:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 08:56:18 +0200
Message-Id: <DLKSQY1PP3WS.2ARYV8F47YY55@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah
 Khan" <shuah@kernel.org>, "David Hildenbrand" <david@kernel.org>, "Barry
 Song" <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>, "JP Kobryn" <jp.kobryn@linux.dev>
Subject: Re: [PATCH v13] mm/bpf: Add bpf_proactive_reclaim kfunc
X-Mailer: aerc 0.21.0
References: <20260921030854.17858-1-hui.zhu@linux.dev>
In-Reply-To: <20260921030854.17858-1-hui.zhu@linux.dev>

On Mon Sep 21, 2026 at 5:08 AM CEST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> BPF programs can observe memory pressure on a cgroup, e.g. refault
> stats via bpf_mem_cgroup_page_state(), but cannot act on it:
> triggering reclaim requires writing to memory.reclaim, which BPF
> cannot do.
>
> Add bpf_proactive_reclaim(), a sleepable kfunc performing one
> proactive reclaim pass on a memcg, like a write to memory.reclaim
> but without retrying until the target is reached, so that when and
> how hard to reclaim is BPF policy rather than hard-coded thresholds.
> The reclaim target of a single call is capped at MEMCG_CHARGE_BATCH,
> as high_work_func() does for memory.high; reclaiming more is left to
> the program, which can call the kfunc once per bpf_wq callback and
> stop at any point. It is limited to BPF_PROG_TYPE_SYSCALL, because
> other sleepable programs may run with filesystem locks held, on
> which the reclaim path could deadlock via filesystem shrinkers.
>
> Convert MIN_SWAPPINESS, MAX_SWAPPINESS and SWAPPINESS_ANON_ONLY from
> macros to an enum so that they are emitted into BTF and usable from
> BPF programs via vmlinux.h.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: JP Kobryn <jp.kobryn@linux.dev>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---

Applied.

> [...]
