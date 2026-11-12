Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794509591;
	b=ERGrN9fD8JLHtcykPzDzsdvwbarC4eSgn5x19u2L64gERD5CrzQoHYm+BCIfzzhNLwB4
	 yG0j/c9HCP7ekSerVzXAcVNC/M0JlJVfqhufF+394xCkzKvbmiy7MeGW/0SYM7e549pmF
	 b0eAvzYL4jug0T08M/7K3teiRTNYhXe7iJQivXo1Y7Rec5UMkt+lwHKksoizT5c68zDqF
	 pcVqrzRClwp24KTehaJQ73HVDVVUZVJiGhHLVDWGh5VgWm/r+90navJp7T802o6r4kUq6
	 c4nujQX9XRniZc6XgOXxJZrVz2+B2SLauUuegidT3cNLVRN3ZA+FVxnnXGwiYac5UCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
	b=V5x0fpfr+2EkCKE2GgMrxgX0SA4vlgJJc1z4Cm6oGzaLGV8vvNe0fBC+YCvm0gNAzyYw
	 hW3H8dXdbHpLGXpJvjdXITf5IGnqd8PZtSAwE6DrKzXkcFcnR3uTvE0Il9Gy2MT5ivrDF
	 Onlk9+0OT81xiToDjQ5HF2H2MRAyUkvYg5CI2E+GNP2Jc/liOLTNH/rxmd0qqqMM4iD3T
	 WG0dMsfyYZgCKDmxXd9SRXYjazJc99n2422sdPXG73h/1H3lH1Ep0X6InD1+AF1xg4mKl
	 wVIEX7bGImwIt/mceLrEVu6k4ed13nj9wFI1tjVPoiRPS22eEEDrOCp21JefuF6Er4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400AB606A88C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 18:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400AB606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso716a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 10:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794509590; cv=none;
        d=google.com; s=arc-20260327;
        b=RxvKlGTMUq0WP3PGtSODzWzJ7WsGOWPcBzoitTJ2rXiArdnVAKdtBmrieYNO3MrKse
         XIb5bEvgRgeKNKwtvHMP5wFJ47rFnkAZT6YB449CsZE7r51Szc7Iv6JMjUYzBUDAyFeL
         ezuzN0bs8qIjAwWI2bJymoiMYo5jEaug3K9Z8UygIWwsH2IGHp/m3Cp3GREozmeFQBYF
         7Iir+TLaaHL6AsiJ6n2SWyWzr2v7U4jluvmKWAXRjOdBSDSuNjzCl0elJPuJreiNP83l
         KiSEcaV44eqXYdH2jlAU8XF3bGHNComC31RHSu92rMTCTUqkeu7CtQM62V+QNgaCoYik
         NzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        fh=llS9+VwusOflgRXcrQqT25n4DaFl4uq1t2PkKLTSznI=;
        b=SsWnvOBp3cQFYCiPyUdaZr/QQR6GAkGn3tNdJQVeq3fvgwwQxZBxe/NV7Pw56IWSCe
         oIHpsl3iAl85h89nBAeWixp5A1KZ4Tt6NFU9jjFyjJOsbyTlhBMyJMsByDEj4Xg0HMFe
         8zAp+2ISdCmU7lyRNP1iPd8gbqyDDC0dfZsuLNHZkcQKNQUk8DmbqQnalj/0cRynz3uv
         kplS6NN11pGAk0aR+R1HxxluieGXXFlJgo3ip7mmEkU3PB/1rrTRtccLXBEzTO1ch7RX
         ybk54nTImUv2YrmBnDNDmu5BC2drmUzSTFnXPSlihyz7lpSejj08nKxvwizonVuMHHcU
         I21A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794509590; x=1795114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=ZrXABmQCJ3w7fpvZ4karrFrjqd/K0rpSVTywmX4rQzivW0jGhC03EBEcz4x1rZkt8Q
         xZcs/BuI8zU80KvjKJSKuYtuGN5mjG+fjxgyYY1zzVeneVge+I4spJNx2yu2QvsTT+3z
         TvPQqMAGvHx2vUpd9qW4OU+W5Fry9rR5vNkLu1Dh44916sm5TAsfKFS63IqtWkHs77h7
         R3bLVHvSuDoXdeOb4Sqv80Gbk7hHPfx1g7wqwZXqG6wIyCH+p+vTXKO0uHUqslp9hEqy
         9SA57J0VwZZvrWjkKS5FzZu1G0+tHoMzzkIWcR9t7JMe3BPtICsD7vMYb+uUx9TrZQEC
         uAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509590; x=1795114390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=G1vYd/4Yw9KYocmLcz9NQtD/wbP/XaHHy8kxDkKekL2lUaD5zgZHZwDjWz3go+ZhYn
         c/1LPHlg+vHJixzrj0bXsFl030SLuv1qzrvat6OckxCUdcEVLzcAFlm7vO5DJwxW1Fj1
         z7PC8VbnNhy21TXHyoc0sHcx6rpHfUs+euDsCpRzw6YDPW7tUShumRVShnY4pK7Hpd7t
         wrYF9qVHFrZa8tAZ87LQnKzqKWvEwkRvByaBYjtp8N0j+LXTLauY2Rf8GuurNhL5uQrs
         kmECxfzaInQ8qAbjPElcBcbJdvyZMF8Sx9ocCW4f4MyYPrk6uQPOpY4gOi0cxsqhCNVY
         bCdw==
