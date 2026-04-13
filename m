Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8111A3164
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776040190; cv=pass; b=YN49S3DURRUzGbQUBORi2rVP62q+iS3xT35iD/w9T0YhlSTvWZ2Po0e2VqjPEHP4DfqXMFxOoT+fb6diYXLsnUc4YZQJ1Xik/Fsn8BShsad5iZJ0C21yK+dBtwmkMTI9Uhrc2sd7JfG142kigB0MmfeFcWSRz6wJIRmJ4+04KlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776040190; c=relaxed/simple;
	bh=prg3U8HK731gOVXqc4EbhlCEjxMTyQb7yWGPWCz2KOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3kiSavf50IeEDJ+YBCJHYuWttd3iKIa9rsZfmDr47EfRdcmspKw+0tp5oNJk8VC5PGWFBNy6qe7Ee5+7QsjF5MIJx2065gNm4/299UDFmw68pyIpkQI/bj5+qZhrO66h5SZcZPKhq7UwqfAxAdklBwFn6dfLXvi1O4Mi75uKdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCzh424r; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCzh424r"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7605ec91so544695f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 17:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776040188; cv=none;
        d=google.com; s=arc-20240605;
        b=CaynryJ7wm00B6qsXW5mplu9FiAkkXAEU/2S4ztbXL5iu1CmhyvYzqbbPQA5Yeg+1V
         VBXwShVEgJvs67m29g9zwlcgT0xZ1oovWMx38KfLPfzYddq7/yIgD155j3wpiK6/NaHF
         sq4CFAR2foqfijS7KpKnsm0rKpicPShbXEafAfS+U+S7r1PqlnJ6ds5OYaBUKqO1yNLX
         /xgV9cguG/9+AmPgS06ECCRpH8BOFJTz6nmO0/XHYIGMM1r7o9euPFBTWx15cNK6POxq
         KVgfFjCPCrnqIuNrVXUgMmVMBaz2cYXuk/bayjTihm2+xc5tMTRDUg7b89OOhH5G8PIz
         j+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+QXCRNJsvBJXHEfK6416uGa9fOl7qqDApTOq7sS6hE=;
        fh=JwfnqxbWX/KeACLZr+hGZuEWfu+c3ryv+u3Jthh9DkY=;
        b=cRI7JaodHOo5KYgO5HLNby9rP6cNm9zVtnHJhlBna3/oFQBeDuHAAXJNGST3zG0Vjb
         XstPOeo2DX+y8COuOlQo9hN9HSVwwvd33+f8L86r2UbJJQylRgXHyAzqtjqy+RqWyLbv
         kxwAzQohHYw8ASMriubtBt/0uAj4nz3SW0RUqTv+3XPv6PAqG80EJ7mc675IAKTHV2lu
         K4j/LXxo0om3GSNgE49lgXtlbVE2tZZSe79eNcIlldX/QFurkMmLkXHFbPrigCU7sOGz
         Fv8XMbLG6yGP5u1I/nk+X+39/iocijtIIRRgk4jyYt1mYa/kMm6C1ztqh8rs1YEofry6
         r8hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776040188; x=1776644988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+QXCRNJsvBJXHEfK6416uGa9fOl7qqDApTOq7sS6hE=;
        b=WCzh424rX6dPKb0bSVGcm5pW+jzuAnvH6EU9fbQNxzNEXp5+T01LkyHK8YbNCN3v84
         BnOvsEvvmTZvOv83/WZB90yL24x78H1OnJtvvtZVpHeYkMBms7H+c6P8LhOr6r9iG/0g
         Xlp9FALPCLbDLun9h0C1CD3x7YCTyB6da4tuKKfy3mWbbf8qAnoFsdjHxCCClmooM9sZ
         bIeXGsPKLmlFfPducp0TxJEAOJNorKujne6nfwr8P2jvHrbcT1Kgqar3wLE22NXC+iZ9
         DXfZqqVGufpvPw46i6DvAJdK9bzlYaekIT6sCsfkju8Wn+JdAVY0ON7cSophOZjq98Tc
         0SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776040188; x=1776644988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+QXCRNJsvBJXHEfK6416uGa9fOl7qqDApTOq7sS6hE=;
        b=byuNIRVHo9gEy0d6TW/ucTLD4Ks8O9Jtj2/fbt33xEK8uwEgE6dRn9DnRR2Vub4C46
         wfa0SWa2u9BaNPYG376mnoMVDvNHQdkLMxasspg5WiOUrBG+4aGhmL92XfU8p9kHPV0D
         JHRglAJbH5hcI5e4ILhvgAGMaVEMvrwsok++wn2rv9ENsc0ND560/Dov+0tL/XNRsv4r
         9HxxpkIYzfsNzPxqkgFZPALtFzu6ZnSZM8Z59sPwRrweRS4uLnND4caLkbDitHUjHhr4
         7zyZ9EccUCx8Q/UR9Gdu5I3ugFOmYgAg4zS6vD41lo9CJwoh5t/IKsB5Pmx5QmGu9Ift
         /wXA==
