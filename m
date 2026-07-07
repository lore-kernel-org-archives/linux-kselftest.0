Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25863939B3
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450606; cv=pass; b=iaYEYqgjXDAaj4PYMN1OloPPcRmeMHnjE81Oe9SvESwb3JXVNOidldG2PgixjSe/nEslpfzugbWjxbnmHt/Pc4w3l0+dJkEkEtDyqoSLXBECRH8fjWq2xSLjrZKM4xJW3lXA1l4axQvJgEJsC3FJA7lRXfy6ayfK5d50Lkc6NW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450606; c=relaxed/simple;
	bh=Igs+/mf1Qm/Jdq/UV2XGaSEccSOZ0Mcwbq3G8sJTIaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHCFMIzZI0obX5e/jGwA1b9dIEcHji3McCfOzGxeu+tgspcRUTZU/y3CEthZecvljCnej5CTTKwiPkLj33dJhSABqUeM5sUorGXJ34w/ZyV0ZYGP2rlMNaTlLWJR+GxIyLTJrqNbWzxhf8fh6wmkd89wVTWOMWzPx5cAlKWY9bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wVjgczHY; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wVjgczHY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69a45011a92so1911a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 11:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783450603; cv=none;
        d=google.com; s=arc-20260327;
        b=IFu6iWqzFTkJJHDjBsqmq1LOVq5YY+sXweHhvwt76tmAuXt4WBNU47EZbGJ/ic5EcH
         85vbgl3rI0oLLAvcxjXoNaEhFwsQI6+ElYibkGai2MEOVwNM/eUkcAr2emiXq5+yaQDk
         zc05rr/a1geWV0+kjsNxbLn//CIWQ4l/PXLYYW/1AG57TpkWUzTmJYdoLGqPr8ZUnNGo
         Q5U/5VEgQimr6BVPkoF+22x5Js5O3+pQy3hhIvOpTWK1kx1bGHY7sddIh/Nh7+AUqTu2
         95jdzZnkwbqMiGu00aOXIRwjSt3/vf+NnP7bg84p9Kkq0C7VIjeDCUY02DoQcIxubF4s
         twuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NHEkf5rCiewzBADWuxq4aeYbW814Bkh0YqaKOSrf95g=;
        fh=Ax7nVxnuvFS4YU+NACX+VNyIlshPkb7hqF30gWDHBwU=;
        b=sE5VERm3C+jfvJxysu+L2s/AhO+GJRNm5iE29xpPTo2aJAGtHAFuVHqY624i3aO9OH
         OM+Cot2fDfvQ+LNWUpeGoaG+xVt90gTMFYJOdGLdkMCj5SatAoujjGZZtvQmZ8wd61sO
         4dHE2CzkYYGRHQ3Av6y9puDW9SQJf2wvCvWrE3LJE7mJTX+5Cyx2O6zbrSN452tANM1i
         abPoQud6nzBcNhLBGYsoF3n7kylFysCrSbJxe0lobHwWSABUpLNI1FGovH7cXmW9nVwi
         3hIAwqXD6wdFmCW0mUX9I6d8JROdYgQfAG/5Jh/K0FH3PYw9dmqhSU+uhuuy3uKQa9kf
         rq/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783450603; x=1784055403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NHEkf5rCiewzBADWuxq4aeYbW814Bkh0YqaKOSrf95g=;
        b=wVjgczHYXOMviVYUeoFpLymNSS/21Ahe0KEAiOl7Kh/aFoyqoaLuaDSkIIJNGezGq3
         /2XPq4uoAuExWuUUdFRTVrfRiXQl/SLiNgryYdrg1d3CFzgQLTPdwURC/KYvqRdxTfts
         b6c/q8bxdVq7dkm/8qw04c0r7HAYkyZmS/s5ttKCWGECzXDCyg+H0/IIXAEop0z+JYfr
         SroVsgZbFLI66Np0fnYCCiO85COMhNsGX1FTACkKuSmxYIE3HhO7bm5TLsuHRxOzu9Hl
         HhIOyeLptgFlUDJI7yyb8uI5NRSuOruE0PBSVbvJgpBOCD1zLQcIKEvMwlOQdKrNlP6z
         uplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783450603; x=1784055403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHEkf5rCiewzBADWuxq4aeYbW814Bkh0YqaKOSrf95g=;
        b=J4/Bj6PJvlrBYFlRrabN8pGEw6FyRZ8W4/2oHki6bu1mHmoCYtTKSSEkimQwveGJ4t
         cEtcy+pGHpvHIZsNkFGMuG6muVC99VTPyR327EDhUrIbbNwfgoB/Oxsno6Ntn0jqpGHg
         YHAIPe4t+jt1J2ywZse2IyO33Tb/NHhZZlxKUkyixDt9C96GnMFnHf3At+UsGrlOFFPH
         5HWMW12OfNiOz+4l9Kpyff0ThxTChxBakSBgU3kNV1fGI3ZjweOQm1UXQfhMo/ToBzIH
         upWl47a6d44XthQ9p15ZJ3lKLbVTlM1TGeSf3d75OAJofc4eosKAUKGvqliwV2SIMfPA
         FxIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQCurLrEuakuONxPuHodOVfhgcKIZNmj66Tj5d3g572nomFvHKoAYIQFDn6XCZoQbifbanj/jfBb7WHkFAUzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZd8rbifZSCiZFmCJdRiseiySru51eoIvS/sFTxS01xWRmWlLw
	Y8ZfwuXdIrVb+bcqmItjh8N2o29BSGV2iwxYv9ANbtzOdGJiHbViYvm6JkdxzoK82LK4b9VitJW
	BP3piPov2RkIG6mI4p1yM6gn/e5+7iOkuhErS78Kg
