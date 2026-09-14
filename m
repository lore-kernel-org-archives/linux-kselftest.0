Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08100411FA1
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420609; cv=pass; b=QGovedwEFEWqwqfbi6LSAxnwZLp0j73tlStuI+A8JHJ3VlZmb2egSLnXJRbcrzZXK8k5Ip5ee8H7yvbLQ1KWrO93+42oNB4Jz9O1FTBdWJWZs1OQBkPRTFFR6uzvlLB4/R4xziqQikm7stif6M+f487eLH11YC7ws8a7xIzXghI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420609; c=relaxed/simple;
	bh=n31Ma7+KWLGZ53xfxdD4huj/g6IficrcnEKN22gWA4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRG9y0IxROc7jk0cSoVPVxwVfIh1EOgEPdfuI8zBttqkDJAuhvAVKgZn4tBcDB0YJfQStKAyCOckOPrHC/cfW3F1odb4vGKSZU0eRYqujsrnRVzabTh0GqXmd3nmpP2qX6a+AlGohZdMSGlI4E5GSOOTVqtBTT64JNYvRQEBnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jjj9zdAz; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jjj9zdAz"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so12a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 14:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789420605; cv=none;
        d=google.com; s=arc-20260327;
        b=ay8QDW1JbLlhwYvXXQ59k2DlThwqhj43OvoaD+tFKdM6NT5NUKQuEWiDcGDVOaSYDL
         97b9uwCkQvYtj1Ur58bBMuKNe9G6W8FGVKxxu3kVbVyFAlfiSwIoG7yxQJlD/U9wOus+
         ZyrDwGvtxqKSKBsYFdWOpRHF9N6+8+9sAo8T7zT2rtgE9Lw7mmwdH6Ds5SiQvz4W6ZFK
         VplRhStCMzFYf2qouE4+WIqNeQhjdR5BiNLG6SwvfFZe6hSG972jMnqvbhFO8ji1vyfN
         +UVbFQtNLjpgGeVNwIRovIXM3wsYN1rcc/EFEhnFhMYch2sDtNGpQv+w4v6wMHqcL+xe
         lYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eeC6WkjWwzuT32tJiZ9pB1qr6n1OgtKzG5VypeJxifs=;
        fh=oDxUO9Uw7cBd1PixW65rLv6sgv83UNm+bEUs3G951p4=;
        b=oXbtuLuAkPqm17cj6RMf5UqGINQrv3YcadCZJdylkv+SByZGAS4hn95m9WKqXYRFNB
         X24oFp43Wumd3QH5plsFZf6GLYzI/T9iY0BXshtEZfX99ndStyyjzai2cqCNW8p2opDw
         d0wubQZpS1oLElcKqE1hXW0Fk42hjc3jjdoYT3G2LJppXQ1ZB//zHZywULEBLir5meHv
         9TaUDZEB2UXdDzF2dmoxqj1uMIlkraWBQiwyx2tIWf06Rr6WXdHTfqGWcY1XJVdx/5FV
         b+gcBbuhzAjB4R1aX2M4JxhRgnVgGEZ7xoMHKSGpURMvVbdJOve4ItYdPAKoAjZpWomV
         oQbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789420605; x=1790025405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeC6WkjWwzuT32tJiZ9pB1qr6n1OgtKzG5VypeJxifs=;
        b=Jjj9zdAz7vweOTPprgbw1+Z0kEPbH3M7/yxmrHZgCwWIB9VH48LIHUANhLIFlXrCro
         21jawGFS9rk0MD4wlM+018RtGidYd+2wgffYRuM0uKcGZc8L0T/rakq61b8b/TW15gKq
         QaJgvYeWd13PX+g/rXqvJbFu+LVnfXG8g7G1ymAdT26n8fng+rQ1BQyMce2IJIZcLVRh
         /TzCfLCezpIUCmhykZ+yxH16RGqR/uuikHfAWvjZYZryWahjeTfnJJYY1C4Bvv+zi1su
         rO71KBhb2YA7VCFwNqLID+EvHJB3qybTVyd+yGEs3LxDE/HyCfiXHekn9bY9YOB5asap
         SaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420605; x=1790025405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeC6WkjWwzuT32tJiZ9pB1qr6n1OgtKzG5VypeJxifs=;
        b=vyXhCd6vuJY5SDZLb/ThnnxRomTmVz9NJtAUDkW9NvfRKLbwKgsT/OVUHbxz4vqV6U
         pqBt3lHPEkjHg41ZRzPJelajlHF5b6VpGwLZSei1rFbIDEIZrciiWSQw8N+1LMXLqyXo
         H1vZmcsvEV70OxpicZn0HpvPSGc4+i1oGSRGJf8/5teMtnktmoptR9uVjwl4lMNah/Ge
         bzDQH+dftPwAzDtXNnxEMNs2N1HWIaKmZMl6VkJmUOaMk0E1//naZ6wBlOh9OrkxH1b1
         69hf6BJ4DKC6R8a5i9R75VHxAIPSCyZ39RXruUKt/9zgB/lhp99dAvDsINUDN0kUIBEe
         3m0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6MP4EQb4V9uqPu9OuejBzqcpOGuJ8StsAXX6DLbEbQ6Go8jZQxsoUbU+80SVRcTSHpGyktt6FVR78ca+8SP4=@vger.kernel.org
