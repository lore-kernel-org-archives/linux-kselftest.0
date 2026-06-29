Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AB37D133
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764456; cv=pass; b=DZG5tjc96eBmazwlWDVGDTu3qVjlNvkB3SgjmvwLlhiWYDzxxgXPgQ0e3Kqcbywq+KVoeygNwizGJahMUAAGuFUwk30b7tKbXU3QM5sOracE3TAG5df7IRrHXZgCq5GM4UTL0gA0fIQONV4W8llsN6/RNJCAv27TsWXUaUQz61s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764456; c=relaxed/simple;
	bh=841cSuiWxfQc2bs8PUx913qlmkW0O3hz7zM/abZtsNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ee4MM2YKQf8SNDj7S+xgGQwAAKYj8FVRdS7ZVEKyDiZl8YBEoWZwiw05lJ3yzBbrJLD8+5pO0FI7KIXLSJD7ZD1id+0MLviKOvHdisJPEdmnusq5iLmh2ffoIRR4v4O2Ou8w/5CXJRTgqAHM/Fu9I65xlPsFFXWbsHto2vYwJOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWOKXuuB; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWOKXuuB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-461edb387ddso3595343f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 13:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782764453; cv=none;
        d=google.com; s=arc-20260327;
        b=QDAYFo58IMVGhIsbiySvvWKSPkFMEGW3w6k7eFiGMzXx0cPxpOoSm8jiHPAD2BIPC1
         TeiyJDwSbyUGZbU4wHedlWV7OvmGt3R/5hu8XFH3RuuKE+PyTkZhCPav+zehKxlb/p8i
         4SpwKIAc6R/lUSyVKfze8Pbl2R275KvABLj/muvRmCTI7w7jebFCWVigqmAcKvKxMU2U
         pwNTVvVzyL8tNyidOcp2Zc+sTslqM/DmW3UImQaU7nEvG8Y/1x388ZWRzRdmS7PBiI0f
         dt6fcl6ZF21veqdLXiCIFvIEeS8k2PX44mwChZffXAhJMGK14D80ePp9lrnsF8HZ/SLg
         I3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CFs/yfWuhUwwa8R1BUL99gq564DjmPBXTx3kH108pz0=;
        fh=OSQK7T1tRM6mYOWiuhY9x4QY34rKlohqnYQoCH91Q4A=;
        b=Lb2ugWBrmAGasfj18Ys6+i5kqhI+UfcS2gaRAjvzxoInvnox737DqSYOFZlDAAMa5m
         FlIlrDIL8Ac1ux77XCBX5TWpz7NZbqxY0n6GN5dr3lIrBA0kwW+6b0X1CY7Qk4L4QXjL
         j1s3J1Yo7oWVhgwQz7omuO63RCAyz1uWerMlmGS3pC2WnqnW689+Z0Cn2Y26m/s4vYmx
         6HmAwVr92HBQvju1B4E06K3s0n8RWMCuJ5JRoYiQXTC8Jby6+Y73vqNmTTp9jYjsekCf
         Bm3A7cS2ZpiBmd8UfSA83I7enh8xFXn95eNm0Da+MevXnQ2H3xGOV+rro15lFFm8z0oA
         A8uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782764453; x=1783369253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFs/yfWuhUwwa8R1BUL99gq564DjmPBXTx3kH108pz0=;
        b=fWOKXuuBuIBDM2z7ggXsBPodVyazUR4hY0VcrbBGikSvWH5Bas6st9FEW7mQ/mWbaN
         spRezIohTU1DzW5uhJVq+JlVy9bL00oSfNMreIyUw2KTXpMWTPkQysEYww5faL1p5f/o
         zIFW+mCZkMrnwjvzyBZpGc+s9w7aXZjsO+zPc1UanCmNu6eNF1dXCIjxCFx3lmxdF9Iv
         U6sKAsyiTrBUqd1STUbXF4jKVRhiatTFBM2ugn5acNxS38GdQ/LYNznBo3fDwDmI2FzT
         uR7OzrS5k422663WUa1Kwc4Rahz+/1p45/Cz4I3S6OQ7cYXegDbJaqz2lGz5JD41sOjo
         y4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764453; x=1783369253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFs/yfWuhUwwa8R1BUL99gq564DjmPBXTx3kH108pz0=;
        b=SW3pgNImOn2YYxS/+cvSvhQFlMFOhmogpwsBB1IJdaWA5M6iAVAvnPLGSv4jUB7+Od
         HGlxWO0p5QjYqwrGsoUBxnpV0Q6N3vmXSVKCi3/5UXTO1g+df/tGChB94WfYU06rvDVV
         UfsJ9qjl5CW3py6P9BZNWYvAkA5bESa17Bm28CThXdmlPKfbp5pQCj5Yq4jOqz98HOVF
         LVncBQD96NgwcEiHPsgVira2HIG7CrRTTLCriS8Pm5lnQN/ltQTJ1eNQa6pdz1q2IEQC
         gh3xM+GCTUXMGqGplTCx07Tgr+iHyEdjaY0JrPvvkXSxgfPIos+7LW92PG0yt9zVX+E3
         Bp0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpIkMuy2HB9gGQVwdo4qk4GbDvmV/lBUtCLh8YOhoecO0X5E5tBRESa7aA+4fDOwjYLtOcbMXtJfby+YXGTM/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNxZRPmmioKxbiE0DV5UonktEDivYLVbqPzMw6KZVb8MBIcbdx
	WuSlD4+3jPbSDgyOKT9QDEQgVI0tB32k/n8Nuotli/zxSDQC28LSBkKypIMV9ZsdomqOM3QY+Lu
	IWhtR+wOvv03ExTMeGdwTQbds6iruy8o=
