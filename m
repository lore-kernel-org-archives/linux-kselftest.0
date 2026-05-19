Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A513EA952
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204103; cv=pass; b=ja1e+Dq/7Rb2ud1RSfE7+zC8mUmvd9c7MHO5ZwkQXHGSdAiro65KQwNpK7Mp3LeX9gsyDXp4+qOfkNWqonzGd9GMaqmXFsfEHHIONqzBBK6XlRHWwqbXhTXWyir+RALBgy+P8axNemsldHay8YpHmviuWA3eBwuYnA6thyni5eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204103; c=relaxed/simple;
	bh=CP4SDXFd648u9ojexa7os9oefqN853dz3CgbyaNYfjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0oDcnAPNPRb2U32Sd4g7z3wBeQqZ46bICMjbdegNXfDWbP6vxc5Mti9rRrnnaE/OsA/VTCiyY9pq2sJPXVsahymsc0cEy+UNCFpWXsmvZRZbeHx27G8HAfo9xT/DRtTRlpfU5WWSx745p3cn14J0FMro0c5hKOVDQFf3YJeIyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=EPChiCKE; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="EPChiCKE"
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IMUw9m2161892
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:21:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=rOP5/C81diETXN+AE61xBsoSkunTrn9vv+GwS2+hWYo=; b=EPChiCKEORHc
	KMPgIL9Vfo3jGBG28bDRQxO+6BT/TUY74kO/VAiXN4wW2xfrsC15XBr1vBsW1Gjm
	KZ0bFknvnV4YRLpTlIO7VQATsXCiD620++Qf6inK9u4KkQjua6HpZ8XnQjgmSBq0
	BLd/p89pQdQ00oPR6vptt9XKdvvVgUGLMwIevU5lnx6Rf6LT4rF7LoYwvag9MEdP
	HbNlJmd9e9IG9fJ15wWTOOhHG/DOpzW14wLlqRb/bwVQ353T69zHYegywaNVfIa+
	dxuWAdXW+h/lIe2M3bxgD44BSLT1fBtwOQQUuBOOlBCYumo7OBoqtyYUqqvbUqTu
	enSFHmFfuw==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e7a5hw7f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:21:40 -0700 (PDT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-678ad5bfc8cso3331700a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779204099; cv=none;
        d=google.com; s=arc-20240605;
        b=jWy0XjGNvx4mFWkfVr9pk7mEbFAyASPnIVBeCcN1OGR9tTkRrm44R521Rwvac2f5Ek
         IOmDCyfTquMVzUaJo6Amvi9mea8hXpSSDjE9MTw2Z78D5K0Q+X9kjrAQbErCVFZHqj0e
         g5XCWpwq2Lib1yJRO9vovOAmm5AmKsxbBsh8IDW9aSpTCz1yvsd9fFn5ZAGNKKRyGw4i
         lBPXJ9zp9IWgVA04NVIbEPivOLJaMWIPk+Qvna5iFin9ys4LJSB5NHviQkDQHJ0HqEqN
         wjisp1lqBdsCoiY+okmd+Tsjmq28qrKur8A+AqE2E6SAfkkXUDoPGs0juP8fpgaRu1uh
         pfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=rOP5/C81diETXN+AE61xBsoSkunTrn9vv+GwS2+hWYo=;
        fh=DTngdQvcXhreD7GncI214CCsdAxMhQB5k8yx/L/LOSY=;
        b=U7oWsoN5/iyi4ANW1RlY08X79yg8lgBNG1g9rBNgLG4WE0Q9UK+r2FLlh6LY20zJ6h
         FumBp2/jl8LIZV/t20puQsoaiYn/T2GpJpapx7HQf5CVNZ1tWePGyiVBjzgwVRssQbYY
         xV4tI8wO0SpSC6ugzXo5k4o2XBpqiNIkYeujcXDkHRQuytWT11hlxeDU78HkAzB013iS
         +VvV/+tNZzo37RC+e15s8sJ4qfmZahR2yTaOkJpBBvsZ3yKBSq5pnQ5bXeaUJsfKppDB
         KMIbps+5YyVEokLmMAdEz1/jke40HvnggQXtyYKMjmnTcWzGrsKLFuOIvBo1AIMjYvRP
         oRMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204099; x=1779808899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOP5/C81diETXN+AE61xBsoSkunTrn9vv+GwS2+hWYo=;
        b=Qy9tpzsEXBRyJYHhiN/F/46QZDlJcP8FIHh9VvIFc8VXHQWdfSVRhrLlmnjByiOoD+
         C93LwOGRwAQMolitkhnMg8giISw/treukUWamFCNaSGkVxgnb50UunDPGPQloCvxKxGb
         Pt5wP0WZPk680G2LmUZ1GVOm9MSIh+9dafzXlYs4+hlMXjmk0DlC7uppavvhsizz3KzY
         9X3Nl0KLTJdoz/Yg+pHsJOo8htTl1QrndXAMl9Bpyakr6Rhw39UqR+6U++83ZvO0YuX+
         R/zN1k9v+mGqUDTnMHaU19wUZBOVln9jRAkUp+L0Vv+42wp5lVkqbW7Jhk5N/sLGPJAt
         Au6w==
X-Forwarded-Encrypted: i=1; AFNElJ80y5NhWO2LcnuOjjzNGzxrG27hEOH0YGMEY2E84ObiUrCWl0LP7oxV+jC7X8RCbP1JIeIOoQoFMcwSWonbopQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6zyPfSVnXQdxz3hlloR6Ul35jqQQJEybgZmKgDOWmq7CH0et
	XAsqsFpeyawFfjvquxty/UclYtz1CcbPjXU+hKecaC3otQKK0rjMOlukVsjhW/j7x8ijGckpR6i
	d0cathG8jBnmSrL4pNT1tk8kMwSRw46NiSrvm832w5tFEg2AtOgmAFpdX5LsyZvoLqniAdBUzcG
	+FDffOoVAOdx8WMHnbwXYEn84Yhp0Gk0DMqJ3A3FNmXF0=
X-Gm-Gg: Acq92OFhKcbl7SoCrgvAy8kaeaqUhTacW+fS9ErC3BydfKr+xCk965kKwmDk0B7wUNO
	e5zE9y+ZBGn1n6MaiZRGI7CjQ+sYQc2lVQkn7iVFtPWD1UPvnY9IqTNcky9618U6fQFFf1Sb/Xm
	qvdHHOcnI1H6rJCIiAiz8fH+IU+oWZYk5sgEgqpqqjgYE69MAgBkNQPCOuAHfrirFN9ULXFv8JC
	iHu2EziS3Bo7C5zogD5mTrshzybF2lAetU=
X-Received: by 2002:a17:907:8305:b0:bd5:2ed4:4ef6 with SMTP id a640c23a62f3a-bd52ed45a11mr650639466b.19.1779204098596;
        Tue, 19 May 2026 08:21:38 -0700 (PDT)
X-Received: by 2002:a17:907:8305:b0:bd5:2ed4:4ef6 with SMTP id
 a640c23a62f3a-bd52ed45a11mr650636266b.19.1779204097965; Tue, 19 May 2026
 08:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518153532.2835502-1-cleger@meta.com> <20260518153532.2835502-3-cleger@meta.com>
In-Reply-To: <20260518153532.2835502-3-cleger@meta.com>
From: Vishwanath Seshagiri <vishs@meta.com>
Date: Tue, 19 May 2026 08:21:26 -0700
X-Gm-Features: AVHnY4LAZemwCzUV5L_fqt7ovZva88BAelehXk6FOFPiaAALnsT9PrMVCEFDhUk
Message-ID: <CAJEWsO1mEVAquRTck0tMh-HaEfVBFXPeA_zVMP+YOqbxWJoSmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] io_uring/zcrx: notify user when out of buffers
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
        Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Vishwanath Seshagiri <vishs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NqXhtcdJ c=1 sm=1 tr=0 ts=6a0c8004 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=VabnemYjAAAA:8 a=pGLkceISAAAA:8 a=7u8bz5AEFckT_jKjNKQA:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: wf1ff7tmIhcG54w4JpxEdNWfQs9CVCXR
