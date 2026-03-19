Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406743ED117
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773937080; cv=none; b=XqNmB5KfIVfs1vymTWYdpDqGdA1GyXlEYIE+UvttD/qz2ZF5Y3/O6X4aLp3k1KNXDyHdsf+SiBs6QBF2Latnea2zuFd9hGsgxGBrVvPgP32EXz0sSqk8RPcsj1NI40VagFmBAdZnFU5u0BJgds4IkLerOg6Yxm0Bmk6UCOXeLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773937080; c=relaxed/simple;
	bh=XKiAp1DwwODDUNt3mgTzBLo9BnWUOH4i7exkuuLcN+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q9LbIct+Jo5fRsmI7oaL5bqZh2uqAQC1zE/5ckIn9vmwOlUdA0akjrvKXzV9HtRULDqVKh5E00iLYBLm2J9OhRRwKEfk6aMXXEYAl99xLUegGhx8vw9qQtyHqpas8C8nycboPOhaUoW7UxUrS6L7amHdQXtTvkUnwbGO3tukrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=iXyUDGCo; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="iXyUDGCo"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfc40e4158so48316185a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1773937073; x=1774541873; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld55lyS+UNJ7gvafEyeKeCDZS977J+HXiJ8/KK+leDU=;
        b=iXyUDGCoe+kIjRyxhuhBUzWXNGzcvmwnBmqVfwtDu5PVTvLWG0OmCpu2uctwdXKKQE
         h2pJIwPFwDLGvECxjmJbTl/OUa0DKz4wGpbYGHeUgEVFWazQlKpI0SvtyR3EU17ROeVY
         sIYSVhSlUeXxv0zLY+zl+gCweeME13OxbRb0MX9U+vIUPmHdNzPQgIkKzf+BPMBK6f0E
         OY+3W56Hy3/fWVPq/jOAGvD2W+Q4af+KzTrdNzGKVyO/MFkqOOn5vTDI1BPaXM7ioccF
         fc0Zt+QAbOpRjJRxP/a17iAz8Xg1t7KEN4cQL3yAvVxvJed9dhWYoHM1J3M34orL8M19
         kQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937073; x=1774541873;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ld55lyS+UNJ7gvafEyeKeCDZS977J+HXiJ8/KK+leDU=;
        b=c2JEuoVaWdCeVVPq4GQ5l5lPZZML/1byYTAnIJCRNgNd+9CfALD6Ij0Nby42jRonjz
         dvEjZyhuLdSso/KMsHajchxL6MB5Su2E1Q+rE/8oCejsPx1dsU+6OpJFt7EMc7pjoei8
         pAKyaYe5HXVto0+QjZUxU/eOh2aA4YH53awi91mTJZvNwVAcb6uT1LUe6x0RtZTWRX7g
         zw9RtJ4zoCL9cNnKAZCfIxwe+Sw23jVuw5q9dbUsCU+LXaLsH1Uh9bKlbY679PiJj1cr
         mudDBcN4mzadEEc1B/giwTVZzVLToEwFXZWTzFJC4PAEegMLmBvUtkaTzhsA0w/mLm6x
         QZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUzagQie1NFvEMgmRtbikU1uWi6epvThd2vcQpui4+xFbVCr5Ve4FHJUUVj+ASP1EGS3aoFzwyqsZeBSdBrRt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrI0HDy7gtp8+BKbZONFnksuYGq1iDamJbGCbRLylpJClLzbRX
	0mTDuY5cuD+wt9t66SJ6wv7JYRvOgEwif2JC9VjRk1UmO4sMENIrBvgYu7FfK2dtZkU=
