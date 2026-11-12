Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443346;
	b=0FaopJoVOLtJWcoN3FegcU59/u+Rmd3aeW8QZa9/AuY6r3yhZyGjGcbZtmMhJt5vA1/C
	 XDqn0BKhRl2JFWjZ3CmUn9m3CoRvPAdZX9syP2F8HzcHmU4OPXrNn+Yu7J0tX4QitcDMP
	 PF5CEmrd0w4JsPfCLQkPYK2i5wAcWKD3fBr3ZKni0jNQsyr9c0oLfZghKk9LWA5j2X6B9
	 M8uENc8nbNTQ0bfP3wmg8lyivCwCk7uNCPYZaMCb9zUp4RjDFBACSSjXnwv6zfke7JgCB
	 9OUGKy/09Q1O3BVH4M4HrGCBV8IfJKc6KogkN0S/qW24LXwGJB6CYpAjnsAzT7sO52A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
	b=2MvdfbM3lZHNiP6NDLUmIkYZpoV4kt0MNtlPnaVykV7pNaShuIL8XgJLeX5BzmJcg4NC
	 4wAu8W+4z+bf4QdZEwmtfRFm8EPE6yQMML81Pp5qRc6QTM8KMYbX1jiLiEmuVKoXN+9hm
	 F2gFaSYVd6G98qDQGE1pH54RGnOQ4OCrDi6YqQXZKr6PTkNcuHb1kbdlaOvecToT50yiv
	 HgAZVbA9qHOqa9nah2Ogtp49OdQ18rjuU9DZTKS/mLZlkwM3JfuqKJH74kgfPGuQHUpne
	 PGj3lLE2ZInYvYoAEx0crmWz09swat/eHZ6KgGZHYWRc4+uDjdCVBWK+ouTFgbBKjXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB6606A331
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FB6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2779a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794443345; cv=none;
        d=google.com; s=arc-20260327;
        b=j/zx3kWBfnX0jxrLluD/Tk9TjnNM7mtoJxsUosHproDeG/yT210SulvshN/DlfKUWn
         w+X2zI9bkZpOQ220qS6wu2+6uB2NztbBXpKnpr75maHdtyXD76eteAP2CdmVSpmgSDFD
         TAYgLia9nAMrAzyD400DgYiCxiibqfaOhtvVaH/DibDOJBhOYHfPK6kKODruWKLdJPFf
         TJQ85/G5r2U4zwOH3/38RyRxlHuDztYvze0Ls2wGOi6NyrbiPnFJqJIVTb4jFSDDn7Pt
         RmGRu3iMhuZxEraoqTfPACgdFx66zBiSIF+oqHMr2FYBwW8FJLjbGvEyde5VTV1/qaxM
         adpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        fh=NZFBkodLhm97mE4RnJoecJCBf5N9oiDn9xB9dXHFxiY=;
        b=M3XCd+BmlUnukl/P/0qIY2Q5qMQUj8RXvrZ9JbcRjGFgqFGhsX98YXvRn91Zp60lk3
         OyxxucJ9PyyqGK0w+gVrlszD56LoETAt+nq1V5j0ogDNHIb2InmAwfhKwbiqdJwxZ5HX
         IU5f+9tmGdhP0SqROmp1+iqkFB0S5a26dx84utv0XYdbR1l0ELMp8hkIg7JTiHy0JcwH
         7nZUN3SfMsuF5CFFiTwGhjv6kFbIncSRgRzYX1WgExit1TNARGHBalEieFiv8DOC+Rua
         yRh7seZ8bhi10rsmlI6hHX6jZtk+0NQWbCafA38F5dunItlqSjgG1Z0tYhJq2/GSx8T5
         Ks9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794443345; x=1795048145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=dWqQT3ssiqROBYD0HYMwG3O5nPjjOo5IjwINBmN5oc7CzXL85oVF14ngDDeicTy27d
         2Es7j4TbUyeAsRFZ5LMNnbcN6tngmqEe37zn6zQam7R70nrWKaO/Io0i8c3OltCnsjrW
         p6kxiLytSyLd/PDkEK8KyflKBQgFd5eZ+7Vk3JxF7KDwCDXijnylYtGY7rHNOWZiqOcp
         g1mevQ9evlsKf2tijEuVEGuTdiNRZH72IvJodG8cb1HsC1pBtbwAHx8rVIB42/gu/2Ui
         o/UP7aEJoLE4r5bEJX62xrTK6lyiZm7IFZ4+kqgjV9sNylagHLcMQXlzr13PdXPhKm0w
         LkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443345; x=1795048145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=dODcBqqePocHEFSfJDkYSD0+l4jgs1ZJb1PNzjTSECeEeLbhYYo8rinyB4jBuEOytH
         AzC2Pv5G9ZLxdgKSakI6p0Cd2sBo97JLBTiiKQyN0UuwpgrKEWY1oyBRhcLXFNuajzu1
         kUL/Ah9tdewLsEuxQE2h9KikknGJJs5tPtS4Vx/6lPxTezHYX8GffQRCTcogwqNQQWff
         XAbueg2PetQjV4WjnhgxvmyN6pjxEl1ryyT8yxknLwzB3OJpYF0lZrkx+3GmYLv8KKMH
         79bZTjY/o4U5MBZAhdVQYezn1OcLwZV2ihWwZFfLTeVyrU/SBYL9VP6AgdGPIJSx8Yew
         0utA==
