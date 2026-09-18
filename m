Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE484A260F
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729841; cv=pass; b=auIyXu9USm04kbmuywGXsAZ9u22Ww8WmYMVtUoZ5fE1654RgcW+G/VCzIj+99RDL6VsLBlkeBRsRqax2eSPOabmCsNiDIYZ5s3SlDDKyZEibDi7wsc4wRMLkHsU3LyUJjo/Lr1hs6d3S9mybY0OtzxIkyK6Uts/BN6DH1dXiXVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729841; c=relaxed/simple;
	bh=D8NQlMTkB0EOhznxgeBx1U32SLb3Dti876hh7jNPEbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ztk4Xf+mhPGpkL6eV3D8C3DO91RYQnVT/xJjXVQDCe0c9kd6fonkiMvUCAAy+Db1NCol1FmWh8B2wC0teQ0ElNi/ch+RtjF8lueQN4B8RT+5p18bkj7B12YcmHnJkVo8i8LA9pXk66tJuXQKzarj0kM6KaxxpF+xdzW7NCa47ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GKSzWx26; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GKSzWx26"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5123a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729837; cv=none;
        d=google.com; s=arc-20260327;
        b=sqJdUNahf/8BcRe95gOw4HoA98l1lC98Vg49a0fSQpIO8KxdmZe/Dt+BHLMbvMDqx/
         npF2/1v54CWRGq+CHnPMVbSm/AsJ9iTRimaNdE2zhyKop4O3ZdTjQZE169jy6n/HtZXj
         fV6/ncfyf+pjVElQeDgtgdtWScsaAyU8w0J+iYWHyg2cO8L172xoe63BmaMLtZz3BFUZ
         55ZsflB2Xt/iL3B+5+bQgoCi24BIJQVoAU9o0ZnkQ9TIUu4Vgg7QmqpWo3S0mxk13GbN
         5Otk2PtJFPrvA6jYo7E3zGjViQ12/bL3WiZvyb5N28zzbB9ItW5ssUg7e+I7POY8dZzs
         qIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        fh=llfEWHs+nClow163EWm3jpbwdIVaZ8lpg/lO1JBfetg=;
        b=MfNSyscBH+JTKMC7RaP0FaIkZTldWZivlhIz4hPfrUel6Goo3db4khT+hthoXJ0jj1
         1FuKg0waIN5Ha80z4LcXX6tLTPIOHb5ygFzCNXUFBf72Hidw7qXeOlNfY6spf1F5Z0ak
         ukJNOFVp+hq2yJrDFes3ezdfkkRJEmscvZLAAf5qYpsLHcP6G+5RFPPhWQd9eTOLbZjR
         pbG8Lz6/KskAUAZUn3NP50ICMXKkbWOj1GSqog/vtDq8QhGoTWiRHL41tXL0xTbQWg2t
         uFgnCAYqohcPuJWWko4BHVnxTFwNUaGwl9Ouv8qLsnUZ0449lcMYllgHW+YVl8dW1Zba
         uTsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789729837; x=1790334637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        b=GKSzWx26MRfk5eV66AXJq5XBRNsa/MC5hsTmlKaDDqaGzxoVdJMOkyawIKZhVNHD4V
         GjNsGlgsknooExv/i+bhqpvtdmSPDc2MC25KLBiUzlriaoFn1CNzXqEJhQiClFKQTL0P
         ERsk1mXPwe7mqvUZat8BPA+OTwTFdOdc6kxftXBJtGO0Is2X62Tcb9q9AWsrukPLKgx2
         Y7ugiNzTsCgD/GUwVFxR6tvsT1Pnh7Qt0WRquvdwCswNOio/KxNxG76YvmqHMcZCGMzL
         8+IAGFbfmhtOG+U1yyd98RYY+NVd3OOkhmrmmwPkd/N4VtbRt+FDzXMIYclSjLM5oqA8
         fFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729837; x=1790334637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        b=WRQi0JL9GW8FAs8BwFbVgZnwymvaaQJzaoQQnyQSVjZu4hO/V1F2oTNmn0gCzcXDdl
         3Cf7kKZWiW4u+l+btkds65GxzOF8ZBTqHab4w9pemQtgS+HBTNeO7BUHiAr5WCCz6E37
         CLCvhtDPglQSdonqCM5jXC0asZGe8n26ZDo0Kh6klzMSTUXbcAkKW+UjvqY6B16liMyD
         G3g1e/zYOh9NPCD7Clp3RkBLMaGtG/qEDGow+KCqGDm/4kE3pBWXQXQ4Ksaf58HR6xtN
         A2FtpRC1UVPxjO0vjGXqx6HmrXTvII3LR+5HstcYTKyHaPIJKQMHfw0VaFZQ/JV8vL7y
         AnZg==
