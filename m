Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792562539;
	b=4KjgGZVPPsMC4IznZ2lYVGk2TDSM8KyqXl2Lk1iYbEbZB6WEvA/wAMWTW1/7xFRGo1Ge
	 xb0gWPR0+Pm+/2oI+idSLWx+0TWqR7Tx4HpLqyYDGZVQJZ5rJok3z5XBlP/tw6EWQmuru
	 tFu4RvlA+Q5d5o0oI0Bl9gwwZyrNcUvHSL4J9c9qhscSquWMX0vWrOotMn2qGKiD3WAAW
	 bNr7U31Bfwdh5NgyOrgwKl+l3liKo+5k87Bp1zfTmQhXktJTqBQWkrjY16U1D6u1ufixH
	 Dbli6ayqGjzjeYCyE20/SEGMrmqxaCnJC5Sw4/lLdQwjGRWslIH8F/WHUvJAczNCQJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
	b=MvwBdjR5M7L533fLkFEYa+4QY5a8WgpHrBcWYio+ac4EnBpzbl0+7vpPOfx4W7dFK1z8
	 B6SmCQoagCLXgn/XWTsLM8/vbPxzxb18z8zv+iH2UQN58FBCVXa3XSxLx8zKLgSMzzIyn
	 +cATNwCNN2+gN50Y67eIirrkPQ+laIfw5GGecrXxdK5WAbdu5RDsNk4gCuNN4RCSVd5u6
	 zcmmsFVPK9dJui0oZA+lT76ni3wk1ARDHs911pklyjQLlkQxGrvscks4uPQb2ULByAX29
	 g/S/fG0E8yRsHDAGL7VekyR0dWe9UajbXkImxxZWskcwrjvdusSCse8BlIcoJ5rWo0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q3pkhCUv;
	arc=fail smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244BD606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 06:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q3pkhCUv
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso5112a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 23:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792562537; cv=none;
        d=google.com; s=arc-20260327;
        b=mWmjZRPzDx8otdukgdtJiyt91QyvXvu8Kfch5hYKv7V0jYOcma5Xlr46tlRzhQcQmP
         mKMOpx97af7SUPe//T0eYgoYCNzM476i91RsR265MU95RnVKAifHT0GHVjyF6wWUhQ9N
         1jSRbfhK2Ra+z4ODXaT0CaBkKGUsCdcIRRgCG1sqgRaIFc1rqCn+naYD1kIaDFsqa7/C
         dCBjOCCwiaksX+mgp0VKRBvrZkV5wZqIFvraevGe7YZPJPi8U5peQ6D+7ErTiBfP+v3L
         QWcN/B10BSQfpVnr5kwO56Sb8YfXeTy1Ux/ediJnOgCEntb6EiqKtMVsFY+gLtJFTR3W
         0ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        fh=ocLEa6OEb0xzXME1rcp7hct9oxj+i9PJmQgmv/ggN80=;
        b=TB0F0ZnvvYjkCszgNtt3H9CjYVcTDaN4gvh9xMgRBQN52CD1/hy3k9D5ulXQfdEx6H
         iogEvtioCkFrEWhWsUA0pobXIPIsFZK7eYxdw8EguBwWLtkHielHk3CrLElsGWshllGY
         SWYyS6wEeb/RztUI4Goe65dIzZHLG/Czi9KZPNE24XXGUFlQPT1G6SXfud4YTdrX5f7p
         OZwQItpYMPOJMuVDmX7A+lYlGoClQY6ZjULvtRK1Jy1VKlHYyDqngkCuFmCIRnkcqI8V
         51zCK8S7pVHg3gJ5gLR+X/vJAC7eqy/SVOK2VVAsvzSH+DvOifWLZAksaELdwZDUK+bW
         Caxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792562537; x=1793167337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        b=q3pkhCUv9nUWBOZccrVMfzeDkaV921iz33aeRXyR17AE1y9cSqfFjgkx+NyopNSRLO
         QOaUT05nQybti3UWD6V4kgP1ewGD3TTnrp8VkN6OR6RxDsTTYIOAwDKZfb2Fmz0QViXZ
         npUW3rOyr3WTDHIlFT4/KQPJMMroas2DVNOQ46D8RJpdtPi+oAxmykdTnrH4/gBYi7y1
         q12HUqRjipCLCo/bs+uO9YCL0K2bTvdmk02L/3tTDEFMlXy7F0n1F9mWNX6T67lJYraf
         HQhvsvGr1DjM79SYNDcVXSoaHnrHCs5vujebegCX8hGUd2mIKbHrhr5jd9g2Mipnwkbm
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562537; x=1793167337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        b=Ctk2VV3JCgoxms2rgfs44HVTGNQdsm0Q+CMwHlUbBk6OnOVMF8iKsZUy30eWqL8huT
         HTB/khCbvWQi+IzjcH9NNF2/gS69JDhgVs1fzuXNweoU1oxGkEDZhpjyzH6OrhYbuW77
         rsPsp/PGr2brw7kTflZV5AOpdos30WmKf0gzthmIR8ixKj8nVrSnKjPdGr676CVQ8W50
         MvkQtS9LuwzXsOifkFMVug2cy4N1XSOePp+VtztvoUGHVaZMvD/hO+9fPDZ/iDr/ru11
         tzhlVlKvVa1Cax7pqNjnO4FDoDnexXZsrlfv/xtY9tzkgXmiVZt/goENZuqC1vslkSju
         WL7g==
