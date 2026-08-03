Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681C2AD16
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785715890; cv=none; b=EDbyk3WVOHj0VKtceRCaxuAMNhPl1FAlk4nOfObRoy2eSIQo0+ZbWH5+692SB6BkMza74waI6JIoo6i05z3WgXrP30MJyRDgnX3RxyVLXfAgQ4OLDkj613fZuyEizK7JNwIp4tN1pFD2MZcU6YFtiK80yFE8zAkDp+KUF6ttcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785715890; c=relaxed/simple;
	bh=xcUY+DKs3+Y9ZAYeOnWRihdxrBbcA1wZogaWMdKPBCc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Mr81bZnDtMfGsZ1LikBv6O+FpBFcLbLrTh2kQhGBRqfeWTYIWApJvpy/fMYXWxUjaL9g+t72KHBQCNSHU+MX3dE3s5AH3YB/2rbi5f0pMKVSAFwROEV5bCuZNe0yJBEAivrlJjiZLoQok5YudH83C+RIB5HkpbIE8EtqKwaHyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6yga2LS; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6yga2LS"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495482c36b8so5490515e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785715887; x=1786320687; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5VBkp/M/Sk63PysxIV8aeQsYqqYmeyIXI2LyKXT+PEs=;
        b=T6yga2LSGOZNG0MN+R5eghd0n39Sl/HAmLATrllGbbg5mMWMsbUx9uwV7Wgmhhk5be
         hvFPZxjouM6Om1olmWAESiS+wUyvGTbmCzwE3kM6Qkl3qaUh244IDfEnJJxDT34HeSvU
         S5d5X+eW27sM2tI+Mu8IMdY6SBV4VFwIxRehupfqACDNcCoN94mHASQUixtIAEijPgDz
         Fh7JbJHzeSp6Ug/IBnkN0XCH2k8nWhVhUMcFjDRM6QbN2mDUwUg9zCKzxnBqQnGcC5mt
         IqmBZghoCjIrA/wKroQSmxsOXmN3hx6ofU9woctQ965Fc/vA5SuEg3I8y7UOfe63oio+
         t4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785715887; x=1786320687;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VBkp/M/Sk63PysxIV8aeQsYqqYmeyIXI2LyKXT+PEs=;
        b=OexK70pAcGBvdeZfLgaGtuHJmVozimoIbRtLXlJMXvhaLPOF8g6Y9nbshhYxdLCmCq
         NyUYAWb6Jx5bMrHClMsamEUytDq/Oy9LA84MeoTFJsShQj7oYNacrA9NO7ynyUowGP2k
         3q6qyuj+2+8qBSbmvFKIicpDVJb5VZjfKvCY3EfNcdk2ukxdDSzQELNgTIEIqHDKj4+N
         X0IpQ1ruKyf5HLjQbGsT3bDeHkGktdIoO8Q+AJMP1n3zm7t2HKwGbFQYSHluAFoCdXAo
         5pFzYYYxUOZNwoGPYScrgdbFGLvV1pX+5bfcWu3v8WT407v8KhjTyznhrMQ/PjMi8FGz
         4JeA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+Cqo/nEfzXyp0SJj9LG4nO9d5SC4ae3vpgDW9ZtWZM9UiIoY9lTVxO98Gm9lfLMM2hoIJy7neJ8QvdQPq1pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHNHC8Ew7do/r4Lw5Bmsb6Q9/ePfcpfaxttPJsCsZXPZOHXOF
	RCtvJyRQMr24asKNw4r+8T9052qsXp0rAfBzWU+wSQTzO8FADcUIrpP8
X-Gm-Gg: AR+sD11sQ5vxYPK6R6DNqigh9iLHrSp5Zx0Yk0Jx7qAaqBSc/bfSiS3fcFJDhvnKRx5
	SiT3gZNKffs5wDCvBley78GxrzVIgHhbDFJTzxRMCQbmB61TcjteLEYfAtWytRNQYoA2jimipG9
	q6rAbdixXGMbdrrY92jPgfHnmikPRMXOaFX/l7IrtHJ4hh5KJSnYgvFn4jBMP2gYZeLDB6C+UB+
	p1JI3pjuNjhuFxkWJqm8wEoKBq2ONSahUmHX5Qe76+RsWt+IZDFHRfN77+YNF9an/iS8YzwVure
	wkymZDdT6xWBF0wmV2nbjxZl7UNxHvKYdu7cctxwvRq4Q5+I97LGe4LexMYlj1KZxwmB5UL1Kwf
	8Ex8nzcD3MOEmMaa9Z7Gr7o/IdeR9yPd1pe3r32mz2tLvtQnKImfBYiU0tjr4sczM1ux2KphRxA
	VZPKzJVOVMpHufnYq1p8McsaVhf69AdcBtuFMViLeGZFpeK0/EHny2EpKJNBZeefzkp+o/8GO0B
	YlmhxwyAjDIfZGk+nt+n8gB6AVB0X04Y9g8Qm05cV0ilEio+E3sAC8ZJkG2+simkcdCQ+okQiYD
	0h/yrtwoerLvh/QW2xUHmOglbb0Ix5n1uIEFow==
