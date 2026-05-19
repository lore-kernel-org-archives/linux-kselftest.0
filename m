Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B604028C8
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203966; cv=pass; b=CUBrYqb8nI6kAxc8Y/YXgDe6XXGkwVK3NQXmRnRv6JUpsxFM+pSzet+II9hLXu4EITA2fJqwjiKJUI27KW1NcgeLEQcCFoFdZ8gVxxW0Czp704J0wX78fKXlMSxp3rtaBjVRssnabMwbxPj/bPxsM6iq5pc8aIz5UfXuTyYBuz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203966; c=relaxed/simple;
	bh=siQVO2sQxemf4Uiqc4EspBf0wzllhMQs3CzU+GJb51Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDSccZiyIX/w8To7iy+oijGg4ZUH/am9Zo0iGg3P9ajoX6h4hKUlu8hSoocsHnTSD1choU8kb+UiCcI91eUEhkiUQg30T9MQkTHk4Obe2VLDppnLoIuk9LwyT4vu1M42VJWDbhizmfHjbVu21xA4Sd3z4G1jWIp6xKSdlu16Av0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=cM7SmRZC; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="cM7SmRZC"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JDZl212072111
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:19:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=cvhqFdFEaw6myv9osLkAkBoObyxXccXadGAoubACWjo=; b=cM7SmRZCYmul
	dE/iM0Q6jt9wxNUlA0u5d5+XuAUSMLKPILSBjs1Wtk2pWJq4q/uB7iE5KyZu/Tzk
	+FFx2mQdg/WXv8G1MKEBFzaOJr4dFKrUmoEFTyMKJnD3jfE3N+bP4p1KmF6yI+Mi
	x1XaLRtcehHvlTfBsngbltXdiEQIEV7rGw6tcsJcDSBenZPoZrAkQZNvE+DeP9WD
	qzCz90CS7DJglwWwBRXo2+A+o38R5pzmVY4ZqNda2DNc9z+db0ClKdSOFj9+cZBj
	f37BVjxBekdYFio13WhziXTKwLkkPVpqiJA3F05rk2z93cL8GaJAS2LC0g6icyP+
	3Acjc7fgeg==
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e8rvv8pdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:19:22 -0700 (PDT)
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bd9a6aae530so68077766b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779203960; cv=none;
        d=google.com; s=arc-20240605;
        b=EFqDW02JZQA7cZ8paJQ/XtW0VvrBggdrvK9aPRTfquPvwhNQDMP0gCzn/xuGTKC2s1
         UuKed6FGyMHDabr/xqduD7l8wU03BGwzDYwO31E7idgoixI4YeQ6M+rlW+bMUTf/NdwW
         Se2ANjmF45Qgg3uK3SdHkgaUfdzPd7dqZAwL3jtVVehyzEmFn05e+1lGQ/fER5LTpgml
         +YpScGsFwgRvHDgu+ABpCuljL+kH5GmoHPFQ2oxXobeJTlLTF2vgx139aXpw2BG5YNnT
         VditYJNJnhpnsnhDSPKO7wY0vExh95t0PC1e78BS3jOI3qAPJ0/MIvOPEUBHK2eG1HoT
         3ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=cvhqFdFEaw6myv9osLkAkBoObyxXccXadGAoubACWjo=;
        fh=oAlOF5CBILOcYo9eslmtcLXiBBAw8zQDSN2Fzk24m38=;
        b=W5I2Qs7lwOmZLfCDCd5vhQheMbtLjIFsQ9LvhQI20wYGLX8orN8LhHO4nugmIui6Bf
         X1tM0WlBO81ubOXgpGwtLvhJX9JeW+Oa8LkQiwBV6jIfCHbGEr5MVv8lJ06/CgZMld8m
         TYS7uYuL7sYZwHMy6xIfWgaUxPdLcdUBOaY30VyKFrZtZT/q8a6PBTzVIlOdKcW+joAc
         peAZFjIzJrJdhWYGmr6wqlrZfuwmdmNd6NBQpI3G8VWWLLX5Wn9YniRIQ7GCE3X9Nt7x
         q4fxbLsj4mcjoHfCNBm5brbZQygoJdup55BYKddD63xg9pcYBe5HJsEXjtNRPbSzclTA
         mx/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203960; x=1779808760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvhqFdFEaw6myv9osLkAkBoObyxXccXadGAoubACWjo=;
        b=XQc9xiWHPTbDBZJp+lGA+8jsuzaP5CIHzNPhv0v/VC7dbk0UtNgILi0lzcHL2UW+R8
         SmKt3/z0UsLHt4zYsgJQpIinNPl5UHGUd6vRxOmiaRy4l7oUVcWgMUxl387QSnjwx2x3
         f8b+rEkIDqVQGPMmxgR8jpzZJKcOVq0PXbCjUPoMJ1ZIfBvGnoxgZc8xwoD34yC7YAOQ
         5mvIVqR4MHa8reOF0fe9jU9QCB9ke9udUd2TeL2oUuiBRgCqJuZ/XMax8bqrnzg1EvDT
         jp2sfTEqOKGugaDzIuNiNBbQiWBofrXKpsdwnNb8twd74SA2REnzlaj4nw2PTJASeEbJ
         XGrg==