X-Gm-Message-State: AFuF++nPyUapyHuK1KeAXaZTHAAI481/TDXwnQZv+GBlkN7T467qxV4Q
	jm74sw1WBH9CimLl4GEFK/O7ip7iIfTdF5B4hiKiaUsSzYIx/GHYJ10bCr+5VUZX4thhxtzklM4
	Awg3Q/slNQLv1jVflgeUAbKuwuZ6gvDo4Q6OPddqp
X-Gm-Gg: AYBFou1126NZlu5k19FgbCi6PUurfD0+G8oYZj0UD4u0P+7APIGGAEibmYIBmB4sCYn
	0rYoF9HMeW4RujbIcpHn5CU8JMJG+tt8QIy832hxvEeAb/s6gN1PJKngS6xrMPVEXDKuI+TP/Iv
	5GuxKnCW9c3Mn5XGzTOSK8kA5+g+/OcwV84wVnaa4yQL5ciqXu6Q0NGcKZnbPV3A/hMv0lw174l
	UzzBCqxEvPf8H76aYW5H/BMfr8heyBMBcafTL6NmHffbJfbN5WDDM8x0/f7ddWPRM3nHDPMfzrw
	GdAOo7jLOlRCVc1QfjsIquqmu/Fh+KwJnEV+DkhuUHKx7QPIsh0vf5E=
X-Received: by 2002:aa7:c38f:0:b0:6a7:453c:a166 with SMTP id
 4fb4d7f45d1cf-6aa0749c8f5mr7106a12.1.1789420604685; Mon, 14 Sep 2026 14:16:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <2cb3eb8fa88f2992b895b68010874fa3261c3a37.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <2cb3eb8fa88f2992b895b68010874fa3261c3a37.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 14:16:31 -0700
