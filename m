Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A9222575
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119083; cv=pass; b=Np9kfhY9nloY6nm+1tB7gj5z5MuSt7n9eY77Y358cukMMXso+bsji/RokOaQHUOudoP7/qjnA7D+IMgVlqbezbuvVBrTYKLQ4R/oB/FndwKnvl9120DqJQ3g1andJGZEOFM8LuqxYh/brKLFIFRUQuDVvC2SoBBqqQ8DfROI0NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119083; c=relaxed/simple;
	bh=Jfl4dZTufIKAHIVFT8NRO4fD8XoSRUWOc0fet6SBpt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+wDdjKdI4FepUEz2B8nR5wV6/kOHUOnFJ7kmW+q3f+EtjUOR0wtK79I+5Yzq+n8bt8xA1YylqTsKuegADmyJR+jRgBotVVYeV8kwW/uU6jdDL6kep+Krws3uMfGoRwF2wNFQ2/ABcEbJ2BMMXe8GweXjFLPfNUmuIuaFy+S0bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=39uLLe/+; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="39uLLe/+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso1682a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 13:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769119073; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyNd4Axrvl8XyGgLN9fyvBXLIIXxVgLxAXgfkFQ2gkFXSs/OGBBmA4PPKDl2TDwBKD
         lfT2dhJFCVKtKc584daWDZ1DWFBE3a19ZGQ2TGkBpH6RQRkSK96l9T8z/s5WRKzGX6Vc
         GygrYAkIXLldwoLKkfs3WRWJtiuEs0s+WUY02t7JvFDgnq6GOIRLB+xyhaWoUMCElIGJ
         nXW5yspMq1lzHOznu6GaUtjgGFcs4YHsNG1bOWee9OZ/2irAlYE5L6qEqbEkU3Ct8gfC
         cGADfFX3qfuRmiGG+BIFcpTS5sbxlvopJOtLTQBnWotNapEXAlein+X2M8fLjREyxBRD
         Tbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uGwfZfWxv4dR3vjl/Vm+r9X4BJKxCk7dJgsJmeqfMnQ=;
        fh=89S9eYyBzunUkZmqsjKdLvZhbPXLFKN7m2umuZF6XU4=;
        b=XrARPFb41qM6HF1VHPyoKgJOSDInkNqz2TYhmZ+v7ttuwqf1ayoyx5itCK81bFDmkS
         /GKsZauKDT05DbQfQd3UMpMhF0O9zI9GKCThkW81BFgMl2OhbteeA1NMTBSCW3CZ5uyr
         UZqgbhFxPYR4C14W9rZlHRO6cUV+vM3EJj71M8MLlXGRvFAb9xqCjo74PQYDQty5Z9H0
         0hDpSzTBevBFt99MlVdK88YK7IFcJTHf3RxCqurRFsvY+i5e0EfVAHmG/f28qoLYrpgz
         AjqAHr5JI5befFcbOKkzMaGmu4OTX0146F4cxtpwrtUs3KStUsQDpQpGIiN3fwobwWMs
         y86g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769119073; x=1769723873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGwfZfWxv4dR3vjl/Vm+r9X4BJKxCk7dJgsJmeqfMnQ=;
        b=39uLLe/+p2pOzi73YG645N+IWdxlxqq16hn7teaCcByjiyapwG5CLMk86v9UOsG37w
         tQJ7CR/icVELRs3rrW3eMLbsjKeL5uR0F681oe2+YaX7foHkmmwCOCZ+AUt6tKPYmw+x
         8fjsmlhcBOBI5XtN5RlBP0xCtGiZs8dvuuZhkoKn8X0Jjdm0yi1sC/1we9S5X8stEq+l
         xglNJVygfboE2zIoF3NeQhg9oQANS6+7r1TMpWapzhjduTElU8RAzNNW3GPS/v9Hv3sB
         LGUGgFkyd925k7csU0t2FlC/DC9S2LW5fAk2TPYS39fprHQ1Fn8uh2msMtXgVmSV9nK1
         Uogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769119073; x=1769723873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGwfZfWxv4dR3vjl/Vm+r9X4BJKxCk7dJgsJmeqfMnQ=;
        b=P8rZ0F2eyQRdPH88YOXhFu++g3ryS1L8lafNSPqVl60ilT0Axwz0S3i+JHCse9IhXo
         kiCcvjfGO7vVqgWp+dBKRGKambEzWi+6mf1WWBiREeZxdsCYc2V0hEg3vLGdCjJxLjXH
         9YQwibl/58cU2QYkVGgVi9vU2Nxk6Fqsta27PpzpdxSEshJLMhxY2low7tLwweSeDKgF
         QMorJoeFHA6/fcE9HQOydBB3fUpl5BwuA6UQ2qbVFEkUWhRHf/KH35QYCFcdcvzy878a
         y/ZyXZIps3mIgyOH+tTqaYQ6GbmxyUqPlzptEWtp9xTDUajd/yeheUnOTL5xcCpyrlBP
         9d/A==
