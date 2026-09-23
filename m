Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF54579822
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202064; cv=pass; b=cw9cDidRf8Si1Gn7W6+HfAJIEUO/2WmUMEvpnXkpMuWKE2N8cnt8+08oUdkxFkUCd/hQlnYZTLLe3uoQ4T/z/S4e+hwU5ROkTTtrbamra1dm6lkh9iD4EFzVwv496y0eXVQT3CvKGPt5pnzqz9Bvg/+hV9vYfmBIa00n2bX5s/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202064; c=relaxed/simple;
	bh=ljpoITL+ddmUXtoxzFrCdARrrjkZ2MpJG8I2LiiH2vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rb2fcmx6D5vI8eEBtt9P/HBGTeZVpZDiSo8I1XWjsQb6qxvgFH71oLlp27oGDk4FCsIRa5USaBp5h0bInr5UZ7uXEUV1ICscfb14Y/CYLdsjjkFrRk+h1FjF0Jr+4H37vjgSVzScz9mA4TnYRmglJefNTuUG3Pfpk3//OqnuEXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j4rcZp+O; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j4rcZp+O"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so4332a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790202059; cv=none;
        d=google.com; s=arc-20260327;
        b=H67TsHMKX8Umg+sG66Oy7g4PC1dp/tTyGTTGowgv73HFr+K1OQTM4wSVLPVa9b94Cf
         XJYLTHIvtA/XXtRnu28/I6E67z0+ab2sFXH/ZRPQ0iUXasPXTz1i23BmPJpu8LWejZjl
         GZsOD1/0ReUPo+8uOBggv8apgJYJnnzIBiVQIAONza0COY5oYEtWlyrVAm29t0GOpupv
         54ModLAHcRkx3UPAKgQ8Pgos4HN7XqOeS+ry+RkXP+Bs4xQaMqooDeThDZvaeitjeFJF
         h6tJIDBtmq1pCMvShvPT/HiY6BApZUHsW/0QfJ9kpILimobNgUgzhyQYiFzipxFlpuXy
         x4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H78LtMLqPdutyOe/A+aVYBWCZPz7tjSiHvt4+KB9tTE=;
        fh=jSGV6sRMO8dR1c14kGMjtOjwShFj5bJztroOXrZIarE=;
        b=jPjDMxXQRPoomsTqiIHM5L9/SQ59OWIWPpZ9pXJxM8W3t0XOb0bWuCUe0S/KTlZ0hW
         SL3vi1rVN6SSJDZu3zq8e7iTnj+BeSYIbvVcvH6mpqAb4kGkIx5I/rEfDkrZ1xkpNTr2
         g2ftx9LpXlDWYkZhChQF3gtweThUCV7bBj2Vi88WHaGMZabyQ7vV50wvlXIc2zO+WHh1
         5eJ6mgyn5FWb8/zHB/1oM/ewF6/DvYIignzwAFiPYYAa97RAjQQwdQMQGTIYWEVNxaNy
         reO7HVkWmRA/pvGDoOgykmfe53wdMg3hrXaQMqyLpfTfafglVT16cMgxO+l0yaDkubta
         La6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790202059; x=1790806859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H78LtMLqPdutyOe/A+aVYBWCZPz7tjSiHvt4+KB9tTE=;
        b=j4rcZp+ORSTGqd6kHKmHpb5pEjOnRqTuCIB6cLmY5YYyZhtXFDH/1D07P5lrRbz8Bi
         w5qLNLIbgnqk6BThULEHdQwGPO3IxVArvxtTGXYxQfhzQC8SWReNbQhvev6GAWYq0E0g
         Tf4cSSqEDso1ilef2cBxIhh34UgzeMG2/w4QVtrIMrcte16TOWqS0z3y59vKfvW/eA4f
         bmipIAzDbToqB1esxp6brPXFmiEXRuN87eos0d/bNk0vTISO6evXUI5rvcc/th8WVC2F
         7IMY5bz4wNTOgi/J73WraIon5XC1Ljuw8dEotpzfX5r3PVfUQxdU7NQ5RFgUK6CT0nrK
         o82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202059; x=1790806859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H78LtMLqPdutyOe/A+aVYBWCZPz7tjSiHvt4+KB9tTE=;
        b=CMS1+bpgWxzkj1aiIgQIcx8v4qwWRpfIWkV6BZn4Pd4jPVjwWMZtnM+XrE7qAEsweW
         fTvf0aeyYnZ4A3L46Iyq01CcmSoCsfzNHmCuoV3Lbk5BVzmiVQdSTR1lnWQ8mUy7Zf/b
         U+VtSkoZKsGGeBYHI2ljAEgTK1Sl7iWyKgNA6Xm2UubLH7k4PZ6RW3uxiIpb/otn6yHr
         c6CA4giSEfOc7kZ7SSpTYrHNXIa9+Ttnp9fM/1UVLWYylfx92RRZiVErthlKNSKrQo5z
         yAKZHvvd0WcyhsHUs6Wa2z7VejZH8U9J+l3HB6qkLbIF+rVXKbmd7mdmV5vyDBdCV6wq
         kLog==