X-Forwarded-Encrypted: i=1; AFNElJ+8ITodPpc2LGHHAHJ8fMdQRl+lB9KZwXEzxA7MEzdaEQlx/G2GgkfsQDvf/KLQTeU49SfvlBCGEklZp7FTThs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6sFPHKoZVdnPLzYuqhgvZefp2qqBtL8m1pP2ymDh1SCMptB5
	OGj5gN3FHdvFbVebmmBMll/RRIWQ6PB8iBJzrlGFqQBpIjPf2koNaXoTgV9290iAf4Bkjt80CUx
	FW91aThTYiBZQgyeuzQSPyaOuzkcEH/k=
X-Gm-Gg: AeBDieu0MvCTvn/+/ryCc3yqu10LhUBP+6aTx/aQfQeCyITnMKPbQiAa9+CGefOc6rs
	pqpDNy6tWuCzusIu7hskRP3nxnq2pATrZvUuSf0VVqTjwPf/I0SuL9IgMEpuarUWKZBYWuriJDF
	CJh9EJbagliqCmQY+1QLbASCcHPHBRJjSs/gXw3M1US9STkrGJn3SvvJW8Os0nv+k/rSEtPm0AI
	kQVvQ6wJzj1rBQMWFp0zQsHmHCCQVNpuX0EX++pcAyjZ9j+rSbREx0CgfbWXtbvnH0yadmnUnxE
	rBXf/3Jx88qmCAmPeYQuvB3sxm8jtgCse30awQ==
X-Received: by 2002:a05:6000:184d:b0:43d:7b23:bc99 with SMTP id
 ffacd0b85a97d-43d7b23bdd2mr577667f8f.15.1776040187608; Sun, 12 Apr 2026
 17:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402063714.55124-1-liwang@redhat.com> <20260402063714.55124-7-liwang@redhat.com>
In-Reply-To: <20260402063714.55124-7-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 12 Apr 2026 17:29:35 -0700
X-Gm-Features: AQROBzDA_W2wnhZr93RNMhtdQJumotHsjmSnSZPteOoUEt7sHLGd9BTXQt8gj-w
Message-ID: <CAKEwX=M150Hw0Ncs69SCWRr7J+vK5F0biotkz=MSFvFG3rgjow@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink
 on large pagesize system
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, yosry@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	mhocko@suse.com, shuah@kernel.org, chengming.zhou@linux.dev, 
	longman@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:38=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_no_invasive_cgroup_shrink sets up two cgroups: wb_group, which is
> expected to trigger zswap writeback, and a control group (renamed to
> zw_group), which should only have pages sitting in zswap without any
> writeback.
>
> There are two problems with the current test:
>
> 1) The data patterns are reversed. wb_group uses allocate_bytes(), which
>    writes only a single byte per page =E2=80=94 trivially compressible,
>    especially by zstd =E2=80=94 so compressed pages fit within zswap.max =
and
>    writeback is never triggered. Meanwhile, the control group uses
>    getrandom() to produce hard-to-compress data, but it is the group
>    that does *not* need writeback.
>
> 2) The test uses fixed sizes (10K zswap.max, 10MB allocation) that are
>    too small on systems with large PAGE_SIZE (e.g. 64K), failing to
>    build enough memory pressure to trigger writeback reliably.
>
> Fix both issues by:
>   - Swapping the data patterns: fill wb_group pages with partially
>     random data (getrandom for page_size/4 bytes) to resist compression
>     and trigger writeback, and fill zw_group pages with simple repeated
>     data to stay compressed in zswap.
>   - Making all size parameters PAGE_SIZE-aware: set allocation size to
>     PAGE_SIZE * 1024, memory.zswap.max to PAGE_SIZE, and memory.max to
>     allocation_size / 2 for both cgroups.
>   - Allocating memory inline instead of via cg_run() so the pages
>     remain resident throughout the test.
>
> =3D=3D=3D Error Log =3D=3D=3D
>  # getconf PAGESIZE
>  65536
>
>  # ./test_zswap
>  TAP version 13
>  ...
>  ok 5 test_zswap_writeback_disabled
>  ok 6 # SKIP test_no_kmem_bypass
>  not ok 7 test_no_invasive_cgroup_shrink

I assume the test passed after fix? ;)

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
> ---
>
> Notes:
>     v5:
>         - Swap data patterns: use getrandom() for wb_group and simple
>           memset for zw_group to fix the reversed allocation logic.
>         - Rename control_group to zw_group for clarity.
>         - Allocate memory inline instead of via cg_run() so pages remain
>           resident throughout the test.
>
>  tools/testing/selftests/cgroup/test_zswap.c | 70 ++++++++++++++-------
>  1 file changed, 49 insertions(+), 21 deletions(-)

LGTM. Thanks for fixing the tests :)

Acked-by: Nhat Pham <nphamcs@gmail.com>
