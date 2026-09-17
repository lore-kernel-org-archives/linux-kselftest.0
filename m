Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7145650EB
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655472; cv=pass; b=QQtcGItOVjxhhE3cb3yxqgMnIp8PDPrQQN312fQU9+GsS6SqmZyXJNG5o239ZMKnoFwX4rGeZeE6gH4GhD4bpSZPlk7cV0V+j35maOdpVgHsYgI921FWVF+cEDOKdoOdPI9RHBKJO9c1D6QBduVKNvBFOu16k6zYq/vBGNPiZag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655472; c=relaxed/simple;
	bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhkwAbiSN8CFMZUHXPCmWFifxBM8+/ARavhRiXyWCpJC5HCUmkLVdV1nsCxppIPy+SQp8HZc1yluLd3EpMhoCBD+Y/itfzBJGriRwZ346APBypWAoyvyVya6AUOglRdAOnnVjbBzQRvsDlUEuTcbctkElGARyi6zgsNr5Jt4tt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKjnxFbJ; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKjnxFbJ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-530e8c6fb80so82831cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 07:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655470; cv=none;
        d=google.com; s=arc-20260327;
        b=l6QgeBEvFeIxGOxeDZzct3E64Tb/e9AgMXGhNBU/yRZAbZewoYQGTHw/WgzVV0wXL+
         pZr+rA4nQy6/GkuExGNkmuKoACHede6hBJ9lcdZ7dn3ytqTMIYSp0Kau/6aIfG5VC3CB
         tfznZjSV/72ycSty2SilwP9x6fd8S21HSWwFVoY3vbdBGAU0ngwTdH7vTBojrM8q+Juf
         OCSVCFKznpwXapZdN2YFxiI0CahXKrZDNAAq+OdWg5K5ETYx3yluYZdMnffLbNVdFHKt
         9rSsCmi0Kbxxw8W+Q5M6lFn++JnZ8wLVzWdVlK7ta14yzw8lQAJDju5gnMrcpaVH7TrZ
         E2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        fh=k/2Rl3e5j0Fgi0lfnflGyjM5xkfAC/KARa2/ndij73g=;
        b=dYJVlu/u1zbAWKXnEVjrqWuA+G5gC6UVDvydQcOZq+iaQnsfkBohhN+G8khIPMgR2m
         PHw8UPAq007ecfOuqgbzh3XQvznUlbzINk9Cl79IM+djiBC3VWGWoeOLiWqgYt8Ibb82
         78eR4P8grho7jeZfW5KoEyKgFH9HSyexU/05rxU+Ezqn0BcdXxGYzmdtegCEsZoSQA9H
         A/Q0Ln1DJQoUlfjfxs9/pnSgSg4MLO2sv1+vypbf5Y4oWs+eBzBldR7NW4IHF7gD56p3
         KrszEvTTTVkcNqEY08JyKL3BoGMxTs54ftcoFbEoALjQHr6c42DWViadOO9dAE7ia5t3
         dNCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789655470; x=1790260270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        b=rKjnxFbJS2MhhAPcVRGEkOhipASSkLDPVfKni9GP3WTRKdID4oW/hSEZJQInOik6n0
         dB0Pcxcg1GURjGNYveby8cmzlXk6l4YjiI6Konl5/RWffjsGFKr/Bq7yNfxY6SWcLhyk
         NSwlhmUEmq68asAOMmHxv9POrKyX66zUZ4PJvkR5Fojgmu4sB0XQiidKf9B7lf/wYEkq
         3KkjmjjpKXf42sPP5CgfbN1oFB/nshGdrohA712pons/jWHrNoOro/14wgfh0Q38TZiK
         BQxMOkAcy8C1s0u5MoGoUepb79lcU4ZBtcNl+Gy707RVnJH6MIkRHq3vLfcxSOnK3Hi1
         kX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655470; x=1790260270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        b=VmFHAP2eiAvR9zTCpHMjUKTnyFahEHDLehMipeqDDgaCEeGQgOKuVzscGsiKIgUZDa
         l0nY4L1/b5/mXXu094ZLYrRtqEoVlO0yoLZVKPQOyxF6BsRPCO9Z0brblvCLvA8PnbjS
         94DsFiTAo+/gZBIgISwsYD42elLxb/OytMmACkxMNuh1pWAOFCEP6QFN2QRlraJffSwZ
         zYlSgThbelM1qH7h0VkKlA2W+TGICIl/ZrkQX6d0H4haCsYf516+sQYAOo4w+Iy0+6My
         ot5ktYRcreGRrIjFsT9OjVs5MJ6PREacn7T+5/XWVrc6tmropu7FpJ1z25kv0EdFLtd1
         8nJw==
