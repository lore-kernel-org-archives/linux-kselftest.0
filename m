Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722ED199949
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 00:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780274711; cv=pass; b=c+g2X6UxDEMomox8ePN30imVTTET9ywczNFh2iwMfEsjkdono/wLpRPbo3Qfi3yHVfIt5v0xNTGHQcHU4owwg8zvoYjHc6+eKmSWLzS0bjU8XKIh0DTSXA2nBRgwQXAy1ymu/ZyKoKe88m1ypizx1WLxncPCNFfDMke5J2uQTkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780274711; c=relaxed/simple;
	bh=IZ4XZSF64CuwQFbBvvn/SOHeTNC96IzPW50aIXcYpmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNZVrbjL0xdGDEVhY3dUk4amsK7/+LpBVP5N7f5SPKpDhuQKvmLlY/fG4CK72vfSNRe+u2aNVmVqmj8CeWyMcwmYJ1OQAn0os83MPr8mPv9m/2jPt9YY/lTR9JPRB4PCZPpsqKDIRlB2NF4TxY7+SD7WJvHEnCr1BiWM/z0te1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om06fQzl; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om06fQzl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490426d72f7so83583505e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 17:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780274709; cv=none;
        d=google.com; s=arc-20240605;
        b=CUAoDJaiLcrDCTNbQy2exuZtaYYKptPqcuXn5s2IPqKPA2g6Pni41HZ8SafrTdt/fe
         1NsQ/kILXbVXv5c4dNcSexpPupWVRg2D15DB1P+Gv0Lcfr+hTddd8mw66JAA0CJd9/od
         Ltp1F5bPRCE77Zjaffdtga01xaIJV1m57mfln7T79QrTeiF3LpMzcgpLHwPtUREW9hPL
         tyn2aXoX3LjawqJmFWzqjYUIlI4yGFg+DZLIoSrdgIfGOcqSZLtSxw5ENRkdK0NkQ6K+
         BIQGjkbfhxTGwY3ep1Kg6x0Ua+Co8ig5x51NlB1L2urmWk0ZP8A4GOEtC1xVIekQBRcW
         5uvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NR2hmbEsf+lZOhNyIUzFrhZQ4twYIu9TsbQ2+1H9Yqw=;
        fh=4B3bqe5SrByb8qU9Ecv7l35QvodAQK7xqn794QBUSh4=;
        b=Sg9J5GAeZfM9fbXCCD+n4aNyHdCddIDl93W/fXhb1osGUvU35FL6F3nfcbbRMDSkiL
         +YljFl+V/7rJhT1mr+1HdjIxK1EKeCXZnrmRLV0bsLmVw5WftE2bTg5M9hlXR6mev3Vk
         wBB12jUBGqfiiYNOkktKlmqHOFIEcwM5QsDSANai6L3AM7XNtJA5lIApNAgsw3+QbPRw
         wyZtYxVh9zKGxz6N49EHxKqUoXAuT6ZqiXtldK36lLQVO9n+DDEEsd0qyn+1RGUz21HI
         yMBrnvNBGLbRGrhUFZf5XpsWOTGWs8SAKqI88uiTANTxRbGpyYT5pM2qAh8Y2JLcLCyK
         HM3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780274709; x=1780879509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR2hmbEsf+lZOhNyIUzFrhZQ4twYIu9TsbQ2+1H9Yqw=;
        b=om06fQzl9Pe7ZDw9yJtalGj8wV9NlNZQi0Ra6RKs32AYCE2qK2SatqyvAKdiWX8moH
         3xBtPBld5UiKtMCqZB70uWpcWbhh4vwbPrDofx/i2OcqUVJNvPjVgi+jT5lKTHwq/85a
         iYz+BD1MCJPADOdyC3uazqqcnhCsJ0F8DKkfmVXQjiy0Heg03EVOVVz685JCG6bZogId
         LxoXOAD+WqPuuCFWeD9cSyZmeyy9DmlglrSV9bhoQTQRRneNifVYogQbowunWgPkfX5A
         8p9xzbdNISDZxX99EFrRYnPS8G7gfRyBo7/R4CGL3YRt1JQYUEkqr9bp00+MNuFNjSSE
         UXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780274709; x=1780879509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NR2hmbEsf+lZOhNyIUzFrhZQ4twYIu9TsbQ2+1H9Yqw=;
        b=Q+TQkDQNa0qr8VbaZPhj74+29zlp0wApIJDa2Vufs6wyotRCIrsYQrPLCH+P3UIeUL
         R5vgHNKkFe+A/G0VXiaqrF3C2K+qWDcY0/MaAfT2LE3G3PmSx6ahq7FYoMA6uL+VMvmZ
         Rnx0mBqCeyluoNdeUNh/0hM9sUW+UoQjNhE8gAnwBRqTcyj6saQdTjJiEKNP0EXTVPUP
         5Rd6eU0/C9C6YqBWzBI+sRlKh4cI+G/9fFju8l/2eYiP7sNKB8tr+A41vFA4YgruAY60
         ToSD3q9APrXMJt+rl+9wUx0zXQA37Vzu173F4gAurcSeqYmg3TBWbkTpWrYQ2zlSu2F+
         3t4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+JVffD06mnW5NC8ueAofEN4t5iF23YKZeoxtJIuhM0JnqVdFQJMswdqJDb0rP1WEun774IDToO4PDgExyzhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXkfXp85zsFbLWi2Y1+pXNnAL1dLnY6eaHYdreecZOKjEPxlv
	JXATLsK/rglXIPmMgg4d2QU4sdvmrbPxXMy4wp1F1j5la0o4mD/X95jJJqZhoF4Y0WGnjHyvPak
	Mrqa9rK1XX3ZsC0+6JxevmeTtR9vXBP0=
