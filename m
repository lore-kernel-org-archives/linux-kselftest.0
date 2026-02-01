Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E073D3B3
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769963660; cv=pass; b=qDN//vs6qA9aGbDJ9llRAwzfMIjr+5bOmG7zvUhV2WTQyL0aJI9gyisYTaTDAU74Be5y2b+WHOGyNyfJntC7O9RIR1JdhV4dQ1QtVMzVJ+NaSXh0SmFxh7yOYp5SCfWZoHeEMKzkVmbL9rfet4S3FeqdVu1fekzxL95qPNAgWWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769963660; c=relaxed/simple;
	bh=9vARzbqm57tHwuhXaOkV/GDbi+y1/yz3tQ/mR3mTHg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jw1KI46vDL1Tnw/oQ3Pdj8uEJFeOhBQNYEan1QvvsVedix60YXEKLIYnZ0epJBtzu0kvLWdhSnXR0/uPDTWZHOQI5f1gJel+UJ3jGhIvYLnveaqJbKwZQvcrW9NTTeDuqfov4gNmAdDTeysHxxInB8Ut8eJLsXucwlKf35qqHfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH26GhD1; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH26GhD1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so38111225e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 08:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769963657; cv=none;
        d=google.com; s=arc-20240605;
        b=WTareNHx0jJYpo07Anz6dcim8JjMImZUG6rg5RjzszkmSleH4nVaVWFDBpIbERqnZI
         Ep9b5sCxqcOWYTv54P5dftixb41moGF+jLjx73yJICQLjxNqX7ic46nEJ+7MdDSEKGzP
         L3hrt2xyf2Wa/XLY/LU5DTcCxCtrMrddYh5QX5HNAg0Fk+A2l1ZMykfXnSKgvK5wh8N+
         T2Q7lQzz1NMjMKV88TkvcxO8sf2pMCPWOPJNnGMEAaWLX1pNWZtziFMPwLrwjUV7Cd7o
         CT+Gusv5+NMs9zrKU1ubMCG7hEdZ3M0DrJC7xabDTgCBb59W3Vk8FjIVmXAS6HHx3Xaa
         Mizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0Iy9aGR9ZHnPoAbdsA1GkEXv4tNmEq2SPJm+D/xhwc=;
        fh=s9iiIKnPE7bj68S1Et2PEZEOLu+3SPV4fWPSwNJxX1w=;
        b=WYQ962II3YpU1lIYYCLB7m8O1jC9lhcwv4ETdZfOGBU+tvirSOR8FHH6twTcPi6M/+
         ukBmaJA3uGeuyuIwW3ls73206tTMeSsiNxs4IeChzQcn9/QwK3KWDy1Ol2zB+Ocb5232
         4Z6Kpjr3aaYvzNHeIBBsTXlphq2VsWDcbdAE49v/tYhN25eikVjwFGFpCD3LALynsE54
         tdl5wMAylPQWhg3JxcxmOR1IoG+IrEAse1auKQh8ne/WMQyOcgC8zdeI9iS3dD3V1+Bl
         amKca9QbECz8zS4aSqoFmRvL5bdqfOAHIkUmg8LPIDdOm3MoYTccyJsbACSU8rrgKRYK
         8W5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769963657; x=1770568457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Iy9aGR9ZHnPoAbdsA1GkEXv4tNmEq2SPJm+D/xhwc=;
        b=SH26GhD17Mc7LRD0W+pRH9GdbyywkcdDLfjEN25lZoyNq9U6dvEo4bjQ8OmURHNqf9
         kY/ECSITSwhbJpZ0sXoqhTRqW0bZnjAn8ISaxq8ZUK4s1SxJl8yhMXN3iq6Dw2xR9wWc
         KXwSaGHHQ2Ns4f7Lfkot2UUj9sO5PgOatIZxwekgfN/EiirYA8q6QobfPReQ8j0HJqKJ
         TOGK2bSJyNy3zKgrW76lnp1h4BvG728gyAHHtZyBppuSDX0eNMwd8L53g8BNgr1D1L34
         65rVzTJmR3WiAsBI6MNcnHKEMMirVe309IihVm5VD49wtNmRTZxSXpQhuWbGt3OvgqyU
         jJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769963657; x=1770568457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0Iy9aGR9ZHnPoAbdsA1GkEXv4tNmEq2SPJm+D/xhwc=;
        b=Ck9FemYptYAYbImjtqAxvSarFxOKrsC9pXJIzOi1UHxdVm44PU2YfzxMbC9R1iidPY
         Es5TX2qKBV7D76lPnZ128xD0MrbItScG2wYFcP51esivNDeDu6Bj6BbuL+Ti8pu4df7y
         MG1OfhBg1+5QR6dm0ghK9HBPKpLn3ydyUHRNWLwUvlz7HWHHBPpOzsOuv2cqtQx2O3kv
         rVbWTtftByipykeP/VEdrr9psm2GV9qaUO+mlti+h644B5MhaaVHXdceWaA6JpfL4mof
         w4du5LFTqp/hk0Dm/Gu+Do9IEGg9cfwSHm4XVTjpblMMMOOgtppJoCfy7xDMYRFIZFAh
         khSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDJySSePdMgohcSxgt8d8AfuX0v3goxJ33388AE3sYcuMg/3AwhoysJkk3pjnKCQF9rqR42JngW9O0wSAYxAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzThkXUdPuqTkpzPHTVWj199P+BDo8SGPQN1zM+8E9zKBMrW4Vn
	vcahbShn+mh1TdmzgdMCjeS3Ogu6EWIqszU85jEoRnAn1QjCA3NwbMeJsOQB7TQtWUpL/yumTTs
	xRJmiKVsTfJknZvHtvgO/XVe4cnvCEvY=
