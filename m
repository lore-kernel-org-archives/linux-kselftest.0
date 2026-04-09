Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B43DBD6E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745005; cv=pass; b=QUfFIIwO5JsADy/XW3yfgIPIEaDmaP3ZDkMZcoc7eyVr+aTP+/QUAf2IpqDYjz8DydgAeSqmbZq+gvUW19UJy1ZjETodErqTdsTOIvIGf1wujfN376j9Rva8Dt4iO3twWI9+qrmriK/HMI9hwLg2/YZMICHlVhN5lLTK51yplyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745005; c=relaxed/simple;
	bh=aiz98qC5uuUB98pxDGSrJs8vIwp/65s1qr19/1CjLTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFpvkuxIpQSIe95pfoA1YqRA9VyH8OLWeBLy2Ve5ZCFK1rM0FyJYCCIR9e0ySliFf6KtTrW0NNep2JdVgPff90D6F75/jVB9pLdm2XoIH+xMZZ3Sh7msa+diuO2G2Uob9Qat3HfU7GbCSik0Jfi+QHA1ddzegck9mMWH0Lb35ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+6sNB4o; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+6sNB4o"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfbd17589so696346f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 07:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775745001; cv=none;
        d=google.com; s=arc-20240605;
        b=gxjd4YoiD/nIxpJnbLPQQX1fkBTpkk8kxGja6G6a1F5/syon+j799gylPtGysM8l/V
         4w1TfMuTE0lDbTC2wSVdc0oGs6zQulI5oloH+23+AwbJT6bj5vTb0E3o4pqK7bZDOrKq
         cylCT+733V9YjtAv/qebCq5C3G6FchlLKbEBg9VOT+PVsrAd/dwTm60lvY+da4PTHYCb
         GKC8nHemt59QcA8z2pLd3M7xigg3IQnWkbBv+0aOT8HniLDfJljvvrzPkBqbzUF/7Z76
         3m9jj8ZEqigH6n9ecfIl0n4Td6b3q1Dyx1FYIrbWcVRt53OPxLD0/uMoCMP7byA12fyy
         HxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j2B9qE/aSznRzr95piluDzuDSrf64tY/r70hHnVKdTQ=;
        fh=SEvnXbuEA9cSAbUS6QBSi+T4OJWrsnMd74cN3+5yMLs=;
        b=JXqCWdKag4XJt0ueASHKWrXuGSaWhnQUvuztyFphCysE/arXH++dOVC0ahdvXB3Loc
         lCUOkdlxQH7kwlGriFlELzUURfbS+lfXFMldJJAdaNU/+oEGbXD/5lhNTV78fGRW3tEx
         azHZqtEAixQvO2qMjgq/3iuxoAnqOa6W5qMYWtkkE55Ey8THoOOkQwnSKfqvmF0mLifi
         ywjEL6Yt2Jmga/gJT9rHskhtucaiHQ0ucej5NnIu9Ytp1I2r0bmreDpurX3ANJ2Fh+Uv
         xHXdmd4B2sp+fvTDZHr0YFw6C+yTb2uXy1gpkV7k+W/kKAFzZllqVvcAANce1GsPaljM
         YnnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745001; x=1776349801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2B9qE/aSznRzr95piluDzuDSrf64tY/r70hHnVKdTQ=;
        b=R+6sNB4oNQPK9IWW0WP6NZ7e8XKcqazpLb3HQLzI979uJShdR1bjPiXVh+GiQwdAfi
         7qIwrp9BWtIu2WMvND9WRKEEnUdC+ulFYCeuEh4laRTdvrHkesN7dV+wlCUOXfbjpEeE
         DBNnjiN3Z3CLR8lsh5+8GXW4GYAvc/vsumJbCNVANiGJI9lDhraIDa9f9h2Ckpd7QnrB
         PREjGjBWYHTT3k5OEyD/jCciY8Ko7DECj0E8Ve2r3CeyY/B31gVqMn637CGnjvpJPrjF
         qnvRUUyy96BEmnhfYozGX7NLCf9bGfxR+NYR+YuziVmRnAZCgnadA6TEnjYUvnAlP/OM
         epqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745001; x=1776349801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2B9qE/aSznRzr95piluDzuDSrf64tY/r70hHnVKdTQ=;
        b=fIZOLmxntkPjQfpE7jB5JEdZbQM4TYJoLv1bFQVOBA/MmsUZqY0UWW9FHluGlqYVGU
         FDKWZI4n67LhEfaS0SEgmDtBizQWbhLNxP+9EE5N+p2B2uTqgA1c+SHjD1/VA75dDsrX
         ui+QGyrZzhOVhpHg0QZa4mXHSyk1rKnYeKf0I1VLeH3vqDG2WOQe6uptXRAn9yigyeTF
         ormqGfDxR4hetBDMy7kEDw/aAZvTl3/KST1hhAQOU4n6R07FP5e3oDR6Te4JASBqtAZy
         mr7OaZmnedAXxLjwlZC6f15eJ/yb1Anw3jRqPnDwxhxlBb4NK5Egwl6u/WBgUPn8Mb0m
         uu5w==
X-Forwarded-Encrypted: i=1; AJvYcCV7fQZ+j7doEWT4QyYjhhvUWbAe3O6a3/IU8uA7JWPzIUdD5aU4ftDfIY+doWpPW7pOhSMWcN+zxCJmTBy8qEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRgyew2FIf0ZagWruaFx4N/8VLzaSA3rIEifgDI4tjzOTqgip
	jEB0Z6i390uK4rd/Hs5P3URVCaGSqSpRoyZbeV8my3qALxhx+WEJKFVFsc4BJEq+Oy+YCuKdCuV
	r1aIijpPKSAru8NkOGCM/M/LWxOMVDAI=
