Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2993BB9E3
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531028; cv=none; b=qNnSnsl01V7ua0SLhVWad11dklPMcWtKuUF9zY8rz/XtjsNxTe/Jpay5lFpN3Xtv2LgpnBGBdi/I5+owbcZocaskSUqz1kizdRXUxc7K6DlLbKOI1iStT2xwpesoEUba5qA/5dUm7YlJJvYG1toP0T6ZaHzbchEOTMEhni7ayXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531028; c=relaxed/simple;
	bh=VYDZY2uGKu33vKOyYd6NW2GKWHjdqDv69Ge3kjWDmHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlbCuK7iZBRmfweLoxZY944MshpOlD5dwieK4FNLnzeAfTo213ixJcRDfOObnCO7vk9OudDNn1njP0MN5N8U34Y9Ptfn1Xt5HUjpohQ2Rcht82Hl7Mtmbr6qy8rGmmzoJsr+4XuXtRvN9NcbuzP21TH0q8fbYMYOnqv5DJAZKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwIUDr3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwIUDr3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEEA1F0089B
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531026;
	bh=VYDZY2uGKu33vKOyYd6NW2GKWHjdqDv69Ge3kjWDmHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JwIUDr3s/MfSM7kcKnUID52hZC5kSpTTuEkc+3ww3rh3REqeBLTEOlZBf7UExohXk
	 +ijBF1puacoxRVPWtk0LaU/94rCUSoT5K3cvAilB+Zz0MHDfI/Yo28jkhr2a6cRlDp
	 V42CMcttMu55r75vyi06asWkSVicuIkNE5b+hm6t2i+9L+HUK3/9o28y1FwlHhl+dg
	 u2FOqySJdm4iM+LdE+eyTYYNTnfmMi2tYlsNDVfxeYuj+uBbxR7Q+kNVfkGmOGYRw3
	 +plZLYhbBRrMmbUfgBO2bGQohQRCbUuHjMNyoS/p8rlHGES0lkj/bs9zM8LUcLizOr
	 7/kwdUfQ5x4MA==
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9144e8021d3so88150906d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 00:30:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycuO3p+moSYofxLWY+syiGD0xSWJrlZHuS3ZxrdeYWIK4OW2N6bCc90KJzT5047xVDxJJGu9h3Zyx4OERDGwk=@vger.kernel.org
X-Gm-Message-State: AFuF++mvGKbXb3LWlbZQizyQ6ccoW8O0mnh4z+lEFp9HRR74ezJdNimj
	MPhXRyWBSY3LdCjzbcAhvCWXRc6qVbYTzRSBoEZf796PyuywL7NtqLFbsTfVz6zN0cDl9zEH9tJ
	1UZMB6YvhyOkm7zmdoTKtox70r3rUTN0=
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id
 af79cd13be357-93ec12c9f3cmr30877285a.81.1791531025574; Fri, 09 Oct 2026
 00:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009062637.176005-1-hui.zhu@linux.dev>
In-Reply-To: <20261009062637.176005-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Fri, 9 Oct 2026 15:30:14 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xYGDXMKjbcnkvZAVf3GEd_bnjdJY=84dfyak=rmQVA1Q@mail.gmail.com>
X-Gm-Features: AclHuK-MFYBp2Fx57JVqeSVV6ggA-SIdiDol7zrPg6odH2nr65hN0ZFPuJg2TWo
Message-ID: <CAGsJ_4xYGDXMKjbcnkvZAVf3GEd_bnjdJY=84dfyak=rmQVA1Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4] selftests/bpf: Add bpf_proactive_reclaim test
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, JP Kobryn <inwardvessel@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 2:27=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> bpf_proactive_reclaim() performs one bounded reclaim pass per call and,
> unlike a write to memory.reclaim, does not retry until the goal is
> reached.
>
> Charge 32 MiB of page cache to a cgroup, ask for all of it in one call,
> and check that the result is positive but well below the request: one
> pass is capped at MEMCG_CHARGE_BATCH pages, far short of 32 MiB on both
> 4K and 64K page kernels.
>
> The test deliberately covers only the kfunc itself. A full example of
> the intended asynchronous use, where a BPF program watches one cgroup's
> workingset refaults and reclaims another one from bpf_wq callbacks, is
> maintained out of tree at [1], released under GPLv2.
>
> Add CONFIG_MEMCG to the config fragment, without which mm/bpf_memcontrol.=
c
> is not built at all.
>
> [1] https://github.com/teawater/memcg-async-reclaim
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Thanks very much!

Reviewed-by: Barry Song <baohua@kernel.org>