X-Received: by 2002:a05:600c:8b17:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-4980c66c926mr166756395e9.3.1785715886664;
        Sun, 02 Aug 2026 17:11:26 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b6093fsm103199905e9.1.2026.08.02.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 17:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 02:11:25 +0200
Message-Id: <DKEVG8ZVJDDQ.2G40FTOIZKU57@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Mykyta Yatsenko" <yatsenko@meta.com>, "Shuah
 Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf: Cancel RHash special fields on value
 recycle
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260726-f01-23-rhash-cancel-bpf-next-v1-0-6e5e1131d885@mails.tsinghua.edu.cn> <20260726-f01-23-rhash-cancel-bpf-next-v1-1-6e5e1131d885@mails.tsinghua.edu.cn>
In-Reply-To: <20260726-f01-23-rhash-cancel-bpf-next-v1-1-6e5e1131d885@mails.tsinghua.edu.cn>

On Sun Jul 26, 2026 at 5:51 PM CEST, Nuoqi Gui wrote:
> Commit 6905f8601298 ("bpf: Allow special fields in resizable hashtab") sa=
ys
> that "kptr semantics under in-place updates are identical to array map."
> However, after copy_map_value() preserves special fields,
> rhtab_map_update_existing() calls bpf_obj_free_fields() and drops retaine=
d
> kptrs. BPF_EXIST can therefore unexpectedly clear a kptr.
>
> Use bpf_obj_cancel_fields() in the update and deferred deletion paths, as
> hash and array maps do. It cancels timer, workqueue, and task-work state
> while the allocator destructor releases kptrs at final reclamation.
>
> Fixes: 6905f8601298 ("bpf: Allow special fields in resizable hashtab")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---

I don't think this is enough. Upon reading the code, I am suspicious about =
the
check_and_init_map_value() in rhtab_map_update_elem() (post this change). I=
t
will likely end up zeroing non-zero kptrs and leaking them, since recycled
elements will retain the value. Dtor path is fine but that only covers the =
case
where freed element is never reused and only freed on map destruction.

It might amount to simply remove that function call from the function. The =
other
user in delete path looks fine since it operates on output buffer.

Please make sure to also add tests for such behavior, having a map of at mo=
st
one element should allow for its reuse, you might have to reinvoke the prog=
ram,
once doing update, then another doing delete, then another doing update to =
be
able to rellocate the same element. I am sure it can be figured out (with A=
I's
help), but please validate it using tests.

pw-bot: cr

>  kernel/bpf/hashtab.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index 9f394e1aa2e8..54ea111daa8b 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -2865,14 +2865,14 @@ static int rhtab_map_alloc_check(union bpf_attr *=
attr)
>  	return htab_map_alloc_check(attr);
>  }
>
> -static void rhtab_check_and_free_fields(struct bpf_rhtab *rhtab,
> -					struct rhtab_elem *elem)
> +static void rhtab_check_and_cancel_fields(struct bpf_rhtab *rhtab,
> +					  struct rhtab_elem *elem)
>  {
>  	if (IS_ERR_OR_NULL(rhtab->map.record))
>  		return;
>
> -	bpf_obj_free_fields(rhtab->map.record,
> -			    rhtab_elem_value(elem, rhtab->map.key_size));
> +	bpf_obj_cancel_fields(&rhtab->map,
> +			      rhtab_elem_value(elem, rhtab->map.key_size));
>  }
>
>  static void rhtab_mem_dtor(void *obj, void *ctx)
> @@ -2964,8 +2964,8 @@ static int rhtab_delete_elem(struct bpf_rhtab *rhta=
b, struct rhtab_elem *elem, v
>  		rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
>  		check_and_init_map_value(&rhtab->map, copy);
>  	}
> -	/* Release internal structs: kptr, bpf_timer, task_work, wq */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	/* Cancel reusable internal structs: bpf_timer, task_work, wq */
> +	rhtab_check_and_cancel_fields(rhtab, elem);
>  	bpf_mem_cache_free_rcu(&rhtab->ma, elem);
>  	return 0;
>  }
> @@ -3027,7 +3027,7 @@ static long rhtab_map_update_existing(struct bpf_ma=
p *map, struct rhtab_elem *el
>  	 * kptrs/etc. still sit in the slot. Cancel them after the copy
>  	 * to match arraymap's update semantics.
>  	 */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	rhtab_check_and_cancel_fields(rhtab, elem);
>  	return 0;
>  }
>

