Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442511;
	b=m+FY4c7YcWBcjXzS8QKmipFwRPlnPQwzSFn0bdqWD9YiQDNT7FxBFJnK5mI3ZFydW6eL
	 gAwHqzS8kVB6E/3BghF+OsvVlfmLm9ty3z6nCpRKNdTqkdPIqBfluzk4RxTLS/J8giBPR
	 PBw8kIn7+Z7be6yVAW1U111wGlR2U/OOTeLH5/zvnFSzvdmZaSjTAqn1uw8rMp8VxKJRk
	 opNIZScaoTZgrl7ZNNFS465dnkHnlM4UiUKqrgGUSyxT4/teoVfihMgP9n0hgo4SUuyuU
	 l6HR4WPPSLHVPTWjo9xqcT74u5trWG8dlEtWN4z/MmAtQkEFVJFsCr1SrKJ8Nf34aNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
	b=sNLzWoZV7FtIb94Q94emUSqswEw3S92ivTob6cSg+YAYMluue5woZPaB0Ilb6EjiQJDI
	 cW9XCXnAjloI4A4RY9TLhNJPUfkultwjrTsmSjesKmzmbCp0J3058MEhS9ITcQbbUQ/Su
	 kNT0Y8ZVPCLi5ESaAGz77Gn9lo0tvYLwH2hZGP6DXwEP+1mUIYA815dzkOykG1Bd16tkz
	 zndHqwwUpdFDEXCLnJopIUQIFDElGXmmuLd5mvUscD22ws39bSX4JX+GZizO4Bnk+DHgo
	 mO2RGmtkN1TGMWNz8j6IDaeDoXOQ8tuahWTkuRq5j4VLoTAlIbrvCXqDd3swBO4PxAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B3606A33F
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22B3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1680a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442509; cv=none;
        d=google.com; s=arc-20260327;
        b=qfjXCL/JXF7+iAlxvzHBbBY+eUmXB6KSf3RFODPu4PloUeoP6IBhXn1cD9dgOPMsZh
         zfPaXmrHZCbIb6pugnJmHp6/PHDo8Mbp9qSPqMKDRiRs1dH6fRRtuKdTYi5sYhY3HhRv
         8NhnByeCd1c4iG8RZ1CN9YWMt6xzj9RfQel8kGz78cn7rvb5+uZc9PRD1C2+g5ecCsay
         3FGDbVSJdCkPaSYya+RvNJBbwwWbxLalbZnpMCzMcbnUIfsLaZtkn3X2B+54SQHCVuNE
         6Iz2cVCJifEeNnLI2A8qf/RfU5n8+uxldYhFejbV2aqckivBpINdvaBe2WwOU5YvU/Wz
         09CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        fh=4+tL8r8XX593u0XJozEgvbWr5P0Cl1lJ9jglIEfAlW4=;
        b=bDYL9Y+zs/W73Savu4rygPdiPe2OskK/0d49Ll1ZoEQaw8dy4g3Oq058eNyVFl019d
         MVtUMDN22zrPIxC+OgvGumlq8Bnt5DHyHKVbb0JkoduF+7v+Nu0I89LR8pmi3ZUWpxGS
         FUjw1X3/KYwHuDdqKQPsTx+Xh81pns291uwv+GMms/ch4kXOosl3AvGyeenJyAYjhCza
         uxQaIp3JC/AMUn4C/RNaSciY4yzPSZAo11equOtTZWKD02/Zsp7sYKuMZJdGf4LytjBE
         lNAMDJcfj0mBMossujmebiI+M4szBTHNG/XxygKusMyQ97J9V9op7cGFbSkqargtGKsr
         R6ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442509; x=1795047309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=PeXxi254jVjJacLsg6c1v/0BankO6tVHFh6AbYJLckSeraKvBRZxAmvwufFHuIVvYD
         jkbmKo+FCqg0SBryL3bUXvdBw51kokdvPo2t6gGxmjYdEHwSqQgDRMyLkfxw6Qp51+n6
         ds9EgQSzXH+7ac2mHfXsp4u1eSCMlEnVwNktB8TG93pvpqlbZBzyalG5b9BR63ygTWb1
         54jvVxknikvPOoIpc0TQ+p4Y/l5uIhkotGtCrINmedkhL7tPKuRHQebn+aYEdDwEO9WT
         RBjg4bOD2siCWSJ9hGnHGD2RvFWe4jctIyHb7Z/Vd8399Z05QaZSbFC2/xwSG/vqhQC/
         fReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442509; x=1795047309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=cnXNdNrv49m+alHBkUfoS0FmFYUywlJyJze1uQzgASqLH87/MQPCRaCU9u47D5rRa5
         SW822WwwY6TcQ37UPbFo3MJYi1HNbud98EKM44qVuZWt5nUWVtesBqD4UEEuUfRh/VWs
         AHkaExb4v/udk3TuUVY0jXCdQeyP81udzRYkqk8pYSv0E6VOQ0TzUfMkn2x3ZXCq3Dgl
         EQoYfi5oxGRDhBeQnR9U5c/SY/Ki4TNTT7aZKYs2ArVMVpfC0O+nIqrr0KUN5UlxZVNh
         gRFVaYzC71/Nn7PdUHh2lEBzK2RI9awlQYy5YJd4u5ZSaE7mudVKGuxEG7IIvGOHQu1a
         b1Hw==
