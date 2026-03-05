Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB71C68F
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736557; cv=pass; b=PCB7Imf0H4/WClXEbISToXoRU2+mjsowsfjFfM2pInbltfPcPh8UB7XlFBzloEr8xAgfliFJNtzEidJmeDXD07mIlr7y/XJTpgr+2r2JrxipfcMaI+TGEwg4u/RIRXzvN6NjBxirlB4q93A8MS1hJMg8/wqxNR7cKSR6WdpxKbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736557; c=relaxed/simple;
	bh=eAk+jD9Rcem2AMZY6UAt3WgRdXjAWpdgOQGbMet11qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWdyqFBgKL0Gl3EJ50Rl0D3fMv7FElmKi1MONSxTjOi+JU+BNrbbfZ4ZwkYELh9GcuLIQ/8T5dRV/yn/xkT4ruC7jz74AMcIG8d/Brm0CbAbVTf9fwFnBMkF8JygbQMvQqYRLZ/OQhpirLR1VDWHYwsSypRxYm+kGb0XQgWld38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ynk6jH5H; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ynk6jH5H"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661169cd6d8so1040a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 10:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772736554; cv=none;
        d=google.com; s=arc-20240605;
        b=HUIkazNi/OkC8HLNpKRAOCv/56mH8xWfGBtbwDruJbnZKdFZRe8YAARprBor6p48kL
         5bLrl+ODG1j4YGRLr8ugtm/l2tcvO7P8EPGdBx+yxBiu8el1aVyrZ30H6YJl+/S4uxSZ
         +qPXWMfG7GnjzXpIiH6V4XRWvARRyH66437fWbqSmfo7RjXA2L0wKiAjzvYpK1VLsDi4
         3ih7/LbjyIUIHzQGzM53SWK2JFjzX5BvoGas+qJwSvkhLf//7Vu3jxGPgEkU11eCOhBQ
         dPsi6f9XebJ+gsPIcPD7evliWBYKaaUtf1X5/JVE+OScMu/2W5qcISaVx4l7CSnwaTO/
         k8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3NngYta4vdsWAWIxQPmUbWutCRgra+ifU7R7mQBuGRQ=;
        fh=VrcPfuWIAbSBdgo3Co8CP86DiDy1V/rkhgupKNj3W88=;
        b=AwuJKSqiHymziiXOuvSuZlfA495gPPzdCW+tvh6ioje+WpObdsBZQAc7TJ+3jlzEZo
         Mz3JN/ZCkWxYhJGqv/6ung9dD0vTiagHN3YZeT3RybLqAZqB0A3mH9Ud2HnBdRevTRkN
         Sur+7M5I7TWO5fC45xRFkO3aqTzQYkvUuDRQ3lZhELuRCkpxtpFqp5YArxM6cKZlCRmx
         ULQEReJ8iwE/n54tM7x9fJ2gTeU0MWknq1BUeRQz8+G5aCn1vFLir5FW10kvoImfpofN
         9jQbpzf1IXHylUNXepePMuTxTxCc8oZYmNNV8hBggDwXDSx95POuso1wt03Q/Frw36i6
         eaqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772736554; x=1773341354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NngYta4vdsWAWIxQPmUbWutCRgra+ifU7R7mQBuGRQ=;
        b=Ynk6jH5Hwm1P1VxoyaKyXWalxr2MrTSy7RJ9mwO63D0ENhsEY7LkyE7UPUsz71VAI0
         W7vd9L//7S325Biuj082DGqm51dH50+4YTqcth2Of16iRrCpeysD8FWvzgO88zGJA1zo
         nWjTtr2FIcibiHGdJ0yahdm2ML1DiKTIX8+ORIHyOmEZcAgf7HoqDdOKOAYAMIcoArhA
         eRNR6xOmy88wtDpM+73lH1Zd6NGNqntIaqOeEkrYfxnMQsERXdNp47h4MsdOQ9iaRijQ
         1AqkezKPGauc+CwW3yThcDFiA7ATLKe84+1kVTiR3Klja5Tnhy3Ihu6jOq5fzD3CIOS3
         YogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736554; x=1773341354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NngYta4vdsWAWIxQPmUbWutCRgra+ifU7R7mQBuGRQ=;
        b=wDfdD178KId205JE+CFRSmFR95wE2t/xbVJC/CexAEScLNsCaCB0c/BmK4UyBQfsBT
         /j7ThWu2v+vdJp//y5FRwlpkEZ1YIu7Nue7KsW0lDf2hRfEX6ahMADTjFm2ym0ulT6qO
         3z5rd8AQzg68OqvYi8DgjxOC741qxWwQhMwVUqiO0I1NGxYeq1G83PAw5Nzeuh1M5+Mb
         Ct4IMVHfgehE0sdMEsOaMfPrfXOqr8fPsw3il8qCpvRIQrhKRIy5T68cL3qoEoHa/42v
         8vmst+gzXRJzw6ftYLHhmSkaYYFZxK5nGl5cuaiQ2lpb2XxGZ5Qgk1VYgRmzCHyS7EQf
         W24w==
X-Forwarded-Encrypted: i=1; AJvYcCUuCXG3faNMJrAutB21nbJBvtYn/WQgVeCV562Gx0FIp7NkSoYpTBpVCK9E62eHngyMx+vV+pAgYGtc1VzVhNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGa/HomWv3ZkCJKfnNBG0rBEZOqCB8VxQDwXCCASMygqi9uY0
	leplQ3rS3/EnzbrCIsOOiJ6VJYFRhWq17RixVv0ZIKaDtqjD27OFS+xafcHI9vlVA52PfADTj4S
	VtkJ2nIrM+BMM8mUSz5IfGpF7dzYJ0ZgsHpa4qkZU
