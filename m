Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67486395AC0
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245835; cv=pass; b=uNoVJ+B/x63RiCf1OPhsD/udG054U1qEh0rVAbIQU1fDbWBMLUS/UhAIjQmIEDbcNkUlQG/hoV1q3QuoQ651xXiAnC++1Lw3RHofETBwxp9GM+QeZJKkoyT6Rfs1d2FT6BWjeFeim+h8BV8Kb63/WhK8F2PKNsugOvR6M/1F2i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245835; c=relaxed/simple;
	bh=BSYiNfjcqtbilpf9G77ON89zIBv60yDWhHNpR43RcG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biaRxBi2WR8aGMkJ+jPejIAtG1fnDV6IYjKKG5wxLcRFrlSBcv0jYOQbQrxqQ6h6aYvus9+6W2wtl9bIRXlGZ4Ps4ABQI0dzSP719heZI1zeRwAoh+qWCfjzKVLej0sbyLrZ3lvIwLo0t1bd17hjUCrkc+/EyYaq44m9/+rGfa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwflqy9l; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwflqy9l"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so262534a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 13:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245834; cv=none;
        d=google.com; s=arc-20240605;
        b=Kk+CqdaCBku2iLEEGWhMHKnKPqz+guS/JiiaRKccs9u14izwICrXILR8JK53bm8vpr
         jov5/zFRy5vode8mkGBIfopNRwlS2Kb+VoUIu6BvjAGj6Jj5OJnoLtvjpq+cwDuPs6ws
         9LXWaImuRis4Nly+9QKT0eFtd1wx5S5ekTcepR4lCZ3Dln64PhYSWskYm1AFjZFqfudR
         fUj4KnM9tvha5g0pAh20oAZqyrBw8CzOR+qLJHjNytRxlHZcU/Mh/DbDivevociVH3bF
         KFRFbApy818pU38qcmTF0pxNiUU8XYBm0Au02AbljHkNh+Rq4iH+sUR8iybFHok1tEoD
         HpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDkRS+tM+X5MLSQAw7MXiKZlq+UbE5KS08f6slGFBtE=;
        fh=C0GLyrKbZn4RCTfln8NFKgYkDigU/GO+r30ncZfnaIk=;
        b=Bmh6EK17plAx42QFkZ/Fpn+KwYclDVLOl6jQtfYetxQDm9kH68Vz+5TBzcI+eF7aw2
         ibB8D0Q4FMS9dQ6n9uPrzpEHB3RfWq0IXHeNHPgpu73KzRqVuX0EehhgmZ/x1DzQnQ+l
         5tNyhOmm+DGTkO9EpqhEpba4qoVVyS10fqgtx+3p18f2qLWJ8ts7a9q1jsVZOvxLNox3
         wIBWrGObc0mEjG122Nl5R810lY2D8d65W5FqDvsiKWZ6GG/Gi8Kfs8XYdDVGjdo2ABaJ
         tz0p4TYlCScloChiDbxv4pKPIbiWUysk4Fbrk8E+VRb4zm7DpZjI0xFcvQh3NLEay2YT
         6+tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782245834; x=1782850634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDkRS+tM+X5MLSQAw7MXiKZlq+UbE5KS08f6slGFBtE=;
        b=Rwflqy9l6lYwnnxOg9tXuY35ffQE6+rinuzNxdVF6gyi+dm6/E8ZE7SKHDkRQVxnR1
         DNq0KkOjZJiog4cnkOQfxrm27gS9tiQdZJZIiK5knmx5sJjdsh3zCTnKcQrihGkQWwk3
         gws8mV+zd2m4klHsDCY9V7+y9LtGEQWfqLlPgbrXzxk1E7JXTAJr2mujI8poBeeBjEDx
         nKq3qVyhccHZSCKsqiN969SBOffc7yPWSeVT9Z2LhIEtGNOT+YoEPIFQDUCajxFXYIFn
         72C2PaJ9APgAFgxxH+aMhaiAr4bD2dgoIjalq0rxJ2HFqkcjLmKCyAUkmRJsCsHJ5GQq
         ojZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245834; x=1782850634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDkRS+tM+X5MLSQAw7MXiKZlq+UbE5KS08f6slGFBtE=;
        b=nKVIzDrdHXLsbzyzdNe/IG+KuVPE/Eu37NTu/E6dJwkobVDoLglLO0aVDgQfelGZya
         ahFOfmFH0OnGfN99Qwk72+H8G4JINgZLKjxncKuW9eV/bXs6pBQRsZf/UCXtdZXb/W3C
         cIsQJUcNL6dQCYT8kiYvTvcHfBSfQs/jut001/X3AOLJMXoZqcYj/2SgD3eiXsrGH0vo
         LbBCVe30Nw9QW9cF+eD/TP84PQxYvNaJO7l1ZG44MumgXvVY/XhSK+II6UPdUWJkYhGZ
         E8VWmJ/9LX/63QtQYQoFbWoxmz9E3J2Lhxx9rm4+PEMymrKkedB+Wtsou2f++RKzu8iG
         nSIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFSDcTU/Y++dk1TjtZPWDYKooWrjuZsFMWa+1tbBpG90/RqjKiOjq7tGQG+H/oD3MlBM5kUwJaxq7niz6yhaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mg0k56TqxavIWRB9mM9jec8kgqkiyegxhUePI64uZgU4I3a1
	H7p5qEuJMwIZxtEmawr8YezbO38agAg1A07UopA6KSoASruaCNnl51kB78do4/WXuwH8Sv8YfHs
	usAawkhHVcyFYmfnBw5Ne4+f+7TFrIE0=