X-Gm-Gg: AeBDiesjLGCZPOlKC4tHJGYl7/rABur4zyIv7PgVKw3YVyR686FKyw5xXaDypRF70cz
	7jSM9acUcPH7BwRAtiaB5di+8rKXIT8dvgi2eVd8+1FquHXV7bRSfz8M3GkxhSLdQR6cSc998Fi
	wm52s5znggYd8rC+oWW7YY9pCvU8z6XUcsiqDRDlfqvaBzylSAKwONEN9jTW9agNG4t9UhX5bqj
	nTAspOjO+hJW3UTCZlNDHUcwIciejal+0Ub6yFOOdqIdlOUT79A72dEE5POfmz8KxzN57pI660L
	oabJ1RQC9mZooy8b2PjBrQ0SFfvSa4+1WSMjxvAs195zHA81qszGmipwW92IVMVyqL53ROvJ7oC
	TnOD8xoa7qQaIaHCxU2dIuSYfKg==
X-Received: by 2002:a5d:5c84:0:b0:43a:16d8:96e8 with SMTP id
 ffacd0b85a97d-43d5a089c3amr5137406f8f.0.1775745000893; Thu, 09 Apr 2026
 07:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406224953.2787289-1-werner@verivus.com> <20260409061026.3926858-1-werner@verivus.com>
In-Reply-To: <20260409061026.3926858-1-werner@verivus.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Apr 2026 07:29:48 -0700
X-Gm-Features: AQROBzA77CgnGz0GMfcb6aUuD-xSsenSGs755KZkihl8giw17FumU7yK1I768zo
Message-ID: <CAADnVQK0Toai=KZ3BggnR33DK20Oks1VcjphueRShCWuyuh3pA@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: guard sock_ops rtt_min access with is_locked_tcp_sock
To: Werner Kasselman <werner@verivus.ai>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 11:10=E2=80=AFPM Werner Kasselman <werner@verivus.ai=
> wrote:
>
> sock_ops_convert_ctx_access() emits guarded reads for tcp_sock-backed
> bpf_sock_ops fields such as snd_cwnd, srtt_us, snd_ssthresh, rcv_nxt,
> snd_nxt, snd_una, mss_cache, ecn_flags, rate_delivered, and
> rate_interval_us. Those accesses go through SOCK_OPS_GET_TCP_SOCK_FIELD()=
,
> which checks is_locked_tcp_sock before dereferencing sock_ops.sk.
>
> The rtt_min case is different. Because it reads a subfield of
> struct minmax, it uses a custom open-coded load sequence instead of the
> usual helper macro, and that sequence currently dereferences sock_ops.sk
> without checking is_locked_tcp_sock first.
>
> This is unsafe when sock_ops.sk points to a request_sock-backed object
> instead of a locked full tcp_sock. That is reachable not only from the
> SYNACK header option callbacks, but also from other request_sock-backed
> sock_ops callbacks such as BPF_SOCK_OPS_TIMEOUT_INIT,
> BPF_SOCK_OPS_RWND_INIT, and BPF_SOCK_OPS_NEEDS_ECN. In those cases,
> reading ctx->rtt_min makes the generated code treat a request_sock as a
> tcp_sock and read beyond the end of the request_sock allocation.
>
> Fix the rtt_min conversion by adding the same is_locked_tcp_sock guard
> used for the other tcp_sock field reads. Also make the accessed subfield
> explicit by using offsetof(struct minmax_sample, v).
>
> Add a selftest that verifies request_sock-backed sock_ops callbacks see
> ctx->rtt_min as zero after the fix.
>
> Found via AST-based call-graph analysis using sqry.
>
> Fixes: 44f0e43037d3 ("bpf: Add support for reading sk_state and more")
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Kasselman <werner@verivus.com>
> ---
>  net/core/filter.c                             | 53 +++++++++++++++----
>  .../selftests/bpf/prog_tests/tcpbpf_user.c    |  9 ++++
>  .../selftests/bpf/progs/test_tcpbpf_kern.c    | 21 ++++++++
>  tools/testing/selftests/bpf/test_tcpbpf.h     |  6 +++
>  4 files changed, 79 insertions(+), 10 deletions(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 78b548158..5040bf7e4 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -10827,16 +10827,49 @@ static u32 sock_ops_convert_ctx_access(enum bpf=
_access_type type,
>         case offsetof(struct bpf_sock_ops, rtt_min):
>                 BUILD_BUG_ON(sizeof_field(struct tcp_sock, rtt_min) !=3D
>                              sizeof(struct minmax));
> -               BUILD_BUG_ON(sizeof(struct minmax) <
> -                            sizeof(struct minmax_sample));
> -
> -               *insn++ =3D BPF_LDX_MEM(BPF_FIELD_SIZEOF(
> -                                               struct bpf_sock_ops_kern,=
 sk),
> -                                     si->dst_reg, si->src_reg,
> -                                     offsetof(struct bpf_sock_ops_kern, =
sk));
> -               *insn++ =3D BPF_LDX_MEM(BPF_W, si->dst_reg, si->dst_reg,
> -                                     offsetof(struct tcp_sock, rtt_min) =
+
> -                                     sizeof_field(struct minmax_sample, =
t));
> +               BUILD_BUG_ON(sizeof_field(struct bpf_sock_ops, rtt_min) !=
=3D
> +                            sizeof_field(struct minmax_sample, v));
> +               off =3D offsetof(struct tcp_sock, rtt_min) +
> +                     offsetof(struct minmax_sample, v);
> +
> +               {
> +                       int fullsock_reg =3D si->dst_reg, reg =3D BPF_REG=
_9, jmp =3D 2;
> +

please de-claude your patches before posting.

pw-bot: cr
