Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F838CFFE
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289814; cv=pass; b=Zre9QknTbbXpz4vVpMFKWDMbzkh+Yvvd00KmeM7gQThNbp6kA2+HjKRzaoxo9nP1EaA1vPhp0srHuog+3qbuTt3Z5jy6l62BGSyrXpqUhznhIiukxc5TNABEjB4W1YSN0pi7jgT/UD6dlefq7b9YRao9tZgu6d428jUzCMK3iyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289814; c=relaxed/simple;
	bh=IQZpujVP87VTdmXVxfTNfi9J/0IXL9EHLyAaVdEbWQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFuhstzYZB4USi+Gf3pnbeVyZuVppcu5NPWvX03j2Bn72WcQe59nS6Akd2ocXHSOPV8AkwAsHvAg4ivO+hYAE5aHiCz613+rwKoH9hJ3gdcv3J0c5FSBFU5ryXQHXS8g02cQoGquvRvTG3TEgjbYuCkAi4DZ68/uuzq+rJww1ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNqgjgKD; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNqgjgKD"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-138501f8c04so379163c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 11:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781289812; cv=none;
        d=google.com; s=arc-20240605;
        b=gZzBfiyRXubMTbQmJEtk1z5rmfSXdF8cRlZOWL1yJ8hWFOswJM8l2eFPeqr1aLsVwW
         h7vBqhleANxhVsmPcmUyS26t3Pg3Cgp80rpn6S/35+a5V1LbCIPtPmRN/KqoY8bjWXPp
         CnE1Gyp2jeYVgpiGvWaRNSIJs+VCs6MG1aV6WPHrh8HlX6+9wvsuELOmSlckjQTKSNuX
         ULuagPh5sBiqVmOINW1wWGovKV47MfmVBINHFwFrkEJwnHjNHuBAA8HJ/4y3haNSZLMh
         nI+kV2cB16C3zQ4g+fIgL900UNfQZXCoSt0pG0CiEgIlIiX62/nSmQ3mHh7cju7/qZuv
         lnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuYKYCkwO9VPPo9z/rSbFexmMoWoCjN3fygPjKuaDfI=;
        fh=QzHHkxJ+5nxd4ofI0mf2xFVXJfzMki2hkG9pcTAAK+c=;
        b=aL6ChL4uFcNxRshflP8eikC5HBjUsOcifOUcgdNwETNa89OGCN8HMCU2GFq6Gi+FA0
         aSr8eiKOFTusK2jdsxTA4Hin4iWA/EEclLXRc/WaMxWpsOGkLKJR3CRZg8BUAF9zW2oM
         pATTP5ofQulG/tj8ngSDt6vO0bGD42T/tk32RlBdTXpSV58Fe9ZxsByXFZkTOv/YfeWI
         6eYySm51KYWdWqddN4S5kLGbD9o9KekAxpq6dB9wXvXwYrBRVKC3TxAukzLzqwFo/K8f
         n4fDjievCzMPlz08cAqKWknCTYzgybFvvpV+IuhOpgv2NhF+WMr2GQVp3A1hAk67WAfu
         dUIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781289812; x=1781894612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuYKYCkwO9VPPo9z/rSbFexmMoWoCjN3fygPjKuaDfI=;
        b=FNqgjgKDckM/ef/CMXnPTNMN1jfEk8s4gs8f9SetKVyxbd+n4K1AEEwZ3OYV0H9yw4
         TndiQagpsw9Dv0OpqPJmlWl/X2s99mp5geH0oRQ5iP5EWzQbOgGz1/OmDiNiRxXKEqLg
         PthTVFY+8Zzjbo3qsNgag8YlB9qYdkUToYF5pC4fTCsnpQZNIT/38ySyjf4F+HbiFg+j
         eFNaOxY7BZnmnuXq2mqSLvVgyERmOmN5pmLO8lgUad0/tjRIBIN2N6LgM7+el73WXaS0
         dlu5/OuXV50SmD3cWcZzGLqXCgD4lKqGiYuSS/HbmTtMIjARhWiMh4+a9NrxSxm+LeFy
         LH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289812; x=1781894612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZuYKYCkwO9VPPo9z/rSbFexmMoWoCjN3fygPjKuaDfI=;
        b=dd17SjhyqYFGMf3g6ELQymF5OpMz6tH1EYzc6T5nqCqzyLodDcQobs7Z+Pfhg644w3
         mwOxOpYm3t+IQ+eK511AI4VcnMqeLB5ykoB+0oWrz2kilmc1+5BvwGgHNsIPM2AJ/iXi
         D/HAI1QP+6icN7ihxbmJ1udVGcdCnedepccxd4gjoHMrJYyF4NTO20++pOzRSwJKA8pl
         TyFk13956MCxj3tCuepBTSonlisqcbnt4lWPq5kGPBZbPcM420Ar8JqPzmwPoK38rwJE
         UYnpTwWPBZ+dvm89w5NahnSaxEKRa8ELAg9u02FhuNw3TSXqydQC3de7PdkgopFN2TtQ
         CUvw==
