Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442551;
	b=TkR9RYHcdi/J5I9s5wj+pFoxfmCavOblwsQGdE5wr7H2/hhJosrko/HoyCoqVG4p4wmD
	 gY6FVXU/ECOtcOFk8xzuQ1zmDwjp9eQxy9ywNcmBNNa5mYiGfVIW1aa/+ZCZ8958zsJ+D
	 038DaL05tvksNGqrWyZUd1f5pjM0noeYYIB/8PX8GbYYZT2k2wnjJSYTgD6gz6IilctSx
	 gsaCer01ptEa+DKJ5JbTkwyRjC0DqjpqFc7v+obVt98d7iPVWF1CV2N+sjQz2k7skFZRr
	 IbUHWnJMjbi969aH/ivAgnZ5EkzskyDBsLMLwhVHa+kVet6ZRky7gh9Bkdqz9SHg0DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
	b=ai9cPbeal+Dog+l1q2rbsBXCBzQC93XmrRL2WC2lwByywYxdEuF3fUP4ZhEdpbAmOkEQ
	 bRysXcz2XvJqoyDyafevn95bBxP1SoRqae5CG/xQcI8x4wL/pUxRhrCStB6d1E4yQfV/y
	 gHnRi6BZqrMoHqSwXhuA00Sdi0HtFdJRAy2lUsdF6+YT+8siZ9DJHEdz9/ub0z0i3ytHg
	 cJ8onUr0zEJ1MG4FQCQjrVdHGryVanVk5S0R/tzF4aDgIdox3EPsqmfG4V5aeRq2dh//N
	 rVWC66uNEmpd1PSepOmW70v8ydZs7AjweJuVO4mJQO7a/GMYIpZ+EdAsDOUQWB3Rb+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e/GCmCMI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B5606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e/GCmCMI
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1690a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442550; cv=none;
        d=google.com; s=arc-20260327;
        b=g+Kng8ZVSgJ9ki4hLy4rqFspoeemiAtSJJ7JgwSlFApbPMeHeoFG8s+nLmv6H0vLpn
         8JcBuQsQIy+THOAJeae/r+Za7TJXQF0+8LvVG6XmJ33ka/cMY9vgvCL2ZnTEMmNp8o+o
         CpFRT0Y4J6jVM4zc01vNOFb5kbwLz/UKj4IBru/UkDW0EizOEA+IOATcdd85TyHCW1Tm
         5ABuKf5RR6BvlSU2EOn7q7ujh2Ya1rkSjx+b7IoOUxLjsnbFB8d0u5PUg31K3sJYz0K2
         C2HMLCN5sgrzfjbY7kKaPPW19SdE4ZAtnQyjtuTF95M2Szq2+TBwT6CJjqKFa4DEcMyA
         LYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        fh=5WuC8v8bzpmKO4LxgSQXINbb0jV+q8upQs+eWw6ACD8=;
        b=pug1ZTL8jwrjelKVHlGiuAT4/e9lP1Vu31etL9nnMZ79FvznlbYCWVL/g+O5Y0bV4q
         vvMf90m+HStRT619DW+XThtuMRjlwG3907NrNgFj8TQpRt9Y8vVHA37ZConuhF6Zd1NC
         A0/kbFyvCMFbM9FH5Km+jMQhmMXCzqZHK8E9mL/5jnpD2Ze/sLJ/N3NF7GC7lVsMW1j3
         y9wArho8SAvOaVM5BvKfqEl4+abZJ63mnj5ncNvC925smAfQFghfO3XCl/394KzINyra
         8zjWo3N95Jlq6U0RtAnD8bEzCMYtR5QhCvMUEkCrTSX+2UuV3vMXWTMd/ETRU06Qf3Aw
         aHFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442550; x=1795047350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=e/GCmCMIh4d3cfq8R1z1xxauNFqtbohTNeCEpyA19Yeg8mtFZCVDn/8EpuaaxSQ2xV
         vbBPGzblo68RCg3AECof9kmex4/J+VkyTceo9nXKl6ACTagIa56x3pIFlQdvJ3TNGEKV
         lbW0PupZKpfTcaVvlxLyKn/NapgwIsK/dqB+YbvYIZtvioZ8buwyH3+bLAfsucQXI4mP
         XA1sVxTtDdszEIWtwZdBE6ccZnwWR5v3EHoerhw3iMc3XDdHWQwbBsHwXHbE5yH02AyD
         +XHfAVQ4L0fgwTbvzK7l1u6kW1g2ilWhONad9skjTyXj4xOpTwvt4tcoOFji34EMS49j
         8l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442550; x=1795047350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=h08d5WPqbM9NI4gauHqFkMTwCI7/iTV4jhIGUhiUxIJ/K+PnSxMDOmb3rLURsvftf0
         2VZ1lpoPzsjdM422vd7Rd++f5NZ4bnPfyQfp30ngSYzft5hg9bZfpti+BKG1uNSDcMAx
         JBCwvateAAtN7Igk0pIFBVuvEpwzScxckDanTAuWDs9SfsFTrSETQr7vKmCoGM74EDA2
         nZvMWJnOGEoD3flTLGHpdUHvrxvJGzCNXcfRVNp7/rt+G2dYJxZU5fiJ2YodJZ+eAYIV
         R6MlHXlqHo6Ss/yVRaXC8rnTjyXHMYIkc1Sw768mceXhX0ptUc+kduxXF7ZzKYQbbYKG
         hMHQ==