X-Gm-Gg: AfdE7cmqRW9tgAvp/UAbs+09vq0JzwxgCIp4sp24RXOU6ymFKJLTLQqaKXE3mnga4wi
	MxN8HfMh10eujzw9gnpev63xH0HU3VEIvyKODg67JjnpI7pPEYr/gd4BlinToqCtjzZBbmyjR34
	L2RPGDs8ZShFtVsJgauLvH7EwladNgoigcoJ3SsFj4B0EYshcTSgX6IkRLXFGEaMyVKuwUjCsVs
	c5hOsklimlTW1KNaGhpRyOvPTIyOogurlxd+30LCUYWWaZ/I8NhCQJrpOiv4kfUsNFjX5DO3Gzm
	NhNZSAgA8jDoCCSZQIe0/42qLTQLYg==
X-Received: by 2002:a05:6000:27c9:20b0:470:eb60:bed5 with SMTP id
 ffacd0b85a97d-4755117849amr648521f8f.20.1782764452460; Mon, 29 Jun 2026
 13:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com> <20260621-riscv_insn_table-v2-7-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-7-7f0810ee2274@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 29 Jun 2026 16:20:15 -0400
X-Gm-Features: AVVi8CfDVfYDga5-lVxUUxsvbnGGVBUwFyz5QNZw1Fs5Hnp0CP3OBY-vABw_urA
Message-ID: <CAJFTR8Tb54YPUQXiPCRq4XsX-P_vSyS2W=HThvEzb=BLn2Cy8Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] riscv: Use generated instruction headers for
 misaligned loads/stores
