Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBB4A43F4
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730529; cv=pass; b=udyEPczZ1qSofVUgLmkLmNfUbDu8/V2PDipvQblLAwBRUvUdGbfpl/gACxqHC9pFm12HkLzb7OfPjcTsi/HiuO4YBp9yzTUMWIEk4IOTWVkdawpb05iD2RR9G0x6zDkJQ7SxAXlGZC1lEqeWs1ODfT8XN0iAt0Z8G7K33hgUHgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730529; c=relaxed/simple;
	bh=/H+f8rE4cmCyRd97Qlb5sVoBG09cTXloUz/HII+jJZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcRpxwsGBaln0N6oR/PBgV0Rt+AVWBcIzpXzu1EO+jA9n0eva4YckpGfMjBF1I0QSwZvuYz6YEmMq7EMpm+ai67lfWoy6lFUmK8LvRXoiN8Nn0fLW84ubFLvFV3s0dwtyfvgvjyERLnmS5F5l1+qICUsot3woxNmZ/Ii59KUl80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ny43O8F4; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ny43O8F4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5259a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730526; cv=none;
        d=google.com; s=arc-20260327;
        b=Qi0wVcUd72QCOQt6gv1KTmKC4XT1/c9U3Pol+0F2zDTzcgKHlIla/ZxGgdbHy4plOW
         d5Nhp8RiqTOyuJZv6h5cKRqsdYvEZ4QLZMlJs8IHayAJCtpiRqvgwBWiU/VJNTyftSD6
         HNuLxm5opbHDg2Tx9urvMCaUD+2asvzYHluvPPk2B5u/6JKD2z7WbrVCwdgBXLQ3ErZz
         3fIFfG6feM2UAN4YkOtATV5XNuc/RCAO07+Bd78p0vH5wVNbTnlXk2v5naScPXhlVvXG
         iMUUzv4IDCnrmhMWYE/klTInQk5I5vRH+BdYw5DSCmqpsVLmJ95X2j1EYMMsQ/H4dC6V
         ajLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        fh=mMpaWzL2e9YMKRMQRbtAMEbtylPxnLZx91+J/YOn2DM=;
        b=CS2vFigdnnpQovesIowzRLJJmPOnfJCYFajAT5ULHVtRDL6+IjrDiPTe6z/Xk2R8+J
         LDxB80Vpu51WmFNR/04xNprVf3yGYgkwf5x0c9HRzE8byVWiw9oShTVpCN8jeXDq7n0Z
         /ZlPpy8Zosmpu4BgzXcUCdEsVkgZ1OzIb5FCURQaN1HYmFURWXEqhAi57I+dB2bhyTWp
         znj0m/DBKhXbg3qbPFSL0ypDAlLN1XatWa5NZ8wElxTfvZVgcejMGXaCCsMwF0NmZniN
         mQDyOnVCM6tXXb/pyDkQblkx55ojz5wJYQ5pf+s4+0bkT09AfZPlN1acR8MvJbZagRKU
         b3bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730526; x=1790335326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        b=Ny43O8F4P4vxQ7/zMrkI32A43lJHFbDxxSUXs/taJpDHGhIPuIY1CJAnTbTE2IhATj
         3zS4g567bNVkMQFL4SEQJBq4w4vBGQGg0dKBNyu/jlihVksHi2CSOF0JOFLZSQ0mnRbP
         D4aGtilA9rfBoZFqg2o8ZCi9bGrM/potcjJ42lelmumgR6/j4IKmZ3gjNw1EugTPfKLm
         a9snYCFql1wnmPaOQl9awVMRyMnGPbHdwBt+1J7uFDXJI/9k4Z0cH7GNRKK+skcnoMOI
         Yz3FDCL26Wl6qftpL2B61xiTouSOzym87VZZst8aBkb1wj76c0ytBWZT91RS1/pBzLVj
         eesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730526; x=1790335326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        b=qJtvIDGkcxZMTufR27C/iGkUBS6HcMgbWmSj92e1PNx30xI/Kz3XM83/gZS4jlw8Yv
         BwLJAPCyXjOvrlvpXPk1N6GP1Tme/UIvqzizhw8r6KyV/CYCcvLX15I3SqVJj00fw3E5
         OAK2muTJFv8QKpvWgOeIgQc7wWF+NLZtul3QpFbUoHii5Z2xniiSOLbpzGykmAg1kF3T
         iRo+zwW8/MCEEu8B3Akz3AmvpmGnUP/wkkI9pTnVLnT2ozRJdOioBniD5mBh7bRAWXm2
         5FxTdYZsbg/1pN8Dm5EMTl7LvTOMykUbvheJR/FMRe3lC1wRjCHldlO3cyqoGYHkD8Wg
         nXaA==
