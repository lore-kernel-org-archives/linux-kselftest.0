Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C58285041
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671402; cv=pass; b=bVNqKeTQVyCkgzaEggrbSwy4tTkeS1fvVjrnBPJ25tdWtvME71Ptq+a7v2FgEU62bhF/Jxe/jCamM2ARYYh+Hrh8x6AuKdaFoj+/JimY7E/CPjS2mjdyJ3s6YdECpzuBB6rYZgYAwG2/p7GLgbPcbfh7v9kkfz7FUm+Z6IcscXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671402; c=relaxed/simple;
	bh=rJRFS+rK9leg5GTdMzhBulrcz4gOf+cJLikV/upD6AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV0gUYr2x1J7XpKJ1oB+IOrPJJR8Qf+ThcJS1w7fU8mj027E0vE1zh5VQ2o5XfA70Vp+IBjxUCgPheQoX6DPBj0jeB0lpt2Wxr/L4+Va5I2NzKuRGNhSKyZJIIC2RsWqgzHID6FXGMWUREaubRWEPHAhwtCTGcPP7pwbtOYomcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWghmkLH; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWghmkLH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c5b40f60so3632282f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 07:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773671399; cv=none;
        d=google.com; s=arc-20240605;
        b=W2WiDJ6SddD4G0yeHrhrAbK47SrFMs3ArkAWmuKsLPJnChqtd8JBF5YrLT5+72HYiC
         38Jdr1pjwuhv8Yh6gx9sxAhO5kxbLT9/0hXc+W51TzVHNlheh5rZZN4tcAQCnIAZJqTw
         ZdzVFpOiyCuHpl+3fMbmIoLHSL7uXLtv/BU6Z76dfqd2zsepzwAev8a83mYozoCVFR+B
         ICvthGbbQYkDkk+5/uVW9i4x9uEF3R4Ko9fC/JY9ByWWGUKWjOnSphYbl5wjJwg0a7FJ
         ii2YYYwkqWjpxquIdvOZ39oAoeygnQQxeIMaYAq5zSMKJYbW4ivKlVORciyutQdV+sue
         xR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8O1jcNEYGgYscyDPYtdi391cu8OxzVlX8P/V5t1fLY=;
        fh=6sD7LpEfjJJr43upOkiH30uyTXg0h01jcvTtJwjb9GU=;
        b=D1j2Qocv6fVC+fTSRKE9ycrEr6r2Ns3rw695mlXn1xG6ai3ZYpWTCIX7/zUiq/bL/F
         Hee8iDeteLVJHQWtF1UD1mqlLBFlsH6xqjWA06/jfRRBv5rv1yg90KceBzKPRN/cPx57
         p6T8roSAa5TAZI1xIUmCuE0Tc18M9gVPenqPOwFu8zY8khkap+YEsjUCy7cGN4nhjIyP
         lKLIa5YN+i8D8RtrHDtuQoWXeEvCL9VIaJ9NNp3N5lOZBLUsqFiIZNpYQqIOB6zo7Ea9
         PdnS9/DCthNDmXzqKwv+Bs7TUnvzBmwR1I2hs7DNOatduM0OrN8rAVML+z4748n9zVGY
         8JLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773671399; x=1774276199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8O1jcNEYGgYscyDPYtdi391cu8OxzVlX8P/V5t1fLY=;
        b=fWghmkLH9MDk/jsLw3gQlzKnzQ/FrP8v3FHykcCGHU8nMKLcDqV1GsL3hZsuF44RUH
         /seiDrM8IzRen6N1c1TfJIKQsqAz99kbrMkfxTPfPswtVMNB77ZfrG28uywbFkGNcQdp
         SIZ8vAaXcA2eIwcZOLCkD25ghgd8ftxmazqiFqWrdUQ5XDsLJkvzhNZLFBD5bw0GNFXZ
         I9nT+7veYlgugvho7eVe86nQcNEnAorkNNq9zF6uQKFJZdvNnBvEqFpWP6bfgdmLn3Pd
         l+FLxD+/WBH1aes90irKKXDoJpqCKOhz3EEBM2M7x1fyhdyRQRG4+DtbTYQZY6CuhqFw
         6TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671399; x=1774276199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8O1jcNEYGgYscyDPYtdi391cu8OxzVlX8P/V5t1fLY=;
        b=AXWLF5g3gZvO6BQ2eKfk9nNyzTLgDOGY5bsXwK2lwWwxeWcuSo6mXxha9oL1mTRuUZ
         ApO1HdN83YmhAs3e2I6mKRrsp+2RTzP3hnDJPGx8fdjRWu8wUVFoJH9S9syhnNzrFgWe
         nk5AFdvIBpUCO8zEkbCr9ixEMSvqP18EHz28yc0MNrRSIC2nhrfSmVD9iGO88hZkr+dO
         XlObVNEv5LRlqdzCjiC25LcZv+FiShn+x6DefyzClLv1zICJg8W4AoB1hw0r7bDUA0mu
         L2JXehikRIeGgoh+6MHo/FMDoyrJqfrj4aBKs0wmFqbdpf108uq2grlbyx+XLBPKRsvN
         XTPw==