X-Forwarded-Encrypted: i=1; AL+hErFf5o7wzN9BiZwWQbuggs7wKNWvHQDI87ePppSstidPtkpfwama90/jOxu0Cg4L1zqMZ/YvEvMgAJ3FofUnTuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o+2nS771jnArFoEKTYN2WlZSmxza3eRsm5C7V3Z8XtSDlgwDa
	6idRpP/8XtSXDTMYJrp3NAt5cUfPUg2nBTHNlj+iDBo3x47Ff49MUIdog1kHI7U4hEWG0wEUFUU
	RSBf5osQexGLWy4oYt0ixLE5w1msgkwN+WlxDDTqL
X-Gm-Gg: AYBFou3ou8NL5IM6nBAgc8G46cg7th/KlhaeE9LfjD8hVmSjoB+j/jRRgjujFqLlF/I
	TmBVQz1ZsYjLGhSXPUAQYF9ouSDVPrR6GYS0bk09sMirUZVLqx7Otg0qBc7WD2cJ6HdgiLc09eT
	rxceNj70ovBgVfoKBQn217bAgf2OM1CILSjkDAr3wmVh8T6JwD7vZV3McZP2oytmQq1iZxPCQoP
	lBKnQGsM/dI7o9277iKkD8XOicQMmRjYlK8y1Jx4aOkOevPiVnc2eHfDmNzPWqBKiGIGLF56h3N
	YBjFXQ82PVkcQjn9CyFfODsnKsbQtqkpMgiljwdzErPpMMtKi2zktNkuAurCMEF8B6/aU8c7Dru
	o285ZcS4wXPG9NLumteiGEoY0IzpVgBFyFcpvmOsSXKO1xr1IFBvDIrJBx8y6QsU6EhleOay3
X-Received: by 2002:aa7:d85a:0:b0:6b5:66cf:eaa4 with SMTP id
 4fb4d7f45d1cf-6b7c278a457mr7058a12.0.1794509588955; Thu, 12 Nov 2026 10:53:08
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:52:56 -0800
X-Gm-Features: AclHuK_9mvODzBgQFtLS_Gtq_h9EB7DHS-Em7YexSsSAbzFwFzuvZxGvVdZTuHU
Message-ID: <CALMp9eTF3WtzGGaV=sCYLqm=8oHNbqg2pYUr_qtcXJaAKjc9bQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
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
> Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> VMware's magic value in EAX, and let userspace complete the call by
> updating the guest's registers or by having KVM inject #UD, #GP or #PF.

It's not clear to me if this paragraph implies that VMCALL and VMMCALL
are supported cross-vendor. If so, it may not be true.

In arch/x86/kvm/emulate.c, group7_rm0[1] (VMCALL) has the Priv flag
set. When an AMD guest executes VMCALL at CPL > 0, x86_emulate_insn()
sees Priv && cpl > 0 and injects #GP(0) before ever reaching
em_hypercall(). The other direction should be fine, since
group7_rm3[3] (VMMCALL) does not have the Priv flag set.

In any case, if cross-vendor hypercall instructions are supposed to be
supported, you should add them to the selftests.