X-Gm-Gg: ATEYQzxcOlIj2MGJP5oQMRxK7njE5tcj3UIs6htFOPZvTRpQLbRA3pfrlohcEHsFh5b
	lG8rh/+MRWoi+JrnRfg/gZQvupCAMQcH2W9EA+YjSRCW75oN2fYqAikZ++iwWBfr4/mI2Tl1LNd
	DTnPorueB38szlj9i6yQdthuQbS3huwWCcb6Vi3V1927cI3pPkRw86PjiZbDWG3+u00ZlULv7jN
	3yQihyq6rwrDKzkgfQFxM1eCIxoFgLp6LcILmNpXvVvMiqxyhQ3g43EBJwHqSiLDd+BIy410gBC
	JabY7+w=
X-Received: by 2002:a05:6402:794:b0:65f:7099:bc8c with SMTP id
 4fb4d7f45d1cf-6618dc4a4b7mr2986a12.8.1772736553564; Thu, 05 Mar 2026 10:49:13
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com> <20260224005500.1471972-9-jmattson@google.com>
 <aahn2ZfDAJTj-Afn@google.com> <CALMp9eR7gKWp8M2Q8Q7vA5hGx5bc12KCh1NZMK33A1dpiKNt+Q@mail.gmail.com>
 <aaiD0k-BE4RZJPfv@google.com> <CAO9r8zP+tdUtDwxzDVKbtCk7Ui5y=Zw_aZ+ptL4-H6-R5vXWTQ@mail.gmail.com>
 <aaiOQKHoSrpPNR9b@google.com>
In-Reply-To: <aaiOQKHoSrpPNR9b@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Mar 2026 10:49:01 -0800
X-Gm-Features: AaiRm53Cb21BdMl5XJu3HttHkszR5QTije8R4B0bcLgCFedybvlXLo3WaDLb-sw
Message-ID: <CALMp9eQ5e_Gdvj=Cc00Puba=-A6rZ-VrV=gkvf_O3_fm9vA=6Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
To: Sean Christopherson <seanjc@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 11:55=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Mar 04, 2026, Yosry Ahmed wrote:
> > On Wed, Mar 4, 2026 at 11:11=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Wed, Mar 04, 2026, Jim Mattson wrote:
> > > > On Wed, Mar 4, 2026 at 9:11=E2=80=AFAM Sean Christopherson <seanjc@=
google.com> wrote:
> > > > > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.=
c
> > > > > index 991ee4c03363..099bf8ac10ee 100644
> > > > > --- a/arch/x86/kvm/svm/nested.c
> > > > > +++ b/arch/x86/kvm/svm/nested.c
> > > > > @@ -1848,7 +1848,7 @@ static int svm_get_nested_state(struct kvm_=
vcpu *vcpu,
> > > > >         if (is_guest_mode(vcpu)) {
> > > > >                 kvm_state.hdr.svm.vmcb_pa =3D svm->nested.vmcb12_=
gpa;
> > > > >                 if (nested_npt_enabled(svm)) {
> > > > > -                       kvm_state.hdr.svm.flags |=3D KVM_STATE_SV=
M_VALID_GPAT;
> > > > > +                       kvm_state->flags |=3D KVM_STATE_NESTED_GP=
AT_VALID;
> > > > >                         kvm_state.hdr.svm.gpat =3D svm->vmcb->sav=
e.g_pat;
> > > > >                 }
> > > > >                 kvm_state.size +=3D KVM_STATE_NESTED_SVM_VMCB_SIZ=
E;
> > > > > @@ -1914,7 +1914,8 @@ static int svm_set_nested_state(struct kvm_=
vcpu *vcpu,
> > > > >
> > > > >         if (kvm_state->flags & ~(KVM_STATE_NESTED_GUEST_MODE |
> > > > >                                  KVM_STATE_NESTED_RUN_PENDING |
> > > > > -                                KVM_STATE_NESTED_GIF_SET))
> > > > > +                                KVM_STATE_NESTED_GIF_SET |
> > > > > +                                KVM_STATE_NESTED_GPAT_VALID))
> > > > >                 return -EINVAL;
> > > >
> > > > Unless I'm missing something, this breaks forward compatibility
> > > > completely. An older kernel will refuse to accept a nested state bl=
ob
> > > > with GPAT_VALID set.
> > >
> > > Argh, so we've painted ourselves into an impossible situation by rest=
ricting the
> > > set of valid flags.  I.e. VMX's omission of checks on unknown flags i=
s a feature,
> > > not a bug.
> > >
> > > Chatted with Jim offlist, and he pointed out that KVM's standard way =
to deal with
> > > this is to make setting the flag opt-in, e.g. KVM_CAP_X86_TRIPLE_FAUL=
T_EVENT and
> > > KVM_CAP_EXCEPTION_PAYLOAD.
> > >
> > > As much as I want to retroactively change KVM's documentation to stat=
e doing
> > > KVM_SET_NESTED_STATE with data that didn't come from KVM_GET_NESTED_S=
TATE is
> > > unsupported, that feels too restrictive and could really bite us in t=
he future.
> > > And it doesn't help if there's already userspace that's putting garba=
ge into the
> > > header.
> > >
> > > So yeah, I don't see a better option than adding yet another capabili=
ty.

Capability or quirk?

/me ducks.