X-Gm-Gg: AfdE7clmodWlNku7d6scNEP6qIq/pfj92O6A1IUtDf9cj56Ho+lP/7/TgQfZvOJ6deZ
	xkoHafkppylXmisvbIIpDNmM/xdPWTG8Z6x84akYzYkcnmZF1qORXsMGubZGDizSMxw7V8rj+pw
	NNiN4Jqx33hVRfx4N0GdkOOtMsm/RvrtpvQa8MhYraQ64VJR292pC0WjAkXfJMWa42zcibkTk20
	WMWZeeRgGgGQTmqPvdUD6Tqi2VRB8qLM4JM/H79CxmNi9Qhr5XKDlWGkaoBNL6OSRHmOovsFVtL
	koYNU14p2naZxP3dactKtBt0MJswfVMQJ53GTHvZJLtuswJDX26EpNLcUplN92s6BJbxgQ==
X-Received: by 2002:a17:903:41cf:b0:2bf:bd17:90d4 with SMTP id
 d9443c01a7336-2c7e151d8d2mr4280125ad.28.1782245833593; Tue, 23 Jun 2026
 13:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-7-33fde039ddf3@kernel.org>
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-7-33fde039ddf3@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 13:16:58 -0700
X-Gm-Features: AVVi8CdEpGZ38igQlR0_mWtEWrlfHpdcY4rIGcGw_cXgZ0_cBsNYkoAZNe89-1w
Message-ID: <CAEf4Bzay6HokFa2CTsoQt2SLQ-3WWC+EUe0b9KpT4Ju2TvBg4A@mail.gmail.com>
Subject: Re: [PATCH bpf v2 7/8] libbpf: ringbuf: Use compiler atomics
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>, 
	Andrea Righi <andrea.righi@canonical.com>, Bing-Jhong Billy Jheng <billy@starlabs.sg>, 
	David Vernet <void@manifault.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>, 
	Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:27=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Consumer-side ring buffer code uses architecture-specific smp_* helpers
> for shared memory accesses.
>
> Use compiler atomics instead. They provide equivalent acquire and
> release ordering through a portable userspace interface and allow the
> next commit to use compiler fences in the wakeup protocol without mixing
> atomic interfaces.
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  tools/lib/bpf/ringbuf.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
> index 1c5bce2b5e12..141f2cbe56eb 100644
> --- a/tools/lib/bpf/ringbuf.c
> +++ b/tools/lib/bpf/ringbuf.c
> @@ -270,14 +270,14 @@ static int64_t ringbuf_process_ring(struct ring *r,=
 size_t n)
>         if (n =3D=3D 0)
>                 return 0;
>
> -       cons_pos =3D smp_load_acquire(r->consumer_pos);
> +       cons_pos =3D __atomic_load_n(r->consumer_pos, __ATOMIC_ACQUIRE);
>         do {
>                 got_new_data =3D false;
> -               prod_pos =3D smp_load_acquire(r->producer_pos);
> +               prod_pos =3D __atomic_load_n(r->producer_pos, __ATOMIC_AC=
QUIRE);
>                 /* Positions wrap; the consumer cannot logically pass the=
 producer. */
>                 while (cons_pos !=3D prod_pos) {
>                         len_ptr =3D r->data + (cons_pos & r->mask);
> -                       len =3D smp_load_acquire(len_ptr);
> +                       len =3D __atomic_load_n(len_ptr, __ATOMIC_ACQUIRE=
);
>
>                         /* sample not committed yet, bail out for now */
>                         if (len & BPF_RINGBUF_BUSY_BIT)
> @@ -291,14 +291,16 @@ static int64_t ringbuf_process_ring(struct ring *r,=
 size_t n)
>                                 err =3D r->sample_cb(r->ctx, sample, len)=
;
>                                 if (err < 0) {
>                                         /* update consumer pos and bail o=
ut */
> -                                       smp_store_release(r->consumer_pos=
,
> -                                                         cons_pos);
> +                                       __atomic_store_n(r->consumer_pos,
> +                                                        cons_pos,
> +                                                        __ATOMIC_RELEASE=
);

this almost fits 100 characters, I'd keep it as single line

>                                         return err;
>                                 }
>                                 cnt++;
>                         }
>
> -                       smp_store_release(r->consumer_pos, cons_pos);
> +                       __atomic_store_n(r->consumer_pos, cons_pos,
> +                                        __ATOMIC_RELEASE);

this definitely fits 100 characters, let's keep single line for readability

>
>                         if (cnt >=3D n)
>                                 goto done;
> @@ -413,8 +415,8 @@ struct ring *ring_buffer__ring(struct ring_buffer *rb=
, unsigned int idx)
>
>  unsigned long ring__consumer_pos(const struct ring *r)
>  {
> -       /* Synchronizes with smp_store_release() in ringbuf_process_ring(=
). */
> -       return smp_load_acquire(r->consumer_pos);
> +       /* Synchronizes with the release store in ringbuf_process_ring().=
 */
> +       return __atomic_load_n(r->consumer_pos, __ATOMIC_ACQUIRE);
>  }
>
>  unsigned long ring__producer_pos(const struct ring *r)
> @@ -422,7 +424,7 @@ unsigned long ring__producer_pos(const struct ring *r=
)
>         /* Synchronizes with smp_store_release() in __bpf_ringbuf_reserve=
() in
>          * the kernel.
>          */
> -       return smp_load_acquire(r->producer_pos);
> +       return __atomic_load_n(r->producer_pos, __ATOMIC_ACQUIRE);
>  }
>
>  size_t ring__avail_data_size(const struct ring *r)
>
> --
> 2.55.0.rc0.159.gbe5d7338c2
>
