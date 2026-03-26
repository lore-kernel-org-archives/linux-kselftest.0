Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613D83A14
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562406; cv=none; b=RjeOJDLSCD1nf2atQmdQL47tK29She7lgQ8bpgMSTQxH5t3GRghTtu6GYSrBKn2pVl3AQKTtTmRlo12uxrAYC1v0uV1SmIRZXt58Pq3hntb2b3D7zHd2jsj7U6VOx0LPwVjJsLl53F+dMvXVMmakx4OUbFxujHboPXgRAR0gQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562406; c=relaxed/simple;
	bh=LKbOUXD76E/X7J7tMmhUieh7kXj7AnqWmQDxhTruCps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RF5bBz0rKsTQUcvCxVgRbxW9NFMI7S/mmvDotWmesXV6YgF6uE8xPC51y0M6l0JS8z2tILuMgYcR8K8plWXjpE2qyZsRuNJSRX5AwUh8pInxQqUSFVvVKwvDKO7n/CJTTfZOHU+jo5l+1vfPKZ1RDmW6gxn5tZQoVE2vHWMbATI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMHJwoHw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMHJwoHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8C3C2BCC4
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774562406;
	bh=LKbOUXD76E/X7J7tMmhUieh7kXj7AnqWmQDxhTruCps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMHJwoHwKULS9FZ6u/hRFwKx0GnO04jIP1WDkzN/Fv115cV4m2crONqsocbRevOJo
	 rH9GNnXATLppdzGTdkIIJcH+fnemgsB2Uy/jb4Eta7xPur0VyFGPtnHlBP/CRZx1py
	 psVbFZfks29+5eY3+BQ1a2GKBoBHULhx27T3RnJ0SkTo99ILrJi2x/EpOPcp48Xqst
	 BJ7WjANwgjU3ZPfpP1Taxtkuoy0mp/8w2nB2fMQLCUpRk3iNhUA30ZGXQ2oUWt/YTm
	 OVAqwQM/vLhQLJlfZOy18fqiWt9c+GQ8+47KRkPafAOjfJE1QTsbK9+LZ0xjQlivWG
	 NKPCL4prwWpMw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so201716466b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjI8gW0nH6YY00yMR0paz4jSnMi+IJKw0pp+H5vxB97hQowi5DRj8UJ3oUZmr7jZH77v8XeVwjd1mACCXM2QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEva5L3d0fOC80o++TinsxYZVq9MJMC2MMqYsvIHS+NN5Gv1oU
	u+KC3PK7kZWMqp01XErjNn6B2GhXvyqmU4oBwAiWkEIONcioOeX+XsTM9aTdhx2UpYgtfup0qGF
	hzLiYGsKKNzrC6Uxq8wuvg9O0IbiiSOg=
X-Received: by 2002:a17:907:928d:b0:b94:1d92:7eb with SMTP id
 a640c23a62f3a-b9b5034a383mr7125166b.18.1774562404777; Thu, 26 Mar 2026
 15:00:04 -0700 (PDT)
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
 <CAO9r8zPwT3cZjvPaqBjFtZDd72Ffjomb6J=QjnXr3V8LkASCHg@mail.gmail.com> <CALMp9eRp-fp7RaULeLZ7itAJBKH=LMRqgUJ-H=ks7K0rjN9wCw@mail.gmail.com>
In-Reply-To: <CALMp9eRp-fp7RaULeLZ7itAJBKH=LMRqgUJ-H=ks7K0rjN9wCw@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 26 Mar 2026 14:59:53 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPNacrz4fFaZRE6XrshyVZJ7B8qRRX0SrdcWJJeh0p=fQ@mail.gmail.com>
X-Gm-Features: AQROBzDiKXPz3k1kp9p_A7NTffUMZZ61zalRGDjfWGLrzF678WX_ZanGbQ0A6xE
Message-ID: <CAO9r8zPNacrz4fFaZRE6XrshyVZJ7B8qRRX0SrdcWJJeh0p=fQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:57=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Thu, Mar 26, 2026 at 2:26=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > On Thu, Mar 26, 2026 at 2:19=E2=80=AFPM Jim Mattson <jmattson@google.co=
m> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 3:27=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > >
> > > > Side topic, either as a prep patch (to duplicate code) or as a foll=
ow-up patch
> > > > (to move the PAT handling in x86.c to vmx.c), the "common" handling=
 of PAT should
> > > > be fully forked between VMX and SVM.  As of this patch, it's not ju=
st misleading,
> > > > it's actively dangerous since calling kvm_get_msr_common() for SVM =
would get the
> > > > wrong value.
> > >
> > > Though I included this change in v5 and v6, TIL that TDX calls
> > > kvm_[gs]et_msr_common(MSR_IA32_CR_PAT), so the common handling is not
> > > fully forked.
> >
> > Do you plan to drop this patch or add PAT handling in
> > tdx_{get/set}_msr()? If you'll drop it, maybe add a warning if
> > kvm_[gs]et_msr_common(MSR_IA32_CR_PAT) is called from SVM?
>
> I plan to leave the MSR_IA32_CR_PAT code in kvm_[gs]et_msr_common().
> Replicating the code in tdx.c seems like the wrong direction to go.
>
> There's no precedent that I can see for checking the vendor module in
> common code (though we do have kvm_x86_ops.name). I could add a
> warning if invoked with (vcpu->arch.efer & EFER_SVME). WDYT?

Yeah this should work. I assume Sean can decide to drop it when
applying if he dislikes it, but given that he said the code is
misleading and it would be dangerous if we end up calling from SVM --
I personally think the warning will act as documentation for the
former and safeguard for the latter.