X-Gm-Features: AcwNN1XV3bxP1cVuBoSTgK_SyNWJVjXdXiEEXWOxJWPehr9GBRjFNWmcolwNHHI
Message-ID: <CALMp9eSSiQWq+ZLaF3mJ5=NmTxXYxsYudC3umr5hL7HQQgq36Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] KVM: nSVM: Fetch DecodeAssist bytes for
 synthesized faults
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> Hardware-reflected #NPF and #PF VM-Exits can propagate instruction bytes
> from VMCB02, but KVM-synthesized exits have no hardware-provided state fo=
r
> the current exit.
>
> Add kvm_fetch_guest_virt() as a wrapper around the generic guest virtual
> memory helper that applies instruction-fetch permissions.  When a
> synthesized data #NPF or #PF has no valid VMCB02 instruction bytes, fetch
> up to 15 bytes from L2's RIP while constructing VMCB12.  Preserve the byt=
es
> already read if a subsequent read cannot be completed.
>
> Limit each read to the current page so that linear address boundaries can
> be checked before continuing.  Outside 64-bit mode, truncate each address
> to 32 bits and limit the window at the code-segment limit.  In 64-bit mod=
e,
> stop at a non-canonical address.
>
> Do not attempt the fallback for SEV guests, as KVM cannot read encrypted
> guest memory directly.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 64 +++++++++++++++++++++++++++++++++++++--
>  arch/x86/kvm/x86.c        | 23 +++++++++++---
>  arch/x86/kvm/x86.h        |  3 ++
>  3 files changed, 83 insertions(+), 7 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index fba230058870..5cb6a9d6907b 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -78,22 +78,80 @@ static void nested_svm_invalidate_vmcb02_insn_bytes(s=
truct vcpu_svm *svm)
>         svm->nested.vmcb02_insn_bytes_valid =3D false;
>  }
>
> +static u8 nested_svm_get_insn_bytes_len(struct kvm_vcpu *vcpu, u8 max_by=
tes)
> +{
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
> +       return max_bytes;
> +}
> +
> +static u8 nested_svm_fetch_insn_bytes(struct kvm_vcpu *vcpu, u8 *bytes,
> +                                     u8 max_bytes)
> +{
> +       struct x86_exception e;
> +       gva_t rip =3D kvm_get_linear_rip(vcpu);
> +       u8 count =3D 0;
> +
> +       max_bytes =3D nested_svm_get_insn_bytes_len(vcpu, max_bytes);
> +
> +       while (count < max_bytes) {
> +               gva_t addr =3D rip + count;
> +               u8 chunk;
> +
> +               if (!is_64_bit_mode(vcpu))
> +                       addr =3D (u32)addr;
> +               else if (is_noncanonical_address(addr, vcpu, 0))
> +                       break;
> +
> +               /*
> +                * Read one page at a time to recheck the linear address =
at each
> +                * boundary.
> +                */
> +               chunk =3D min_t(unsigned int, max_bytes - count,
> +                             PAGE_SIZE - offset_in_page(addr));
> +               if (kvm_fetch_guest_virt(vcpu, addr, bytes + count,
> +                                        chunk, &e) !=3D X86EMUL_CONTINUE=
)
> +                       break;
> +               count +=3D chunk;
> +       }
> +
> +       return count;
> +}

Hmmm...You added the wrapper I suggested, but you still have the loop
I don't like. See my comments on the wrapper, below.