X-Proofpoint-ORIG-GUID: wf1ff7tmIhcG54w4JpxEdNWfQs9CVCXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE1MiBTYWx0ZWRfXwNWnadgHqw4n
 IiZGTOlPeN8HKiZfeF0k573D88nZNaY+06F1tha9eDs6/qdFKjtcjd7E8Q/V96ao6ya6JkVxoVs
 DpcK8xpWFVR9Q4KUHAym6LKH3eggpWWmrGgld2HUOiJS6unfRu+0J6c5EVRhzBBqpM/ECIcX2go
 smgfwlPqyLSHJoMHFf3gwwLySAe46bFSgrIO7gSkPw4gVUrNFxBTY6es5VMU5DeCudWBs+MYKCo
 RyLb66kKoYH1nrhdzIp12dyzpRlPBhX9Y3W7FVlxY5dTOVuz+QsZ1OdwFT3Xy/8B6dgEcCF1CFF
 PaMTQKg/RObaos+PQYtvcW+8yZJ/4kRIBHnGp3Dx7zF4zHfQBO+BIka2PC6oeCltpgyPz2Jdl1E
 q8hExuS4cAhZXOSYEybJMtbTZuVCAKaxbxUpEHCRvRV7iK3b6vgKxw57g/YFZDvQ/eiJkoMNqJa
 Hy6GEf6wRT6khkhvKJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01