X-Forwarded-Encrypted: i=1; AL+hErH+CUqJjgohJ8SRxn98G7LkFG7dIpV0NUbxpRMoMX3sVSuG4c9MvwYpQNQE+GfTjZ8kCS5KOPiAXdHrXnIp2XQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85rmMPXBHOwbnLTZ4p1tZlfnIdzuQonGDX8vevq6I7HXZmJrNe
	Bl4SvfmBO/U9EBs2gUD+ku9dqiK6ZQ9UyOGwePvdm6/DsZCYiW1S0vn+Q6bMaIs86Gsb3Yf7pZk
	Zj1RJnarHerXep13ZHJsq6nb0zw0F6jyowZnG3i8I
X-Gm-Gg: AYBFou3VrpwbvsP4+YJTXEL0S8s1XBra4EKvyE1a/9R653J4n/RSbv4+ml6aDBmCUnn
	JCVsAD0MuolVV2d+EyA2gEfMndc8LIsj0ExjWYJZjZjCR83JOet9AUoSlQxBgYgRLbdkaFzehA9
	L96GMQDOJrPG9w6ittyN1qO9ujvAlvsKARjal+OWvUA8F7/KNOyW1QyzHJfmqLydlATN5rPiyDy
	MR0fku6G3PG+bBTwQL3vPC5cFE3VLuxZ/x49pgyWytLiis1MWV1dPXqa8v8U00myKkSWVD/CmXc
	lBoxXXXRphrQXvemiPfPXrWpYx8HToF9T+qUX3rHLeIdgB9xSu6GQw6Fnx2vHh5bpTNMQUhh+C3
	TJaIWnn0jhjFphCrBbjIDaoYju0Q9XdOfKXFwD0HUcl9JrHKJRFLie71zyJRKetkha/gNdvxa5T
	ibMgMRLQSCcydpEeCbnA==
X-Received: by 2002:a05:6402:a3cc:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b7a29ac02fmr15840a12.8.1794442508697; Wed, 11 Nov 2026
 16:15:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:55 -0800
X-Gm-Features: AclHuK87L8uvSccN7ek3E-oclf6HfrUbptT1NvBilCQRrlrDsTQ4W7H0chAi-Kk
Message-ID: <CALMp9eQQG5U1JUbAiYBTaSRysux=F6VS8vra2KpJaEy=L6vBKw@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] KVM: x86: Encapsulate VMware backdoor checks
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add kvm_is_vmware_backdoor_enabled(), kvm_is_vmware_io_port(),
> kvm_is_vmware_backdoor_pmc() and kvm_is_vmware_backdoor_opcode(), and
> use them instead of checking enable_vmware_backdoor and the VMware port
> and pseudo-PMC numbers directly.  Make the module parameter and the
> pseudo-PMC numbers private to vmware.c, and take the backdoor port
> numbers from <asm/vmware.h> instead of keeping a second copy.
>
> The next patches make the backdoor a per-VM setting.  With every caller
> asking whether a vCPU accepts a VMware interface, instead of reading a
> global, that change stays inside vmware.c.
>
> Check the enabled state inside the port and pseudo-PMC predicates, so
> that no caller can treat a port or PMC index as VMware's for a VM that
> hasn't enabled the backdoor.
>
> No functional change intended.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
