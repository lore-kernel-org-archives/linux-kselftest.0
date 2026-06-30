Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174C046AEC6
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834750; cv=pass; b=s9fMDqLrqgyu4OHtWXEQBDeGHrmZmUWbupz9spMcp4yJrJ+UM23DEbcVAXT4ZtTWMq27X0tr1Y2nuNygzxyBNyCWJjCyhcl05ICtHu/CcY3Qy3Py8TT/ZpFRr+x7O3bxdnT6H4z2CV4wgcjdOYZCoQLLE0VR3iYYRFiXmAU1z6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834750; c=relaxed/simple;
	bh=kSLAhR9ppk/Xzs8MS4kWxArKPd511dnRar+gVLTV6DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OM4itt2NQLhxXECsQNGQGSsxyEK3uE1gCpSw2d7yQaKFp8QIeRQNo8XxW9rROXY65o5ebvh6BAJoDWYb3hzWIYPDJ3hj8EBoBjsKagMWjSYaQx96cUgXofr9L5Xduy+f329KDgGd909x3rADVbLZvDLgZP42serrHubcilMeSNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzVo6i1H; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzVo6i1H"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6981fefb9easo10515a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 08:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782834745; cv=none;
        d=google.com; s=arc-20260327;
        b=LpyESSvnDs/C8f6+h6lniv0ytnwYBDBISQDrfpX5f0MO9y2zGGXCH4Baqq8DfMdifq
         kTDTsWsxGue09A0yVNzP1M4phL6r0TCusM0xWTU0rzmrOg1dYDfY7DktnmEv2MEFO4wk
         mPcr3zyj8Q3eAsE2yNs2jrCr6/HLUtvVLV29USt0QdhKlz0fko5ZbuNd/YqPcIh9DCUZ
         V09v2NxUmH15P0yVtV6qv1EPyQspUTgAFR985iazFaC2QRtWWXP1zs5nQE7f+iWMji4N
         DK6YLHUa9iQysrtWA/d1J4tUMsPIOcm6MpE+TqgnAKyjwycPzD7UdD38o4CmOt5IoIOa
         bqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5lODWx1VIMLw81zLUXFW5qk73p8Ldi1PHz+nZ4TnfE=;
        fh=7Rjs7kY+qAsFndCV+GqsfBqhbSbZO00FDI708EgggT8=;
        b=BEQXQ5Og/o2MJcOP7XBu3uNI9lpw9kM2jH8zOlYOpww1gOfdeXDE43F7erpEE11gVi
         UeNaSKMsuHnwQirDguDIxxIkOZxV7lEH2xGV3h/RLkaI4e8NhHxBLcyCR7jM5h8rdmgE
         j+xLYRi0uveth6cMJe+MdPRxKp5lGT3tq1Qwhg6fmHGKENt9ODvYev2PTszgNHm5QfUW
         vlawP4nflasyrIZJiZjwu3wNBjTYkHCcYReDGTrE3K00sXMZP/x4+K5ek/3HNq3yTkjW
         R9UtcvLZMnSnOZBebJJFZ+bbEB4gf25d8/unzD7cqMEexvpFvNB2kyeIDU/d1sH9NiSv
         wQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782834745; x=1783439545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5lODWx1VIMLw81zLUXFW5qk73p8Ldi1PHz+nZ4TnfE=;
        b=HzVo6i1HURBLRXztiu71CX9d852I02LApUgcrkHZ27oBBlAK826ZGu7pwG0xZKqYfP
         lTPCaaWAHJ75dD9PcFTaMMaYI+nlyGHQ6SxCnvgwHBI2XIu+6rWve7HgGWU56N6t25K7
         whT7HtcAeKOrc24Xyacq0MDXJbIG/jZAxCuDLRWX0un7KT/APu03uEi+rTLK9qALmUwe
         Xn34vcS+o1WBxZ0IpNHo5Wo7QhgNgq44a/f4jzgZBtHHHtAbdl96GbEg//3sL3Ukk9GA
         QJ//NhQNO5DAuTOaa/rsAqBBcZkwmBpZ8RIu+LjKR/Vv2ALuid4OCgiaRg9wq1e8SODI
         VYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834745; x=1783439545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5lODWx1VIMLw81zLUXFW5qk73p8Ldi1PHz+nZ4TnfE=;
        b=etsEmt1OEMCaNrCtwr7hkh4jlYNRJ1QZykAnavbsABsQWILTuu/vECvE7WkZDw0K3b
         NHVb5fdLS1Ph1aIFkkhhirayP2/5QLMOLRCuFna+wFn+siF7Fu2eYbF4xG/B0tmRG3DJ
         qEIFNgbpdnLDMBG+oIrHfUbS3Qkxu7oIs8if5jnf7O5xsyRrNKzn/AQ5QqVGHse4AsvS
         1TeJOJE+FgDcmwvBiwjyruwb0scryY+qK5yJVn8u3/hfli4LKC9uqIMv1v/IPhkYqTMT
         lVQm1wXBL9Fq+GF5jsa0BxzK+MKhxlmjB56A7Al6mvdZCZkp4B2CCbm1Ie6XDRBIHpSW
         2DbQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4pXNH+HcVr7y5ua25e22+c0s0uslgo18rImdQUIaXFPxwpm0Pe19BMKJMuXOY0U+H1N36XTI5ZSNxfjyzOFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2k4AsWthdH31/MD+FZdB/mdgcyyituDLAP0CWpmm2IUaqMYcJ
	DIiZyzDF4wqNeqekjtS1rT4K4NcDKK/cRTiNpJRG0SPj7BcfMxonvkjqMCZtPvYuHpo/NsxpLvE
	/n5tPf2cUkI4P/SzlguSPBSGPn93dRU70Va7D1oY4