X-Forwarded-Encrypted: i=1; AJvYcCWobZgD3Jg20bGmn36uIeq3Ln74wrYkvkXt3SDtzNoGXcUB1EBSUWKjM8GWE4HhboV0kaCcOAOx8WN+xSjBw68=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8r5N0Cxwi7dByeNpthrH4Kd6/dP4annVTFUr1yZe2dd+6TIis
	7X1qOJn9eMSdg5lIPuThSFVwe/flN7HbvOoIUIITa9rvycW/9rgIxs8N8T/jWxXOuCbunYHoI7R
	aH5Z/5UdAZ63ErBk+mTbdl0rqcj8TKaMCNY7MePLr
X-Gm-Gg: AZuq6aKhSLmR7srBdTofmhVoDIOw0+X2OYgHcfF2W2MrC1vs494uNS3yGqvzaFx/u0D
	fvyPzx3PWSbwIrJTaKSE0O4YbQyMsMuM2iFTSYOL1WAkXB76K+dC+6WQyNkHbN5bUURXXZ91exi
	89Rm7tmR4OYIx1n7oLQF+yB7ha0BAKosQuMx7HC2+4QKRiWKlWqoiudPCyIaEU+gRcm7neWDNPO
	KTQLUIFs48A8UEl6ep3K2J6o74gUwsGayDpI5aasQ/YhHgj0LqHs5necCs78RnN5nodRynzsfO4
	eZwcybZ6CkIXl8AzWTVayKgY0ZqmXs8Tnw==
X-Received: by 2002:a05:6402:5144:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-6584eabef16mr2044a12.11.1769119072536; Thu, 22 Jan 2026
 13:57:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-2-jmattson@google.com>
 <aXJKdlJI3fg42gim@google.com>
In-Reply-To: <aXJKdlJI3fg42gim@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 22 Jan 2026 13:57:40 -0800
X-Gm-Features: AZwV_QgJymUgNy_50vQyL9SN8_pY8sRH-FZ0KRcWUNAUxqWJsSqINclPGSmR8dM
Message-ID: <CALMp9eSNqqgLN9dMzer9Cj3hQ64fB2T==hB_yjvNBK4W8Pn66A@mail.gmail.com>
Subject: Re: [PATCH 1/6] KVM: x86/pmu: Introduce amd_pmu_set_eventsel_hw()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:04=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jan 21, 2026, Jim Mattson wrote:
> > Extract the computation of eventsel_hw from amd_pmu_set_msr() into a
> > separate helper function, amd_pmu_set_eventsel_hw().
> >
> > No functional change intended.
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/svm/pmu.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
> > index 7aa298eeb072..33c139b23a9e 100644
> > --- a/arch/x86/kvm/svm/pmu.c
> > +++ b/arch/x86/kvm/svm/pmu.c
> > @@ -147,6 +147,12 @@ static int amd_pmu_get_msr(struct kvm_vcpu *vcpu, =
struct msr_data *msr_info)
> >       return 1;
> >  }
> >
> > +static void amd_pmu_set_eventsel_hw(struct kvm_pmc *pmc)
> > +{
> > +     pmc->eventsel_hw =3D (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
> > +             AMD64_EVENTSEL_GUESTONLY;
>
> Align indentation.

Sure.

After wondering about how to configure emacs to do this for many
years, you have spurred me to action. In case anyone is wondering:

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'statement-cont 'c-lineup-assignments)))

At least, this seems to work so far.
