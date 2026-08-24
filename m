Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35F23839B9
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601783; cv=pass; b=MJUaQZ/rnT6iBu6dBUQpy87KFP+0tetAuoqr5JhCHnqhR/i5Zp8s1HxJPDbQQBfTg9BAcHXxi27asWoJHCrhAmJ32fqW8D7yQgtRLiU2lyWqzopYUmNriwKgRQAesam1p3I1OD6K7/hUkEHIURg2AA/a1i0XVA89eBydERSjMWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601783; c=relaxed/simple;
	bh=Jj1eMW4hRuQ95Mf8+sMk0J8dXwuhop1yzKow3ZKRqdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYjFpHDWHRCzn8IHvBxD0AjF25Nf8Ec4uh441oQskUpAAQRwvZ+qglhddxU2aTAqg3selep5r3QEmxxvCdbBE6eBprZz2bfVNAMuQU+G+pz2o4g2q32N5dhtN9hFhGRTdW5bPCCDxMogpGrk87MnrjRV9sBsos2tyEQhCnXzIo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7VMH41k; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7VMH41k"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so2829708a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787601781; cv=none;
        d=google.com; s=arc-20260327;
        b=WBhO/dct5DJ323vMfGMQ88P63nQ3e1qRoV5wXTIlYGyq7Lu5X766KvBLRRYVz62xtu
         /BaXWIMo3AamuelyaQRsioJpAfujo9gQxL7KTnH7uzwB3CZpod+z7d5IQ0in44p1E6ql
         Bak1+gYG4zs7hXz4KBSoHIWM6B1+jxoWypy2Mejo32ARqE3R4FF5xXjsj72sdnlJEreG
         XGQTOqkAcGOFz3AewKzhVtphTJYugjfzsdqFEnFQEtX6z74Z6VwwFP3xq+YggGh6GBuZ
         /aIg2bNpAcEDaBqzB5f1LefJpeNIjsV0vjUFEa3n9GVytC6NXVdy25plTYO25RZh7MTM
         nMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3mEWmWLPfbBEGQVJCFnc4zzX5ivCTH8MT18ptDlEOY4=;
        fh=Hlhz9LXR0xBkrlBalKekrLFyd+XKGUmAb8alq8VCz8I=;
        b=V7bomJ8JrVnDMO65/4OmnGreI50ddMyzlF50sL/lujTXhy8JsbH2ydB5QJsMJAsKLs
         b2gup+gQB7cFmJtnEYpPKAk+aC37uGldJ3FCvmT845NN7bXGN3gLp8vPsEIg/WJ67W5O
         cFfqYIYhghnKu8SRPb9QGK6u86h0v04nnhhWQRkOKxW3E6kjscZOWQINH7IeWZtIv5cE
         DikOc7dh1W0GQ1hQIc4M14EtIoQL9VLhfpYnrmz4WQF9NPNNTg2emaqg7m3eJ4SZCj6C
         Aov+0j1R4PdvLGgnzAXjsulXFGy0ATiaQXwkxfsNpj6BELHCw8AtOFab/NeBNJXmcGQF
         fH+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601781; x=1788206581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3mEWmWLPfbBEGQVJCFnc4zzX5ivCTH8MT18ptDlEOY4=;
        b=J7VMH41kmK8mIuh9ZjV9D9Avu9Xa6+mp8Rq9yfrfFzNvpEQTiMn7b40k1QNkQenpuU
         Kl5JjYabDxgWO0yyz2VX9daDVetNFn8sQsJbxPE8e9SOjNm7P/geY7Ao1iLlrnO8UPTg
         2KGPa4wak9VhlrL423otduYahQMbmTOSO37R6amPpv3/tl1HmSdBL89hM6Zt0sTNeh6g
         9rNZk+wL3O5WyiynYwH/L9Z8b6SxCgulO4C2XDQvn3uBQTBp6sjaSRmUcbE0T0zGbg9R
         vyUVoLV0N81FfLrt2eIvf9/4x+AS6GF1Yzw2nGx7sCD2Z9/U2xKTnyhsC2KgYm4ekO77
         nX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601781; x=1788206581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mEWmWLPfbBEGQVJCFnc4zzX5ivCTH8MT18ptDlEOY4=;
        b=bXtTnsFjbQMORuTcO1OjxBROnEuuCdDwgwi0/sDNXG/cjAi62OVVNJcVBls4QyX+Zr
         FoGqD8+d5oLMVUPDAHRNQDIo7OweG2QoNqcZy4IgQykqdspmXHGmf4gzKlAK2Yko5NoF
         0wozxO+MwY6BN8q36KANAOUPltIwn0pURu0Way9KKIqsi0WLQ2dbE+zzYG4F8pADuWui
         UASD2Mj60xA4F+RJf34dbnEEqFC5MpDQ8HUj5jmY25DjbLAC6H7zrKsJDc/fFOYw6eay
         nw+sUWt+OrSrFCr4QMn5KC6mpV6v7ojqiQPgaC6TwHjMkqQWmY5ONj6hgo7J+6TRhjqQ
         McEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPYKdcuvvZJ6rhPPxCZE7Cewf5hrXqPn20PAsexbZa2pnQKh0Rq9GfoRRGmZG1ADuHUI0+9FY83ccV3aqwPis=@vger.kernel.org