X-Forwarded-Encrypted: i=1; AFNElJ82ShQhGP1fHFJXdFP94lfE02YNv3NlKMCbYp4QBk6t+S4r1fsDJAZv9bWYAZ0FnCsS3U2n8r0VbPWmPfMoJ6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjBiYcPcdt1BvDaR3VHNIuCV7SeOrhVIPxs5lJlid+G7DXGLd
	IZ6LBxDR3HMKlKu5pKSk536kVKI+NkEi94Cmsv9NDC+w9WZXkQsuUFb7HMJTRcBEjgb7HWd7qNh
	1chtty1TDpDRXxUkU8gSqWQA95vccffZLMwy8iTYwOH1iaBi5hUigRB3Q2DSak/dNnlxL/K2KSe
	Ofqjyi+CEt9+1/XCyBFUoaJZKyM785AelhtzhdEJoPczZ7ViEO+5YWKw==
X-Gm-Gg: Acq92OEu99sctSAsC26mrGkUxfwb7xVp2CpyQckBqE+FT9DBmPJ5jUmK45ugcCjlouN
	ddtWl1Pe05J4XcAh2/gBsg2YmTpBtydoUZaqyVKl2Mudf037ZbMBSYii9WjpbexAYizmjyBfMFM
	W5cwwBUbPTdiK+sDUBVg+IaWZmqrnlHISLjyguK06sCa5NVPhsV012Kr6rvXSrpMW/LULJRkX/G
	pyi1X3V6Psy8EPoIZEpgpjz/CXcyj86urg=
X-Received: by 2002:a17:907:c714:b0:bd0:7949:a931 with SMTP id a640c23a62f3a-bd517960723mr1182044066b.27.1779203960372;
        Tue, 19 May 2026 08:19:20 -0700 (PDT)
X-Received: by 2002:a17:907:c714:b0:bd0:7949:a931 with SMTP id
 a640c23a62f3a-bd517960723mr1182039866b.27.1779203959924; Tue, 19 May 2026
 08:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518153532.2835502-1-cleger@meta.com> <20260518153532.2835502-2-cleger@meta.com>
