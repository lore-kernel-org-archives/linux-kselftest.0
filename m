Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2878642086A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 03:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395148; cv=pass; b=LD4ArnDtCHsr5nlOPsSqdvQuQpsvF806iJgYdOm7Qxl7jBm4ZQ1kNIkpjbq6tadPQicFg07Y4Cm8dGhYBTPMy6M4O8sNuFSCFNAui1zaWJ5t45qEfSp0KvNfh1IdTbdJ+rYUEoqJeAa5Z4IBa7RZAZ48ulyc9pnfyHuWH+PO2qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395148; c=relaxed/simple;
	bh=JHMabzQ1PB0pYgpwx3N1IWMZXeMArHJvTraVIbD6+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+AROgDTt/z4NP6KZ3wPI7D3fMu87NeAchfZrvnWh5exl4qF4hwt7+jeSEoC4XkFeGUZ4LAC12vjxlOyvJ3B6LQdirZl2ZXM47Uy59yy1Da+24Nc4AtLFVBd2jJ3HH701o2bgn+cAY4XgxKzbbUnCnw8oYo4K/XlNEUwr89GEmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMeajcfV; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMeajcfV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69a19eb2e6dso1731a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 20:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783395145; cv=none;
        d=google.com; s=arc-20260327;
        b=JHT7b+W23zQWL33Ms1+IMTtfTxl15hwaNjQFnEkUKi9wlepvBsnbPTcz6nNFJUvDLN
         QFX1knaXylO/oDkmuWyhlAKiw+Q+Q7A16NW/zAYSYYbndlg2ocBvprrtzXNUcg2RyU0R
         f/JHRyvv+hA9BYIVxxGeQUfxtxXcpXoH5zPhIB4FvPgqMZoIa/D+ZvfsdrZsWHiz+zAY
         HCk7bxH0ZGmA9E9MQitx424hgelEQsenAa4WmHcimUpGjIVTvL+/yXBbPsKNJsz2nB4x
         x6IvaZz5SjR+g3Za1wwUCoG+VSuffVZ2kg+dHpE8r2sKYehsgHaG8xI/5lkWmDOlnL1V
         oNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHMabzQ1PB0pYgpwx3N1IWMZXeMArHJvTraVIbD6+WI=;
        fh=kjICNwuoDxWhil0PLKVW/OpyXzurPt7lhivdTD93FiI=;
        b=fNunHG2RvNzFDHCmgAKJ8jBbj5fErcLl1HCuyGUl1BwZ0VZ957JfKerSyIp+ZBho1f
         ciGqOlR+fHO1hGgruZXyZrrZvlBaDfsUf00H9OCcrPkVgtroDvXlKJBrPCtWgcjeDCot
         kNqoIDxb4wYsJrvKjpWAtmozuvLqvFJ5vXXDrDLogDFgUFEqXct+uSPzDJM9Ov3/nYNg
         mbvdCM9IqdjEYcnehm1nj/t3HllN4CwIwKNQFM2TWGzQbGkZJ4JdgDlgGTRSdUMDl6P6
         eUDoQ/tGrBAj2/BxPC1Ng8XLtoTOaJ4Rm1oBv8XSEOJjbEApj1stSZbZ16+tu9UHqtfy
         REww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783395145; x=1783999945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHMabzQ1PB0pYgpwx3N1IWMZXeMArHJvTraVIbD6+WI=;
        b=rMeajcfVta9/RZaUTUW4oYlg5J4YztwXQKaKnMtP3viZtscgDS839UnB4lhyveD3Uc
         Ii8TMcKj6nU9+s18vMI+t5TqGsRWJez1aeWHVCxJz30jPdTuJDMJ3Tu350PbPML9tGLJ
         cV+uOTyPPok1RWsz2i4WR8YqezoAfLJvpyA72zTAszB+pxnUOtsvCcYCJ1G394Yn+Y3i
         8NntVcieDRHP4d8P3Wxnrx+AHBRq0ZZ7ZQWZKFIPUJxREiTi3XFMo2vQIZNb1me2H6a5
         riVocoPTEuPcLBPTriGpo/JAiP24IVc1pNHHKj1uUxkubIaSE0RjGD+0YC7LMjYxJXWY
         /XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395145; x=1783999945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHMabzQ1PB0pYgpwx3N1IWMZXeMArHJvTraVIbD6+WI=;
        b=DDdS5N7sFhtMVwI/6hnm2twGdn2iRtIUIG9v6/V5aUYQg5hnuYJBouYmeX3hJXBMCD
         O00S8HtnDOxL0i8fHY/G3yBdDG/MFcSRSoLNzENrWo7UxF63LweXAgtcWplDP5DyFVTq
         o8Bvufn6M9khQjtX+m6ys3xPCAnBvZz6eVs4qDjYdYYYVlrWErndowii0e3/KPf0BFQr
         CjC6IWtOmvRMUbaz4mY6cx8N2ALLRTK1U+kfoiq9B1fKtn4lht1j9jZLc1/wNkELBxdz
         urzrctIZwNYrBBZ2qdjyzTQ9wyt2MKWT+stDzsgcRfZSsdn53q1pQhGehs29DMs47tsR
         P+WA==
