Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB4350285
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712185; cv=pass; b=JNFwGPNSO9A+SRLFy6mge8uS8x2hDV+/8xHObmdwycJeX+3ysYIlcth1WjbbFcpvt+2yP/kC9cKqCZAjS9nWiC/14aAcmMQoZOxrtp6ZaL6JcvssHf3HXtwnud6WlGxKBmb5pXXGC4Lz6WoU/dZqTtJmDPsRO0EBUDM/awEdR/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712185; c=relaxed/simple;
	bh=xsSKiOspqG/+MtQ6W1neljIxJh5ynRg01+19OLjolSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ga58uhM+Itu3dXo2aSFf0zP+GQJVDIKpRrMIZQo3jBrQBcFY/GwgiiPtjW52AcIpHWHE9aqYLuzdT8qPaXMAgeGZeL7OJ3lq3DEx8RdXxi+hYqtjnLGvgkElWP9DRYNeknjvlBmwavbB+Q44i3qGM29KfzkHB3kT+DnycgfrH60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWePuTp4; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWePuTp4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so6327a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 09:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788712183; cv=none;
        d=google.com; s=arc-20260327;
        b=r9hieZyuTup18SPG9Npb1RIYJXn1uXGvxEHDpVHkPi/M38YN738R8rQYONEFVzunFs
         Yv0tEGDk86dG9n3wMmwWZ/hvLSfA8hknSVY1NH6urHWaR+rt0W2h4lfATtNpikH7fBui
         HOvvTV+NtD0Oi5OX+6nP6/VD3ctJ76RDkFO94sn57xTCUB3iJ9AIupRrTFUaJ+kyVhik
         taXEbLCC4eUaFBGIhNnpracb5BZoi/vN8M1agDnGk1a6oQpk9bbbNju54WdUmCYn60Uv
         HAwNebjCSYg/vrtQj7wDg6t1BwVVlsola0HJNsu6zICBT+5xqTEoolbxhj8plH/yrc8g
         i19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        fh=zJtGMi5RRfxUD7ZCK8qb/LhrNMxmhMkgmrtuXT9SFho=;
        b=oVlvURaWuDu117ClnO5HC3OCBVfNxb4qGkePz3txYt9E/Ex9UwoXhnRiOEJfk5JpGy
         L1pDT9WAeNtM0aGRUjpQjZwtuoXVlBbIbzU5FKiGhy5NZWSOrtbuw51GhqERFrhGXL1K
         fzkFRkH1CYYPn7byZrx+96BMvQlvK2gSSaWlDLBS4NoWJOiMKhSCQOBQA1D05x7soYWv
         Z1XwlYoMs95m6CE+SoHouKGQwBB0NUC3ykl/LmgaEPeLXwgyU82w41EJz4wec6jztCcw
         qbcD9dZViYorKM2esKtnxmZZ0Ky2ZxDRsszqx4KBK8oXaUyxD1LlGHOWDdfFuhwm7hcF
         Vswg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788712183; x=1789316983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        b=GWePuTp4DyHrmoN8RLCVlXAjiCAR/3l1vV/63TROXgeraA2vNAIlYSw/TaijwUXHok
         81FwDN/HrJCCReCymBaJGEuJNS09kC1iOyQpuOTXgoPfVUODPsOIMxPTXKFsbMl/C3JM
         AO1X34qSdgEz6IepWDXHn6AejkbWcAAz57CENDd7x0AYjxtZDHu928woYrHYxpnpwru2
         X66QUawfG0NBVnHgzgTPAHSFK2ypFht9ikySCIHD3Xw4t1y8z3T+wqP/rsppziWJWHtE
         3GnyF3bknUmgvqsg1KTL426+BFOdQo+J3OtVW2yAMVHZ7GPMIOg/jd0Nfd8jx3p2MP7c
         xnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712183; x=1789316983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        b=YFQXyBwPaNrZriulr326iv7WMPqZ5lx+W5ONe0VYiOQNN4KhWj3EDMcDKLAMmgNsB3
         zai6WOFWGqD0sjBINwA4ODUYUvnHI3wrVkdito09IRDteTKk6EijTrir6cFWJOfaUMuH
         +QA5EX8vA0oBtq4zpVBhs94U7ta9JOBFYmkGs2Ka5yX2jS0gRvYaSZvurL1z7jwV0ESo
         hzg6MepegMbAkx0DfwBRshHaMYt2f720gZrgtTNpNDnQX+SJt6thcZjZvy/sS18Tb6KR
         SV7tP/psE4UVoqbrsqcIlH3762SAIRMp41nMJy2Ch8ikq1AqdQnjUCRp6oEwcvhtNAuk
         kibg==