X-Gm-Gg: AZuq6aIyZ21U5KtklgoEbecy7sxnh9uRMe1gXE3dQn3XhAETMkEu0/mjZ2zZWcktJTN
	BHrKy17sbDMISjkg0tulVTI6NBfZqNLlK23OR8PvDi6EHpRw7s/GpMnfXGIXW4yfsweMez4Jc3T
	/rLpTYig6u0W8Yfjd3K3sZj+e+BQMwg/Tank3b/dh/vBl4WT1v1UvCg/hNLK0pRsSsOLBQXwu8J
	n22oAOwt8Vy8m9WaPR5c3XJ1Ynb0e8KDu925y9iKQVdo0R+3tw7sKgiPZfojMsdgBCSgcRD/6gC
	kmJasJD6uPzF/LZwDOQvMFQ6sua60h6RchR3tTi2nWEl8hyqYJyLMMeF1z4kEK3cOTXm0ME9wGt
	LsbejE0ETBMc0/VALBOk5N8pX
X-Received: by 2002:a05:600c:4e12:b0:477:c478:46d7 with SMTP id
 5b1f17b1804b1-482db481c85mr120406455e9.22.1769963656749; Sun, 01 Feb 2026
 08:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201031607.32940-1-pilgrimtao@gmail.com> <20260201031607.32940-4-pilgrimtao@gmail.com>
In-Reply-To: <20260201031607.32940-4-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 1 Feb 2026 08:34:05 -0800
X-Gm-Features: AZwV_Qhcz2_dwtnHN0abQtq47NxLW3mB88GNnOnp3aBl9Ob11U6ru31evgMuNbs
Message-ID: <CAADnVQLFBJ5BKv_6UBk7Wrv=-5QxZfG=856uj+rUKRDcxGWbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
To: chengkaitao <pilgrimtao@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 7:16=E2=80=AFPM chengkaitao <pilgrimtao@gmail.com> =
wrote:
>
> From: Chengkaitao <chengkaitao@kylinos.cn>
>
> 1. Allow using bpf_kptr_xchg under lock-held context.
> 2. The rb_node contains a __kptr pointer, eliminating the need to
>    perform the remove-read-readd operation sequence.

typo

> This patch implements the following workflow:
> 1. Construct a rbtree with 16 elements.
> 2. Traverse the rbtree, locate the kptr pointer in the target node,
>    and read the content pointed to by the pointer.
> 3. Remove all nodes from the rbtree.
>
> Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>

Please use your full name. Like Feng did :

> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>

..

> +#define private(name) (SEC(".data." #name) __hidden __aligned(8))
> +
> +private(A) struct bpf_rb_root root __contains(tree_node, node);
> +private(A) struct bpf_spin_lock lock;

It doesn't even build :(

progs/rbtree_search_kptr.c:23:1: error: expected parameter declarator
23 | private(A) struct bpf_rb_root root __contains(tree_node, node);
| ^

pw-bot: cr