X-Forwarded-Encrypted: i=1; AL+hErFrE2uqnvWTyuVmda284PUAyWk/eyo9FoU1JCLdegF/17dKKm1EjaTB9XS33L0gWoBJCZ3imZb7Z7eJjrPgy5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z95kGVhLiPEduV4b+2NXtbWWqikVWgL768nQcT/3GLKCuc6YQd/
	o8v3Ly+Cu6GVKXnklpianEa0Whjo4kL66OmjQTs/8lB9lwGzK2yRQ/MMUo7VhD0xW9RuvETMmiL
	BOf5HfcMgnZPgtjyDiGk+n9RfJvwJv/PpOM4feuDi
X-Gm-Gg: AYBFou3+nS0Eix36Z5im9x732LvQwUochkgjMmrdTYsx1QUsCqpH/bzqETrQg0lTAvZ
	Hms9E8nhsW6nYg6e5wISKsplfqgL0CuuOoRi8ub+kkBTDrJtnNynMmB4rMM4aI+eVwmKPpJNNjR
	a6dF7RQPRoQxVekoOSDL4ALZZz7kZDf5kSvDlmDfUEk6xSsnk8czarg40HhBVx4b9WVzZCeRbAS
	3xuC/NpnSnYhvQYnYDOSHftnrf+xJXrKDOCNGpDyW2Fcxcqw7KaAt+v6XVOkFBbEIOt+gHwWWQA
	Glsuwjb44KW9xkKCOyDAgTt7Rd0ygvZ7rs5phC6Z16898g94KjH8C33XdfKrvFqFiVQxxqANsTA
	4ynPBf3g+ZR92OSqmF58YGPY8GWCeOT0cVAxNKzmvt4oJLDMn1zQ51YmvdYTBVLS5AVDqG0k1hA
	==
X-Received: by 2002:aa7:c242:0:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b79f5c8602mr22296a12.3.1794442549332; Wed, 11 Nov 2026
 16:15:49 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:15:37 -0800
X-Gm-Features: AclHuK8BRDjHRWgUjUQI_bBfAQydWugPH1spbS9sNXXgu0pmOPALjqQkmfs2iVc
Message-ID: <CALMp9eTcUkG6wUaZXHSsGmz9Rm=MwYgrA8DfCuwUV1c1Hp_f=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
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

On Tue, Nov 10, 2026 at 10:07=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
> VMware emulation is built.  When it is disabled, vmware.o isn't built,
> the VMware predicates are compile-time false, and the
> enable_vmware_backdoor module parameter doesn't exist: a
> kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
> an unknown parameter.
>
> VMware emulation is only useful to VMware-aware guests and to VMMs that
> offer VMware compatibility.  Let kernels that don't need it, e.g. to
> reduce the attack surface exposed to guests, leave it out, as they can
> already do for Hyper-V and Xen emulation.  Default to "y" so that
> existing configurations keep the backdoor and its module parameter.
>
> Provide __always_inline stubs for the predicates that gate VMware
> behavior, so that callers need no #ifdefs and the compiler drops the
> dead branches.  Leave the operations behind the predicates declared but
> undefined when the option is disabled: a call that isn't guarded by a
> predicate then fails to link instead of silently doing nothing.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
> Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redh=
at.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
