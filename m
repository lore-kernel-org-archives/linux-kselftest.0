Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F702376BE5
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534345; cv=pass; b=k519Kx4lcOLe2QYb1AXkJJrEuAjCCEvsJrIB8If4Xvj155o/Cs9leeKwl2NlZlT0YfF9IhjZvzfbUV0gzxDhMTrTeJhaxPClGLHFQTVnBNB0YC0GA7FCG1N+tY+yCLGA71CHlIVbEFOuitnjfWw5xRAWChBBz/5rpjONs6kmkCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534345; c=relaxed/simple;
	bh=mfzKgLqLZzYMsvQGYLY63k3H3j/n9cAOhMKsXc5Hl9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gciPZxi93BbdcUk1DwzNjh9Qj/h8iyRY6l5mooH/kaE0msqD04rA/Wu6A4olxm7OSL6n4aqAKKSkfsUJT7Vit6b3R61t9iRvqLM7w4fh1JzycsR2WGRhPDfPppo022NUWKtrIgruqK0uHN9C1jQkx26ycqp04KVlvMBPpsVxjlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQk6jNYX; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQk6jNYX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so32371a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 20:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775534341; cv=none;
        d=google.com; s=arc-20240605;
        b=Xbi9lXfWd2hHDf9CZ8aaHC0xZxtXcBlI5i0Q0BE2bp6kwy1F7o7ueyWpDDd9Lccpxe
         xMW7ZSkTsKKKMDcjPirrCrZMtkpKGwsOorI1Sg1XQ7j5Fztn9z+/CJpgyAoajH8NT6E3
         mOLRGO1opPqwdU6PfSXP87fdG5vxulL74DRE9/QDsXqLLHXQ0FX4sdLK+b74RKLxk0rM
         2sQh2nVXhdw9uAneD47BD6ifneCQdWYHxuhyWROW6Z5WVhfi3h2FfGWhDQv7unlakVuU
         MqQPrewM3eOHDpo+xJq261TE0p/fW8DEKsaoqe6qZQblUkxosSnRuDlKGH6jtJ5KxGua
         0AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        fh=kiNQmpqZ+qEnLA+kRN0PLjaFriLOuxdxbl66G2oqJTI=;
        b=F5ClBSyIMDqnF94+Xf2YE/gkO+zma0IKXSorgK0yQhWYus4w/IeIfSg6ijT1a4X2Yx
         XAiRPAmai0yK5+MM0APU6LoIkUovNSoQ6w4g0fIdnBGAzsil8VlvM4TIAtl5h2gj70C7
         WrVnr9urW8tG9wOZw4dn3PLPXE1W0ebUoCBSBM4Uf3HDK1lS03lcAnE+fGZiLx37aPws
         +Y1pyRYwXsfW9yJ3H7nRka1BbkO6LipE857TdjeWj22CnTUCinjLdCB/2QGXfjeyUaoY
         cRML5hSCh2ZE0ebGdqaqjEAT1+i4YUDcuPBz3Ai5W5vq3/N/Pja0D97Ac8nbeEKlnd2G
         6yXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775534341; x=1776139141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        b=oQk6jNYXCO/9sgZMwolqIwFskFhI0re5l4iu3mfkBjsOWwyb3F9fB3EcFsBEaJeMt+
         KTEt2eYasLLbpMRT9QbBw09p3YDMolAngiBxjRB1KGto30kefxBY7kBnRKavaG4M8q5F
         hymvWa4Yj8ABYF2k4QQ9bm6tjG3tE91BMNxoN7hj5cfzyTGNHa2th4JPOqRPdEQg/Mlx
         QwI0RvvrZi5b9smemZbgVB4Jd5q/8N43XoeNjkj6iYC4KbbSa4Dl77f48/AyOUduj7fF
         MZZOb8AGbZS5gLinDbusd6546LHN9WqSh1SLt2a/WVt1RRg3HzBzsBN9e12voUXIdGCB
         hqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534341; x=1776139141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Gp8YbEZRFqhe15YerLSFU9IKBLIqcpI1UPog9hHvAQ=;
        b=qhf6iZNampml+irWa2BBOgGkr+FZ1h6g+X0Vj2OaK2B43yIM6kP08wgxO+W063wnNj
         GZsN95ugQlv0vZ4F0myrTEq7pczHSZXU+T8MKtfRr3mFlL1DKNZN/wumX2RZxmNNOxls
         +r6HXhgmfQNW84ADc+Ngqg2jD/QmxqcfR65dYD3WFm916n7YbTeUTWZKC98pS6Kj+wlL
         DStYyRTihiTi2rUu38RWEfLFL/+ehU73tni5wVJbl3GAZ9SUzuAz1bsmxDdDKu8/LefK
         HjAhbuv6KKbQCCq76tydt38HkMuFtx+5l+pB8wdfLvnSu9d38VINuEvtpKF/1Gv/+qbi
         vNog==
