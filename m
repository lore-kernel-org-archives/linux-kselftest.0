Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3C349CEC
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472232; cv=pass; b=MahLE1PIUgraGTiq72sQgePElexyKhvIC2FnDByfHier4YVrSOqysrhZ5Rtfem0jzUGQoA8J+4rVhXQ0mM7gcIshGA5s5YySznn5acJdlTkByMno48Vz5sdDZ9fC83kLB4l8Lf4DCUjBJ794+ACvhvHYLtfInqwyQfXxiQ3++I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472232; c=relaxed/simple;
	bh=QtGnFGrJTBq3cSANlv40Fl4rQnbEqw91J+szuDFQOAQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWQG03cnwp5q9iOLdYMGnG2bQqy4wdBPgO+L9MLyinKqZtqX1gicfVfMDdiX+4cj4YerwSlXGJuSyOj+xrH03AIMkIUC6gKNwtlHfA1Osf2fzaHakvGG3ymvjYxBYhPU9tzEx8OiVnLQ0CG2XyShtns06mME1G8slJ/frKTKcZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OqbviR1+; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OqbviR1+"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6314c3818baso5824232137.1
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 10:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779472230; cv=none;
        d=google.com; s=arc-20240605;
        b=VmbS17K047oM5AaeG/37arN089O8b9x+bGNAhPZrTjLZP/NMtyVTidS6nm4LFz47DT
         vwuzudmKi6imw/q130h7/ZUsuW3oqFc+qfvXYX5H3bnudz0qkpPjpom2jfeQMxoEc22g
         1kCRilbrTfW3jZXqDOQCDR29coWLjVXH3QOMq2pH+VlaQdN/HpUk7cg6u67SwjeZgqwu
         duWR0MURU4fdLsMiPNfgFpJDlylz6EKZm3aWeP1H+iZOwmKxSgVVDPyW3UoZbpgw/5va
         5uY+Eh872gDjAx2mcyP8z5lPtdAlYg5fSI9Y5YAG+q3x6OjXP0ZueKIjH27mM5PUtvpW
         JVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QtGnFGrJTBq3cSANlv40Fl4rQnbEqw91J+szuDFQOAQ=;
        fh=dNUvhJUU9ztfeiIV+Ia6pfGBRMb5xXpAIYX+L+qZwxE=;
        b=GIyFII1kwnwzt5X2e43IH/UXAo9XYScgSFGdS9oU/tTD2yYm4lYHOO7trrnOLJS6m8
         RQFhG6vRLVYqgEvgHCcK/ejQ9GULAq87+OGz1dO3GUhFlQlbwmkL9bzhmWJrhGOUCPft
         0E3g6gwSA3kdt15BAF6JImexSKF+f6x3fyyfWV8xY/uW5ncrpbM/3UDx/D3GD1WOjeIf
         /6CLlHXtJ5A4iG8pE8qtcdA215yrcHjTW2iDksRVWFo6gnphLD7ZMLp80kwbrFERfwCk
         74/0lErCJxdKiMr4w/deq3qNImAfiDBSn9aANsHEfTn4hvaQg7KtvjZDZtLl2bnE+0po
         NfOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779472230; x=1780077030; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtGnFGrJTBq3cSANlv40Fl4rQnbEqw91J+szuDFQOAQ=;
        b=OqbviR1+9LFzxprBn5PrMxE7sp6JqcLuapwsFouIjiw1wteOu2L1cE1WVkWTxQvx5S
         njVBeRTwp2HeDDMS2cXrX7l+dWwF6+HaCB1o9IB4z6NsfzX1aFo09AFvRd/KxzNvKtww
         tXGCzxl0OMdS3F2Y3a7MulaMiAtU+uHEbvBNuCnwZ/PFBuPsV+OlYAaO7lXRjVxEJAk2
         ZXzJYeS0nV5n/pYzgmEgWj0CtOi4DSE4Sn7RUt+DTNHVBVPDTgTjklXw6mS8yAw6qqgd
         JWge6RX7y4tELqmEmFyxV9gfAtZZGWNpl5/ynXFqkWoNm8SQZ7l1/yaR4Jb1REcutmeH
         /Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472230; x=1780077030;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtGnFGrJTBq3cSANlv40Fl4rQnbEqw91J+szuDFQOAQ=;
        b=ZSKlW46KiTtgdCPxvSQK7HjGucfg5LkSoxQIpkGUuua0HClSlMmKTdtf6XEfjGyde6
         Dw9QD4e0RKxwZ1G6eQIdDan5RsOuFVh/Ej++G62xnepSY16mG0nAj+D2DBWrsz1FxKE6
         W5SoA6HjjBgfAV6qNVJhrJWHnDntGx2qyeAIRilGjwNkzMKmw0QYZjSwO90f9TcOyvvG
         wblJGt2xddg/TR0Jq9Ox+uusGbngUY1PPhvBDzi7xSxtqAzR32U6dWuKSmmtEvSAlgZa
         jlDd9PwFmXjtl2tjTYmU/yuIMsj1Rc3BfIsLsBrzmGLD4qC00SxDFgtb9NuoWNZeKqFb
         zFwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K9AxeGVaqUbfqMY/3j0RPJnV885FN5vMAJdoICctjXwdLpdfrARQqQje2WjfhGsTxY1tFwcUcvNYJKHbTHIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUhT3I8b9Sf46IroaLFd4ARm1M4HIRbLaYyerm/RmD3UD9aKS
	23dfB+lID5c7A6EZvy1clmryaBfvbdjOhpuKdRHQ8QpdZ9vwTlYSUfkz+XZ1mw+feVH3hc1VqPd
	aV3y1kou38/3qK0GvXW6j5bT3rnZjvK5XeigIe9Xf
