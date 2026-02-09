Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4CF3793D2
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650337; cv=pass; b=gEWF4VqOjP3FiZgVk8zXchRtirxouBHSMVKe2tF0yh8LCZT+HaZFKZqCMISEsPoHxxKnUrZpZdV9QZGUS2h2943JpOoIg4RlDyZtCYUR8JVUadU7oAI366+4sWjF3R70CpRxZEmrdcDQtKj7JxHubCqqidttU2+EiiK7DeH1C7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650337; c=relaxed/simple;
	bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLu5vUwsbyoH+rTqvPQ6N8CuoH9FM4eBR8Kkcm7XC0u94jjtuZ0IHoEYOUpvFXg1cr2LfYfyxdRG0FuBMHGL5KVdXOz/18V8jWlLHaqy09UHkMqmFrCyir8PbSf6V8TJCk3s7DSoWf0oVQi+LrKs+ReoDQ7SRCIDMTlVtJ6urXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKoGnH63; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKoGnH63"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7927b1620ddso64526367b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 07:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770650336; cv=none;
        d=google.com; s=arc-20240605;
        b=Jp27l7boE9HfijF6UrDUzoGrd/Q4wKTktMWlP/mrnH7AAxSrwaEFajEIsACY1+XUmk
         +2MiL0SZCIea3qf4biex2Z6Ds+Z5tSrzW+Ypkoi0IXs+30FO0+qprlNRLeE+GEv9JCWB
         qdDC/R9QduxfTcf0SNyocReJKX9dNMdHF8pR19uc7czkMnysfpVr6OTLCzXq/YaFK+x+
         AnINMZ27DXbgJNpBAjwLwQIAbrOCu0DKTL26EKZuH88LFEWzC6WAxmFqmmN1jNLbRz7C
         cmoADqg7r4XpaXF9FMeqqbco0+cXka6ImEg7z4IzN1xgIRUUZUMVHC20Db0KL6HQfGDB
         gKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        fh=0sz+rrIa4bYg+/oFefujMF8l4tnmLxxAsKKSafTUMYQ=;
        b=OL79PaUexXh+782BFIGXw41OOug3ndALw8zRCwStHdopHaZIX920eJxSdFWb2UarLK
         qBobv2JILeiNMFQqiNAmxjQZ+EPfqdf+YDreQpM1yQ3+NWuBqmao7jBDTFZLMnGTijoz
         MPai5J1BQRcS2MmZ/XnQUZ5zlQtxsyw9Q0wFvJ+Z9loxePHLVuZv1GoXeqkmZUZqj+Og
         evx2rAFAuwkgKbZjKGwKmoT+rTshJ/mYhbg7HPVC0KfVKFQH/bRIkWVexfoxMRBzqq4U
         Svrh7IloOM+i7NOccrgWzPFU8sOlGfju0YeqG8iJRpQLQKKqZ/fCv/1sIECRi+hcmzqz
         NDfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770650336; x=1771255136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=LKoGnH63YlYTTc2EIEVciBLSbEozVqYrEQBhkRJIkpiAtwcmgege5rWCHdYgIz6CZ/
         KLC73lgO1wpVMp19dGD4PfVCAYOqFQp2HSFIVPmRT8QvDvj7TyOx/yF6xGUATLAYJv+f
         Yp6XuheWTZhNVWe49qlpUGI7GTWmO0Xk1BFbILzHm2bwipWkLNrgoiQKQJumvOU5b6c9
         tkLIYzmYePQJL7+FxatCuXFWFpujuYzclSemiCpYhtI++E8QWZzWB9rn+yBWUw9aa2gN
         6GVNeQpMCdNB9i3So36vnniCPXmys1AjdIHqNp1BPExc8ojus28BCkacoD6wR+CUBb0P
         JtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650336; x=1771255136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=b+bzNN/XooOXhoNN1EIyXAeDgM9uWvqtrYjesymc9topvJlYKnH+aEsQvLauOBSQso
         xfArT2PMwNIePuuJlJFRzWSWLsExxogwpne+AKs0go+hvPaiVk2pzW366/+taYSMxLsr
         61ozD3k5ef1uKwPA7Sg9sNIrll9ljR4FpL6Eh6H4w9431eOPhPf0HqnpOlEBlc3iKYKb
         n38AvBTZIxKeMS2ETquqot5WXXOMG9WMEpw99HsSOlLg8tb97kRQ3FMC93R5jrn6lKYW
         v00Nmg/e6+L8f1I4y6VD0zbutV/tid/WvfIfrG+R4JKhFo4PSJ4dan93cDtmWSzzqds8
         6R7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtLziGf+OUb5EpKfgphDpr91X+ExJr4IB0oap80uFiZ/phBHOfyxW0zQLSLwcUiiBLIhBozmEe4gB95vnKZlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wssB2kUQhNmwgYZ9dJlAl1607lJBchuXYgh2D9eLCsBPb3EM
	7Z+t0eMjY9WXQZvBI6iqb5YAsacJimN/chrjd4tAvftOtLXa3MFJIMawSqYCEan81dCg6tyOTf4
	oOOAIKMBN6i59zsOkTeJrOkOLC2tKipFNQb/c/lGsvg==
X-Gm-Gg: AZuq6aKp3ZkwPB4iAcUyYyLrIBbp5OwRESFnry0Di1TNViQP8gFbb7BqThOBUtOjHN9
	VjW3msUaqrSI/B8vMCKcu135qfKeP0bqrD1ix0O2SyM/3L72QCXRtJTCuSeSS/a879dYchvU2cy
	XkNpln7HJJAjmeqvco2pNweniB8MvTaImkfT6ylLDhh1RAmJiZffP0Rh3fMr1ubSN0NKGuGnAR+
	t3/CD/fvF7Y5gvrdHbn5PPPusYzmEMQtNpwQ0kCcX2zDymCGk2ecJCwabIgxhPYiP9hXeuG7GdI
	EHdhjt1X5ixwEaZFLhI7zuQ4T6GKaOgyinlUFHMLpirnHSkQMqCtOVI=
X-Received: by 2002:a05:690c:e08:b0:794:87bf:76ef with SMTP id
 00721157ae682-7952a63ec7amr99106367b3.7.1770650335943; Mon, 09 Feb 2026
 07:18:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Feb 2026 15:18:43 +0000
X-Gm-Features: AZwV_Qj3JfZxsU8iVNrT9S4IUwlHEkuMD3WG7W3HRrHxULDnwFPH-_uH0mM-meA
Message-ID: <CAFEAcA-nhHdwuQODmT4-dBCEuiut-jbHsCGVYByoMF77-UWbCg@mail.gmail.com>
Subject: Re: [PATCH v9 10/30] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME, the Scalable Matrix Extension, is an arm64 extension which adds
> support for matrix operations, with core concepts patterned after SVE.

A late reply, but I just noticed that the cover letter says:

> Userspace access to ZA and (if configured) ZT0 is always available, they
> will be zeroed when the guest runs if disabled in SVCR and the value
> read will be zero if the guest stops with them disabled. This mirrors
> the behaviour of the architecture, enabling access causes ZA and ZT0 to
> be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
> any order.

but the doc patch itself says:

> +Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
> +to 1.

Which one is the intention here ?

thanks
-- PMM
