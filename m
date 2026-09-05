Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6542C237C
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568775; cv=pass; b=XxxOOeqQrCJYVEjofpTizcCwetbQW8LFNBg84yZLmlOj8/NiA58zfhKhO7XhLXptQf6TfU5Jvf2UGxd7ORJUibI1j6VazpSmBdXyZmq5bL5rRkQHpmtvwEBILEm59oke+82H5LjAkmttsrvqL/3sUDp8TIwlKU72r8iNVbiOb+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568775; c=relaxed/simple;
	bh=QrGclNLa4Jq/CDyFekU00QNy60Gdb69VZHZRX+Re3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMwGUZCE5cExQDsZ/m0FY/loBHDwAliNFlhDFQC5rkW9dv/K8go5w4U4+QF60z7ZA5gB9QcDxxd2F9It/NwfE8z2DRcmkz3jWAybq6VLFbe79TlRAJpat0qYKsQ8aHd9sBU69I8rICuV/IJAJSwT3m18oe+cy+Hmc5pCAuC0fiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6C5rQcd; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6C5rQcd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so2293a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 17:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788568772; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7MGirIT8SIv6i+gVndKUUntJztdwgIqVmDD/gftZjWhpie9n6ee3YzC00d9YN3/62
         YNI/dCnC7pBD/UqXEqzoal3+MmafTDIg32Jgtm23We7aBsNJuVl/rM7sZ1NrgC0M+y5b
         Giw3TJK8C+oVMBh6JwKEO6gDQTNM7XnzreT9bpoMzt2w8tL/vlEeSl9TbKh32zx6Sq/4
         un1Pb8Q+MUwudCspSwQIMA4sORJjzh6nTOSNs8PYOoD/I5FpyNVPo7O/RFwPuPHXMBDP
         fJDdObhwJ99N9CLcsR7dgqpf9wL4dX7ZDdUCOhAPv7GkE1EUQr9v+wzlvc1SICjS+oyk
         H7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hWq5lEcNyW2r1BR3vWDHcgMxFiN4OYFWA+he5PqaWKw=;
        fh=Ar5HM5UhEZWhUK0BSajbNUgcgn9oEqe/X+T2heVHZoo=;
        b=sqUt+tbNW89/xsN4UYW8Ob6Jez6xgbESKUilqJtveNGXd/ihbY9vU0FZjhwjuvzkDb
         bo7MqQ7aOwftH6/Po+FB+qi1Bh0wQRGsIXK+H4ZJRaSMUVoGz35PwL915H31Xz4oq0Gb
         HzL04BkWhiQ2rCY7d8Cq+uZBYinjQuDo/Vtbgs66gNcwYYp3VTAaM/WB43V3zxHHuGo7
         BQVimCstjQRCbvBjKOnF4vdA568otqyfSNZufNoqzy2AWYnFium4LLvc+/CopTMCXZ8c
         9Xyeol+4pSDAbvHFrxy4wJuRx7bbX6OW7hFwyi3EgVkyThj2Ub4QZdQmLedz+nfMY7LW
         bCYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788568772; x=1789173572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hWq5lEcNyW2r1BR3vWDHcgMxFiN4OYFWA+he5PqaWKw=;
        b=G6C5rQcdodECkFvFg2epAIgAJ3fVRE4E5BhPHhjcSPZk0QiknSZd5tZPtLyLuLVcV/
         HENcaVA7FxQvCW/TMKgJLGCw5ONtaS1x0MMPX2DgLiAkAVz8hcocrOKIRlQDyABxziDS
         8zXc4ahAVRQax1y4h2LnvXO//iTKd7xzu4AybH7Gan7Nv9UDd/dlNuVO6urfPMiLkRF7
         4WRDHbv5CabcXteOzcciBiJYTte22XMs6wAu8Zk7wcUJY0GdOugFywTz63mYU8Bh8Na0
         hYUvuTG7o9nYQo072UlrJqqCfU9noKxp0VjLFthhrrxK2t9NXCpQuxYpO/8Pj9FHU1fA
         k2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568772; x=1789173572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWq5lEcNyW2r1BR3vWDHcgMxFiN4OYFWA+he5PqaWKw=;
        b=pr82H1sbXSaIR189ArCn0rLYhfz1BcHlcNGXjhg73I3v9Co63tPL4ncGyHyC4SoqFq
         BKX7UxrET1fMRN6p9WLgjkHUh7EcmSpPRI1C29Lih8DvrQIL4uKRb9de6XjWBFAU61BJ
         eXOMh8Fzo5EXdQnw5A3AnnRVq4mc9Xc8WDUiePtZ6AU1f1uZmf0fCeigCY62jhoIbtp4
         RL4NV+4ZGIFXCoMaBoXAJyW53eItzgkkpsMzXfxa0EqNdoAmiPtg6OXdCKpWa1vyEicV
         Wh/72o2hCB+o05HU2ownEySXA8xj+6pWqhEYyVyYH8bRF++wFwX9375ik13lgOr1vPfb
         ir+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJzDdKNVmkvKZU7IH+N7Rj2tmo6BeApIvX6bmu0cd9NaEav0JU8YpbA5wYAtR0QOFP2jS3sNIlDEsMOhPtoIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lafYrlT6YTcyOzmZqizt6OS183W7siH8wO6MacK3oDtXfKUB9d
	EOQNjN1l2JZLPO7lN2Leqec2TpTb5tT+fkA3Qyamu5D6hCIQhsMHBXzjacLztaoDG+kgkGfBROy
	/SslSdjiVP1cC1bIQujacI3oSgLBHVkrTkdiTI83T