X-Gm-Gg: Acq92OHs7qfu1pwt5P5hyuhbUkn2eRrnNfiCntzABvMtiE9go2wNdcT7ciV3l9rmezN
	6HNGWFrDAOXe5XFm/poG5elzzSzBpw+1XCzc61ga+TbW0+HxZ/jd4n6yojTXI5gnywELO9zxajq
	z9c09qcjYKLqWo+6aGI+bYD1C9BVqT31Z9j4B8UxGVFMTVATMvFuv/iI9TkFMPzRGupngNlBkXL
	q/f+4/mvsabN54uoURMC/a1OPGfMkmNIdP4pqvdzFgrnrupIRlyzM6z6Xa++RaPDBVavwbcqvkj
	ZdpVukzU1fHsa9/TLjGdkKd7GKCo19eOxu9pKPq412qP+l9hvsv5x+MnaYAWJHlCCu+rkC8IT3w
	LEqx4
X-Received: by 2002:a05:6102:5ccb:b0:631:b834:e051 with SMTP id
 ada2fe7eead31-67c7d977c2cmr2934980137.12.1779472225066; Fri, 22 May 2026
 10:50:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 10:50:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 10:50:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260522171535.3525890-3-seanjc@google.com>
References: <20260522171535.3525890-1-seanjc@google.com> <20260522171535.3525890-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 10:50:24 -0700
X-Gm-Features: AVHnY4JghhdFYRuUUfTSQ76oPHlndxQKHRLoOmZQMrlkofDXzB5q7N8R8CzcqpA
Message-ID: <CAEvNRgEjcARP7P2bW80qM6BmHH97WSg70+=EMPw7jT=KtpPK8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Add and use kvm_free_fd() to harden
 against fd goofs
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Add a kvm_free_fd() macro to close and invalidate a file descriptor, and
> use it through the core infrastructure to harden against goofs where a
> selftest attempts to reuse a closed file descriptor.
>
>
> [...snip...]
>

Thanks!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