X-Gm-Gg: ATEYQzzfd9bWrTK1+66N3toqZKbn9q4BDuKgqRhoIj/SLD4JuQ55hR8X/jq6C4oVQDj
	8e2Ybrpu5wnXQsU9r/jLhmuf0BBFA6AKUg+ob6hMPaXhcQEXz5F2ZWYfWwpua2vskKbqfKbQRkb
	g13xJ02Wf+AtXakENYta8+ABncuqFFkkcEuV1AjGmNeZKVIg1rGWZi+I/6wJAwNDtsDkV1246bo
	nVyOwwAaKIVZpeRUQ/LGxX3IuzlrDrK6zFYu1xFoMvdewA9y8y0EWvVNgRX9VIBpmsnnSquGS9s
	0DZ+8Io1tK/XUZhIHGkB6xlvtGo7c8L8hqYRzsmq3Wmt1aRL+SJ4rqJCu9uvi5oTcXZ15QobFvU
	6E7X5tbEGCWFTRebkWCVNMTU07Hi76i2P2cv2QnlbIXMcjXFu897JvceaHoC7SPx3o0dB/Gs/j7
	4xV19pAUyaBkfYt8E4SPskiqw=
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cfad2eab27mr1171304085a.55.1773937072730;
        Thu, 19 Mar 2026 09:17:52 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad1e1fbbsm493643485a.42.2026.03.19.09.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 12:17:50 -0400
Message-Id: <DH6W7K2SLPYB.PCO7FQ6CR1YZ@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v8 2/8] bpf: refactor __bpf_list_del to take
 list node pointer
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Chengkaitao" <pilgrimtao@gmail.com>, <martin.lau@linux.dev>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
 <haoluo@google.com>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <chengkaitao@kylinos.cn>, <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
 <20260316112843.78657-3-pilgrimtao@gmail.com>
In-Reply-To: <20260316112843.78657-3-pilgrimtao@gmail.com>

On Mon Mar 16, 2026 at 7:28 AM EDT, Chengkaitao wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Refactor __bpf_list_del to accept (head, struct list_head *n) instead of
> (head, bool tail). The caller now passes the specific node to remove:
> bpf_list_pop_front passes h->next, bpf_list_pop_back passes h->prev.
>
> Prepares for introducing bpf_list_del(head, node) kfunc to remove an
> arbitrary node when the user holds ownership.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index cb6d242bd093..e87b263c5fe6 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2426,9 +2426,10 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf=
_list_head *head,
>  	return __bpf_list_add(n, head, true, meta ? meta->record : NULL, off);
>  }
> =20
> -static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, =
bool tail)
> +static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
> +					    struct list_head *n)
>  {
> -	struct list_head *n, *h =3D (void *)head;
> +	struct list_head *h =3D (void *)head;

Note: The cast to void then back to list_head is necessary to avoid an
"incompatible pointer types" error.

>  	struct bpf_list_node_kern *node;
> =20
>  	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> @@ -2439,7 +2440,6 @@ static struct bpf_list_node *__bpf_list_del(struct =
bpf_list_head *head, bool tai
>  	if (list_empty(h))
>  		return NULL;
> =20
> -	n =3D tail ? h->prev : h->next;

The new code reads n _before_ we check if the list is initialized. So the n=
 we
are passing from the caller may well be NULL. However, __bpf_list_del()
will in that case now a) call INIT_LIST_HEAD(() to properly set up
prev/next, b) call list_empty() on the newly initialized list and exit
without ever reading the NULL passed by the caller.

This is kind of counterintuitive: We are passing essentially a garbage
value to __bpf_list_del that we thankfully end upi ignoring. Can you
move the init check logic into the top-level kfuncs to make sure the
list_head we're passing to __bpf_list_del is always valid? You can also
just init the list and return NULL in that case - we know it's empty.

>  	node =3D container_of(n, struct bpf_list_node_kern, list_head);
>  	if (WARN_ON_ONCE(READ_ONCE(node->owner) !=3D head))
>  		return NULL;
> @@ -2451,12 +2451,16 @@ static struct bpf_list_node *__bpf_list_del(struc=
t bpf_list_head *head, bool tai
> =20
>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_hea=
d *head)
>  {
> -	return __bpf_list_del(head, false);
> +	struct list_head *h =3D (void *)head;
> +
> +	return __bpf_list_del(head, h->next);
>  }
> =20
>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head=
 *head)
>  {
> -	return __bpf_list_del(head, true);
> +	struct list_head *h =3D (void *)head;
> +
> +	return __bpf_list_del(head, h->prev);
>  }
> =20
>  __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *h=
ead)

