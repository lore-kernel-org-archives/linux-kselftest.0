Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABF13790B
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245723; cv=pass; b=FiEWdOYwadXnGCfhNi1vijhwt4vjtwQzFw8stmf6oeNWVr/fZZB3DQHmWls3JX7thMrqHQ3k2kvhP348khJxYKVRL28xpEFHPsR3HFPbjN9k9KpBuQnXFWtLKy4iy1pftlXe2ocbhTKZeOMAI5yoBgDoGkRsFxRvvrb+BexWZ2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245723; c=relaxed/simple;
	bh=VyUN5kc8pY9zeZGfxVG9I72IM00S38DsQj8XPbrh/jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o39U4LBDvx6mL0k8pTrjRqw3vgnFDZP2i+OKmY0MsNtb3R+CDGoFMkOGld34PJZh2z2X91/6/eDUwiCMIOIP8NgPVdfwNXVnIP2pUUxkeHBLviJvVxHKKeQpbEQdHzIGueoD0GuKp+rzrNwhydtSITIsytwtMRfj7v6OMdTU0ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjLLGfF4; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjLLGfF4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c892935bcdeso92322a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 13:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245720; cv=none;
        d=google.com; s=arc-20240605;
        b=UDNoqtVPLRwY9eV/KAtriVYVbx8IcpJ1/r/LABiMTzpAkBDGSCZRtda6r96/ypQz4r
         eyLQs1T9oE3O3C0aMRXdPodyOsjQbyFvivAlgGzoC99nE+3MzJvDiUvyrd2ciso2Vjk5
         Z+5+a02RXao/TX+63yLgRwvx7aszZZi5jeCVXiPmr62Pa2aBn6ea36ygscFlx1iSwDDx
         l0AANh3F6DUVh21Iyir6Y9cD3XTyWVx1Zh5NMIta8j7xA3nmyzsavf/6DsPEqz2GGNg4
         SzuroAXfkfCcSmNTce+sv/9vY+dfRo0+zAixayvTI5uVgurixo+WP2YIh3mcgQpQqZuA
         fTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+Z9M3ZKDsrVtD4vMbDb1w1q1I4K+UTdIQhD7+XfBGo=;
        fh=I9nVNhg8MJpbHch5u3DgUTnyfne4VTTBrdQen/YVxII=;
        b=jLd+N850CD5k7+2D/EgtkQdpeVLio1iWOFtNmN38Bua/cTJqha6xRgJG6wp/od+6Hg
         /u5I/ANo4c4K0CKfQv0sOrv3eKVzJQJ7hGsZ655fXbs96rGXDmy5AEDJHuyNSBLPRPX9
         xAOhCqmHzfhOLDSEBay2UVh/oaiylJD8TyBXbZuGXduL4dHd4P6Ro0UqzyDw0CHxhcY2
         xXPH2rp/87xLHKJ20cb/muqLcchr0fehuYmONeydlBYbzmjBBd8PsyVxrkRNJRY6sP4M
         aUYtqFnYTuxZf/VjoxFQH/nSGbLjangHfGdg9kmGIxs2tvlhuqKO8pKtKQz++Exw1sh8
         N4tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782245720; x=1782850520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+Z9M3ZKDsrVtD4vMbDb1w1q1I4K+UTdIQhD7+XfBGo=;
        b=GjLLGfF4L8j+VK+0ZoajA4d5fc7wimo/cHSiWRUdfXvZ6mN15oM3m8zKhWoXu6MM4L
         aYWtEM+Ecp6k9hFolJ+RPTzOffw6rGvPkeKXs8LV6zwpVSZsBD86dtLB0wm4x89lLXUw
         qUYtEcZ+vkWEEZ2cVGyjD+q9a2YcqUOHRtPDFQTEgcxMNjFXBcydRqaX3Hprwn/WqWAE
         THdgXuT/yQ3vFD23cKbIqm0Thby5m4fE9SjAJxBhlF8kZqItyfiXdL53gXOolhLJdikE
         f048qFRZ4tkVkRbd1TDjdR3nw0v0G/QSZcl0xYnkkChHHzPxKODs5N+CUiYkOQp4oIg+
         X0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245720; x=1782850520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+Z9M3ZKDsrVtD4vMbDb1w1q1I4K+UTdIQhD7+XfBGo=;
        b=HrgbkFDjFePD7WTr7INbXKha+tjNqjnEbFuNqMG/B1L06L4hBwaceeAgMhPawxXo8W
         +4NwNPLk+bh5k8tDIASRAbyRMzZfhGlSGFDQYHpCvT08wA2j9Hg3rpq7sjC7pmZhsMNS
         YvRU3VIeO+RngAAiHX1T557gjQ6UBzHLWr4UApiPI5M2VSou79Vav8Y86sLuopBdUV5m
         nJBQ89EVe5/lcBY1RxGronEI3yzvfQ31nHnfR5H65XCkzSyLSm9utBEKijqlgnkUT36B
         Tn0R+UyHtYLA2vvSStMboA/TLU4GTtGomI7jNPf5UpM83Ib9e7nxsILbQGf48zNwcXCn
         i6hw==
