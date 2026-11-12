Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442653;
	b=Qhqiw4Z+BSSr2peA2MCjc82xjRh1mxPm5xpSgo6ESHRkPNDNuDZNopHcuX/UaqM8h0Yo
	 V0SLwAF4rULtNOTJ0REK5xyn+p3l0vCdeTSv7bQlF9HrLSYy9lsD1HQsoG2T7/NYCG9fc
	 QHbh5Qi01NSBRD8LZ74jSV76JbXM6yKsP3SABstGgJhsPXu7ZSK1KJBOST7UD3erpAAyc
	 NoHZP42oMNkk1k2hBaspk4OqHPdn+gAybVUuHDA87I9vlSWF9kXMG4YdWQvnxVyebl4cI
	 x/zlvTvwqzn89Qcwd38gO39KFlhHW4uvxS5Ur9DWK7zdT53fSkWYWkVy7PCGgnPuxyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
	b=CT6WnrfGITcsXMfjMi4pkjW9kRG0yIN7BAXVrOMiHZeNBbHlZ0h8BEKe2IzcvImyEsev
	 j4k0SI+c2ra0EOd+eMmmmfgWihmnd4atSBenKzxggMtG7Tg5PFwQFTSjEtkr4r3vuzNM6
	 pRijrSMz+WoqVCbMK5lzL8SVT7Vwyf3zHFgPXRL/DxejfBFUqlJ5/wY+tDcFP32f7Ktrf
	 F05aW6amWryGlp7Hl5vsL8qUMeMhQT8xZX+IEUIL9/BPJofC+RCXrUi2h6IN/KtrEmXn/
	 8Ajc0Y0YByK1tYArqAMtwR+wJOXYQXP7h/D1XhM3sLSxL5e9tBhdND+ADc4NG6g4woA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCD4606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFCD4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1716a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442651; cv=none;
        d=google.com; s=arc-20260327;
        b=pJpa9Vv3FBfuPp+8ocofvxuKopfQdESiF61bYlybn+r/+slJtcQfpz4YtsSbaRvEeG
         ZWbwhCYSXnB8lRdNPd1O1UO9r1BqC8J4qkh3D2FLkkpxr+2D2PS5j5jraAdDBAZrq0wz
         EbEATsnG2lp3wdV87MxQ1R9BohNbPllwoJEGLh3H/CAfY/SDsrCcsxtFIY8zW7Kn5Vb2
         AA3cVbWbtTrFygPB2jgy70dgB5BVtcTs6zGdujAf2lVSl3xLRbA2WjO2k1kIu2nbbAdc
         G2TOoJnc1w9E9/h1nGoxnw08jnB7lMkHf+V48mlJ/E1MYJ0y9oLFpM8iH9e7pQ1C5sqe
         1qGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        fh=XHgirSgSLsoT2dvx06xddlaNApPXCMnDIEnrMhYBBlc=;
        b=ozIqdPmMMtlgp7dZoaQS3zXiSapVvytqyVIZzkwm3SbRjlszJG4VYlFAIjQojqOb0t
         2OSWAfK6e6Ywyebu0QMNFl5kq+SnrUyHPG2gWRsySx1dKUhd4WPtUjzx7YiFikQNse8b
         7ek8aAtaXRvpzEXTTW8UIpulNdjzt52Cj7BNIDZy8PhDAVmNcBuucCFquXzLZJV7KN2J
         JI2zRz8FOGhJdRBqwVugyA/j2SL2l+ITjN0uq3P7+AH0j7rPYc81owxrtM9MRwn5c0Bf
         zJv01LXs3I9yyY6IvPp/Ra+L5QWwOvttJ8V0FS4rCH7fR21divUvDUqwMFkBi1P15OW9
         RxDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442651; x=1795047451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=QY+9H4KBVMuRH6WseMYE10z/E6oHDTOxh8WTDUyV9c1OJB/L2GOFHpJ8jTAfTPyNx4
         fnThIGMHJGQSj6hOU/X43MCGlvQdkiO64U45kfZ9SUWdV/nIBHN2yM8WjPL3ie/cE5CL
         KfH81hSPqG3FwvK/mbyH0AKy8wh/batRMthVd52IT8+bfnWhQT7GUqM9nWa5zuL3ThA2
         vyuaQMrfbHHFgxJvYpIprSsfvOxsGEFsy1XtwHw+8+fLUvC75LYsDziB7kDmd1lIZhDM
         bd44g2vlfdilYjpd0y6qdWk/rMix5Y9GFOEv1PHFlj/tkpTWdZ1OlzmijfV4pNIibtQj
         5FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442651; x=1795047451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=hEHMAlsNdVj5c4cVY4xP7Etfqu8CMzj9vkxoMsoIgaZDsd+YCIJEc4ALZGtRRqbDRx
         FomRXDBPqAuSpPtmdANFqEc3wPXtCJyREG8Wt+2Ut2i+wVAT/OPVWQj8ruUPHysAOtXh
         cn3iNRs3BJU/PF0UZi/IUGMzGjmrewn4ROWnm4UrOUzmVXKjt6/7ybRDTuUJJz5BjYEg
         +q/YJ1p9VJYKW2LhWwTL+BbqRCJ/aUV6pwsBk6rQWN20mSKtxwfQZZ3EXU/whAxOAMT2
         poqn23IZZse/+V7q2PT1sO4fe/VAsy8DWZmd7pLgaDKPA8z9TOiobFkp7e3QaToSjpi3
         lqLQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ0ozQmsafBbaSBPoaD3MnbPkEkS855by2cx0iTRt2v5qgFOfiRM86iAUKYPH/gdkATtXc6btyrXzHRPjxgVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZTR+QEdMpVWHCvEvZn13Tks7vY8iG5W6OWKOD+xeetXDERz7f
	tGkXnQj7a7c4UwuiEta7XuQP/3L+oGymcce5woK7l/8J9ULPZn53jVTb1kNbb528u1G+hLEECbH
	ZXPf7EsJ3PHYIeyczjIS2MpURjcf+GJExnVJU8Evj