>  static void nested_svm_update_vmcb12_insn_bytes(struct kvm_vcpu *vcpu,
>                                                 struct vmcb *vmcb12,
>                                                 const struct vmcb *vmcb02=
)
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
> +       const u8 max_bytes =3D sizeof(vmcb12->control.insn_bytes);
>
>         if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS))
>                 goto out;
>
> -       if (!nested_svm_vmexit_supports_insn_bytes(vmcb02) ||
> -           !svm->nested.vmcb02_insn_bytes_valid) {
> +       if (!nested_svm_vmexit_supports_insn_bytes(vmcb02)) {
>                 nested_svm_invalidate_insn_bytes(vmcb12);
>                 goto out;
>         }
>
> -       nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +       if (svm->nested.vmcb02_insn_bytes_valid) {
> +               nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +               goto out;
> +       }
> +
> +       if (!is_sev_guest(vcpu))
> +               vmcb12->control.insn_len =3D
> +                       nested_svm_fetch_insn_bytes(vcpu,
> +                                                   vmcb12->control.insn_=
bytes,
> +                                                   max_bytes);
> +       else
> +               nested_svm_invalidate_insn_bytes(vmcb12);
>
>  out:
>         svm->nested.vmcb02_insn_bytes_valid =3D false;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 4b3681796c75..735b67781d55 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4848,9 +4848,24 @@ static int kvm_read_guest_virt_helper(gva_t addr, =
void *val, unsigned int bytes,
>  }
>
>  /* used for instruction fetching */
> -static int kvm_fetch_guest_virt(struct x86_emulate_ctxt *ctxt,
> -                               gva_t addr, void *val, unsigned int bytes=
,
> -                               struct x86_exception *exception)
> +int kvm_fetch_guest_virt(struct kvm_vcpu *vcpu, gva_t addr, void *val,
> +                        unsigned int bytes, struct x86_exception *except=
ion)
> +{
> +       u64 access =3D PFERR_FETCH_MASK;
> +
> +       if (kvm_x86_call(get_cpl)(vcpu) =3D=3D 3)
> +               access |=3D PFERR_USER_MASK;
> +
> +       memset(exception, 0, sizeof(*exception));
> +       return kvm_read_guest_virt_helper(addr, val, bytes, vcpu, access,
> +                                         exception);
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_fetch_guest_virt);

To make this work the way I envisioned it, you need to add an out
variable, unsigned int *bytes_read, to kvm_read_guest_virt_helper():

--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4818,7 +4818,8 @@ gpa_t kvm_mmu_gva_to_gpa_system(struct kvm_vcpu
*vcpu, gva_t gva,

 static int kvm_read_guest_virt_helper(gva_t addr, void *val, unsigned
int bytes,
                                      struct kvm_vcpu *vcpu, u64 access,
-                                     struct x86_exception *exception)
+                                     struct x86_exception *exception,
+                                     unsigned int *bytes_read)
 {
        struct kvm_pagewalk *gva_walk =3D &vcpu->arch.gva_walk;
        void *data =3D val;
@@ -4830,8 +4831,10 @@ static int kvm_read_guest_virt_helper(gva_t
addr, void *val, unsigned int bytes,
                unsigned toread =3D min(bytes, (unsigned)PAGE_SIZE - offset=
);
                int ret;

-               if (gpa =3D=3D INVALID_GPA)
-                       return X86EMUL_PROPAGATE_FAULT;
+               if (gpa =3D=3D INVALID_GPA) {
+                       r =3D X86EMUL_PROPAGATE_FAULT;
+                       goto out;
+               }
                ret =3D kvm_vcpu_read_guest_page(vcpu, gpa >> PAGE_SHIFT, d=
ata,
                                               offset, toread);
                if (ret < 0) {
@@ -4844,6 +4847,8 @@ static int kvm_read_guest_virt_helper(gva_t
addr, void *val, unsigned int bytes,
                addr +=3D toread;
        }
 out:
+       if (bytes_read)
+               *bytes_read =3D data - val;
        return r;
 }

Then, kvm_fetch_guest_virt() should return the number of bytes read
rather than an X86_EMUL_* code.

That should allow you to eliminate the loop in nested_svm_fetch_insn_bytes(=
).



> +static int emulator_fetch_guest_virt(struct x86_emulate_ctxt *ctxt,
> +                                    gva_t addr, void *val,
> +                                    unsigned int bytes,
> +                                    struct x86_exception *exception)
>  {
>         struct kvm_vcpu *vcpu =3D emul_to_vcpu(ctxt);
>         struct kvm_pagewalk *gva_walk =3D &vcpu->arch.gva_walk;
> @@ -5817,7 +5832,7 @@ static const struct x86_emulate_ops emulate_ops =3D=
 {
>         .write_gpr           =3D emulator_write_gpr,
>         .read_std            =3D emulator_read_std,
>         .write_std           =3D emulator_write_std,
> -       .fetch               =3D kvm_fetch_guest_virt,
> +       .fetch               =3D emulator_fetch_guest_virt,
>         .read_emulated       =3D emulator_read_emulated,
>         .write_emulated      =3D emulator_write_emulated,
>         .cmpxchg_emulated    =3D emulator_cmpxchg_emulated,
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index 0f5919b092e4..f03419a79a11 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -356,6 +356,9 @@ static inline void adjust_tsc_offset_host(struct kvm_=
vcpu *vcpu, s64 adjustment)
>  int kvm_read_guest_virt(struct kvm_vcpu *vcpu,
>         gva_t addr, void *val, unsigned int bytes,
>         struct x86_exception *exception);
> +int kvm_fetch_guest_virt(struct kvm_vcpu *vcpu, gva_t addr, void *val,
> +                        unsigned int bytes,
> +                        struct x86_exception *exception);
>
>  int kvm_write_guest_virt_system(struct kvm_vcpu *vcpu,
>         gva_t addr, void *val, unsigned int bytes,
> --
> 2.43.7
>
