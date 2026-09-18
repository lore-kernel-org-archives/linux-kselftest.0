Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DB4E50BA
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730870; cv=pass; b=Mk8bmIppDyJ+TZH+PKi6PgXvDQVZRg9oTD+/LxvVvfMrP/lcy/kHGICvwbNaD/laDZMfQzsdfrzIpkoJazcjiKqhxnWp+vNne7T12ZpBnjgLuAKdjMOGhP1KrxCiS7RO8cueqZJ9wSLY7MHtFg59tO/PtSaXX99aPU0hATNGx/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730870; c=relaxed/simple;
	bh=1T4Ypx73b49lIoEeXBKDKWASxqKm0qUZYs1hZl9y4gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u66m0gEhirxPtjl6NuYS+vtcjKBN914cZ0PCWTsGxqfhobZb2OUvXyoUWlmf3qZa2h1AVS+NAVc8ga2bzKx/rjENmG94IliZ0CnW00yOG5aTicsMC2OfP8GcZO7DoslWtE0tRR7hBu6YvtTuDrnEQIK/IfHBlX4yElexl/gLRMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bnicj358; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bnicj358"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6585a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730866; cv=none;
        d=google.com; s=arc-20260327;
        b=JrHso2HyFSt7FbYooIVm4WW02GGUc3ykQWo5Ah5pGzkDLZgeVSnT4zp2C3RJ3RDX2M
         y4uNWKNq/sej0LqLuwDk7idYAa6AU9WWjO3L6IZsKJAxz5SijIGQZRRzvhGrRQkNm7Q3
         jv1Jm2Lcx1qdqcCeIqosT/RlNYLaqXP1YEwRYzr3JP/jPMqj5NWrgncoDGcpm13McCKY
         Xt7NAmbzJ9QIcsG4ZURdFSUDvGtymi1AwgEhs7WbGIKMFGA1sMjP6egsh+hXOKMVHZyd
         d2RnMPG40Lrh3xajSl3U4yoFJHvLRcMpWBBsjDBYqFLol+f4VZlfXVZ7OiFRNv8bqP3R
         d8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        fh=pn8i63R9jh52ESikXUZD4z/BDWWg0cSA8hNbflX1PJA=;
        b=OiOuqoqCzMBcii1bywCL2vMYUv7ctfr3PgaqhEk9wBORV5j+LERkWbn0N10bXA5dr2
         6Xp3LdzhGzKCHtDKujriem3mw/fJ4fGdpPlIdAlzSgaUo3YPA7Er5IX0s3dwm89SKgam
         HMDPMWe1aRYQkHqAhZebhvIJiJTNqX6iLUjaN9CeTlCUMaAzV2I7sYR13ou0Fmq4NblV
         qHzR9MKY6y6gfFJy1istwio0OFNjrwPKs8NSaEth0EjLnu4mj8uZyXoICUN1cfSLBHTY
         btbcs1OFWq1El7D9MqmWHAIrt/HjJrrmXiCpv1eMaCwys4okr/Hm8JTB/K7+NvWY8uJo
         DZiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730866; x=1790335666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        b=bnicj358p8BvR+0cPsy7nSRI+syhPcD8q9t1kzH/MM7jD3Ex2AgecRNFRaIh2hoD12
         t69llh4Gd79xFNGgrtRQqTucY8HzpYZPkiePEQvpXaaU8L8B6vuctbaMv3j7t2O9Ulyg
         DiBifT7wFrrd8V7NIOZMz36SDefcD0ExuZmo5B6UeU6MQSLwhUINU0tQ03hQsFspBqPl
         cJ9yoiFMNZR7Soz591jRZzlMG4yr/651O4S2Bz3yZoTMWjRHQo0FbxuNxeXOteLlQZ37
         +7/+dO2nFfXN2gatJZt3WwO/AMmDtcVXhxc8N+bcdTHovBGad+zyhtC7YwAbu1P2BYKT
         K3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730866; x=1790335666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        b=dr0oSvIFv8jJac/mupbE7S9nVvqRhoZFPhwns92m6l0fWYfhrKqbjvuwSTZWOJGWvi
         nnLXWLFCXGukYwXwfr0K4twJaqIlOiWmUHK40XE+YfvIuKjwW9ycdJw5af+/6kx19z0h
         ZeJSrs4NjVjW3RSRioL/BymoVVwrYvqnjNdaPQ8LLAWt4zQPFJClBXsRK/yD6A1u+3/H
         yjhAE2cLi/Lxlv8DsU9mPbxO7SqW1l9U/+x26fAht4Y9QuigYIGcer2gsHy/+jhaRra4
         vhtTOLXG+aK16G+hOW/ZWcU4mXC8re5D7ZafXewwnxj5yQptLNOuZyQTQjwy08aVQB+a
         XILQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLp2WABxXM6+p0uUNI8VQi5J7nQ6UNCnVyJqd06Kaklvm00zILhWsh4GgkGBnEjqFmI6axWxEBjrWu/uwszu0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFdJ7DpwZ1TEst1lQo9Dk/t2yMlhJ00fVLc5hpMc+CTqKvcFxk
	SZ05ajmWheIjI9N4YHyslpZQ7A0LbhAweupikVWvyEvR941Ctongu9CcCvQrEA+TkV2fsIXvoun
	Ja3qIcHTDCxPxZ4rbLNfqV2y5Htb43j4PYgDl351mNgY0BJaLQcg6Dt0N
X-Gm-Gg: AYBFou1lXkLytElqS+xGU7B3EPO5ANboJWJFTeDpD60xZmr5kpUhflPS9HwJx+BXFfw
	9G8NoWmzYjDe4Megw7t/lkF/TBRp1+abVpbVXEXCD6cinUje5ZIJvtqEmOhZRkrQKr+TNarg9Cq
	GXNwwBDWW2K74W6n0P1EexNtplBssSPwgqlphRV2WQZIvK7S7sFsxYToTsaSj7iIlkMfumEXALK
	Y1tQAY3s0wjOHhEPiENiIC3nUhvLDwNWiArXUDUePTaKgF/qB3QD5D+CeywxDpSfHS7KC6xB0CU
	MTmgUvy7QrhPrbyL/V7J4r7hUFoUBjMcZaJ0Blt9IKjzePmV4VJBzOk=
X-Received: by 2002:a05:6402:a588:20b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aa4df2139bmr25284a12.4.1789730866074; Fri, 18 Sep 2026
 04:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <2b30c180a7ec1fb22033cc1b89debc36c9f569d0.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <2b30c180a7ec1fb22033cc1b89debc36c9f569d0.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:27:34 -0700
X-Gm-Features: AcwNN1XiB8HFa2Js9NBlTZk2TxW38UVMUVZNntIOccJ00GWuWntEdr41p3Y9JBA
Message-ID: <CALMp9eT0RjVUYbcHbhd-phmaXs1yPsh25j+qkfmizqp+DCV=fA@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO1 field when
> DecodeAssists is exposed to L1.
>
> Provide the GPR number for MOV CR/DR, the interrupt vector for INTn, and
> the linear address for INVLPG.  Preserve the MOV-to-CR0 decode informatio=
n
> when a selective CR0 write intercept is triggered.  Leave EXITINFO1 clear
> for CLTS, LMSW, SMSW, and INVLPGA; the INVLPGA address remains in guest
> rAX.  Leave EXITINFO1 unchanged when DecodeAssists is not exposed, and
> leave unrelated intercepts unchanged.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>

I think Sashiko is hallucinating.

Reviewed-by: Jim Mattson <jmattson@google.com>
