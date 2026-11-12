Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794508629;
	b=GnObPL19U7Hx8BZ56iqZ9WM2LdTa5Vh2dCGQo8KKvDzZc9Kie4ZICf0thWcG8HKgNUwk
	 UyA9ynXWKS1yxGT16ymDHearTeNPV0SNvscCmypmGrsoZDDskPClyyOnkYZGj0iJvi+rc
	 IOOyTGYzH8lN5VoBO0SspzzjPqTs5agjOBVxNg56oGX9y5h8RrPnEfGhlhMmN8cEI7FzX
	 Gxnew3Z1nQUJcqLOnGLl2z3WTfJqt6LUMpJugtXfe3yTn5sixrJUkOTRaD3Qd0WwVlk7p
	 ozHpNNQo3GKdCFlqNKfLCvhLORXvKD4v6LashHWz4SgkKT3mlY0Yic1A6rjmwRab/hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
	b=PMc/b68j2pvkC8oWbCYYZu1/huinQplXy4cizlGFOBW8Yy6vcns73w89z4SUsx0ZRtfR
	 YLhbc4qwndlDtdphH5+rdaXw8SnuHw1R3Hq9xUK4JxO1X9BijVJQWNSzG8xL4/94dT4dw
	 iqBVuy7pCZniZshh3zJoFRp0sjRJdji0mcElcg1/u4XOPHCbTMu36tFUbDH8JFzYchh42
	 DwReG25ze86er2SBophNlkA2mTjFirF525z+OYHxY4oxImq+HzdnK8rZTOEv9UtzZ4iKl
	 pTKb/zhHzlwyVigGCJjcqCUOQ9WN6Y/mH1vEzPhdNiy+Ie7mkFxEjtTBB/3aJU/lYag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H4xaCjFy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749F606A334
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 18:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7749F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H4xaCjFy
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso1258a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 10:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794508628; cv=none;
        d=google.com; s=arc-20260327;
        b=NsuCpWlJKdl0SAI2jl1ZFPdpaO8O3/ZYJATunP+KXEmq/XgqxAEpL7EdZ0hViC8F7Y
         QeYrC8Za/TF2rP7rJ4B7tBC4yfyC5VlJAryGlwd0Sgbvw6bA97/U/2/+UJZpdYOAJ/vT
         IOgbZS/Ww4+3NKrcZb0yPBSPI7mhUG+OkUYYkT1m20vX2kkldcVDvLm6WPYa5bVeUsAJ
         PsbJ8cX2aAIWuqCRW0TjME98BfqyDdRBhIr8hb5fuoqVVA4VsLzUtsOB9NZhXlkBB71r
         xZlZwBS2DZmsQBqTiPfEUvCEKDUm/WDIZ/+PPrwKcoJuzSJ8ZVmqE09uklsH9hUne9Xz
         yR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        fh=CeoKWlTu9QR3kI+HDeeb7hvHzZBrb/rKcXj3IO11tDI=;
        b=Vlzgz0j8GVWFZIKbgSRkCNtDqSILffW0YBvgt5ifN86F3Pq9LlEUSKijxFpGhi/0OB
         6zsgnRFhWNHqKG3NlbY2EwDWXW9LwPSTNyT+sjRvk80Qe7xlQNmO5cOYOLPzGOihSyVd
         WP7yVRt2olsnPNWkIGSEB0Li5kmNKsb/q2ZqVAbBtHkdvBzgIEIKcId7fFbwjoFIEG2X
         gYpzBJBcBkOSkb1pJfL/F1MuJfcq6zp46six2cQ5x1cBfvbo1VP32ygk4VARDQBZ7nR1
         ifOrRrkXtxd9hntNskehYkT3o0DAp19aLU8qbt/4YSBmiSROnZislhJ+rPLPDGrvcjFd
         V1Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794508628; x=1795113428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=H4xaCjFyorNRMHu4JRUVL3kxyy5XCQ6rNk8FBb8UHfiwxPUXcNR+K7MS7C4x78naKL
         5MOv/s9oEhDu1SbMd3o/DJBUsa4W4ti+6tv8MmJicFNtOqjeLdI1JAbO/2qz4i4uFY0Q
         e3qymi10upruK+tneE8hA8/AKXVfGXeiKZtP+4JQ3HLhw6u+4akhqCrJAPURAKsCcspd
         4JWSzSv9H+mUj9EDxZYeAgjEKcgCJ8h3LTY4iAeiBIuTQGMR7EFE7TNqTzGX83KuRmQP
         hD1v8lUtxCOH3+4BqSRXL8g0ZFeDDHy4KvYqV7bstknRTq4Am4P2n+utcs4C7+i5tN/H
         yJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508628; x=1795113428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=FgYVcGXARVN9IaDs9RF/9QL38ZaQ/GmuJESSfKkiRt/WUnLK9LR2aoRH+tO4jsGdBF
         ZW7D7qYrAHlCn5S0h16wFUmlITlJc4REBWNczTwHspLtnwXcRj3vWL455hgEM/ke3N/y
         lUe0WTGS8SJaEgbk0YJ6nJ8VMKwMYgiYB2iJpmLl7VdXcyeu85TyJwPUUoTZV10he4yI
         PYzo4XvgJ9mtNV0wV1AkM6Caq2R+haZZWImHge1MjHNRI8wStXbjYepD5/oc2cTLGsBs
         hfnOrgPbVpZ8KJfJWekjYDqyabVlojjSgJMGoQjbpejCRicr1cjh5Rfns4BwXWnjbSTU
         MyRQ==