X-Forwarded-Encrypted: i=1; AKwUvBwkGcGqy1293XMCZwBYKlEY/OFPaNKOgxn/h1BeNQnYHz0h+ujsdwrt37GTalZY3PH+NUiFl43W6O6TIdSnRIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lukId33THbbt1yo/IIlx7vkvR0HBATWW9cbjpJ8S/jme124TEn
	J/33iKyQEUo/tBEcIWI7J5Y5ZuRT39Po7+/ffvhcw2YzgG6zEscSiEl5v/8+9jjTOxWFug1lJxG
	rXN/MIIIUeG9kw+gio/SXBqiN1oolTkG9qV7Rg5Io
X-Gm-Gg: AYBFou3UVkx9f5q1k5lsetOuGH1jl4QirL32wsIWFL88foSOAX8gGxb/pF6zpG5qDWc
	ntYK5+zGV7/bjAS9JZhEn5aGYH0roq1sH3B0DqeT4jXsa+wD/PPbtgg4Ff4UcbQTB/6LC7MPNe4
	nhqBjM8kv1laRlgfxEqeNUzoUGdYPGkK3jRdbygrfOnCcLO1gIqpDtNev7C3padhXmAMwMlpSBc
	3A5PY0Hh705WW+0JcuvO8AsRzONdrAw6Tb3F06Mca6lGHLh/0MMbiV3CnKoNOrfQkd1HozYFIL5
	7dgyEdaq4EOsV9u1/hcxa1s8/BbXsuRXz4Ek0JTtxGll/EuCWJdQ2ps=
X-Received: by 2002:a05:6402:70d:b0:6aa:1cdf:d859 with SMTP id
 4fb4d7f45d1cf-6aac7d2429dmr22782a12.14.1790202058283; Wed, 23 Sep 2026
 15:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790171702.git.zhang_wei@open-hieco.net> <b614e927c6c1ce9265cb9a37b296b0b30598da72.1790171702.git.zhang_wei@open-hieco.net>