X-Gm-Gg: AfdE7cnboFUXOEWMcOFWvBSFF94jnWwSdqNtUsdQ+wq46IG3y87rYnt+mN6oTcIDBFj
	pmvbmJLiTercZADwS45CMWUsyVsc191vdp422IyqCbBnc5b/u6ndRFkORHcXygpiO9AQ9gMa4lI
	iS81MQ1/AKTB0lmkNhoaIzv4XwoRMeqMAf9oqgSQg0pC6KLz8o6O6FbtSLIgAzQwAdzHPY5F5Xb
	8UBF9Natkz7uirk2SGRwt7tf6vyyzBZGy4upkhbmrfpey+Vn0mJXU96b5C0835bIyDN6Jpu
X-Received: by 2002:aa7:c44f:0:b0:698:a99:443 with SMTP id 4fb4d7f45d1cf-698884fd8fcmr13416a12.5.1782834744729;
 Tue, 30 Jun 2026 08:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
In-Reply-To: <20260629125205.52394-1-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 30 Jun 2026 08:52:12 -0700
X-Gm-Features: AVVi8CexX0SPJSoL21VNOqvBGssP7ede0gyOZ3BvlCZVww1rK6AudnusZccgGfI
Message-ID: <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:57=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> The SVM DecodeAssists feature is reported in CPUID
> Fn8000_000A_EDX[7].  When available, hardware provides the length and byt=
es
> of the intercepted instruction in the VMCB, allowing a hypervisor to cons=
ume
> the decode information directly instead of re-decoding the instruction in
> software on relevant VM-Exit paths.

DecodeAssists actually comprises four components:
* GPR number in EXITINFO1 for MOV-CR and MOV-DR VM-exits
* Software interrupt number in EXITINFO1 for INTn VM-exits
* Linear address in EXITINFO1 for INVLPG[A] VM-exits
* Guest instruction bytes and length in the VMCB for #NPF and #PF VM-exits

You only partially address the last component.
