Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD43218DD
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562220; cv=pass; b=BGu/3XTDL7V/HkGvnsQBVVkbpI0ASOqurPtfnCaGdGtmc3auctX1lJ8llLgGvl4Ryxwi/BRKZ5KeMCalkCY3edceainoSBkxdjdprZflzBpK7nU8OfTNHtVIHHWj6yshdwt7x9O/7i49UPNs3CzptSm08zqMNa6GCvdg3GwtJnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562220; c=relaxed/simple;
	bh=vbWIOEfqSbsqmebzcidRuMdnREb+FHm0JupshMflAjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUUBXJj6NfpwpmYmh7PtyB/gCN2dTEjGuFiVYdc5A1nYqWiDLlwKSfOOLquy5XsqZZ63PDXDSTIdIFC3MHhvconBWjfhG2fbaEE8eM1hmn6tH2axa0nzHaDWjMjkjYEGoZTzqP8wZUfXHMGowK5eAAzTI4l5oRO7urtVm0TOKGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYR6T130; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYR6T130"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so3860a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 14:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774562217; cv=none;
        d=google.com; s=arc-20240605;
        b=fXH92DBWzAcOs63cwiMW2sUlXr/ZZN7rBTD6+HFZtCQan2AcTnR99dpParFu2APq9K
         CgUsdlCgrlzOIaVYFzw2pmJyUZo3iL7b/TuCdDKhM6JHqm8mrIV6wHFkDIyK64H35n/n
         IlU0lVpNItRTHXUY/s5X4zIba7hwbvDoHpGq+QqnzH3mw8Il4AFE/i5U60pgEFn5kKnc
         F/B+K9SNbcgjLeVgH5sKSYuGF93OY/3HbDRTI51KTXoMyahysWSqygXTAMMnUI1YjVzS
         Sh+LwzPVXos3fUUw3fLyoQwgCZkReD5E/D6ZkdBPbWYopuLH58X58ovCf/+4HXbYquwb
         BWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEmcE5ZcVNzsLkYYvvz4gjReNb+1g33mjp+MWnHjCUo=;
        fh=CK96zsn54yYrJeXGyTT83Ve9NXn7IoGxM1zYKx66+TU=;
        b=EJ9AFmHujbVhmrCBsD1j77py/NF/aNhBaFADC3qAiwXNyzUEBn5NbIFyWD5TfMPhmy
         al3NBWg3P3PEV/Qywss4/8EwLyRabR11MchsbymiiOU9PAlgFTETWTeJ/R8a974VIbS0
         PEPMp4/ZFYdlWiceECHyd3/I5f2HT3ZNQfMuDyeR9akxbq5E2f1Bv3ggJ5FYtgnjSxVk
         0E1CP7Hi2CBHovpNHtq8IZqw6hCTqnHZPaYAl+kvLua9v7YZLoUiC6TnTZgBL6RSpkRg
         kZkkcvObTxtF+XL2Zmv5yet8AcEugOyOPWTx8FbOknuqgLb4xNIm2angvmd2ak0Xrg5l
         yNAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774562217; x=1775167017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEmcE5ZcVNzsLkYYvvz4gjReNb+1g33mjp+MWnHjCUo=;
        b=EYR6T130QGrlYd/rzeTGvEqJSf5mN3SQIu4wZpbG8gFJ1D9LIpl1MUcAkQBxe99soq
         NTdqIJEw45auvuQEPSQJBLMe2wQYZ3OJc5W6C4jKLRiABdwifwRYqxpdWP6iGQMtEhKR
         E4TqE5JqaIC9mIfxipAdogWB7B5F69QXslS42mlAOZrMVucEzbu2ShJUhIOWPMtImn4Z
         bOP0KhZ2cQSYDMbHhQz8Wd1PUP4kti1Em2esxGGaFHyvO7sTCPWfTRQFi4/uqiI45uOJ
         yOldmbbr0bZVFi/zdkumJB7HzMECizO9Izb+8ErfY+OgvTZ5R3h1n5r2qd/DjjzV5Ui2
         d/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774562217; x=1775167017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEmcE5ZcVNzsLkYYvvz4gjReNb+1g33mjp+MWnHjCUo=;
        b=lriI/vccbRO9iTP/zkz6UaXyOa8fmzrpzeWRIm6WqT6e16YgmA3u1z/BCxPoabNAG8
         2PP+N3ah/MJUwXhG9KinqOKx+8LsdhRUW6EM7OzX+IyPGuCNDLJIIycGKcUU58h7AC8y
         l5YElr4KowvSU9g8GOtJEKLVQBeB0q5ZGPm1OP0rZSiZdg+cVrrN7O5f9lwjkTV87mUS
         zeYca/QDjH6XeHKzuSJSAaHd0bgxWx88kI06h+Ah1w3XWGCx/aRjAwBlw3BRmII1OYXM
         6qdkHsNAiRidqDFNWXZDDQX8+/+OgrG2K3Rq1TG82cq8c10YBbBQgF3qGcCu7uQhw1QB
         vAJA==
