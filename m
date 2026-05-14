Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57031E835
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775793; cv=pass; b=LUcehF2ezQTfyAaNgIqGegrVpIjOeKdRa2+O7GHqsXYqsjkHtvwbF/riYzLQI/gS8QnSMq2u3iEXNqmKl2mDAdF6/0putg5hPsD8z8Kki2QvWuDN/TBK9wJl00trUL7265SEMCM52VZP8YslqLtXkbjI4M5dtWpdQA+YyjpDse4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775793; c=relaxed/simple;
	bh=Q0ib4SDX/P+VFF7eKBzjA1FdrcNeZGq2xss6Iv0jB3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvrqs8a+9ug676aNpYDzGRxXrtadoLnKkn+ka5uMn0Vigw6D9iETf6NLhUmV5ULVjH0aRJSHbwuRwwFJmBPftBzKQcIIrs0ds3JmpsCjZ32uN2NZe2p26fSi8fSBmq3lTZTq2SlV0yDdJzWgtqG5ztMVFAMdKaV4gLi36FSqCOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qG/rwtGA; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qG/rwtGA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso11039a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778775791; cv=none;
        d=google.com; s=arc-20240605;
        b=OUhcqF8daerK+uQ9OZKnu0fZRpj8LV8LUCaCSPaKgMriFYiJlG7ljr3PPcWdjCrIZG
         4Ka4mMAXFCry491746j0N/VR+NMaN3N/RItJYrMdwq1vZj/sUwpCT1hz81W3CSO2cwnv
         c+DTkuWtMHwofG6bp/pCPHLibGV6Ka2arsYHC3HGMHMgPl6TVtDlo+vhyD0N5Qbxn2Ne
         +NLKeSAHKSX2PEGdWMJQ8silUku0zoxxmMUt5xLXdEVkSU9NzG/9YfN84MZwLZ9BKcDO
         k5F62BhGKayVrFxOmyUwkea6dEq77CrFjaPvGlcmTkDvfpYVJfYpwzhq8wurwVZG6p6x
         voxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eBe4adX/bnjRGKzW5ohsf4TCpEbTJmEdSDad4e+lcVc=;
        fh=eANtK27scmrATJROsxHBOKiL2F1JiXaMYjBChAQavWE=;
        b=O7e46xyMe6HXGcZ6M8wfVMB98UAwmQQg1EKGvpB1C2oC4f2sQ/d6KxClmLVTYakqw2
         +vuIuXWnPpVUuD+RQS87Tlw4eX1l0HeYkhOPtYdR7ge6TnOIdAs0xzhl90OmnhibWgz/
         TDxJqjG9p/rAfkkf+lhOoTolZfWna53LE+jJddMIbIGaOQYnOTWsiv1Pvq8RVcYECTUD
         QupyCil9RnNzIwd63Gg8BLcsk4VO0jcnNaVMbcMbtmY8PuEpUN/nu6rqH8JEHdCd3w9S
         yvUzsT5iJ6wvKKsG/p1/w7YdtYgoMganq+sXYKjUVfso/HdPeSaCk8m/G2So7d+Wc2l+
         UhoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778775791; x=1779380591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBe4adX/bnjRGKzW5ohsf4TCpEbTJmEdSDad4e+lcVc=;
        b=qG/rwtGAqKhn34ASB85AlOnVO+EbKJgG5JBDFa24VWPFjqpOHwbvPXYHo8UXhpJYYk
         7py9jdjUj0HG6N/uYxR5nKVyS01JJxRQ4OLegjQmwr7u7dZ1zXdbZ5c3E92KYQuI1ia1
         HFKzuRrFagbioZ5doli6J8A5yJ7fyQC9LEZ6CD0mhNTx4oBAhHYuck01dRwgmHmNxB/s
         Fhi1G8ZsyiQRe809Iz9/P/WBWHRJ23ICcqSmPzjeq9dzafSTxgZ3Bq7raNcE6x0uCqyi
         QEWmnZ8U1j1eyzQtEvi9mOoWMEiT4V6+civTHH2giGccDFe2xxqI414KkpY8qVXz5VRO
         C5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778775791; x=1779380591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBe4adX/bnjRGKzW5ohsf4TCpEbTJmEdSDad4e+lcVc=;
        b=b3lNwcAjV4IUPBTAvHDM20BACPs22MuL55KRC4fu7AQmmXBmXXSSO+k4eMwvVtkLX5
         ihqQBC0zKqBJ2nK7p3NanofDqb3ICireYZnjV4kAv08ccU0B/GI+izyqs8uXdD/Vi6m+
         U949h/BH+pIJ8QQ9/mkVNJUv1msDivOwOfmktInbhYM137oXZD5bIW++cRzsd4zqXje/
         BLbWXQVCM5gUc6DQieo+5j7sIPQf0NJZcQjX+srHyfvzz/rgNC6RzTcOXH4WMumxbzN/
         cSjbhRt5oibeDVFSTlUsClrVC6uIUficStwSnKAEY2l7P/0hGLEzFmTc4vUR9kwFqL+6
         XMlA==