X-Gm-Gg: AYBFou3XKCic04YCWjCCbKpXFIy0Aa4dYRnDZNrF3yo1Paaaarv6MZnA9ngrCxrXc/k
	hqrRsk73R1ImSiXSaJ5X62prNgq2JZvE9STHTjDHfqpwyv1Iz6bLV/R8DvFstwkcj3U5nXNeUjg
	HOIRu5/hIMsAAHBSXs3+re9htwT65gHlPyo4Zge2WeHbXzirGGjehZ6vtUSZHXwiLOwBRM2Re4m
	2UgSbKHqw9OILItblG1+NXlFFIivaax+SbvOivLc/+D+yuFmh57dKYoWWRmICJeHLSMR9rVNqjH
	NYhHTxKMCqVuFE4nIzdDPcyjp5upE385867eso+751WN
X-Received: by 2002:a05:6402:a582:20b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6a7f68409bbmr11841a12.12.1788568771665; Fri, 04 Sep 2026
 17:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-7-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-7-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 17:39:19 -0700
X-Gm-Features: AcwNN1V2hggKMx63jSyqdkNYbpaKDu_WgfuERjQ0OUna8s8rs2dzxi2e2J1ODvE
Message-ID: <CALMp9eSoLMx6DLH=Ve5_r7y=0EOmxjZgJWE_fLM_CAYxOvJdkA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] KVM: nSVM: Fetch missing DecodeAssist bytes for
 synthesized #NPF/#PF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> For a synthesized #NPF, the emulator fetch cache is not guaranteed to