In-Reply-To: <b614e927c6c1ce9265cb9a37b296b0b30598da72.1790171702.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 23 Sep 2026 15:20:46 -0700
X-Gm-Features: AclHuK-m_XpDfXwZpbOInUSIvV8XfLNXMUuMKPM1PWOMbUcNZTtYq4cU9I3GuUk
Message-ID: <CALMp9eT1qMk7V7=md68LEXvmWH5ecj1YBn-YHoQ-vzJziaP5VA@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] KVM: nSVM: Fetch DecodeAssist bytes for
 synthesized faults
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 7:03=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Hardware-reflected #NPF and #PF VM-Exits can propagate instruction bytes
> from VMCB02, but KVM-synthesized exits have no hardware-provided state fo=
r
> the current exit.
>
> Extend kvm_read_guest_virt_helper() to optionally report the number of
> bytes read, including partial reads.  Add kvm_fetch_guest_virt() to apply
> instruction-fetch permissions and return that count, reusing the generic
> helper's page-by-page read loop.
>
> When a synthesized data #NPF or #PF has no valid VMCB02 instruction bytes=
,
> fetch up to 15 bytes from L2's RIP while constructing VMCB12.  Preserve
> the bytes already read if a subsequent read cannot be completed.
>
> For instruction fetches, truncate each linear address to 32 bits outside
> 64-bit mode and stop at a non-canonical address in 64-bit mode.  Limit
> the fetch window at the code-segment limit outside 64-bit mode.
>
> Do not attempt the fallback for SEV guests, as KVM cannot read encrypted
> guest memory directly.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 41 +++++++++++++++++++++++++---
>  arch/x86/kvm/x86.c        | 56 +++++++++++++++++++++++++++++++--------
>  arch/x86/kvm/x86.h        |  2 ++
>  3 files changed, 85 insertions(+), 14 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index e839f61211c9..813b0fc663c6 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -78,22 +78,57 @@ static void nested_svm_invalidate_vmcb02_insn_bytes(s=
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
> +       gva_t rip =3D kvm_get_linear_rip(vcpu);
> +
> +       max_bytes =3D nested_svm_get_insn_bytes_len(vcpu, max_bytes);
> +
> +       return kvm_fetch_guest_virt(vcpu, rip, bytes, max_bytes);
> +}
> +
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
> index 1705e7be46ec..ad8b35f2219d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4772,20 +4772,34 @@ gpa_t kvm_mmu_gva_to_gpa_system(struct kvm_vcpu *=
vcpu, gva_t gva,
>
>  static int kvm_read_guest_virt_helper(gva_t addr, void *val, unsigned in=
t bytes,
>                                       struct kvm_vcpu *vcpu, u64 access,
> -                                     struct x86_exception *exception)
> +                                     struct x86_exception *exception,
> +                                     unsigned int *bytes_read)
>  {
>         struct kvm_pagewalk *gva_walk =3D &vcpu->arch.gva_walk;
>         void *data =3D val;
>         int r =3D X86EMUL_CONTINUE;
>
>         while (bytes) {
> -               gpa_t gpa =3D gva_walk->gva_to_gpa(vcpu, gva_walk, addr, =
access, exception);
> +               gpa_t gpa;
>                 unsigned offset =3D addr & (PAGE_SIZE-1);
>                 unsigned toread =3D min(bytes, (unsigned)PAGE_SIZE - offs=
et);
>                 int ret;
>
> -               if (gpa =3D=3D INVALID_GPA)
> -                       return X86EMUL_PROPAGATE_FAULT;
> +               /* Apply address wrapping or canonicality checks before e=
ach fetch chunk. */
> +               if (access & PFERR_FETCH_MASK) {
> +                       if (!is_64_bit_mode(vcpu))
> +                               addr =3D (u32)addr;
> +                       else if (is_noncanonical_address(addr, vcpu, 0)) =
{
> +                               r =3D X86EMUL_UNHANDLEABLE;
> +                               goto out;
> +                       }
> +               }

I hadn't anticipated the need for this special-case, and it's more
intrusive than just returning the number of bytes read.

I see now that it's complicated to match the behavior of the
emulator's __do_insn_fetch_bytes(). You could clamp the number of
bytes to read up-front to deal with the end of the address space, but
you would still need a second call to handle the wrap.  Something like
the following (mangled by my MUA):

static unsigned int __kvm_fetch_guest_virt(struct kvm_vcpu *vcpu, gva_t add=
r,
  void *val, unsigned int bytes)
{
struct x86_exception exception =3D {};
unsigned int bytes_read;
u64 access =3D PFERR_FETCH_MASK;

if (kvm_x86_call(get_cpl)(vcpu) =3D=3D 3)
access |=3D PFERR_USER_MASK;

kvm_read_guest_virt_helper(addr, val, bytes, vcpu, access,
  &exception, &bytes_read);
return bytes_read;
}

unsigned int kvm_fetch_guest_virt(struct kvm_vcpu *vcpu, gva_t addr,
 void *val, unsigned int bytes)
{
unsigned int first, bytes_read;
bool wraps;
u64 avail;

/* An instruction-sized fetch can wrap at most once. */
if (WARN_ON_ONCE(bytes > X86_MAX_INSTRUCTION_LENGTH))
return 0;

if (!is_64_bit_mode(vcpu)) {
addr =3D (u32)addr;
avail =3D BIT_ULL(32) - addr;
wraps =3D true;
} else if (is_noncanonical_address(addr, vcpu, 0)) {
return 0;
} else if (addr < BIT_ULL(63)) {
avail =3D BIT_ULL(vcpu_virt_addr_bits(vcpu) - 1) - addr;
wraps =3D false;
} else {
avail =3D -addr;
wraps =3D true;
}

first =3D min_t(u64, bytes, avail);
bytes_read =3D __kvm_fetch_guest_virt(vcpu, addr, val, first);

if (wraps && bytes_read =3D=3D first && first < bytes)
bytes_read +=3D __kvm_fetch_guest_virt(vcpu, 0, val + first,
    bytes - first);

return bytes_read;
}

I think this solution may be worse than what you have now, but I will
defer to Sean. Maybe he will have a better idea. (Maybe my suggestion
to return the number of bytes read was misguided.)

Reviewed-by: Jim Mattson <jmattson@google.com>