X-Gm-Gg: AYBFou3XGEzTvCwRWedidDxln8Vp0cZrQbxsnRoMIqZ4t4twDdvCOK0LbzOdH93CGYM
	MA94YZ4luwvgxzqUlDPsCVYwI3gaPO605enuZCZu/BYWvE7YWrwkVduLrwAXVyLQvfLxMKJpsTb
	d2zs9Ffh89QY1+r6y5NWN9n8Xx25BXgZYDD2uNPcgfOy/fT32MJ9038Zkie92imaI/cfHF38ihM
	NPdA45KtTx1Z0EuZwzpwWYItHK6vT43EYrcT3nJI+Z3fn7OICWPtnYiSnlPpVm4umHlrZOYrHi3
	0075rMz7Co7HIIchohoxmHn/uls0aRgOY3GhNbpJG7edhASTZctptZSyORCoNDq3CFg7by5VjiK
	UtDFTJ1bs/9yEmKgzPA1EU0KqShxT2ihQfIellFgZOey7Wq7JywLraDfy3aTFCjRBdzmfDRrl
X-Received: by 2002:a05:6402:327:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7a2a18aa4mr17979a12.12.1794442650687; Wed, 11 Nov 2026
 16:17:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:17:17 -0800
X-Gm-Features: AclHuK_V43cL9OcDFeVKDhORDjmYSlCIZPO3f49bHRt-Tpt3bJyQNBhejjxGgLw
Message-ID: <CALMp9eQvP6hdxJ2-X5bhZHfaM5JCsvVJe07OkzTnnQhq73mW4w@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] KVM: x86: Add a unified VMware capability
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_CAP_X86_VMWARE, a VM capability that takes a mask of VMware
> interfaces to enable, with KVM_VMWARE_ENABLE_BACKDOOR enabling the
> I/O-port and pseudo-PMC backdoor.  KVM_CHECK_EXTENSION returns the
> supported flags.  Track the flags per VM, and keep
> enable_vmware_backdoor as the initial value of the backdoor flag.
>
> The module parameter enables the backdoor for every VM on the host,
> whichever VMM created it.  A per-VM flag lets VMMs enable it only where
> it is wanted, and the module parameter keeps existing VMMs working.
>
> Use one capability, so that the hypercall and nested-backdoor flags
> added next share its validation and rules.  Accept flags only before
> the first vCPU is created, because vCPU setup configures #GP and RDPMC
> interception from them, and don't allow clearing them.  Limit the flags
> to bits 0-30, as KVM_CHECK_EXTENSION returns an int.
>
> Enabling the backdoor for an SEV guest still doesn't bypass the guest's
> I/O permissions: KVM doesn't intercept #GP for SEV guests.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/aAjrOgsooR4RYIJr@google.com
> Link: https://lore.kernel.org/r/aAkgV3ja9NbDsrju@google.com
> Link: https://lore.kernel.org/r/aIEkrc7Mdf2ia1Mm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