X-Forwarded-Encrypted: i=1; AKwUvByV92ttZbVccA7SO+AFY3DpBHJDKFwsZkBR6p2Y/obMpniTu9dx6AcxLJ94EreTiXCAv4QuYeJXjbac2HZG4DA=@vger.kernel.org
X-Gm-Message-State: AFuF++kg2KmL+vTODg5TjTHxL9Dr3qcUxRIrryMqKrux4R26e9us3ls4
	9jPjoow4n9/LICu0d1vTrsRbq+Hi6u01NwTIpNjW8VF4HXLRdTmaDLlh5cgD41fVj/Eu/dtI3ar
	DUkLBIO2IxnPWercghRcax/OvxvfnRwbmSQsvY+80
X-Gm-Gg: AYBFou3dqEqbe5tpVpVg7cfBlRrDHYCjIpwql0tXIA6RtTZuUAJVBVDZO2miexJft0R
	rhkSVdpmnOrxECWAOGBMbUHgiRnWStk6m51GzhvL6XPzrrSzaz0r+lwE/A1KXulvhd6BpG5RBvZ
	ayMJO+o2cx5SSnCXa4BN7QaeOXr/mNou4cLKd3beeqIMD1HL/bZsjuBaGHXiQrQ9hit2Q9zD6YR
	LEDn1MIGh1dUq5FpKgUsM/mTAOAFVXCAQ+PK4YOBeYSyrxyFC/7LTjvdzqbbwyfGDH3tszHQ9Jv
	irF2sdZ5/ALSBhw/Vxzu9JO/o2B9wqO3gzFJ9FsdhlHCLt87oeOXNYJeONVRHQ2m2w4=
X-Received: by 2002:a05:622a:400c:b0:531:129b:2dba with SMTP id
 d75a77b69052e-532998b798dmr3895331cf.3.1789655469226; Thu, 17 Sep 2026
 07:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net>
 <016ecb3a3187b20fac299f1c2cb15aac01358412.1789281096.git.zhang_wei@open-hieco.net>
 <CALMp9eSnoFAk5PN-JudLc=xB6jzKzERfTVPEeAaRbLTYqtnKKA@mail.gmail.com> <cd63935b-8239-4caf-8e97-0896ab7743f1@open-hieco.net>
In-Reply-To: <cd63935b-8239-4caf-8e97-0896ab7743f1@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 17 Sep 2026 07:30:53 -0700
X-Gm-Features: AcwNN1XpKe-CB8PQDcy6cyaywdtMnfN_H56Nu0Oy7JZUSLelJ_9kw_Ni3fDLoxE
Message-ID: <CALMp9eRGvU_zXO1FWAj9o3dECpUaK4qOCOVwenPZ0nQ9+Yk2yA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] KVM: selftests: Add nested SVM DecodeAssists test
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:22=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
>
>
> On 9/15/2026 6:33 AM, Jim Mattson wrote:
> > Should this be:
> >
> > .exit_info_1 =3D BIT_ULL(63),
> > .exit_info_1_mask =3D ~0ULL,
>
> Did you mean .exit_info_1 =3D 0? For CLTS, bit 63 should be clear.
>
> I tested CLTS without FEP on an EPYC 9754 and captured EXITINFO1 at
> the L0 kvm_exit tracepoint, before reflection to L1. It was zero in
> all cases, with CR0.TS both clear and set. Each case followed a
> MOV-from-CR4 exit that populated EXITINFO1 with 0x800000000000000a.
>
> The current mask checks only that bit 63 is clear. Would you prefer
> checking the entire field against zero?
>
> I'm a little unsure how to interpret the APM here: =E2=80=9CIf the instru=
ction
> is LMSW or CLTS, no additional information is provided and bit 63 is
> not set.=E2=80=9D Does =E2=80=9Cno additional information=E2=80=9D mean t=
he remaining bits
> must be zero, or simply that they contain no valid decode information
> and should be ignored?

I stand corrected, and I agree with your interpretation of the APM.
The original code is fine.
