Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886B2EEE7E
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437871; cv=pass; b=Czpk4es03Ygv6CqRh9u3kvs2IESdn4v6uDkUrAeK/A93ZqjGknwdqqX5GY/EXATW89aslsxAwrS1DZsr+YdAe9PnrYjXpgs4oTJBACMj40xDKef6Zwsvb6JVh8kZG0ONsjn0SJsXrheHTFBpVTsQ38N+ayaNSFJgj8ETZaaz+2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437871; c=relaxed/simple;
	bh=va8xMcojp/wqlH955kAcrki46mO9Z0hCEPfHLiFpKO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvieE1LrXF3CeuZiWaoaNDLX7lmQLG03G8YZ9rBm/yaOfDAUEQtNN/+UoIlu1ZHq6ELAsY1WCnrpyf6GP8E5FjOUcVzMQi3k5MwO6nGw+ppP+jGGL5GQsMdSl6EtAFqcHmpYagNy2oxms+5ofg5szF+Be2GZlXHBj6o4tAMf6js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRgbRYw6; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRgbRYw6"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so10023a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 08:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783437868; cv=none;
        d=google.com; s=arc-20260327;
        b=Mami2wKKrNN8MycyNJC8Rn1Kv3yJcICXN++TnXmFgYuA3DZPcF1EX7G9v3ddjaJS/o
         ZhfauAJXAUL1MqPVvVySen3D0uah8/4axgpAdOcfdGpJpEKcOJxJJUKa/Oa2wfW+kC2u
         UMhRD6W3sNc+0Yqftj/GyNW1J0lYR0i/7u9d3uARrv1eqJD/j5pWj2PZqCafdkVKDaGj
         a1KdADvUa5bJtpx9vLrdmf/YmpP/mqnMJxwu/dw2LuBRSA6SYTb1wE3rLhube0LorIyD
         6zgHWYqLSj1VfGXJAMZbsgHKYh6ziH5e2qCkJRLj/CPRlLLKeQkRsrWVdSFudazzcGe3
         5+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sRAvQtVXJNbBLG0JVFcqABmsGYBHBTODI/Uqh3OZb1g=;
        fh=4xzc8mDxKglVmwGfvi9KPDa1MmvBfRoEZhlqS95W88I=;
        b=sqrqILMFwtp07YkSriM5gPX1hu/JWq9VCoobNTv4gOQKn+ps8P1qRqbn4Iu2b+G0t2
         KBBUTzotfOTBbAwXSS+PvxpTfTrurFPpKf49ZYk4fYXmuyg6+kinjyJiYTO7/yPoyRSQ
         UKBPPZdx8EhdLhSYKKcmVCSdw9QrN9I9db1gClvxkZnDO9NKZrvnV3Apaf/ZkxWPySoq
         MJB/0b+KQyRKlRMO/3PPf5m8WwwYJus3P+ouaB2RQD9vESZUD+THzq1od9IXMYCM55FP
         W83xEuDXHkyfsqfin77g0z3bosMl79jpGccyQw3cVW05U7ogoi908F+KXT9nzZJ5euMG
         BCKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783437868; x=1784042668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sRAvQtVXJNbBLG0JVFcqABmsGYBHBTODI/Uqh3OZb1g=;
        b=vRgbRYw6gZYsblOnfHBNQ90t5gkpAOEztyYq6eFKDLew8fUyZ5jAwBZs7tTuRK76PR
         joVtGt8xj5TlUc9oW7Dq93+wFS0tbb/4VJBE9GFH5oyuLNimHyFGKzj43QRlNnOBRIHG
         WNMI4alL1d5e/8w1I1qVDOCAMFLllkt7mUotIwuax4flIaOunI4FO2S5kxuAfGvDjAzv
         FSX1CHnd5lkdcOkW5MMo/SLCtvVcDZaXiG/hVhhWK6Ei1c9eNVkhImeZ+5MtVw5kavJu
         +CorfyQj6ccMRxBDp/rz6325mxttr2O1UGXaTgnCRdBdnVbwJK5p9dwI6Ne4rvTCd4Gh
         6KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437868; x=1784042668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRAvQtVXJNbBLG0JVFcqABmsGYBHBTODI/Uqh3OZb1g=;
        b=ri9q3reMX5Jzvr00MAhpOHgZUCYSJWr4+0czrEaiwaYSsVyi1QkPZCeotLIiLj5H87
         Vs2Ql7UWtI0y2WDoasCzu3JqFhKNmB/rqLpeQF90HNQVNwLavrBbTIuehLXMBBPL/IaC
         1+cWNdwBJGleI0FW+2AFJxWnRk4RdvSQthLn96jrA91c10NqFACrZMF++8/AJeSG0Xgs
         2+0TXE2akh0ibKqx+A0QHZrIUkweps8pBO4gIJxALbdFpbHtJtx4Muqv5QQuqaDOnRe4
         x0yKhW0ovkLBO4FLiYE/8jk14HeHfRX1cslrcCtcFEzGrwub4lgD10sLuvrZx3JEJzqa
         VOsQ==