> contain the full architected 15-byte DecodeAssist window, e.g. it may
> contain only the bytes needed to decode the instruction.
>
> Keep preparation of synthesized state limited to capturing a matching
> emulator fetch cache for #NPF.  When constructing VMCB12, copy those byte=
s
> and fetch any missing tail through L2 guest page tables.  If no emulator
> bytes are available, fetch the full window from L2 RIP, including for a
> queued or synthesized #PF VM-Exit.  Stop at a translation fault, read
> failure, non-canonical address, or CS limit overrun.
>
> For a non-64-bit L2, truncate each incremented linear address to 32 bits
> so that a fetch whose CS.base makes it cross the 4GB boundary wraps as
> required.
>
> Do not perform tail or fallback reads for SEV guests.  KVM cannot read
> plaintext instruction bytes from encrypted guest memory, and the existing
> SEV emulation path treats missing hardware DecodeAssist bytes as
> unavailable instead of decoding guest memory.  For nested SEV, report onl=
y
> matching emulator bytes already captured for a synthesized #NPF,
> potentially a zero instruction-byte count.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 58 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 635ff20cc431..c677ad5df8d6 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -87,6 +87,54 @@ static void nested_svm_clear_synthesized_insn_bytes(st=
ruct vcpu_svm *svm)
>         svm->nested.synthesized_insn_bytes.insn_len =3D 0;
>  }
>
> +static u8 nested_svm_fetch_insn_bytes(struct kvm_vcpu *vcpu, u8 *bytes,
> +                                     u8 count, u8 max_bytes)
> +{
> +       struct kvm_pagewalk *gva_walk =3D &vcpu->arch.gva_walk;
> +       u64 access =3D PFERR_FETCH_MASK;
> +       gva_t rip =3D kvm_get_linear_rip(vcpu);
> +       struct x86_exception e;
> +
> +       if (kvm_x86_call(get_cpl)(vcpu) =3D=3D 3)
> +               access |=3D PFERR_USER_MASK;
> +
> +       if (!is_64_bit_mode(vcpu)) {
> +               u32 eip =3D kvm_rip_read(vcpu);
> +               u32 limit =3D to_svm(vcpu)->vmcb->save.cs.limit;
> +
> +               if (eip > limit)
> +                       return 0;
> +               max_bytes =3D min_t(u64, max_bytes, (u64)limit - eip + 1)=
;
> +       }
> +
> +       count =3D min(count, max_bytes);

Ugh. Pasting together two partial reads performed at different times
is egregious. This function should read all 15 bytes in one go. That
pretty much renders the emulator's fetch cache useless, except when it
contains the necessary 15 bytes.

> +       while (count < max_bytes) {
> +               gva_t addr =3D rip + count;
> +               unsigned int chunk;
> +               gpa_t gpa;
> +
> +               if (!is_64_bit_mode(vcpu))
> +                       addr =3D (u32)addr;
> +               else if (is_noncanonical_address(addr, vcpu, 0))
> +                       break;
> +
> +               chunk =3D min_t(unsigned int, max_bytes - count,
> +                             PAGE_SIZE - offset_in_page(addr));
> +               gpa =3D gva_walk->gva_to_gpa(vcpu, gva_walk, addr, access=
, &e);
> +
> +               if (gpa =3D=3D INVALID_GPA ||
> +                   kvm_vcpu_read_guest_page(vcpu, gpa_to_gfn(gpa),
> +                                            bytes + count,
> +                                            offset_in_page(gpa), chunk))
> +                       break;
> +
> +               count +=3D chunk;
> +       }

This loop doesn't belong here. Perhaps you just need a simple wrapper
calling kvm_read_guest_virt_helper()?

> +       return count;
> +}
> +
>  static void nested_svm_prepare_synthesized_insn_bytes(struct kvm_vcpu *v=
cpu)
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
> @@ -120,6 +168,7 @@ static void nested_svm_update_vmcb12_insn_bytes(struc=
t kvm_vcpu *vcpu,
>         struct vcpu_svm *svm =3D to_svm(vcpu);
>         struct nested_svm_insn_bytes *synthesized =3D
>                 &svm->nested.synthesized_insn_bytes;
> +       const u8 max_bytes =3D sizeof(vmcb12->control.insn_bytes);
>
>         nested_svm_clear_insn_bytes(vmcb12);
>
> @@ -135,9 +184,16 @@ static void nested_svm_update_vmcb12_insn_bytes(stru=
ct kvm_vcpu *vcpu,
>         if (synthesized->prepared) {
>                 vmcb12->control.insn_len =3D synthesized->insn_len;
>                 memcpy(vmcb12->control.insn_bytes, synthesized->insn_byte=
s,
> -                      vmcb12->control.insn_len);
> +                      synthesized->insn_len);
>         }
>
> +       if (!is_sev_guest(vcpu))
> +               vmcb12->control.insn_len =3D
> +                       nested_svm_fetch_insn_bytes(vcpu,
> +                                                   vmcb12->control.insn_=
bytes,
> +                                                   vmcb12->control.insn_=
len,
> +                                                   max_bytes);
> +
>  out:
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
>         nested_svm_clear_synthesized_insn_bytes(svm);
> --
> 2.43.7
>