X-Forwarded-Encrypted: i=1; AFNElJ9+uE+pO9jzOeyXkaSlG/fSSCMUK3ynE5rF+r4VAabZJvjWWA5HnIn40Ql/9sRWQ4wm/CdSMoxNSM1HNxPGD9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeYj//UsLkDSWfLJO4F9o/6Cp9UERra9PUakt8GhOX67gd2eO
	gJ+MloL957HXqzuDZADCo6xog0IA++nW6qan66cNBjYgtUKYA8n7pkIUcWTXIk4i7KT2AfLGh0z
	Oul/FDXjkEJDqbW+jNcBpjaCR29kN+wiPv8vjp5OY
X-Gm-Gg: Acq92OHek0H+Rs8TbMRGuHVKtTCxk4MsJPAPJtmfoZvAo14upPy327z/9hnX510IHrc
	iu2O2k17wj3YUQ/GPDmdoGCtRzhtVysg6Fao0f69WU23adAhb7B2+HnN1EoMr+gCfE1lm1GiydD
	EV2uhGwUIlIn+uUA9S5DohnJuWcQNt9OR13M6gIVUYbSbWybQBfE0Yv546y2btxS5l4DrxfHUH7
	zo+aLWUPlQTK/erdRw0ZTvAz4N7d6PR3w5gcoi2P3utg3fr89F54QjWFVTU3JpffARfiTWCt6S8
	d1W6FGvyC33k3yCyBg==
X-Received: by 2002:a05:6402:a547:10b0:668:c2b6:9fa2 with SMTP id
 4fb4d7f45d1cf-68326bd4ba1mr41151a12.7.1778775790450; Thu, 14 May 2026
 09:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com> <20260513224608.1859737-4-jmattson@google.com>
 <CALMp9eS4s9tsOmvDUDeqS7oph0mSHyhxBiULQdwHVaG+7gXLSQ@mail.gmail.com>
 <agXcKDjnJc9DPcyr@google.com> <CALMp9eS831M153QmAgjzJcR2dFY_wCCCzDisd7_T6GyS3-gAFw@mail.gmail.com>
 <agX2SJF3rJSkIqDe@google.com>
In-Reply-To: <agX2SJF3rJSkIqDe@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 14 May 2026 09:22:57 -0700
X-Gm-Features: AVHnY4Lsmqlfaqp7hEXV3B-RlTugrnhObbgCElgWlD60p-logKCtI0xa4Zqrmow
Message-ID: <CALMp9eQTSxFkVf4vV83yNYvv2AjseHYiD3M68mcc951L4U1Jxw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:20=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> Oooh, this is based on the generic CPL rules.  I didn't think about it fr=
om that
> perspective.  So yeah, addressing that does make sense.  What a pain.

When I fix this in version 4, what's the correct footer for Sashiko attribu=
tion:

Assisted-by: Sashiko:gemini/gemini-3.1-pro-preview

or

Reported-by: Sashiko:gemini/gemini-3.1-pro-preview

or something else?