X-Forwarded-Encrypted: i=1; AHgh+RptynBgkWz0WIIfeqwmPnvmYN3uw300jkVAV4HRFm24IQP1cu0cMI+CaGfQIUox/GyifUapGHDuce0D4vAaOqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/fP3UbUF4QbcuHlAN+/2OwFFRvRWfgh3AEtwbBdVA59XPFO9
	Xra0FQ5AHp9Ih/d9F6unIt6qnURLLTP6+gcUHeI//zJKOUhUqZ7aNlTrOFTGHCUNw2iz9Ff/I0R
	xir3HXiX2WvNhCDeCVabPrcncpGokWGVHC5tB/76Anq90G4dFhwIcf3zn
X-Gm-Gg: AfdE7cnqQG9AX1Vcvw4j4uLMf43ALmGFpja55deaXrkcxSOE7QGq8oSDvhjvsZGD8aZ
	EhKhg5srY0IHXZUgcK+uLn8NF+b6p8giOI77sBhvm2SVpORLDBM6L0+7lM/j2HWN1N4m2iy33c7
	UEowOg43xvjhF2BpO9rmZ1yQUcGzOJZLWaqz1tsuCk3Kmnkbr0IyebTlei2mu61+uwiItkwqYQu
	mDVthmuBMvU52gDlgUrb5qAZ50EKkbrvRi8g0TJuY6S4dv5LzTPslxAuC2GsqAZENxwld4M
X-Received: by 2002:a05:6402:3046:20b0:697:9254:a66b with SMTP id
 4fb4d7f45d1cf-69a91340f8bmr43195a12.6.1783437867684; Tue, 07 Jul 2026
 08:24:27 -0700 (PDT)
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
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com> <ak0QE7mP_TeZmzeS@google.com>
In-Reply-To: <ak0QE7mP_TeZmzeS@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Jul 2026 08:24:15 -0700
X-Gm-Features: AVVi8Cd95GVwYBfuP3XznzxvpDMnGWooflK8KFIsDpgzTbJAg7OoycQy2qFC1k8
Message-ID: <CALMp9eTycB8Z94V8j-xyfDeah5KaJypRrPfFNHfQSUzgrr7FkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Sean Christopherson <seanjc@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:41=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
>         insn =3D ctxt->fetch.data;
>         if (ctxt->eip =3D=3D kvm_rip_read(vcpu))
>                 insn_len =3D ctxt->fetch.end - ctxt->fetch.ptr;
>
>         for (len =3D X86_MAX_INSTRUCTION_LENGTH - insn_len; len >=3D 0; l=
en--) {
>                 if (!kvm_fetch_guest_virt(vcpu, kvm_rip_read(vcpu) + insn=
_len,
>                                           &insn[insn_len], len, NULL))
>                         break;
>         }

This split doesn't bother you?