X-Gm-Gg: AfdE7cmdRWA8U/GwoGtVzsZju5w2m8GJvIXyFyfZVcfQ3x9t64D1kFt4pSQYxWs3y2F
	lhNcbjQVpk0qgaRm7VC06VYhmdyGKgM/u8X2ctq9V7JRQwv6+7jf3Uv5sDxAMqBbNYrdy3RqGjH
	q/akQM+j5+FwmuP3lMq+qH3wu6SHk2vldIhEYU/DgK32OqVg9QyE6E40o6h1ehlFz8hvM587Xi9
	Og6RZOL1skHdY47h3O9iczYHCNQrvZGIuNApnJafP/aChQdx/n+BS7sSf9mRgF+U3USzU/qbsQA
	vlZFwT8=
X-Received: by 2002:a05:6402:21ce:b0:697:6207:bad9 with SMTP id
 4fb4d7f45d1cf-69a9129fabemr94852a12.2.1783450602781; Tue, 07 Jul 2026
 11:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
 <CALMp9eQXGYevLQJnEV+Kx6hvp84vPQ=2U8AfZHiZrZj=CVM2hQ@mail.gmail.com>
 <ak0QYnYvchKTnwxS@google.com> <CALMp9eTK-Dg24geFN6tnkoD3rc4ct6eZcHCBv3EvPYOhBvaFaw@mail.gmail.com>
 <ak0frVw7GZ3HTwJV@google.com>
In-Reply-To: <ak0frVw7GZ3HTwJV@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Jul 2026 11:56:30 -0700
X-Gm-Features: AVVi8CfoOWabuW23otSrJFrdN-eeDtK9MNIudaSZ-7KRgXBFb1zgV3EH5k609DA
Message-ID: <CALMp9eTqVciHZXw+PSvbHWChDpAwjAoH1=f62DcyoqgneAku9w@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Sean Christopherson <seanjc@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:47=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Tue, Jul 07, 2026, Jim Mattson wrote:
> > On Tue, Jul 7, 2026 at 7:42=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Mon, Jul 06, 2026, Jim Mattson wrote:
> > > > On Mon, Jul 6, 2026 at 8:25=E2=80=AFPM Jim Mattson <jmattson@google=
.com> wrote:
> > > > >
> > > > > On Mon, Jul 6, 2026 at 8:21=E2=80=AFPM Sean Christopherson <seanj=
c@google.com> wrote:
> > > > > >
> > > > > > On Tue, Jul 07, 2026, Tina Zhang wrote:
> > > > > > >
> > > > > > >
> > > > > > > On 7/7/2026 9:32 AM, Jim Mattson wrote:
> > > > > > > > On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_we=
i@open-hieco.net> wrote:
> > > > > > > >
> > > > > > > > > I will take another look for the next version and try to =
handle the
> > > > > > > > > remaining pieces properly, while also making sure we don'=
t expose stale
> > > > > > > > > or incorrectly synthesized decode-assist state for emulat=
ed exits.
> > > > > > > >
> > > > > > > > Naples erratum 1096 seems to imply that the instruction byt=
es stored
> > > > > > > > in the VMCB are not necessarily the same instruction bytes =
that were
> > > > > > > > fetched and decoded to lead to the #PF/#NPF. Hence, in the =
case of
> > > > > > > > emulation, it might be sufficient to read the instruction b=
ytes quite
> > > > > > > > late in nested_svm_vmexit(). That would certainly simplify =
the
> > > > > > > > plumbing.
> > > > > >
> > > > > > The plumbing doesn't seem all that complex though.
> > > >
> > > > What about the case of a userspace-injected #PF while running L2, w=
hen
> > > > L1 intercepts #PF?
> > >
> > > That can/will be handled by the fallback logic of reading the code st=
ream on-demand?
> >
> > Could be, but I would prefer consistency.
>
> Not sure I follow.  Consistency with what?  If userspace injects a #PF in=
 response
> to an exit from emulator proper, the emulator context will still be valid=
.  If the
> #PF is injected for something like X86_WRMSR, X86_RDMSR, or MEMORY_FAULT,=
 KVM will
> fetch the bytes on-demand, same as it would if KVM itself synthesized a #=
PF that
> didn't originate in hardware.

I was thinking about pre- and post- suspend/resume. But I didn't think
it through. Any KVM exit where userspace can synthesize a #PF is one
where the VPCU can't be suspended. So, I retract my concern.
