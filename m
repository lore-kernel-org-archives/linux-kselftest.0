Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730A3624CB
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579283; cv=pass; b=mnBRuun6ZVwg6eEwxmD6vJxWmMaSSYDMipYL7rtGes55u+2s7ygZ0mGJHxseVeUrH/aU4ikQOYSMtUq0liTHohOGIfNAYra8TpuuvaS00mBOYl6HpR9tZtdhmB2mVmStpl/+U4i8ce65F1ouHl3+xfx00t8b29LggrA2C0MmpWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579283; c=relaxed/simple;
	bh=mfSDevp9b8hpUHFiMKkR6R4RMAK3vtsH4zOSKGhaxkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYWCbJOV96/E2VegsfkfwepRCU5/JNZp86wP4rP4kJy+7aWSN3AdNz3Cu1maoSR4Wsy6aEq/2vPfnVvqMWD0FD7SR92cHgA2z38k4307vnqaPhJiZGktzAckpbw21wj71X5b7uQYodBgLLyfTbGNNN3zX/lU8+7DT1IphvmGvIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4Z06B+W; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4Z06B+W"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so41576a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 09:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775579280; cv=none;
        d=google.com; s=arc-20240605;
        b=YxKaaTG/l3r0JTeiNS4Qu4OWUUdttT0i0LuNqKAYrGYjGkttOCJ3gGg1FRYISYtJWE
         WjwlcRnsL077Igtk8whCZL104aKcNVWwFyGnUYlCSb7mgw5yhU1LqyWk/8jRUDeicmLB
         JeGfR6kGfDpEAJ1zy2tPsF1BT2exUYS0Vu1BKufdYpawAD7t9E8yYkxCk0K5I9QUXAOV
         2uCrsIhvCpICH7B8E+Q4CG4f0F3wiMUfvVEsEd7hOrGdtN6FTPFj6mjZ4EYIchI5a/tC
         c0A1MvHvfTeZ16CbZi/4qkYyKmgVTBwtD8olwTzVnw/0+hq++mfluEKw5q2TMExK9+9Y
         4xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        fh=VIEDZD0zwQrOLwTP7MeUyL4HUXRxKZsLu5oxsEO632E=;
        b=I5VaclbMmOSl6KNwEITLku5aBc3+MwBcbzZ1FrkmLx6GBkeSAqGhJth07f4yOM5nRt
         EPoITT1EwZy0dq7KyUrw5D7d6bH3MqF1EwHnCYxob+9M5VI80tLAVrCG+RF1o44NQoWa
         W+UTEnitbNB5di4k+xaHshazDQLhXTINuOsH099h11Ov9cs99wUXgUIuFsNWsckdoSPW
         l8f53bttRnB5lWMd5lMtRKra1/SyFC1QwqoX34ohP3LVLNqPhRPgnpMzDgyL4wuL7RZo
         mCo6zJqJiEHDVN2VFkKF3GMNgcTrEj8ZZHfxlIwEdLOqJspn7YetaEMCFZwjSEZxEX/Z
         jtTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775579280; x=1776184080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        b=A4Z06B+WfljDsz3Y3MnqR5tH92eU8jRlUBHvvr/DQRI4JIPythmJxKvzbCpTaluEcO
         Y0zvpsOIPeNywjQ7ouvyBYKeddXF9vi6gPZvtkav0N6uDf7hf2Q/31HrL2HnKuTdzvTJ
         2O4dqmpJ+zSMjkzAe+a4v7yq2iYxmA5bHqHD/xqLbzu3sWybSOOxjSj/2GfCANSkbvsM
         juv7p9h0l0uBR6A8BN+ViF31zH3LLVtnQaO5DkzvaO0jZAo5iOQ8h5TO1/IG9HBbyJ/q
         118Uk0lpXbpAOsVmmCkhC17GRj+iwSOGQh5CES5bLuOfB/4EB5dOTN8YMoQV+TuCYBY9
         nP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579280; x=1776184080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        b=Qnl+u2x2L0yu10ek7QWdpQ00EGdnLyrvpb/BN031mTNrXMTd5IFUSNP72qvXF8dNP8
         /lgAXJ9dscbGSTcdRbOFwONGWzBzm1djHTJh+Kup1nkIGpWRx+G7cP37+PI/H9TAPGbD
         QOGuO+MA8zRVH2T41cLVbnzYnhrCYJvN0aYT8B3PerHRJrApAtGD6GDs9Pt6qQazA3l1
         melTo+6GBWPnr8U2pZGhaFwATI3rUIAgiblmgvp6hp1WS/YzqP1v6MiuJsepG54/iN6T
         K7G7ApZpqbbLXp2QAO8IaPMH3XJphpkQnpMzfyWd8neAYUs12XnlKgLT4WbZylWa/AnY
         A8kA==