X-Forwarded-Encrypted: i=1; AJvYcCUfXFpuUp0sfeFiBEQHcnZ2zRSxwzfPOruK8kDj8dmF9RzU2omXiA74a9TC7NvFOIdWAGdzXjLIfLClVM7OUsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb5mSOPdXjCJHbv2q+cxUb79E5YCGaGBBopyz15eJCHLbu4V/o
	oUUoWuH/A8RUGBBw1Mf1H+tyRHM8lGNZc0rAT7Q6M1AgcaBYhahyKEqIo3Y232cBot7lD5MlDfD
	zOaHW2vRRO0ejuqCTnLr+Dx8KZ8DQa4s=
X-Gm-Gg: ATEYQzy3njSRunmZMhspOCEcP+dc9V/BFDI/wrcw/QDTfu/Ij4cwd1LrsqmNd38KmuF
	7A1vLhze0rJy+tMe/sW0+Hv9AK5zsj1YivJZw0Dif18J4nPhTbusBkaynscPPKQOqsK0r3GUgus
	p9q1fF5DGK/ZRWQMo7n/TDbHhP/xSxhGMRT5KszMT0xbVkhwGe7P+Rfhz3zMibfG+AqLhawsIye
	NskD0F29JholWjlWbPphD5v1GqomfrjlReAUijZw7VtkOxEnFbtYhAx2YTMHZy/GFM5HdPMu2Yz
	rGUgGMTlqNW7+XhZXIzQ8Sa8j4+3fLthCq4QfA0ozupRa+tfYpGOlbQOjXn6ERVXLlg=
X-Received: by 2002:a05:6000:381:b0:439:d8cb:1392 with SMTP id
 ffacd0b85a97d-43a04d91a43mr25216111f8f.26.1773671398558; Mon, 16 Mar 2026
 07:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316112843.78657-1-pilgrimtao@gmail.com> <20260316112843.78657-7-pilgrimtao@gmail.com>
In-Reply-To: <20260316112843.78657-7-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Mar 2026 07:29:46 -0700
X-Gm-Features: AaiRm52jfrG-QXxCpkn-e4a_CxQ3E_JeYlW7Cp4Cm58pDy-9uGQT9qrmcAXzcQM
Message-ID: <CAADnVQKLsC2=RcehL54yHQ-vv0poXydFkRDHW1JZxAEncE=SxQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 6/8] bpf: allow bpf_list_front/back result as
 the prev argument of bpf_list_add_impl
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 4:29=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com> =
wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> KF_ARG_PTR_TO_LIST_NODE normally requires an owning reference
> (PTR_TO_BTF_ID | MEM_ALLOC and ref_obj_id). For bpf_list_add_impl's
> third argument (prev), allow a non-owning reference with ref_obj_id=3D=3D=
0
> so that the result of bpf_list_front() or bpf_list_back() can be passed
> as the insertion point. When prev is such a non-owning ref, skip the
> MEM_ALLOC/ref_obj_id checks and jump to the shared list-node processing.
> Owning refs (e.g. from pop + refcount_acquire) still pass the existing
> checks and reach the same label.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/verifier.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 98ddb370feb5..0a6f2e6a5d28 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13737,6 +13737,14 @@ static int check_kfunc_args(struct bpf_verifier_=
env *env, struct bpf_kfunc_call_
>                                 return ret;
>                         break;
>                 case KF_ARG_PTR_TO_LIST_NODE:
> +                       if (meta->func_id =3D=3D special_kfunc_list[KF_bp=
f_list_add_impl]
> +                           && i =3D=3D 2 && type_is_non_owning_ref(reg->=
type)
> +                           && !reg->ref_obj_id) {
> +                               /* Allow bpf_list_front/back return value=
 as
> +                                * list_add_impl's third arg (R3).
> +                                */
> +                               goto check_ok;
> +                       }

This is too specific and non scalable.
Another kfunc with similar requirements would need a separate 'if'
with func_id =3D=3D new_kfunc and potentially different 'i =3D=3D N'.
Let's introduce a new double underscore suffix for this
or some other way.

pw-bot: cr
