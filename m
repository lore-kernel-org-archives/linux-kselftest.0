Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC030F543
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771626410; cv=pass; b=X9QSd9WxizY08CyEza5/zHYNv0pS5At2YSuzr6DqhiJqZdvVdW9WxeDvrVgtLaqk6CjIXvoq9cJs/YWHh1+TAHU+kSoW4j/OUcQkzjfkiZBFcyomQP26SD9kfADiy1u/IwfLVBg2b463r9N3ZN4x7emhA93m74IISAfLtyF/kLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771626410; c=relaxed/simple;
	bh=SuFFXamwm+ptnoWMzh0eeppJs25M/vVzrHN4bcP/QfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uv2JOawywhk7aeOJ3vxcp8qBfzbl95kXMfIRsw8odg6AycFPCtnl9E7UEFkDaKtd7z3sodm8f1uuGcA+XSYF1o0JE4BAqTEKsNzVud8hMHigsXbOImg8SWvKIsT5GTHYzl4hQslZo3rHeYabi17O9cNvrKmAMpoAG/IS+L+xeFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sYYBScYW; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sYYBScYW"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so1384a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 14:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771626408; cv=none;
        d=google.com; s=arc-20240605;
        b=cnBs8GdYBtCsxTwETpmCH4sct0iNg2Jt/LZs7M1OWaxTiWYnKSb3cN78YwEKHyIpVV
         gH19ZN2BBnSA1ucz11ZIfux/uMXqDGV08/RFYTiuIeA1D9nCl8hnf8nN71A88JkhHEJJ
         KQjL5RC4lPUyBvH4p8B2YJe3OVvhS/YDBE3NpKoW0T8uxqg0ibfVA/dfJQ8lr896UVCC
         ktJcPd5wu7KwDesgeZdIHLab34gOTdPX7BmwAIm/THHCBIHUopKGlSgJMO0WuTG83S6j
         nfQN3T6KaLp+swjgjnnYHp91ayi/ECjigkqOv6Pj54PImb4I3RjkFvt/ueHfqi00o17f
         JnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhONdEzZ5uYj0tWSg+PyKRuIzspHfnI5Pzgh7yFndao=;
        fh=AST44PStYfYyuPvY/LgIXw1FLBhFfF4H4ZQEkVahuLM=;
        b=XLkJ/QjGSB/M3GmqbG6VDUEpswEvETogwIezQVWfH+EMHdTaA2PUP/qJLe/d58V3LK
         dCD/7CSi72BiTq4mXmb4YokpKX4jS7RNw7dQRQSM3T8tZ6YhgVMaxkLGu/bYVxz+Nd53
         V9plsgGsqIFZkyU5kmeCzOd/QF9tits6vWxXCsHBRwwSOOmmu+/UGwbDgr/sAJ4YY6fN
         3BM1y1ldBIb2F8+QksZx4dtOa8oZmihFm25MjNMWB2rB9fC84sWO307P/rMKWW7dLavQ
         9pzT69Pb8OBX8IyEefwv1NGzm6RcZRyh9fvokJLoeBTv+8tF5K5Zc4a1dTtN3nUqZIt2
         B6Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771626408; x=1772231208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhONdEzZ5uYj0tWSg+PyKRuIzspHfnI5Pzgh7yFndao=;
        b=sYYBScYW26MrqMFgWTyDNSeR+2o+OliRs8oL5C2PlcPSBusYujbQ6TIG7MaBE21rT1
         BdA3Sj3mFWb3fjMStbRw0gl+quQ/xiQkbs/aPnbXRZpxg3+amxi/ht1roMJQG8t7yLmg
         ZjOZ6pz6oWqPfeq3oR4YT0KSSKxr40kUpMjx8cWxyC0Ehkx/1TWqhMZrlOIQrN2FTyI6
         YxmjfX60P6sFozGj3mTaOiS1BpsHqNOEuyxkxvgzh9uos2nZO1PMS+vEeZH2n3DsQ7tG
         KZzPANNL+VKOOsnidrzW+Wsayg12uc5LWq0NPQjJWJw3A5rExGwu+QGUcutXarjVvVoy
         3u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771626408; x=1772231208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhONdEzZ5uYj0tWSg+PyKRuIzspHfnI5Pzgh7yFndao=;
        b=JeLhZERT4VkLqrzl58EyRT5KgAU5NQneDBMY3VSCqG6uRT7c5UdQA3jrC1jvpRQAkL
         zCIypu9AI6eQ4cN6uvfIC24N8UuuOn+zGye8TqK6XP6kcAnjAsCM96zckOsmfBAuKZWo
         RaBFZt/adyku7ZPMblXsTTt2I6+RLl4W9D3hOitstwRwsSk063E/9a/x3GnGc6+j1Cy1
         5zQfSKF6W3A0aXLjwOyn3bL6JCYl+Oa/PdqLI9mSpV7bbEsB5FEYw565bkZWyUivx/sJ
         fLVhxr57U42nDenDMFwRHWDStrsLgdU3l8mq2CmbLnvqxwh3axkckZ097v7HREfbDIB5
         MB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUihvRgV4nl/S8RnQqqivk5DV8sTdx2Luy2RfCeY+8xo4Li+u97e/MHOIvMjYJnSVy5qP0h4CTZDaUpdTuUWU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcw1CihIibUbrI8Ak5pdUhdQeBwhaFXLGu4Pf6sCmZIcZMeI7
	tXCBF/U9J2JtxQXm94qZk+AKK2m9prAY7qtXA6rbQiimb5S68U8r1XVvjOCMpgpSCPgmAPPduvV
	9/fCC7LmgSk0bmE4HJsAD8f5vt8LlOS6KfHtfVq2z