X-Forwarded-Encrypted: i=1; AL+hErG6s0CrTVlKXpLJ+S1FgJkrYaA2yBxq5rhVM0mY36K1doMRf9yvIkYKMcbmK5FCCy89jorkOeEsJm41Qkttk4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qLrfprC71w6VENhxo9DW91Xi6378R6ZxAU/b7Q4Zy5GGDYCiG
	q1MBYYLquASEcWmbiUOpoRoT5FQGw5E4+Tia0qmdrRlvjPSkhhls6BdTooU2RU5NH5evSJfkcPX
	G5o1j4zegd0U6g/+mMXRhOnbD97NSi5OihfMnjbq5
X-Gm-Gg: AYBFou1vbEUI7is82FRMu4FeVjNJI3YKSvBpRvFmtkrl4Ete25GXfws7ZVfmswlZKTQ
	OleQI+QGlb3tQ6KZNJlaCfaa/wvfVKmN9joH1JdXd9W5Q9y8Vb2q+vOyn9GN+oWztQOj+a1MWCj
	d6wFAsfE0TtuXvbn3XBB7JbVrfFOiv4F04Kv/kPUwHcEX3xWyjmUkWqAS9+xIcfjGSxIQav0HVT
	BH4ewr0dhuOeLo7qGfkETIpJmaw3C/Mg+/WtbtKwQmoWIrrqhsneDpYvVZY1TLWS5La1mUKsut9
	63iA8whY3emCiuk46l+vmFvSfEuJJGSUtee/okiZu7rqqGt8DmBdpu7kWde6LwauHsAfdEovWSr
	lXrbCVDh+Eu3tXaY3SZKWEtEQF7IsFVA68QCWuRvKXctkm1Nb2oRtTxzX3htzHaw1tJtJ9n0p
X-Received: by 2002:a05:6402:4022:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b7a2a2458amr26083a12.14.1794443344422; Wed, 11 Nov 2026
 16:29:04 -0800 (PST)
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
Date: Wed, 11 Nov 2026 16:28:52 -0800
X-Gm-Features: AclHuK9Fp7q_BxQtLzb7tD29UbrmuAxqzi1HMzLWvRd49RzuQMFPjipCoyh1bWA
Message-ID: <CALMp9eR2tm=RkNk_cYsYj0SZmcUBTfxpYiqtLbtCE4TJ4H6jzg@mail.gmail.com>
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
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
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
>
> VMware guests reach the hypervisor through the "backdoor": either the
> I/O-port interface that KVM already emulates or, on newer guests,
> VMCALL or VMMCALL, with the same commands and register conventions.
> VMware's userspace implements the roughly one hundred commands, and
> reviewing the command list on the mailing list found none that needs
> to be handled in KVM (see the Links), so leave them in userspace.
>
> Only claim calls that carry the magic value, so that the same VM can
> still use Xen, Hyper-V or KVM hypercalls.  Never claim a call from L2:
> the only L2 hypercall that L0 handles itself is Hyper-V's L2 TLB flush,
> which doesn't use RAX as an input.
>
> Pass operands and results through KVM_SYNC_X86_REGS instead of defining
> a second register ABI; KVM_EXIT_HYPERCALL returns a single value in
> RAX, while backdoor commands use RAX through RBP.  Report the CPL and
> leave the privilege policy to userspace, as VMware Tools call the
> backdoor from user mode.  Instead of completing the call, userspace can
> have KVM inject a validated #UD, #GP or #PF at the hypercall, and may
> update the registers as well to keep the partial progress of a
> high-bandwidth transfer.
>
> Don't forward hypercalls of vCPUs whose state is protected, as KVM
> can't access their registers: reject the flag for VMs with protected
> state, omit it from their VM-scoped KVM_CHECK_EXTENSION result, and
> ignore it once a vCPU of a VM set up with the legacy KVM_SEV_ES_INIT
> becomes protected.
>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=3D0YZ3j2=
gGhgmaFRdCFg@mail.gmail.com
> Link: https://lore.kernel.org/r/CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8cc=
xYzk3aFzCA@mail.gmail.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static int complete_vmware_hypercall_exit(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vmware_exit *vmware =3D &vcpu->run->vmware;
> +       u32 pad1 =3D READ_ONCE(vmware->pad1);
> +       u32 inject =3D READ_ONCE(vmware->hcall.exception.inject);
> +       u32 pad2 =3D READ_ONCE(vmware->hcall.exception.pad2);
> +       u32 vector =3D READ_ONCE(vmware->hcall.exception.vector);
> +       u32 error_code =3D READ_ONCE(vmware->hcall.exception.error_code);
> +       u64 address =3D READ_ONCE(vmware->hcall.exception.address);
> +
> +       if (pad1 || pad2 || inject > 1)
> +               return -EINVAL;
> +

Should this check kvm_is_linear_rip(vcpu, vcpu->arch.cui_linear_rip),
like the fast PIO completions do?