X-Forwarded-Encrypted: i=1; AL+hErGLixVOIB4hWXtqU3y6u3u7fhzv5CKYUrqmT9ArRfAUJXKM4UlcAb+00OxAYWW/x8Xr1PAkf6fJhsutE0opkyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qe5Uv7QWIeSJ75+VtjCBN5qBKSGAl8KGQBO8sqb94IqK1es5p
	7mBQBIS58FAebAovl8PkUy27vlGu8GuGVmmT+wMhXZs1tTbC4V7DFkOeuCbADAR5GPCYOazfgIL
	SQnqMAfWY/N5ZZ1thMZa9gGttUvGNTj+JtXXRiAsP
X-Gm-Gg: AYBFou1uXa9DSyH9T4ALHHv4zhg3pfmtPwdvOjNoD5gJ85jqi/7qSHpIepGmvKp8m4r
	vaGsmSMkEJj1G1ItYlFpx8D3rOfQ/0O7k+bZoPYslWAIZ7NAI5T8rb8hB2O+NmUhluuVMjHg6YT
	wU5WFhPOvlgLnrybYVRbl1EbrT1z+IEHK9OG3OK5MiIi4FgWLu2bm1OxQigdGkur/457QHUh03D
	ZQnWKhxSgfLQEtl+4Hm8o/sEnY2JdxR9kOS2zQO8OMqQO6su5PCUTubQArNupoUj2lr1rxFUTFF
	ZL2KpPyLvN53UHzR6ibXFkyZyiixXBUuaz4t43zpzDawwiyxvH+xvu9wDt57yAH6FiAbJb4Vgs7
	26hmyHXYzGqWXYtSFy+hu0qo2HM53j1vdvaOGYvrZxG4PcnIEpWI7ybXArqcr12X8Jad2eg+iCu
	FSQ5nm2nz0Cu7pYgMa2g==
X-Received: by 2002:a05:6402:327:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b7a2ab087cmr87795a12.16.1794508627091; Thu, 12 Nov 2026
 10:37:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:36:54 -0800
X-Gm-Features: AclHuK8rt1aN38OOO-5Oe9cWGgilUSsg7YZ6I-VfVfdCTw37NLQGQcQLM8ki98w
Message-ID: <CALMp9eSARNY=K-bXSoV6sBBaWoKQGHtym1VrjnHtBQhFvsb2gQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] KVM: selftests: Port VMware backdoor coverage
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
> Add vmware_backdoor_test, adapted from KVM-unit-tests' vmware_backdoors
> test.  From CPL3, with CR4.PCE clear and no I/O permission bitmap in
> the TSS, read the VMware pseudo-PMCs with RDPMC and issue backdoor
> commands on the backdoor port with IN.  Verify that the pseudo-PMC
> reads succeed and the port accesses exit to userspace only when the
> backdoor is enabled and raise #GP otherwise, and that other PMC indices
> and ports always raise #GP.  Repeat the pseudo-PMC checks at CPL3 with
> CR4.PCE set and at CPL0, where RDPMC doesn't fault before KVM handles
> it.  Skip the pseudo-PMC checks if KVM doesn't virtualize a PMU, as KVM
> then injects #GP for every RDPMC.
>
> Run the checks for a VM that relies on the enable_vmware_backdoor
> default and for a VM that enables KVM_VMWARE_ENABLE_BACKDOOR, and
> verify that KVM_CAP_X86_VMWARE rejects every flag it doesn't report.
> KVM-unit-tests can only cover the module parameter, which applies to
> every VM, while the selftest also covers the per-VM capability.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEoNpe-LFoH6LBm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static struct insn_result guest_inl(u16 port, u32 command)
> +{
> +       struct insn_result result;
> +       unsigned long rax =3D VMPORT_DEFAULT_RETVAL;

Shouldn't %rax be VMWARE_MAGIC?


> +       unsigned long rbx =3D VMPORT_DEFAULT_RETVAL;
> +       unsigned long rcx =3D command;
> +       unsigned long rdx =3D port;
> +       u64 error_code;
> +
> +       asm volatile(KVM_ASM_SAFE("inl %%dx, %%eax")
> +                    : "+a"(rax), "+b"(rbx), "+c"(rcx), "+d"(rdx),
> +                      KVM_ASM_SAFE_OUTPUTS(result.vector, error_code)
> +                    :
> +                    : KVM_ASM_SAFE_CLOBBERS);
> +       result.value =3D rbx;
> +       return result;
> +}
> +