X-Forwarded-Encrypted: i=1; AHgh+RoOsDKdBVc58Z7keheo+2WsnE01w+c/zhxxq/DwJWBWsKzUvNmSTLsZ5qEW1MVz4HaLpz4PeuLRm16y4g9Ux+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwGEKFxJwGvl8v+ZIBXi23/3dHpfW8foDqdBoopZiooDi1Tg+
	IbbAbXifa6J13K1vY6j4g542eWqUxbk9drfRDyuxsdcb/Gfnf6DJv/BP/sQtk1YRYaIBHulMaQb
	JVL0Fs4kS+7MFNxY99dLTWJCS2rL4H5s=
X-Gm-Gg: AfdE7cl/xo3Eb8Ar5y0wFyKVMtQ0vQ2NRDgG0e8q06RKsGPsizfJJFoaRovAi4nzaxX
	7hTxIqWwkH5wFrV/QAK8D/OZg3zAXH5BS0ywy7bEbeWW9aBvKEyM6kv7Ov/2+IJ3dP0qxY46KDA
	lYxUxkarjrxL+bMuCZRUDP77feCRsNCgyehHZx/jDVryMCfFPCYed9DY3G37xMeZIy5syCQwFfp
	QDrlk3u4KFs/lwj2WPxni3sxYOnbYfljAqMTMVUoH8uZ/Z2WrW2Js+dJzbPvo3GGwhwadN0b0oX
	SO7xmqzKtiICS5+LrBrkDNWUPVAwl3Sa2zakQXQtWn8OhhyFH1sDzULESfj8bQbAqCUfuA==
X-Received: by 2002:a17:902:c947:b0:2c0:c3ac:4af3 with SMTP id
 d9443c01a7336-2c7e14be9d1mr3830645ad.15.1782245720502; Tue, 23 Jun 2026
 13:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-6-33fde039ddf3@kernel.org>
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-6-33fde039ddf3@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 13:15:06 -0700
X-Gm-Features: AVVi8CfqHtnBLCweM7eX_1wpYpE6gYHvPw60CrJ-FzxF11Iv983c2apGCEnWOa8
Message-ID: <CAEf4BzattX9GherSPJ7DBeKksfxsX_uKz4y4tYNU=gUjqkJP_A@mail.gmail.com>
Subject: Re: [PATCH bpf v2 6/8] bpf: user_ringbuf: Handle position wrap
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
	Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:27=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> User ring buffer positions are unsigned long counters, but
> __bpf_user_ringbuf_peek() widens them to u64 before comparing and
> subtracting them. On 32-bit systems, producer_pos wrapping below
> consumer_pos therefore appears to move backwards and permanently stalls
> the ring. The widened subtraction can also bypass the advertised-window
> check.
>
> Keep the positions word-sized and derive the available data with
> word-sized subtraction so the arithmetic wraps with the counters. Treat
> a zero span as empty and reject spans larger than the ring before
> reading a record header.
>
> Fixes: 205715673844 ("bpf: Add bpf_user_ringbuf_drain() helper")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/bpf/20260614020552.022A11F000E9@smtp.kern=
el.org/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  kernel/bpf/ringbuf.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
> index 909880031fd3..19cbb9b74ee7 100644
> --- a/kernel/bpf/ringbuf.c
> +++ b/kernel/bpf/ringbuf.c
> @@ -748,9 +748,9 @@ const struct bpf_func_proto bpf_ringbuf_discard_dynpt=
r_proto =3D {
>
>  static int __bpf_user_ringbuf_peek(struct bpf_ringbuf *rb, void **sample=
, u32 *size)
>  {
> +       unsigned long avail, cons_pos, prod_pos;
>         int err;
>         u32 hdr_len, sample_len, total_len, flags, *hdr;
> -       u64 cons_pos, prod_pos;
>
>         /* Synchronizes with smp_store_release() in user-space producer. =
*/
>         prod_pos =3D smp_load_acquire(&rb->producer_pos);
> @@ -759,8 +759,11 @@ static int __bpf_user_ringbuf_peek(struct bpf_ringbu=
f *rb, void **sample, u32 *s
>
>         /* Synchronizes with smp_store_release() in __bpf_user_ringbuf_sa=
mple_release() */
>         cons_pos =3D smp_load_acquire(&rb->consumer_pos);
> -       if (cons_pos >=3D prod_pos)
> +       avail =3D prod_pos - cons_pos;
> +       if (!avail)
>                 return -ENODATA;
> +       if (avail > ringbuf_total_data_sz(rb))
> +               return -EINVAL;

hm, should we use long and then replace cons_pos >=3D prod_pos checks
with `cons_pos - prod_pos >=3D 0`, this will handle wrap correctly

>
>         hdr =3D (u32 *)((uintptr_t)rb->data + (uintptr_t)(cons_pos & rb->=
mask));
>         /* Synchronizes with smp_store_release() in user-space producer. =
*/
> @@ -770,7 +773,7 @@ static int __bpf_user_ringbuf_peek(struct bpf_ringbuf=
 *rb, void **sample, u32 *s
>         total_len =3D round_up(sample_len + BPF_RINGBUF_HDR_SZ, 8);
>
>         /* The sample must fit within the region advertised by the produc=
er position. */
> -       if (total_len > prod_pos - cons_pos)
> +       if (total_len > avail)
>                 return -EINVAL;
>
>         /* The sample must fit within the data region of the ring buffer.=
 */
>
> --
> 2.55.0.rc0.159.gbe5d7338c2
>