X-Gm-Gg: AZuq6aJNAkNdfLpiNiJrSDEaHKZVsqyZSkVV/2936g1/mG53j0NMcAdSdaPWBRm1M+Q
	JhBVq5bkvQ21LpLqODBPS5bUbqPkouFg0I3JJPoGpjlnXB4Y56xkV4Bx3YbAbHN27aaPTXYynpv
	JMbr4Kx7xUMI94hG2ky6+EpMxVc3QANaVut2hSB0Q3MxLoE7S8jHNXnoUjkkpDGqBe65U7IsKnn
	uK0PE+B4t7qtDjx+jDssxabzcYgpvTDFFZp/PZD7nnnng2g/kvrhBdW43BkP8z9fz0BC31I30QO
	EiiSxZDWoP+sP2HRGw==
X-Received: by 2002:a05:6402:a2ca:10b0:65a:3032:5f99 with SMTP id
 4fb4d7f45d1cf-65eab89c28dmr9467a12.14.1771626407377; Fri, 20 Feb 2026
 14:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-3-jmattson@google.com>
 <y2c76qtfmwgy4ncypthcm25wedlapwknjnfyptu62qmlbdqa7k@udzmtcddsmwa>
In-Reply-To: <y2c76qtfmwgy4ncypthcm25wedlapwknjnfyptu62qmlbdqa7k@udzmtcddsmwa>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 20 Feb 2026 14:26:34 -0800
X-Gm-Features: AaiRm51T2rP331JnlXcrOOihyG7FCkVkRkv247heUN-CWGu0lt_x6RRhcjTjip4
Message-ID: <CALMp9eTNpSDkEgVBb81n_vQrd63Txg+gMBCGh-DAcN5yOuhLxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 4:22=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:

> > @@ -2006,13 +2012,16 @@ static int svm_set_nested_state(struct kvm_vcpu=
 *vcpu,
> >
> >       /*
> >        * Validate host state saved from before VMRUN (see
> > -      * nested_svm_check_permissions).
> > +      * nested_svm_check_permissions). Note that the g_pat field is no=
t
> > +      * validated, because (a) it may have been clobbered by SMM befor=
e
> > +      * KVM_GET_NESTED_STATE, and (b) it is not loaded at emulated
> > +      * #VMEXIT.
>
> (b) here means that svm_copy_vmrun_state() does not copy it to vmcb01,
> and the value is restored by KVM_SET_MSRS, right?

Actually, (b) refers to the open-coded block of assignments in
nested_svm_vmexit() under the comment:

        /*
         * Restore processor state that had been saved in vmcb01
         */

> If my understanding is correct:
>
> Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