X-Forwarded-Encrypted: i=1; AHgh+RosUHdlPaknLdwd3lgrepsmIW/jT087XVygyR9u1K2aH4vKpg8aYhWi8gXjtkZVVz4MP0aruchHobyf92eywc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbGV2/xBh0MvdhvpZeDp33jPwcWh10qB7h60LDvRK8N/EqDY3
	7sZS7y05siU8fB3nWVhbn0wx54k5Z7gnFqlSHLGGlWhdH9L+Y1Aft63dCbybxvlMKkvxBPCM/fN
	lxfC6rHw59mwx5k8WAClQXCGDYI1F8MeBMoMRXRQV
X-Gm-Gg: AfdE7clekbU5oMakk8vLrLQLvbfXyuEGHwb0O7k/yR4EVJV+bGANyTcHFRJ2CXn9SbR
	LjaF3794mnDMUWDBnLWm5n733+pKJAXvXooP4/BlxePE87+c9+uftN9hVPuy+b9zkmhgpVhzPP1
	M6HJY7re9IPVOOvaloPvfdByt7cxQvHSqnxwawQXumwLWxQXhLgd1Nz8mLq3ao9yFDCoR/YHxtN
	v4VDMlx++LmdOuZwmUaqiqiptALCeenJ5jnXWrER10hkVRL0UuIk4w5mOmKKQpmtk7WoEkGI2BY
	+trq3zI=
X-Received: by 2002:a05:6402:5648:b0:68a:e1ba:9cc0 with SMTP id
 4fb4d7f45d1cf-69a91343a05mr10004a12.8.1783395145232; Mon, 06 Jul 2026
 20:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
In-Reply-To: <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Jul 2026 20:32:12 -0700
X-Gm-Features: AVVi8CcATv0-eokO_Wpr1SytCQ95kvkWSmREbAjSgHaHchSuV2W_ugKT4eGqcTg
Message-ID: <CALMp9eQXGYevLQJnEV+Kx6hvp84vPQ=2U8AfZHiZrZj=CVM2hQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Sean Christopherson <seanjc@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 8:25=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Mon, Jul 6, 2026 at 8:21=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Tue, Jul 07, 2026, Tina Zhang wrote:
> > >
> > >
> > > On 7/7/2026 9:32 AM, Jim Mattson wrote:
> > > > On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_wei@open-h=
ieco.net> wrote:
> > > >
> > > > > I will take another look for the next version and try to handle t=
he
> > > > > remaining pieces properly, while also making sure we don't expose=
 stale
> > > > > or incorrectly synthesized decode-assist state for emulated exits=
.
> > > >
> > > > Naples erratum 1096 seems to imply that the instruction bytes store=
d
> > > > in the VMCB are not necessarily the same instruction bytes that wer=
e
> > > > fetched and decoded to lead to the #PF/#NPF. Hence, in the case of
> > > > emulation, it might be sufficient to read the instruction bytes qui=
te
> > > > late in nested_svm_vmexit(). That would certainly simplify the
> > > > plumbing.
> >
> > The plumbing doesn't seem all that complex though.

What about the case of a userspace-injected #PF while running L2, when
L1 intercepts #PF?