X-Forwarded-Encrypted: i=1; AJvYcCXOSzVaASISvBqdA0dCSTMEbpu/NmDld5tb7bY4Thqdz+nTDhb6GCBrMrfOFJByrYpmFNS6aUUe5/0pSpgriO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRpPdAWc1t+Ebj502gVoODO69pdCMlEwHcSOv9DwSU1mDt+xP
	UxXEfy0H+DDdmESToawliz31Qu4sOcKgLAoAZP0MjuI6K9j3bchK1GBV5G+eKf7KifCDTTRhhxL
	UmSVSloFG9Plg9GbHCytRXCHh/m+jIRIs/FSe0+wC
X-Gm-Gg: ATEYQzxbTeAYQHkHC81xzg9JDmEh6aQju++aGdhY031vfHNuwt+njj+lZsF7k8yD8EJ
	ftJHFf+JooPIJ48nBjIjoqfj0KywGaW0wGOMjY2hoPhFeuOEVgcNadKnKmrOLx32RTQjoC/KJb8
	LYzn4zUAKR7P11W7/5v6YsahNb6VETf+Bkmd2aHkN7tiNFNB2dOkcfqvOsSaTDfkpI3tphexNX9
	D5JElr94tmwylhZzeQAbis/Tx+D67j9VXZew0QZb9yf9LgSOntQE7qcv17xtH6YG1vZPzu0ljl4
	I7PkLAoAMp+MeDsW2g==
X-Received: by 2002:aa7:c757:0:b0:665:d39:4afc with SMTP id
 4fb4d7f45d1cf-66b19d7f94amr13694a12.6.1774562216825; Thu, 26 Mar 2026
 14:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-5-jmattson@google.com>
 <gqj4y6awen5dfxy32lbskcxw6xdv4xiiouycyftjacndjinhvp@7p4dtgdh6tjw>
 <aY9BPKhzgxo4UuHB@google.com> <CALMp9eR4ayj_gwsDQVH8pQvzqgEYVB6ExWp3aFgJXRWikLEikw@mail.gmail.com>
 <aY-jViitsLQm9B83@google.com> <CALMp9eTnXW9=0=+RxQjeXfA++UP3MX0LzXo5qwUP-dCCQjOLVQ@mail.gmail.com>
 <aZT5eldlkLpRm7OD@google.com> <CALMp9eSMLwiE7JPs53w8Nyq2HB-Thmv3wNiRkMV1zrJmJeoZag@mail.gmail.com>
 <CAO9r8zPwT3cZjvPaqBjFtZDd72Ffjomb6J=QjnXr3V8LkASCHg@mail.gmail.com>
In-Reply-To: <CAO9r8zPwT3cZjvPaqBjFtZDd72Ffjomb6J=QjnXr3V8LkASCHg@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 26 Mar 2026 14:56:45 -0700
X-Gm-Features: AQROBzB7NvOUANLJwQsGxY0UhtynaAQWyKZHYOlZO6Z3zZDd4zAlzCmoqi97Rss
Message-ID: <CALMp9eRp-fp7RaULeLZ7itAJBKH=LMRqgUJ-H=ks7K0rjN9wCw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:26=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Mar 26, 2026 at 2:19=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Tue, Feb 17, 2026 at 3:27=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> >
> > > Side topic, either as a prep patch (to duplicate code) or as a follow=
-up patch
> > > (to move the PAT handling in x86.c to vmx.c), the "common" handling o=
f PAT should
> > > be fully forked between VMX and SVM.  As of this patch, it's not just=
 misleading,
> > > it's actively dangerous since calling kvm_get_msr_common() for SVM wo=
uld get the
> > > wrong value.
> >
> > Though I included this change in v5 and v6, TIL that TDX calls
> > kvm_[gs]et_msr_common(MSR_IA32_CR_PAT), so the common handling is not
> > fully forked.
>
> Do you plan to drop this patch or add PAT handling in
> tdx_{get/set}_msr()? If you'll drop it, maybe add a warning if
> kvm_[gs]et_msr_common(MSR_IA32_CR_PAT) is called from SVM?

I plan to leave the MSR_IA32_CR_PAT code in kvm_[gs]et_msr_common().
Replicating the code in tdx.c seems like the wrong direction to go.

There's no precedent that I can see for checking the vendor module in
common code (though we do have kvm_x86_ops.name). I could add a
warning if invoked with (vcpu->arch.efer & EFER_SVME). WDYT?