X-Forwarded-Encrypted: i=1; AKwUvBwvEhPCvxCZPLLSaDhsGKNIRKNEbg1gLk0DJZEfQSGvFYomog4SQU+KxnTv2LXnNKLW8foila3k4atw/GGAWiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3GBfhmsp53p4ufxXgYlbplU+XkAJgOLENfZrKZZhToTdtER+1
	A4+WPeWhW+q65bkVt0j3loYhWP854Jzr1qTjbFzLXHziCk6B2nkT3yu4EFbcmnr5kPjKxr4bwr4
	y7OHaJwXcskiy1wA2xKZSyqz9MWGqr7aiYSC1iQPF
X-Gm-Gg: AYBFou2DiYmRvQVdrAQtyo026S5tpcw+2gm9m5Ax00mucp/B4h0xWcSQmVPSr6GUF6L
	Zp4an2s0i+JYJUvD91YNMESwXqPfh5pe4a7kVyy943ZJ90K/8r9DZx2TfcxBYhzjha+jqM+xgqj
	+Pnjhh2nk1LuyzbDxLVPqwHlb+rWmaSeWHNpkUgrM6c0SoNa/pr22k58fNNovmE+36Ji5lvyqOt
	N0jJ2RvYWf/lorJ8XY4F0QAfrcXi4PTG8scjd89SaOFWhzNe/SMP+hZ7j/noVLtIbM24B045EWE
	s3OsldtiKJK1fB7213nfS2R42pT8M/t3hR0N5xyW5F+uzu4O2IjgD2KFHwe3dxcD5VsNf8ibavq
	xQNDtxycwAJozYV5+KO5X3oCg694Ixt2WAXuefl4i6LyjYCUqBEIXkt99ET1h7zZGv75w1fM=
X-Received: by 2002:a05:6402:14cf:b0:6b1:bbbf:25b4 with SMTP id
 4fb4d7f45d1cf-6b3e5a5474dmr95391a12.6.1792562536864; Tue, 20 Oct 2026
 23:02:16 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020163835.4076594-1-tavip@google.com> <20261020163835.4076594-3-tavip@google.com>
 <20261020182043.4bad43c4@kernel.org>
In-Reply-To: <20261020182043.4bad43c4@kernel.org>
From: Octavian Purdila <tavip@google.com>
Date: Tue, 20 Oct 2026 23:02:04 -0700
X-Gm-Features: AclHuK-S0Ui5RYs0FXdYffIYsww7_eDbtV_O9m-OKB2qGOVBMwFfZsAC_baGNN4
Message-ID: <CAGWr4cRLv8k8HHnz7Euh4FC+JXoPLS_vGpu+3X=ORZSats=XCQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:20=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 16:38:35 +0000 Octavian Purdila wrote:
> > Add a packetdrill test that drives sk->sk_forward_alloc negative via
> > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> > under TCP memory pressure fails with EAGAIN rather than returning a
> > negative copy length from tcp_wmem_schedule() and failing with EFAULT.
>
> This is failing in our CI, it doesn't need any packetdrill updates,
> right?
>

Hi Jakub,

Correct, no packetdrill updates are needed.

>
> Here's the AI report about the failure:
>
> The new packetdrill test tcp_wmem_schedule_negative_fwd_alloc.pkt is
> failing in our CI (both the regular and debug kernel configs, all three
> address-family sub-tests: ipv4, ipv6, ipv4-mapped-ipv6):
>
>   tcp_wmem_schedule_negative_fwd_alloc.pkt:105: runtime error in write ca=
ll:
>   Expected result -1 but got 3680 with errno 22 (Invalid argument)
>
> Instead of the non-blocking write() failing with EAGAIN as the test
> expects, it succeeds and returns 3680 bytes. The kernel log for the run
> also shows the test's memory cgroup repeatedly entering the OOM-killer
> path (try_charge_memcg() -> mem_cgroup_out_of_memory(), "Out of memory
> and no killable processes...") from inside tcp_wmem_schedule(), rather
> than the write() being throttled and returning -EAGAIN as intended.
>
> This suggests the test's reproduction recipe (tcp_collapse() driving
> sk_forward_alloc negative while sk_wmem_queued exceeds
> sysctl_tcp_wmem[0]) isn't landing the socket in the TCP memory-pressure
> path in our test environment, but instead in the memcg hard-limit/OOM
> path, which the companion fix (clamping tcp_wmem_schedule()'s return
> value) does not need to handle the same way.
>

Thanks for the report!

> Could you take a look at why the test's preconditions (buffer sizes,
> cgroup memory limit, write() size) aren't reliably reproducing the
> negative-forward-alloc + EAGAIN scenario in our VM environment? It's
> possible the memory cgroup limit used by the test is too tight relative
> to the data pushed through write(), causing it to hit the generic memcg
> OOM path before/instead of the TCP memory-pressure check.

Ah, looks like my local .config was the issue
(CONFIG_MAX_SKB_FRAGS=3D45). With the netdev CI .config I got the same
error and OOM as you are seeing. I'll fix the script in v3 to work
with both 45 and 17 skb frags.