X-Forwarded-Encrypted: i=1; AKwUvBwQaeks7iukVnk+nnQX9cPJJu7+oW3NJJDo3KC/yXqMqNXF+WmjuLY+WN8BiqdWMNp1lrkngPO2y719PuTlWgk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntLswId3LjHDf69MHEWPbBFsbKiXZSqgxNtKzMshE2RYLrDPEk
	pbC4n1KKFHTnQlUfCOy7HCt2uiiqcHNszmKv/7Db6BhaBaB3i9NbTq37q/+eDW9K+AXyaJzsrgv
	F2AzuXGWwTgD9v2LFC7oFmOU/1e8ahYmf8H9J0qoJ
X-Gm-Gg: AYBFou3/6+oP161lONyDScXvuTpLhHNr+XlQL9wojObWaiPCwM6RMKb/njjLBITyOxQ
	uASD+1upFB0MC5j8pJadoFzSw2jy2fbbxpkHNbkKefAXRII2fpTIcrykOosUTWV0kehnoJjb8S0
	mvDjZxG3AqaakJazidpEojXWU2bfz9WT8uKJ4OxcUNxzVePCxl7rkrhSSLJXaBZlqoWkE6IIA4Q
	fdVXrxI0TmGSOPGRpUWHQIKZTgqntAl+MgWhxcxpEGFweOU4p9JugIBM/2gTF9nV3QfW8wBtdct
	t1s1fnSGF1I52shG61J/N2suAdjS2YaMsbI+C5g7fa768/Am5EqLLn8=
X-Received: by 2002:aa7:d0c3:0:b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6aa5221e1a1mr19881a12.1.1789729836834; Fri, 18 Sep 2026
 04:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <2d608f82681532f3010db14ff8d4293f57620514.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <2d608f82681532f3010db14ff8d4293f57620514.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:10:24 -0700
X-Gm-Features: AcwNN1V-rgmx99EAasoSRH5nrhUVDqdiVaLr-XvIiqfmCZLZ0zQJlJ6-mPzgGz4
Message-ID: <CALMp9eQo1WZhtCEmPhsK=BoCkeSmMfwXh-JHsq6-E0HCkOunVQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> INVLPG's memory operand is decoded with NoAccess, and thus src_val does
> not contain the operand address.  Intercept handlers therefore cannot
> construct exit state that reports the linear address from the existing
> x86_instruction_info fields.
>
> Add get_invlpg_linear_addr() to compute the address through __linearize()=
,
> using the same flags as em_invlpg(), and pass the result through
> x86_instruction_info.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/emulate.c     | 23 +++++++++++++++++++++++
>  arch/x86/kvm/kvm_emulate.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index c1b21282187f..2972a35b0ac0 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -411,6 +411,9 @@ static int em_salc(struct x86_emulate_ctxt *ctxt)
>         _fault ? X86EMUL_UNHANDLEABLE : X86EMUL_CONTINUE; \
>  })
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept);
> +
>  static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
>                                     enum x86_intercept intercept,
>                                     enum x86_intercept_stage stage)
> @@ -428,6 +431,7 @@ static int emulator_check_intercept(struct x86_emulat=
e_ctxt *ctxt,
>                 .src_type   =3D ctxt->src.type,
>                 .dst_type   =3D ctxt->dst.type,
>                 .ad_bytes   =3D ctxt->ad_bytes,
> +               .invlpg_linear_addr =3D get_invlpg_linear_addr(ctxt, inte=
rcept),
>                 .rip        =3D ctxt->eip,
>                 .next_rip   =3D ctxt->_eip,
>         };
> @@ -684,6 +688,25 @@ static __always_inline int __linearize(struct x86_em=
ulate_ctxt *ctxt,
>                 return emulate_gp(ctxt, 0);
>  }
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept)
> +{
> +       unsigned int max_size;
> +       unsigned long linear =3D 0;
> +
> +       if (intercept !=3D x86_intercept_invlpg)
> +               return 0;
> +
> +       /*
> +        * Use the same address calculation as em_invlpg() for the addres=
s
> +        * reported to L1.  Ignore address-check failures, as __linearize=
()
> +        * sets linear before reporting a failure.
> +        */

That comment misses the main point. Perhaps something like:

        /*
         * Ignore faults, just as em_invlpg() does. Calling __linearize()
         * exactly as em_invlpg() does guarantees agreement with
         * em_invlpg() on the linear address.
         */

> +       __linearize(ctxt, ctxt->src.addr.mem, &max_size, 1, ctxt->mode,
> +                   &linear, X86EMUL_F_INVLPG);
> +       return linear;
> +}
> +
>  static int linearize(struct x86_emulate_ctxt *ctxt,
>                      struct segmented_address addr,
>                      unsigned size, bool write,