In-Reply-To: <20260518153532.2835502-2-cleger@meta.com>
From: Vishwanath Seshagiri <vishs@meta.com>
Date: Tue, 19 May 2026 08:19:07 -0700
X-Gm-Features: AVHnY4ISeSj-tWX2tmLsxva9JeDwShAViFq_TymQ9K5usF1cuLqmkszdGAaeUro
Message-ID: <CAJEWsO0hprYmXoGmkR1+yv+hM53dGVh5O=7M+xFAdqoQjKrA8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] io_uring/zcrx: add ctx pointer to zcrx
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
        Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE1MiBTYWx0ZWRfX3FZIemljl7kP
 MQDgCM+qEbD1Vja1bWhFMZ+uzLq4WfZ1ZwCOuFYw/LhhSrE/N9E8YWPYAoR9rgX9A9CE4Osfz2o
 IKjCUpzTlc1zE+9OizyHz7eZsltUaMRl/YYchNvsduh/WI5sEuCix4hNah8QyRuMJxFD8wVxlcK
 n+8mpgu7OOCAcPlZa0HFjeuSsWYXOLhSgM4VnUYhFmMrdez3kjEhxvBUAseSxdZBWSdIuqlq6ak
 GpEfp2fYcRoUXFPgPGNCMcEQhgc7xcVx7lQWakRsnwTO6cq1GZiEooKNsalRTzoHBJ+dgeodOCX
 UdeZ3t/GcdvnUGLO1udotjaSa9yYqZW/A57YhV7dREnFpei2zCggXr4JfsLslvxXl6bu9WLEK01
 k0cxjJsTVoSqdYzu4iiKPD3/9V9jZcHiYXF7pl/KF9GpJX9xgzLq+N/e5aHIsuFMRehHBFFBxjo
 ziO3lu/0nebomadCuXA==
X-Authority-Analysis: v=2.4 cv=KfHidwYD c=1 sm=1 tr=0 ts=6a0c7f7a cx=c_pps
 a=edIAN7ErZTGbxav20d8A7Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=VabnemYjAAAA:8 a=pGLkceISAAAA:8 a=DNv30csI2qpO98t81IsA:9 a=QEXdDO2ut3YA:10
 a=nIuFr-8touD1a-RngYHT:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: QPGtU5UliAjzaDlRMk-q10TpM_ac1KtB
X-Proofpoint-GUID: QPGtU5UliAjzaDlRMk-q10TpM_ac1KtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01