X-Gm-Gg: Acq92OGxY1GucSoKMhGpUY9tiU4lT3ZggyE9W43uNxkxb8KHFcKyzcvxN8/F0Pan6rN
	f0r37INzP9YB8dpbIm4Iae3FGK4lFYpDOfUtgF0EdtZWnEEaMMDdKctFBcywMlFQZEs3vngLsJo
	4qQ62P3WLaUQIV3JTqjw/XREJZN1oO3r6s20tlB3EOwhIiPDeF6FJgH0xHaWOmh3hkvhU+uPAb0
	O6NcQtQM9eMRAIIC197WwCaHe+lUj23rw5avHd4kaijoFjEwgYdUgtv3stp0dMg6t8SEhryNp/N
	On3mYFB8wl1IaihbCxh9cEXUpIQKb/C53QwhzslrMLoCAk8zqT75Ckc2pzpPgs4LSMoRDUPK4vf
	Utik/mCLYQsQvgxE=
X-Received: by 2002:a05:600c:4f87:b0:490:abd7:fd9 with SMTP id
 5b1f17b1804b1-490abd71214mr7854975e9.10.1780274708953; Sun, 31 May 2026
 17:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529151351.69911-1-leon.hwang@linux.dev> <20260529151351.69911-2-leon.hwang@linux.dev>
In-Reply-To: <20260529151351.69911-2-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 31 May 2026 17:44:57 -0700
X-Gm-Features: AVHnY4JLy_kGPt9SuGY_PbelWeENHCrokYlfBWentfqbHu0QQiGfeVQh1WKtLPs
Message-ID: <CAADnVQLh7VEKAtckzz=XOVPT8ovpDQshvPPCWHDQu2OWQx27_w@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/4] bpf: Fix TOCTOU issue in lwt
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Guillaume Nault <gnault@redhat.com>, Ido Schimmel <idosch@nvidia.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Peter Oskolkov <posk@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 8:14=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Sashiko pointed out [1]:
> The hdr pointer passed to bpf_lwt_push_ip_encap() can point to concurrent=
ly
> mutable memory such as a BPF map value.
>
> So, the memory of hdr pointer can be updated after skb_postpush_rcsum().
>
> To fix it, memcpy() the hdr to a local buffer, which will be used for the
> following checks and updates.
>
> [1] https://lore.kernel.org/bpf/20260525150010.CDEBA1F000E9@smtp.kernel.o=
rg/
>
> Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_pus=
h_encap")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  net/core/lwt_bpf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> index f71ef82a5f3d..8009e427851f 100644
> --- a/net/core/lwt_bpf.c
> +++ b/net/core/lwt_bpf.c
> @@ -599,6 +599,7 @@ static int handle_gso_encap(struct sk_buff *skb, bool=
 ipv4, int encap_len)
>
>  int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool =
ingress)
>  {
> +       u8 buff[LWT_BPF_MAX_HEADROOM];

extra 256 bytes of stack to partially close a hypothetical issue
is not worth it.
Ignore such AI complaints.
Not every "bug" needs a fix.
If a malicious bpf user wants to crash the kernel they will
find a way to do so. Especially with agents.
We cannot realistically close all of the holes.
Right now the priority is to fix the issues that normal
users can hit and not bots.

pw-bot: cr