X-Forwarded-Encrypted: i=1; AKwUvByipSHVShBcEc5TWwjEMBqBZqcR3pAYaH1czUs3aG1imlQ7s3hweKd+aaxmda1PxF1deEdlawLWPzH1FPkvihM=@vger.kernel.org
X-Gm-Message-State: AFuF++mNtl7s1t9aGQ2bT3eTrSJJFmrTnwErzcaKL8gavGOZgWcoPvwk
	x4UDOyhavOXojSaE1xwMFfUyse2ZQ8exvw2XCbGZbA0YEgaoIFfrjf3HnFOWZOs6PTwpuMwArIK
	vXlnG1HDHWqRmfk9j5pvtUDXHfXXxOIqTh+RK1NKZ
X-Gm-Gg: AYBFou0m1oenPWEBGGPOvKzSn+ZpTBBNGH8/TWOb5cgfPBO+tNJ4hbinyQkm1vJOttj
	4LuQ4lm+ddvl8C2Nlz846d53owDHWMl4abYTzbrIyBwP+T3x5qNvRf77wKOOJa6+NydgFadAkcv
	Qbx1+UbaQzXMAhxHjbg1LvYD0aR3r/iIbzbZofre7PYvTUlvpN/oCm0A1erKDVVAbfSU30IxUCL
	rwLTVJYxEP2/azNDog4VYvwqwU+sZ52ZMngBtT5eOPHf2H1GOyMUvEvjzCAwDVBHrJMrvQg7H56
	va05xmN60MYw2RNj74Lqr5ytGpiacM9lhileWO409J8qF0/P41MMTCA=
X-Received: by 2002:a05:6402:c318:b0:6a7:ef71:28e0 with SMTP id
 4fb4d7f45d1cf-6aa4de2f154mr26925a12.0.1789730525581; Fri, 18 Sep 2026
 04:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <95301258748704c6b63664015ea18d3632739256.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <95301258748704c6b63664015ea18d3632739256.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:21:52 -0700
X-Gm-Features: AcwNN1We1S9kRVzuD3jSj8IbJp1M4rVqZ6TcYDxFKtZsWvmaACGzUXedXxtLuy0
Message-ID: <CALMp9eTme_QbkN8fuc-JkE9M-VLri30sqR7vxqjeU8xX5iHQgg@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Preserve the bytes used by the emulator when synthesizing a data #NPF.
> Reuse the fetch cache only when the fault is the current emulator
> exception, identified by fault =3D=3D &ctxt->exception.
>
> Add an emulator accessor to copy cached instruction bytes, checking
> the RIP and cache bounds.  These checks alone do not establish that
> the cache belongs to the current emulation.
>
> Write the cached bytes directly to VMCB02 and fetch any missing tail
> through the instruction-fetch helper.  If the tail cannot be read,
> report only the bytes already available.  For SEV guests, retain only
> the cached bytes because KVM cannot fetch plaintext guest instructions.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> Reviewed-by: Jim Mattson <jmattson@gmail.com>

Oops. My bad.

Reviewed-by: Jim Mattson <jmattson@google.com>