X-Forwarded-Encrypted: i=1; AKwUvBxKqUeBdENoKTUkV/Q+fDFtENwU0KJ2ngXfl80P4yLN5YI1n2yLjOY53LwDoBD3FKMe4e8VNSIdBFbaVIddhmU=@vger.kernel.org
X-Gm-Message-State: AFuF++mJJkTFAir8mNxCQVGQuBNM9V418sfSDaW8rkQUzCHEgzyyvJ9G
	6cENXhz3Stdaq/PpCzG1g5nHCryHHcXVqbwye47D47AQJpRfWjjXiNOKhCRKgo4yfqtrKFRHlQC
	yoLbf0JPcdBfnjlE6bzUkgWX8fZYnnoybUI6a8Xhc
X-Gm-Gg: AYBFou0BPcemg1PFnqw4u8VbAwtZgPuI5gdjiuSs903sBXvtDAZVXq6Euv0XWAzZnMt
	3Z/pTXhSQf6xNikEPckrjEckmUPJKg16sMBaWtumN7n6dZhz2I5zSzZj7O1pwTlJCBBwHX7qBMs
	y1H2K9JI8kKTxYjp3ECqYLP7oDnjT7DcRBA68C9hE1luVtBrmljoFzDCW3twmyT/x1nm3LgZTt7
	uNmL7AnTubMc8x2tlzTwBGx4Rdkd/KCQniFSTCZCYJ5D9neZmIVK+bL9Gsy6KqqQo84Yjk+Yy8R
	TkEChmkJL4kJqTvU7Hlcl42aN2taZhOdVNmCPWh7pFPt+SV0TZSIPck=
X-Received: by 2002:a05:6402:3105:b0:68a:e1ba:9cc0 with SMTP id
 4fb4d7f45d1cf-6a7f68270famr34473a12.8.1788712182134; Sun, 06 Sep 2026
 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net>
 <20260824123954.315112-3-zhang_wei@open-hieco.net> <CALMp9eSmrHdLpOi9-xQvcRUxyVN-8CG2MKWnxKfXFaBBDztzNg@mail.gmail.com>
 <38bac307-e0c5-4a93-98c6-140b1c52d41d@open-hieco.net>
In-Reply-To: <38bac307-e0c5-4a93-98c6-140b1c52d41d@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 6 Sep 2026 09:29:28 -0700
X-Gm-Features: AcwNN1UgWSO6Yjn-R8pVimjApTkTKNe-q72h-YE1U5LYb4CD7YKT9-WMQSoP4ck
Message-ID: <CALMp9eRYa86-jcgeWsZeiMev8T+wt6TSZk4TN9rqLtcD0uhZOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 7:24=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.net=
> wrote:
>
>
>
> On 9/5/2026 7:07 AM, Jim Mattson wrote:
> > On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hiec=
o.net> wrote:
> >>
> >> +
> >> +       vmcb->control.exit_info_1 =3D exit_info_1;
> >> +       vmcb->control.exit_info_2 =3D 0;
> >> +}
> >
> > Can this entire function be integrated into the existing switch
> > statement in svm_check_intercept()?
>
> Yes, that makes sense.
>
> >
> > And, if !guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS), should
> > exit_info_1 be cleared for these intercepts?
>
> My reading is that exit_info_1 is undefined for these intercepts when
> DecodeAssists is not exposed, and KVM previously left it untouched. I
> would therefore prefer to preserve the existing behavior and update
> exit_info_1 only when DecodeAssists is exposed. That said, do you see
> any reason why KVM should explicitly clear exit_info_1 when
> guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS) returns false?

You're right. The APM says, "Note that the contents of the EXITINFO1
and EXITINFO2 fields are undefined for intercepts where their use is
not indicated," so pre-Bulldozer CPUs would probably have left them
alone.