On Mon, May 18, 2026 at 8:36=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@met=
a.com> wrote:
>
> From: Pavel Begunkov <asml.silence@gmail.com>
>
> zcrx will need to have a pointer to an owning ctx to communicate
> different events. Reference the ctx while it's attached to zcrx, and
> rely on zcrx termination to drop the ctx to avoid circular ref deps.
>
> Co-developed-by: Vishwanath Seshagiri <vishs@meta.com>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: Vishwanath Seshagiri <vishs@meta.com>
> ---
>  io_uring/zcrx.c | 39 +++++++++++++++++++++++++++++++--------
>  io_uring/zcrx.h |  3 +++
>  2 files changed, 34 insertions(+), 8 deletions(-)
>
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 3f9632e7790a..34faf90423f4 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -44,6 +44,17 @@ static inline struct io_zcrx_area *io_zcrx_iov_to_area=
(const struct net_iov *nio
>         return container_of(owner, struct io_zcrx_area, nia);
>  }
>
> +static bool zcrx_set_ring_ctx(struct io_zcrx_ifq *zcrx,
> +                             struct io_ring_ctx *ctx)
> +{
> +       guard(spinlock_bh)(&zcrx->ctx_lock);
> +       if (zcrx->master_ctx)
> +               return false;
> +       percpu_ref_get(&ctx->refs);
> +       zcrx->master_ctx =3D ctx;
> +       return true;
> +}
> +
>  static inline struct page *io_zcrx_iov_page(const struct net_iov *niov)
>  {
>         struct io_zcrx_area *area =3D io_zcrx_iov_to_area(niov);
> @@ -531,6 +542,7 @@ static struct io_zcrx_ifq *io_zcrx_ifq_alloc(struct i=
o_ring_ctx *ctx)
>                 return NULL;
>
>         ifq->if_rxq =3D -1;
> +       spin_lock_init(&ifq->ctx_lock);
>         spin_lock_init(&ifq->rq.lock);
>         mutex_init(&ifq->pp_lock);
>         refcount_set(&ifq->refs, 1);
> @@ -580,6 +592,8 @@ static void io_zcrx_ifq_free(struct io_zcrx_ifq *ifq)
>                 return;
>         if (WARN_ON_ONCE(ifq->netdev !=3D NULL))
>                 return;
> +       if (WARN_ON_ONCE(ifq->master_ctx))
> +               return;
>
>         if (ifq->area)
>                 io_zcrx_free_area(ifq, ifq->area);
> @@ -656,17 +670,24 @@ static void io_zcrx_scrub(struct io_zcrx_ifq *ifq)
>         }
>  }
>
> -static void zcrx_unregister_user(struct io_zcrx_ifq *ifq)
> +static void zcrx_unregister_user(struct io_zcrx_ifq *ifq, struct io_ring=
_ctx *ctx)
>  {
> +       scoped_guard(spinlock_bh, &ifq->ctx_lock) {
> +               if (ctx && ifq->master_ctx =3D=3D ctx) {
> +                       ifq->master_ctx =3D NULL;
> +                       percpu_ref_put(&ctx->refs);
> +               }
> +       }
> +
>         if (refcount_dec_and_test(&ifq->user_refs)) {
>                 io_close_queue(ifq);
>                 io_zcrx_scrub(ifq);
>         }
>  }
>
> -static void zcrx_unregister(struct io_zcrx_ifq *ifq)
> +static void zcrx_unregister(struct io_zcrx_ifq *ifq, struct io_ring_ctx =
*ctx)
>  {
> -       zcrx_unregister_user(ifq);
> +       zcrx_unregister_user(ifq, ctx);
>         io_put_zcrx_ifq(ifq);
>  }
>
> @@ -686,7 +707,7 @@ static int zcrx_box_release(struct inode *inode, stru=
ct file *file)
>
>         if (WARN_ON_ONCE(!ifq))
>                 return -EFAULT;
> -       zcrx_unregister(ifq);
> +       zcrx_unregister(ifq, NULL);
>         return 0;
>  }
>
> @@ -711,7 +732,7 @@ static int zcrx_export(struct io_ring_ctx *ctx, struc=
t io_zcrx_ifq *ifq,
>         file =3D anon_inode_create_getfile("[zcrx]", &zcrx_box_fops,
>                                          ifq, O_CLOEXEC, NULL);
>         if (IS_ERR(file)) {
> -               zcrx_unregister(ifq);
> +               zcrx_unregister(ifq, NULL);
>                 return PTR_ERR(file);
>         }
>
> @@ -787,7 +808,7 @@ static int import_zcrx(struct io_ring_ctx *ctx,
>         scoped_guard(mutex, &ctx->mmap_lock)
>                 xa_erase(&ctx->zcrx_ctxs, id);
>  err:
> -       zcrx_unregister(ifq);
> +       zcrx_unregister(ifq, ctx);
>         return ret;
>  }
>
> @@ -932,12 +953,14 @@ int io_register_zcrx(struct io_ring_ctx *ctx,
>                 ret =3D -EFAULT;
>                 goto err;
>         }
> +
> +       zcrx_set_ring_ctx(ifq, ctx);
>         return 0;
>  err:
>         scoped_guard(mutex, &ctx->mmap_lock)
>                 xa_erase(&ctx->zcrx_ctxs, id);
>  ifq_free:
> -       zcrx_unregister(ifq);
> +       zcrx_unregister(ifq, ctx);
>         return ret;
>  }
>
> @@ -967,7 +990,7 @@ void io_terminate_zcrx(struct io_ring_ctx *ctx)
>                         break;
>                 set_zcrx_entry_mark(ctx, id);
>                 id++;
> -               zcrx_unregister_user(ifq);
> +               zcrx_unregister_user(ifq, ctx);
>         }
>  }
>
> diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
> index 9e1a6a1b11e8..6b565d0bf6da 100644
> --- a/io_uring/zcrx.h
> +++ b/io_uring/zcrx.h
> @@ -73,6 +73,9 @@ struct io_zcrx_ifq {
>          */
>         struct mutex                    pp_lock;
>         struct io_mapped_region         rq_region;
> +
> +       spinlock_t                      ctx_lock;
> +       struct io_ring_ctx              *master_ctx;
>  };
>
>  #if defined(CONFIG_IO_URING_ZCRX)
> --
> 2.53.0-Meta
>