To: thecharlesjenkins@gmail.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Nam Cao <namcao@linutronix.de>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 12:08=E2=80=AFAM Charlie Jenkins via B4 Relay
<devnull+thecharlesjenkins.gmail.com@kernel.org> wrote:
>
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> Migrate the misaligned loads/store code to use the generated instruction
> headers instead of the hand-written instruction composition functions.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> ---
>
> Similar to the other patches of this series, I extracted out the logic
> of this function and brute forced all possible inputs to validate that
> the outputs are the same. To verify this change in the kernel, I booted
> on Spike and used the misaligned access checker which does some
> misaligned accesses.
> ---
>  arch/riscv/kernel/traps_misaligned.c | 183 ++++++++++++++++-------------=
------
>  1 file changed, 83 insertions(+), 100 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 81b7682e6c6d..4d2a2432e0c4 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -22,15 +22,11 @@
>
>  #ifdef CONFIG_FPU
>
> -#define FP_GET_RD(insn)                (insn >> 7 & 0x1F)
> -
>  extern void put_f32_reg(unsigned long fp_reg, unsigned long value);
>
> -static int set_f32_rd(unsigned long insn, struct pt_regs *regs,
> +static int set_f32_rd(unsigned long fp_reg, struct pt_regs *regs,
>                       unsigned long val)
>  {
> -       unsigned long fp_reg =3D FP_GET_RD(insn);
> -
>         put_f32_reg(fp_reg, val);
>         regs->status |=3D SR_FS_DIRTY;
>
> @@ -39,9 +35,8 @@ static int set_f32_rd(unsigned long insn, struct pt_reg=
s *regs,
>
>  extern void put_f64_reg(unsigned long fp_reg, unsigned long value);
>
> -static int set_f64_rd(unsigned long insn, struct pt_regs *regs, u64 val)
> +static int set_f64_rd(unsigned long fp_reg, struct pt_regs *regs, u64 va=
l)
>  {
> -       unsigned long fp_reg =3D FP_GET_RD(insn);
>         unsigned long value;
>
>  #if __riscv_xlen =3D=3D 32
> @@ -58,10 +53,8 @@ static int set_f64_rd(unsigned long insn, struct pt_re=
gs *regs, u64 val)
>  #if __riscv_xlen =3D=3D 32
>  extern void get_f64_reg(unsigned long fp_reg, u64 *value);
>
> -static u64 get_f64_rs(unsigned long insn, u8 fp_reg_offset,
> -                     struct pt_regs *regs)
> +static u64 get_f64_rs(unsigned long fp_reg, struct pt_regs *regs)
>  {
> -       unsigned long fp_reg =3D (insn >> fp_reg_offset) & 0x1F;
>         u64 val;
>
>         get_f64_reg(fp_reg, &val);
> @@ -73,10 +66,8 @@ static u64 get_f64_rs(unsigned long insn, u8 fp_reg_of=
fset,
>
>  extern unsigned long get_f64_reg(unsigned long fp_reg);
>
> -static unsigned long get_f64_rs(unsigned long insn, u8 fp_reg_offset,
> -                               struct pt_regs *regs)
> +static unsigned long get_f64_rs(unsigned long fp_reg, struct pt_regs *re=
gs)
>  {
> -       unsigned long fp_reg =3D (insn >> fp_reg_offset) & 0x1F;
>         unsigned long val;
>
>         val =3D get_f64_reg(fp_reg);
> @@ -89,10 +80,8 @@ static unsigned long get_f64_rs(unsigned long insn, u8=
 fp_reg_offset,
>
>  extern unsigned long get_f32_reg(unsigned long fp_reg);
>
> -static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
> -                               struct pt_regs *regs)
> +static unsigned long get_f32_rs(unsigned long fp_reg, struct pt_regs *re=
gs)
>  {
> -       unsigned long fp_reg =3D (insn >> fp_reg_offset) & 0x1F;
>         unsigned long val;
>
>         val =3D get_f32_reg(fp_reg);
> @@ -107,28 +96,18 @@ static void set_f32_rd(unsigned long insn, struct pt=
_regs *regs,
>
>  static void set_f64_rd(unsigned long insn, struct pt_regs *regs, u64 val=
) {}
>
> -static unsigned long get_f64_rs(unsigned long insn, u8 fp_reg_offset,
> -                               struct pt_regs *regs)
> +static unsigned long get_f64_rs(unsigned long fp_reg, struct pt_regs *re=
gs)
>  {
>         return 0;
>  }
>
> -static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
> -                               struct pt_regs *regs)
> +static unsigned long get_f32_rs(unsigned long fp_reg, struct pt_regs *re=
gs)
>  {
>         return 0;
>  }
>
>  #endif
>
> -#define GET_F64_RS2(insn, regs) (get_f64_rs(insn, 20, regs))
> -#define GET_F64_RS2C(insn, regs) (get_f64_rs(insn, 2, regs))
> -#define GET_F64_RS2S(insn, regs) (get_f64_rs(RVC_RS2S(insn), 0, regs))
> -
> -#define GET_F32_RS2(insn, regs) (get_f32_rs(insn, 20, regs))
> -#define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
> -#define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
> -
>  #define __read_insn(regs, insn, insn_addr, type)       \
>  ({                                                     \
>         int __ret;                                      \
> @@ -217,13 +196,13 @@ static int handle_vector_misaligned_load(struct pt_=
regs *regs)
>  }
>  #endif
>
> -static int handle_scalar_misaligned_load(struct pt_regs *regs)
> +static noinline int handle_scalar_misaligned_load(struct pt_regs *regs)
>  {
>         union reg_data val;
>         unsigned long epc =3D regs->epc;
>         unsigned long insn;
>         unsigned long addr =3D regs->badaddr;
> -       int fp =3D 0, shift =3D 0, len =3D 0;
> +       int fp =3D 0, shift =3D 0, len =3D 0, rd =3D 0;
>
>         perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>
> @@ -240,68 +219,71 @@ static int handle_scalar_misaligned_load(struct pt_=
regs *regs)
>
>         regs->epc =3D 0;
>
> -       if ((insn & INSN_MASK_LW) =3D=3D INSN_MATCH_LW) {
> +       if (riscv_insn_is_lw(insn)) {
>                 len =3D 4;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -#if defined(CONFIG_64BIT)
> -       } else if ((insn & INSN_MASK_LD) =3D=3D INSN_MATCH_LD) {
> +               rd =3D riscv_insn_lw_extract_xd(insn);
> +       } else if (riscv_insn_is_ld(insn)) {
>                 len =3D 8;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -       } else if ((insn & INSN_MASK_LWU) =3D=3D INSN_MATCH_LWU) {
> +               rd =3D riscv_insn_ld_extract_xd(insn);
> +       } else if (riscv_insn_is_lwu(insn)) {
>                 len =3D 4;
> -#endif
> -       } else if ((insn & INSN_MASK_FLD) =3D=3D INSN_MATCH_FLD) {
> +               rd =3D riscv_insn_lwu_extract_xd(insn);
> +       } else if (riscv_insn_is_fld(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -       } else if ((insn & INSN_MASK_FLW) =3D=3D INSN_MATCH_FLW) {
> +               rd =3D riscv_insn_fld_extract_fd(insn);
> +       } else if (riscv_insn_is_flw(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -       } else if ((insn & INSN_MASK_LH) =3D=3D INSN_MATCH_LH) {
> +               rd =3D riscv_insn_flw_extract_fd(insn);
> +       } else if (riscv_insn_is_lh(insn)) {
>                 len =3D 2;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -       } else if ((insn & INSN_MASK_LHU) =3D=3D INSN_MATCH_LHU) {
> +               rd =3D riscv_insn_lh_extract_xd(insn);
> +       } else if (riscv_insn_is_lhu(insn)) {
>                 len =3D 2;
> -#if defined(CONFIG_64BIT)
> -       } else if ((insn & INSN_MASK_C_LD) =3D=3D INSN_MATCH_C_LD) {
> +               rd =3D riscv_insn_lhu_extract_xd(insn);
> +       } else if (riscv_insn_is_c_ld(insn)) {
>                 len =3D 8;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> -       } else if ((insn & INSN_MASK_C_LDSP) =3D=3D INSN_MATCH_C_LDSP &&
> -                  ((insn >> SH_RD) & 0x1f)) {
> +               rd =3D (8 + riscv_insn_c_ld_extract_xd(insn));
> +       } else if (riscv_insn_is_c_ldsp(insn)) {
>                 len =3D 8;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -#endif
> -       } else if ((insn & INSN_MASK_C_LW) =3D=3D INSN_MATCH_C_LW) {
> +               rd =3D riscv_insn_c_ldsp_extract_xd(insn);
> +       } else if (riscv_insn_is_c_lw(insn)) {
>                 len =3D 4;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> -       } else if ((insn & INSN_MASK_C_LWSP) =3D=3D INSN_MATCH_C_LWSP &&
> -                  ((insn >> SH_RD) & 0x1f)) {
> +               rd =3D (8 + riscv_insn_c_lw_extract_xd(insn));
> +       } else if (riscv_insn_is_c_lwsp(insn)) {
>                 len =3D 4;
>                 shift =3D 8 * (sizeof(unsigned long) - len);
> -       } else if ((insn & INSN_MASK_C_FLD) =3D=3D INSN_MATCH_C_FLD) {
> +               rd =3D riscv_insn_c_lwsp_extract_xd(insn);
> +       } else if (riscv_insn_is_c_fld(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> -       } else if ((insn & INSN_MASK_C_FLDSP) =3D=3D INSN_MATCH_C_FLDSP) =
{
> +               rd =3D (8 + riscv_insn_c_fld_extract_fd(insn));
> +       } else if (riscv_insn_is_c_fldsp(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -#if defined(CONFIG_32BIT)
> -       } else if ((insn & INSN_MASK_C_FLW) =3D=3D INSN_MATCH_C_FLW) {
> +               rd =3D riscv_insn_c_fldsp_extract_fd(insn);
> +       } else if (riscv_insn_is_c_flw(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> -       } else if ((insn & INSN_MASK_C_FLWSP) =3D=3D INSN_MATCH_C_FLWSP) =
{
> +               rd =3D (8 + riscv_insn_c_flw_extract_fd(insn));
> +       } else if (riscv_insn_is_c_flwsp(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -#endif
> -       } else if ((insn & INSN_MASK_C_LHU) =3D=3D INSN_MATCH_C_LHU) {
> +               rd =3D riscv_insn_c_flwsp_extract_fd(insn);
> +       } else if (riscv_insn_is_c_lhu(insn)) {
>                 len =3D 2;
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> -       } else if ((insn & INSN_MASK_C_LH) =3D=3D INSN_MATCH_C_LH) {
> +               rd =3D (8 + riscv_insn_c_lhu_extract_xd(insn));
> +       } else if (riscv_insn_is_c_lh(insn)) {
>                 len =3D 2;
> -               shift =3D 8 * (sizeof(ulong) - len);
> -               insn =3D RVC_RS2S(insn) << SH_RD;
> +               shift =3D 8 * (sizeof(unsigned long) - len);
> +               rd =3D (8 + riscv_insn_c_lh_extract_xd(insn));
>         } else {
>                 regs->epc =3D epc;
>                 return -1;
> @@ -319,11 +301,11 @@ static int handle_scalar_misaligned_load(struct pt_=
regs *regs)
>         }
>
>         if (!fp)
> -               SET_RD(insn, regs, (long)(val.data_ulong << shift) >> shi=
ft);
> +               *(unsigned long *)((unsigned long *)regs + rd) =3D val.da=
ta_ulong << shift;
>         else if (len =3D=3D 8)
> -               set_f64_rd(insn, regs, val.data_u64);
> +               set_f64_rd(rd, regs, val.data_u64);
>         else
> -               set_f32_rd(insn, regs, val.data_ulong);
> +               set_f32_rd(rd, regs, val.data_ulong);
>
>         regs->epc =3D epc + INSN_LEN(insn);
>
> @@ -336,7 +318,7 @@ static int handle_scalar_misaligned_store(struct pt_r=
egs *regs)
>         unsigned long epc =3D regs->epc;
>         unsigned long insn;
>         unsigned long addr =3D regs->badaddr;
> -       int len =3D 0, fp =3D 0;
> +       int fp =3D 0, len =3D 0, rd =3D 0;
>
>         perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>
> @@ -351,67 +333,68 @@ static int handle_scalar_misaligned_store(struct pt=
_regs *regs)
>
>         regs->epc =3D 0;
>
> -       val.data_ulong =3D GET_RS2(insn, regs);
> -
> -       if ((insn & INSN_MASK_SW) =3D=3D INSN_MATCH_SW) {
> +       if (riscv_insn_is_sw(insn)) {
>                 len =3D 4;
> -#if defined(CONFIG_64BIT)
> -       } else if ((insn & INSN_MASK_SD) =3D=3D INSN_MATCH_SD) {
> +               rd =3D riscv_insn_sw_extract_xs2(insn);
> +       } else if (riscv_insn_is_sd(insn)) {
>                 len =3D 8;
> -#endif
> -       } else if ((insn & INSN_MASK_FSD) =3D=3D INSN_MATCH_FSD) {
> +               rd =3D riscv_insn_sd_extract_xs2(insn);
> +       } else if (riscv_insn_is_fsd(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -               val.data_u64 =3D GET_F64_RS2(insn, regs);
> -       } else if ((insn & INSN_MASK_FSW) =3D=3D INSN_MATCH_FSW) {
> +               rd =3D riscv_insn_fsd_extract_fs2(insn);
> +       } else if (riscv_insn_is_fsw(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -               val.data_ulong =3D GET_F32_RS2(insn, regs);
> -       } else if ((insn & INSN_MASK_SH) =3D=3D INSN_MATCH_SH) {
> +               rd =3D riscv_insn_fsw_extract_fs2(insn);
> +       } else if (riscv_insn_is_sh(insn)) {
>                 len =3D 2;
> -#if defined(CONFIG_64BIT)
> -       } else if ((insn & INSN_MASK_C_SD) =3D=3D INSN_MATCH_C_SD) {
> +               rd =3D riscv_insn_sh_extract_xs2(insn);
> +       } else if (riscv_insn_is_c_sd(insn)) {
>                 len =3D 8;
> -               val.data_ulong =3D GET_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_SDSP) =3D=3D INSN_MATCH_C_SDSP) {
> +               rd =3D riscv_insn_c_sd_extract_xs2(insn);
> +       } else if (riscv_insn_is_c_sdsp(insn)) {
>                 len =3D 8;
> -               val.data_ulong =3D GET_RS2C(insn, regs);
> -#endif
> -       } else if ((insn & INSN_MASK_C_SW) =3D=3D INSN_MATCH_C_SW) {
> +               rd =3D riscv_insn_c_sdsp_extract_xs2(insn);
> +       } else if (riscv_insn_is_c_sw(insn)) {
>                 len =3D 4;
> -               val.data_ulong =3D GET_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_SWSP) =3D=3D INSN_MATCH_C_SWSP) {
> +               rd =3D riscv_insn_c_sw_extract_xs2(insn);
> +       } else if (riscv_insn_is_c_swsp(insn)) {
>                 len =3D 4;
> -               val.data_ulong =3D GET_RS2C(insn, regs);
> -       } else if ((insn & INSN_MASK_C_FSD) =3D=3D INSN_MATCH_C_FSD) {
> +               rd =3D riscv_insn_c_swsp_extract_xs2(insn);
> +       } else if (riscv_insn_is_c_fsd(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -               val.data_u64 =3D GET_F64_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_FSDSP) =3D=3D INSN_MATCH_C_FSDSP) =
{
> +               rd =3D riscv_insn_c_fsd_extract_fs2(insn);
> +       } else if (riscv_insn_is_c_fsdsp(insn)) {
>                 fp =3D 1;
>                 len =3D 8;
> -               val.data_u64 =3D GET_F64_RS2C(insn, regs);
> -#if !defined(CONFIG_64BIT)

Shouldn't we keep this?

> -       } else if ((insn & INSN_MASK_C_FSW) =3D=3D INSN_MATCH_C_FSW) {
> +               rd =3D riscv_insn_c_fsdsp_extract_fs2(insn);
> +       } else if (riscv_insn_is_c_fsw(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -               val.data_ulong =3D GET_F32_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_FSWSP) =3D=3D INSN_MATCH_C_FSWSP) =
{
> +               rd =3D riscv_insn_c_fsw_extract_fs2(insn);
> +       } else if (riscv_insn_is_c_fswsp(insn)) {
>                 fp =3D 1;
>                 len =3D 4;
> -               val.data_ulong =3D GET_F32_RS2C(insn, regs);
> -#endif
> -       } else if ((insn & INSN_MASK_C_SH) =3D=3D INSN_MATCH_C_SH) {
> +               rd =3D riscv_insn_c_fswsp_extract_fs2(insn);
> +       } else if (riscv_insn_is_c_sh(insn)) {
>                 len =3D 2;
> -               val.data_ulong =3D GET_RS2S(insn, regs);
> +               rd =3D riscv_insn_c_sh_extract_xs2(insn);
>         } else {
> -               regs->epc =3D epc;

This line should be kept.

Thanks,
Jesse Taube

>                 return -1;
>         }
>
>         if (!IS_ENABLED(CONFIG_FPU) && fp)
>                 return -EOPNOTSUPP;
>
> +       if (!fp)
> +               val.data_ulong =3D *(unsigned long *)((unsigned long *)re=
gs + rd);
> +       else if (len =3D=3D 8)
> +               val.data_u64 =3D get_f64_rs(rd, regs);
> +       else
> +               val.data_ulong =3D get_f32_rs(rd, regs);
> +
>         if (user_mode(regs)) {
>                 if (copy_to_user((u8 __user *)addr, &val, len))
>                         return -1;
>
> --
> 2.54.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