On Mon, May 18, 2026 at 8:36=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@met=
a.com> wrote:
>
> From: Pavel Begunkov <asml.silence@gmail.com>
>
> There are currently no easy ways for the user to know if zcrx is out of
> buffers and page pool fails to allocate. Add uapi for zcrx to communicate
> it back.
>
> It's implemented as a separate CQE, which for now is posted to the creato=
r
> ctx. To use it, on registration the user space needs to pass an instance
> of struct zcrx_notification_desc, which tells the kernel the user_data
> for resulting CQEs and which event types are expected / allowed.
>
> When an allowed event happens, zcrx will post a CQE containing the
> specified user_data, and lower bits of cqe->res will be set to the event
> mask. Before the kernel could post another notification of the given
> type, the user needs to acknowledge that it processed the previous one
> by issuing IORING_REGISTER_ZCRX_CTRL with ZCRX_CTRL_ARM_NOTIFICATION.
>
> The only notification type the patch implements is
> ZCRX_NOTIF_NO_BUFFERS, but we'll need more of them in the future.
>
> Co-developed-by: Vishwanath Seshagiri <vishs@meta.com>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: Vishwanath Seshagiri <vishs@meta.com>
> ---
>  include/uapi/linux/io_uring/zcrx.h | 24 ++++++++-
>  io_uring/io_uring.c                |  2 +-
>  io_uring/io_uring.h                |  1 +
>  io_uring/zcrx.c                    | 86 +++++++++++++++++++++++++++++-
>  io_uring/zcrx.h                    |  7 ++-
>  5 files changed, 115 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/linux/io_uring/zcrx.h b/include/uapi/linux/io_u=
ring/zcrx.h
> index 5ce02c7a6096..67185566ad3c 100644
> --- a/include/uapi/linux/io_uring/zcrx.h
> +++ b/include/uapi/linux/io_uring/zcrx.h
> @@ -65,6 +65,20 @@ enum zcrx_features {
>          * value in struct io_uring_zcrx_ifq_reg::rx_buf_len.
>          */
>         ZCRX_FEATURE_RX_PAGE_SIZE       =3D 1 << 0,
> +       ZCRX_FEATURE_NOTIFICATION       =3D 1 << 1,
> +};
> +
> +enum zcrx_notification_type {
> +       ZCRX_NOTIF_NO_BUFFERS,
> +
> +       __ZCRX_NOTIF_TYPE_LAST,
> +};
> +
> +struct zcrx_notification_desc {
> +       __u64   user_data;
> +       __u32   type_mask;
> +       __u32   __resv1;
> +       __u64   __resv2[10];
>  };
>
>  /*
> @@ -82,12 +96,14 @@ struct io_uring_zcrx_ifq_reg {
>         struct io_uring_zcrx_offsets offsets;
>         __u32   zcrx_id;
>         __u32   rx_buf_len;
> -       __u64   __resv[3];
> +       __u64   notif_desc; /* see struct zcrx_notification_desc */
> +       __u64   __resv[2];
>  };
>
>  enum zcrx_ctrl_op {
>         ZCRX_CTRL_FLUSH_RQ,
>         ZCRX_CTRL_EXPORT,
> +       ZCRX_CTRL_ARM_NOTIFICATION,
>
>         __ZCRX_CTRL_LAST,
>  };
> @@ -101,6 +117,11 @@ struct zcrx_ctrl_export {
>         __u32           __resv1[11];
>  };
>
> +struct zcrx_ctrl_arm_notif {
> +       __u32           notif_type;
> +       __u32           __resv[11];
> +};
> +
>  struct zcrx_ctrl {
>         __u32   zcrx_id;
>         __u32   op; /* see enum zcrx_ctrl_op */
> @@ -109,6 +130,7 @@ struct zcrx_ctrl {
>         union {
>                 struct zcrx_ctrl_export         zc_export;
>                 struct zcrx_ctrl_flush_rq       zc_flush;
> +               struct zcrx_ctrl_arm_notif      zc_arm_notif;
>         };
>  };
>
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 2ebb0ba37c4f..c5972274cce1 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -160,7 +160,7 @@ static void io_poison_cached_req(struct io_kiocb *req=
)
>         req->apoll =3D IO_URING_PTR_POISON;
>  }
>
> -static void io_poison_req(struct io_kiocb *req)
> +void io_poison_req(struct io_kiocb *req)
>  {
>         io_poison_cached_req(req);
>         req->async_data =3D IO_URING_PTR_POISON;
> diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
> index e612a66ee80e..de0a3bed58d1 100644
> --- a/io_uring/io_uring.h
> +++ b/io_uring/io_uring.h
> @@ -213,6 +213,7 @@ bool __io_alloc_req_refill(struct io_ring_ctx *ctx);
>
>  void io_activate_pollwq(struct io_ring_ctx *ctx);
>  void io_restriction_clone(struct io_restriction *dst, struct io_restrict=
ion *src);
> +void io_poison_req(struct io_kiocb *req);
>
>  static inline void io_lockdep_assert_cq_locked(struct io_ring_ctx *ctx)
>  {
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 34faf90423f4..463fbaead35b 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -768,6 +768,8 @@ static int import_zcrx(struct io_ring_ctx *ctx,
>                 return -EINVAL;
>         if (reg->if_rxq || reg->rq_entries || reg->area_ptr || reg->regio=
n_ptr)
>                 return -EINVAL;
> +       if (reg->notif_desc)
> +               return -EINVAL;
>         if (reg->flags & ~ZCRX_REG_IMPORT)
>                 return -EINVAL;
>
> @@ -856,6 +858,7 @@ static int zcrx_register_netdev(struct io_zcrx_ifq *i=
fq,
>  int io_register_zcrx(struct io_ring_ctx *ctx,
>                      struct io_uring_zcrx_ifq_reg __user *arg)
>  {
> +       struct zcrx_notification_desc notif;
>         struct io_uring_zcrx_area_reg area;
>         struct io_uring_zcrx_ifq_reg reg;
>         struct io_uring_region_desc rd;
> @@ -899,10 +902,22 @@ int io_register_zcrx(struct io_ring_ctx *ctx,
>         if (copy_from_user(&area, u64_to_user_ptr(reg.area_ptr), sizeof(a=
rea)))
>                 return -EFAULT;
>
> +       memset(&notif, 0, sizeof(notif));
> +       if (reg.notif_desc && copy_from_user(&notif, u64_to_user_ptr(reg.=
notif_desc),
> +                                            sizeof(notif)))
> +               return -EFAULT;
> +       if (notif.type_mask & ~ZCRX_NOTIF_TYPE_MASK)
> +               return -EINVAL;
> +       if (notif.__resv1 || !mem_is_zero(&notif.__resv2, sizeof(notif.__=
resv2)))
> +               return -EINVAL;
> +
>         ifq =3D io_zcrx_ifq_alloc(ctx);
>         if (!ifq)
>                 return -ENOMEM;
>
> +       ifq->notif_data =3D notif.user_data;
> +       ifq->allowed_notif_mask =3D notif.type_mask;
> +
>         if (ctx->user) {
>                 get_uid(ctx->user);
>                 ifq->user =3D ctx->user;
> @@ -954,7 +969,8 @@ int io_register_zcrx(struct io_ring_ctx *ctx,
>                 goto err;
>         }
>
> -       zcrx_set_ring_ctx(ifq, ctx);
> +       if (notif.type_mask)
> +               zcrx_set_ring_ctx(ifq, ctx);
>         return 0;
>  err:
>         scoped_guard(mutex, &ctx->mmap_lock)
> @@ -1127,6 +1143,48 @@ static unsigned io_zcrx_refill_slow(struct page_po=
ol *pp, struct io_zcrx_ifq *if
>         return allocated;
>  }
>
> +static void zcrx_notif_tw(struct io_tw_req tw_req, io_tw_token_t tw)
> +{
> +       struct io_kiocb *req =3D tw_req.req;
> +       struct io_ring_ctx *ctx =3D req->ctx;
> +
> +       io_post_aux_cqe(ctx, req->cqe.user_data, req->cqe.res, 0);
> +       percpu_ref_put(&ctx->refs);
> +       io_poison_req(req);
> +       kmem_cache_free(req_cachep, req);
> +}
> +
> +static void zcrx_send_notif(struct io_zcrx_ifq *ifq, unsigned type)
> +{
> +       gfp_t gfp =3D GFP_ATOMIC | __GFP_NOWARN | __GFP_ZERO;
> +       u32 type_mask =3D 1 << type;
> +       struct io_kiocb *req;
> +
> +       if (!(type_mask & ifq->allowed_notif_mask))
> +               return;
> +
> +       guard(spinlock_bh)(&ifq->ctx_lock);
> +       if (!ifq->master_ctx)
> +               return;
> +       if (type_mask & ifq->fired_notifs)
> +               return;
> +
> +       req =3D kmem_cache_alloc(req_cachep, gfp);
> +       if (unlikely(!req))
> +               return;
> +
> +       ifq->fired_notifs |=3D type_mask;
> +
> +       req->opcode =3D IORING_OP_NOP;
> +       req->cqe.user_data =3D ifq->notif_data;
> +       req->cqe.res =3D type;
> +       req->ctx =3D ifq->master_ctx;
> +       percpu_ref_get(&req->ctx->refs);
> +       req->tctx =3D NULL;
> +       req->io_task_work.func =3D zcrx_notif_tw;
> +       io_req_task_work_add(req);
> +}
> +
>  static netmem_ref io_pp_zc_alloc_netmems(struct page_pool *pp, gfp_t gfp=
)
>  {
>         struct io_zcrx_ifq *ifq =3D io_pp_to_ifq(pp);
> @@ -1143,8 +1201,10 @@ static netmem_ref io_pp_zc_alloc_netmems(struct pa=
ge_pool *pp, gfp_t gfp)
>                 goto out_return;
>
>         allocated =3D io_zcrx_refill_slow(pp, ifq, netmems, to_alloc);
> -       if (!allocated)
> +       if (!allocated) {
> +               zcrx_send_notif(ifq, ZCRX_NOTIF_NO_BUFFERS);
>                 return 0;
> +       }
>  out_return:
>         zcrx_sync_for_device(pp, ifq, netmems, allocated);
>         allocated--;
> @@ -1293,12 +1353,32 @@ static int zcrx_flush_rq(struct io_ring_ctx *ctx,=
 struct io_zcrx_ifq *zcrx,
>         return 0;
>  }
>
> +static int zcrx_arm_notif(struct io_ring_ctx *ctx, struct io_zcrx_ifq *z=
crx,
> +                         struct zcrx_ctrl *ctrl)
> +{
> +       const struct zcrx_ctrl_arm_notif *an =3D &ctrl->zc_arm_notif;
> +       unsigned type_mask;
> +
> +       if (an->notif_type >=3D __ZCRX_NOTIF_TYPE_LAST)
> +               return -EINVAL;
> +       if (!mem_is_zero(&an->__resv, sizeof(an->__resv)))
> +               return -EINVAL;
> +
> +       guard(spinlock_bh)(&zcrx->ctx_lock);
> +       type_mask =3D 1U << an->notif_type;
> +       if (type_mask & ~zcrx->fired_notifs)
> +               return -EINVAL;
> +       zcrx->fired_notifs &=3D ~type_mask;
> +       return 0;
> +}
> +
>  int io_zcrx_ctrl(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_=
args)
>  {
>         struct zcrx_ctrl ctrl;
>         struct io_zcrx_ifq *zcrx;
>
>         BUILD_BUG_ON(sizeof(ctrl.zc_export) !=3D sizeof(ctrl.zc_flush));
> +       BUILD_BUG_ON(sizeof(ctrl.zc_export) !=3D sizeof(ctrl.zc_arm_notif=
));
>
>         if (nr_args)
>                 return -EINVAL;
> @@ -1316,6 +1396,8 @@ int io_zcrx_ctrl(struct io_ring_ctx *ctx, void __us=
er *arg, unsigned nr_args)
>                 return zcrx_flush_rq(ctx, zcrx, &ctrl);
>         case ZCRX_CTRL_EXPORT:
>                 return zcrx_export(ctx, zcrx, &ctrl, arg);
> +       case ZCRX_CTRL_ARM_NOTIFICATION:
> +               return zcrx_arm_notif(ctx, zcrx, &ctrl);
>         }
>
>         return -EOPNOTSUPP;
> diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
> index 6b565d0bf6da..cca10d0d02ac 100644
> --- a/io_uring/zcrx.h
> +++ b/io_uring/zcrx.h
> @@ -9,7 +9,9 @@
>  #include <net/net_trackers.h>
>
>  #define ZCRX_SUPPORTED_REG_FLAGS       (ZCRX_REG_IMPORT | ZCRX_REG_NODEV=
)
> -#define ZCRX_FEATURES                  (ZCRX_FEATURE_RX_PAGE_SIZE)
> +#define ZCRX_FEATURES                  (ZCRX_FEATURE_RX_PAGE_SIZE |\
> +                                        ZCRX_FEATURE_NOTIFICATION)
> +#define ZCRX_NOTIF_TYPE_MASK           (1U << ZCRX_NOTIF_NO_BUFFERS)
>
>  struct io_zcrx_mem {
>         unsigned long                   size;
> @@ -76,6 +78,9 @@ struct io_zcrx_ifq {
>
>         spinlock_t                      ctx_lock;
>         struct io_ring_ctx              *master_ctx;
> +       u32                             allowed_notif_mask;
> +       u32                             fired_notifs;
> +       u64                             notif_data;
>  };
>
>  #if defined(CONFIG_IO_URING_ZCRX)
> --
> 2.53.0-Meta
>