X-Forwarded-Encrypted: i=1; AJvYcCX+vVz3yDtgGcN8CEByIoty2H7gkq3U0gj+LTo2ex0XWsZmY3sspPJj+10L1RM0xgNf0Aq0wiOeWT3MqxAQK9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVfuLNMKByxfoUIQZE5MS1HIE4XHBRxIO4ljsmzVQlbe0dcg6
	K5BIakRc8z9YsW8WGcK5O2mDrrzkD53DSn2i+AMSXmiTBlzqqstsJJKGq1/XHni50UttQxx7Mcj
	3gtzmBCsmUBrACcLQU9pJB23V/XOZOAqCe+06efGY
X-Gm-Gg: AeBDieuREtcheNn7LrHM3h4CoO9G60bBl1KFYSe5c8Dr/B69rVOBuEPrgpDOZwbFyvS
	ydxSHMUzJNgTPKWF7iz66SZgfmkMGxVC41JmhdsAqDKQ1R2S3EXhZ8zqMnxfODuDKrkhwmFAQXe
	Ko3L4w0bxm0MlKFKn00FEUEZdmQTgn6qBYjL3uSMwBoH3gNj9epurUqI7RI6FB7V6rn1HGSBZV+
	DL812JzW8Rlf3xySOCkcdSxoOSwph0by+6Y0Uulx+isuTN9G3UOYi/c47SSCptQeSzASg3Ani42
	NRXehVMxIEE3FWR+/gItej9hVo2uve5PBo8=
X-Received: by 2002:aa7:d14b:0:b0:66b:e078:5934 with SMTP id
 4fb4d7f45d1cf-66e4181ffcamr155534a12.12.1775579279867; Tue, 07 Apr 2026
 09:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-2-jmattson@google.com>
 <adRBZuqNlBozaDrK@google.com>
In-Reply-To: <adRBZuqNlBozaDrK@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 09:27:47 -0700
X-Gm-Features: AQROBzDfpgRU66Y-o07i73DU_xVQhhMm8EOnCI-usfps8N1_AZv5hiiifJSUv6Y
Message-ID: <CALMp9eQR_ZivpcARLyvDK3w+frpwU8bj2Z+ZvA_fLdCtTq3Vhg@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 4:27=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index ff1e4b4dc998..74014110b550 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -616,6 +616,17 @@ static inline bool nested_npt_enabled(struct vcpu_=
svm *svm)
> >       return svm->nested.ctl.misc_ctl & SVM_MISC_ENABLE_NP;
> >  }
> >
> > +static inline bool l2_has_separate_pat(struct vcpu_svm *svm)
>
> Take @vcpu instead of @svm.  All of the callers have a "vcpu", but not al=
l have
> a local "svm".  That will shorten the quirk check far enough to let it po=
ke out.

What is the actual line length limit?

> > +{
> > +     /*
> > +      * If KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled while a vCP=
U
> > +      * is running, the L2 IA32_PAT semantics for that vCPU are undefi=
ned.
> > +      */
> > +     return nested_npt_enabled(svm) &&
> > +             !kvm_check_has_quirk(svm->vcpu.kvm,
> > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT)=
;
>
> Align indentation.  With the @svm =3D> @vcpu change, this becomes:
>
>         return nested_npt_enabled(to_svm(vcpu)) &&
>                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT);

You wouldn't happen to know the Emacs configuration for the alignment
you like, would you? I asked Gemini, but it lied to me.

> > +}
> > +
> >  static inline bool nested_vnmi_enabled(struct vcpu_svm *svm)
> >  {
> >       return guest_cpu_cap_has(&svm->vcpu, X86_FEATURE_VNMI) &&
> > --
> > 2.53.0.1018.g2bb0e51243-goog
> >