X-Forwarded-Encrypted: i=1; AFNElJ8fY91rPhqPbPybVlPvTj0SFUNzocbr5xtW01yDpRnT6kTcNkyXSaehfMyfhuLGagVdnR2FO8e1kIuC1Rdoc7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8T4aL7IthtSAEcygDkAxyKwCyFv4OFT7gBjrVBNmqExC10Hnl
	J2EjvbwKKUJuxnHGOvGmuaXZWN9Tti1mr/4E+yyoD7A3d0D42V7UawNELK2iXpUG64/2e6u1MT2
	hgpnKuHLY4EXRVJcSNFkovdKzVONuaa7kDji61xaF
X-Gm-Gg: Acq92OFdfAOVmgueeQKHjJBnWZBtagwbQ3We+ePFg9s6d+2HU0pa5a6QMHEqn4ydTMB
	6PVmBPtK1roChP/XMv/EIzW0N6+Ky/navQdGdK7iAmy5CfH+Axu5NgnHULkbuLEXt0hJ0AfC/aC
	08F/861sdLIyBqOb2bET4SvXmW7nqy2gfleGdm7Zo4lWp5f+wpKtdCjMt1zvcWkgTPmdPzEOAbs
	PPNcS+QGXBPtChzf9ryiumjculRUNu/uyLrxo4ejUeGWUpMTPd4PNbhkdBBOAzjbA/FMQVqhy1u
	a8S+G8eYIPGv4vyt7IVTF5tZ6soWxudrde9VHooWGt7i/bpqC0S5riYuBwHYSK80X9gnchfCN9E
	zfviaIC+5hL7aoi8i+jMVkrhMTh2pU33PpISzHuaVQu8y+ZH75qtc
X-Received: by 2002:a05:7022:418:b0:137:fe07:8a2d with SMTP id
 a92af1059eb24-1386f24121cmr436470c88.6.1781289811262; Fri, 12 Jun 2026
 11:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612130919.299124-1-jiayuan.chen@linux.dev> <CAADnVQKL26zPepqOf_FtuA6ALQEtFJmiKU12iahdvfeAyJ7XhA@mail.gmail.com>
In-Reply-To: <CAADnVQKL26zPepqOf_FtuA6ALQEtFJmiKU12iahdvfeAyJ7XhA@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 12 Jun 2026 11:43:17 -0700
X-Gm-Features: AVVi8CfZ2Yztrdd9Cz0a8Cioo193fVEec7AtKDsitODSamBkyRtcTNl8C85ikBY
Message-ID: <CAAVpQUBmiyfW-3FjssDUmbOXyA+QbsFyATEs2D38ZbWfpNQE+w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/7] bpf, skmsg: some fixes for skmsg
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Kuniyuki Iwashima <kuni1840@gmail.com>, 
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, Shuah Khan <shuah@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Sechang Lim <rhkrqnwk98@gmail.com>, Cong Wang <cong.wang@bytedance.com>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:10=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Jun 12, 2026 at 6:09=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.=
dev> wrote:
> >
> >
> > All fixes are from previous patches sent by Weiming Shi, Zhang Cen,
> > Kuniyuki and Sechang Lim, which have already been reviewed by me and Jo=
hn and Jakub.
> >
> > https://lore.kernel.org/bpf/20260610081218.506709-2-rhkrqnwk98@gmail.co=
m/
> > https://lore.kernel.org/bpf/20260520102715.3033936-1-rollkingzzc@gmail.=
com/
> > https://lore.kernel.org/bpf/20260424190310.1520555-2-bestswngs@gmail.co=
m/
> > https://lore.kernel.org/bpf/20260424191602.1522411-3-bestswngs@gmail.co=
m/
> > https://lore.kernel.org/bpf/20260423155807.1245644-2-bestswngs@gmail.co=
m/
> > https://lore.kernel.org/bpf/20260221233234.3814768-4-kuniyu@google.com/
> >
> > The automated reviewer (sashiko) may still flag a few other potential
> > issues on top of this series. After looking into them, they are either
> > already covered by the patches here, or only reachable under very narro=
w
> > conditions that require a specially crafted BPF program and an unusual
> > sk_msg ring state, so they are not practical to trigger and are left ou=
t
> > of this series. I'm collecting these fixes together because the same
> > problems have been re-sent many times in slightly different forms, and =
I
> > hope this series can be prioritized for merging so the duplicates can
> > finally settle. With so many AI-generated patches floating around for
> > these spots, leaving them unmerged just keeps wasting maintainer review
> > cycles on the same issues.
> >
> >
> > v2->v3: Target to bpf-next and carry Emil's reviewed-by tag.
> >         Reverse xmas tree style is used suggested by Cong.
> >         (not all code match reverse xmas tree due to variable dependenc=
y)
> > v1->v2: fix problem when fix the conflict.
> >
>
> Kuniyuki,
>
> one patch is yours. thanks.
> Please help review the rest.

Sure, will look into it.

Thanks