X-Forwarded-Encrypted: i=1; AJvYcCW+GGubo4x3+Mzuhl/DrW8ktlOP0TSG8npTiibEXLp5EzNl4AHfzZlyzsLsdL2zT7UrkEhX0i+e0JY7oVzbloQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSHzOaO5sLLV2bNc7QqwNN09/hHXA4on6NNuM3gPTY8upaFIA
	ZhBAV7fI+Kb0CH8uTI5ikNXNAiuvmpri3qY2RrD4ho36alDE/YdfwI96wDszflvHz+UDpseFbgP
	jBoJUKBspT2BnLcME9Dc4WQRzlydr1U8CMcQxb6Dw
X-Gm-Gg: AeBDievJBl5MEdg46gXUDdfwnx3zrMvvncHp+JglVmYh5VqvseICdtozvP4h4t0fufH
	4j5KWKiFrZaRzqrKFEAYiqSl3v35Z9pPwyCanLqgbmvS/XVC4cKVBmCR2eEkt0xf0V+JzS8+x1X
	XKmr+u0WWNhXdGAadJxyKvZifPDTu+BCKpwS48M1jHOwaE6Yy1sc6XOOVeKk3CUWnVOUUQfYb5W
	+8v3zId7cPdNAz6vbAvY82mOXZE7egh2nVZU8yrec6UthaU5fyuRIY3U5eoQ2d8G4C1XPyD2tFZ
	sTycRoY=
X-Received: by 2002:a05:6402:a215:20b0:66b:b6d8:c0f7 with SMTP id
 4fb4d7f45d1cf-66e40ae6f4emr91714a12.0.1775534340995; Mon, 06 Apr 2026
 20:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-10-jmattson@google.com>
 <adRK0dyF9QAsZyVz@google.com>
In-Reply-To: <adRK0dyF9QAsZyVz@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Apr 2026 20:58:47 -0700
X-Gm-Features: AQROBzAR4L9hartxNauJf5yfV8dXpfTn1DNBr0PmrsEV2bOZT00NXIY1ANXG8VU
Message-ID: <CALMp9eT_+dAS-4Qz9cRGx5n+f7M=svOGpcSk_Kv7QyQw9nVWTA@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] KVM: selftests: nSVM: Add svm_nested_pat test
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

On Mon, Apr 6, 2026 at 5:07=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled, verify that KVM
> > correctly virtualizes the host PAT MSR and the guest PAT register for
> > nested SVM guests.
> >
> > With nested NPT disabled:
> >  * L1 and L2 share the same PAT
> >  * The vmcb12.g_pat is ignored
> >
> > With nested NPT enabled:
> >  * An invalid g_pat in vmcb12 causes VMEXIT_INVALID
> >  * RDMSR(IA32_PAT) from L2 returns the value of the guest PAT register
> >  * WRMSR(IA32_PAT) from L2 is reflected in vmcb12's g_pat on VMEXIT
> >  * RDMSR(IA32_PAT) from L1 returns the value of the host PAT MSR
> >  * Save/restore with the vCPU in guest mode preserves both hPAT and gPA=
T
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  tools/arch/x86/include/uapi/asm/kvm.h         |   2 +
>
> Don't update uAPI headers in tools/, they're not used by KVM selftests (p=
erf
> folks will sync them as needed).
>
> > +#define PAT_DEFAULT          0x0007040600070406ULL
> > +#define L1_PAT_VALUE         0x0007040600070404ULL  /* Change PA0 to W=
T */
> > +#define L2_VMCB12_PAT                0x0606060606060606ULL  /* All WB =
*/
> > +#define L2_PAT_MODIFIED              0x0606060606060604ULL  /* Change =
PA0 to WT */
> > +#define INVALID_PAT_VALUE    0x0808080808080808ULL  /* 8 is reserved *=
/
> > +
> > +/*
> > + * Shared state between L1 and L2 for verification.
> > + */
> > +struct pat_test_data {
> > +     uint64_t l2_pat_read;
> > +     uint64_t l2_pat_after_write;
> > +     uint64_t l1_pat_after_vmexit;
> > +     uint64_t vmcb12_gpat_after_exit;
> > +     bool l2_done;
> > +};
> > +
> > +static struct pat_test_data *pat_data;
>
> This is ridiculous.  Whatever AI you're using is reinventing sync_global_=
to_guest()
> in a very obfuscated way.  Drop the indirection along with the params and=
 the
> full page allocation, and just sync the damn struct.
>
> Actually, this is even dumber than that.  The "data" is only ever accesse=
d from
> within the guest; it's used to pass info between L1 and L2.  Drop the str=
uct
> entirely and just write global variables.
>
> In general, please clean this test up before submitting v8.  All of the L=
2 code
> is basically copy+paste of itself.  This is the second vibe coded selftes=
t (AFAIK)
> you've posted, and it has many of the same flaws as the first one[*].   W=
hile I'm
> not opposed to using fancy tools, and the bar is generally lower for self=
tests,
> the code still needs to be readable and maintainable.  This ain't.
>
> [*] https://lore.kernel.org/all/aXJal3srw2-3J5Dm@google.com

I contend that the kvm selftests infrastructure already fails to meet
that bar, but I will toss this in the bit bucket and write a selftest
by hand for the next version.