X-Gm-Message-State: AFuF++mO8xG+KLlrul5ZKjVFMg+zh4B8yqaRmWQxVC2Rd8E5zq90p5G+
	D8Qf7MSXiDqBWhuXKWfJaS4uZw40c7kncac8PCa1eJqejgEL0pyC5tjUCYHYr+mEZ6DkScA6Fn0
	rDufy2miy6tJosgyZEOXzd5GkCMwKj3c=
X-Gm-Gg: AR+sD10chpp4NQXv5ktUwNokalXHrAYFverD6q1TRII13X89AYEuERFpJzEkJTUNdhU
	g3hXywtYaiz22oKxUjaq8kTA3/vaG+mo5kdkpMha8v6AEaKB+iN9Y3I4dM3MNAHppWCaohsuzUt
	4ZXnds0HqCQyP3mJ6ebMHHXz2wWpyDiMXZZYDfctTtf7mtPeIQYgKVNW39WmlXi+1priGAY7NGl
	Q7gLB3FKmsBSQTQR3yJs10k9+sAP1Zk68nlGguxre1EZbDHG+d78lBED2VUi3zZ2dFOEwdJAdT4
	UGfgeLjgnWucrfhOoGpMebWwHgbDvmHeiRUqVSn/afmUJO/BxVf/zA5p+gSld97SX1nY8jIxkiJ
	MflWbrjnioYdFU27ujD65RYcXaptTP/rkiOkfBadwvg==
X-Received: by 2002:a05:6a21:e96:b0:3cc:b26a:7686 with SMTP id
 adf61e73a8af0-3cd9107fdecmr2555856637.6.1787601779615; Mon, 24 Aug 2026
 13:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809150111.45000-1-leon.hwang@linux.dev> <CAEf4Bzam=0V6n4_vBahhYh2Qn9KfriDKXSz58L4L+teHJRWfPQ@mail.gmail.com>
 <0b30bc97-2ecf-46eb-a863-94e706e18c6b@linux.dev> <CAEf4BzaXaLLqs6XXCG_02c7UcvNWfbGUAJTYosr22oaD4iokuQ@mail.gmail.com>
 <c71d27ab-ec59-4b72-855f-7bf437095cd5@linux.dev>
In-Reply-To: <c71d27ab-ec59-4b72-855f-7bf437095cd5@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 24 Aug 2026 13:02:42 -0700
X-Gm-Features: AcwNN1W7QHx2RbjWvAKjCJKxsiFvI4VgPdw5RI8B_3Oxui6UCoF584p_UxygwRo
Message-ID: <CAEf4BzZpB-qkhu3SAu5MrYYAT2+ZN8WaXqpmnKruOOdjJOLK2A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/13] bpf: Add tracing_multi link support for
 bpf progs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>, 
	Avinash Duduskar <avinash.duduskar@gmail.com>, Anton Protopopov <a.s.protopopov@gmail.com>, 
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>, Rong Tao <rongtao@cestc.cn>, 
	Eyal Birger <eyal.birger@gmail.com>, Pu Lehui <pulehui@huawei.com>, 
	Jingguo Tan <tanjingguo@huawei.com>, Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 10:00=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 22/8/26 01:46, Andrii Nakryiko wrote:
> > On Sun, Aug 16, 2026 at 11:20=E2=80=AFPM Leon Hwang <leon.hwang@linux.d=
ev> wrote:
> >>
> >> On 15/8/26 04:14, Andrii Nakryiko wrote:
> >>> On Sun, Aug 9, 2026 at 8:01=E2=80=AFAM Leon Hwang <leon.hwang@linux.d=
ev> wrote:
> >>>>
> >>>> Similar to the tracing_multi link support for kernel functions [1], =
add
> >>>> support for bpf progs.
> >>>>
> >>>> When attaching to bpf progs, it must attaches to the target by text =
poke
> >>>> way.
> >>>>
> >>>
> >>> Please spend a bit more human effort on justification for the change
> >>> and explaining your use case. In what case you'll be attaching to a
> >>> large amount of BPF programs such that attachment speed-up (if there
> >>> is any) matters.
> >>
> >> Will update the cover letter with justification and my use case.
> >>
> >> Here's my use case:
> >>
> >> I'm planning to enhance the function-graph feature of bpfsnoop [1]. It
> >> will trace all bpf progs, including their subprogs, to draw a full
> >> function call graph including bpf prog call sites.
> >>
> >
> > fair enough, interesting use case, definitely outline that in the next
> > revision (and provide before/after attach time as well for such use
> > case, please)
> >
> Will include my use case.
>
> Implemented the attachment micro-benchmark. Here's the result on an
> x86_64 16c16g VM:
>
> ./bench tracing-multi-attach-progs
> Setting up benchmark 'tracing-multi-attach-progs'...
> tracing-multi-attach-progs: prepared 1000 identical BPF program targets
> tracing-multi-attach-progs: fentry created and attached 1000
> programs/links in 679.324ms
> tracing-multi-attach-progs: fentry.multi created one program and
> attached one 1000-target link in 470.042ms
> tracing-multi-attach-progs: fentry.multi creation/attachment speedup is
> 1.45x
>
> The speedup 1.45x looks good. But attaching to 1000 progs via fentry

I'd say "meh". If 500ms is ok, 700ms is not that much more noticeable.

> costs less than 1 second, which is really faster than attaching to
> around 1000 kernel functions via fentry:
>
> bpfsnoop -k '*:(struct sock *)sk' -m entry -D
>  Tracing 1096 tracees costs 11.597266736s
>
> Thanks,
> Leon
>
