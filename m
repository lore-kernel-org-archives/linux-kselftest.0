Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC13AF646
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239060; cv=none; b=EFMDxGWKzfNWZJpHxN6gqqrhQ1WPpgbveuULUDow8vxieVNSKY7iPtf5eJgSG2ONFASSMdhyAMdDqGhnGRHul0Emfm6q2ZTzMmfqXPhTRKC6+UKRxKxOZ4mWi0pWmb0DTlQejC8HFB04R0eV82r3H/R4kR0iAUro/wKglJhuTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239060; c=relaxed/simple;
	bh=u4bY25OlS/STiPfEff3AYuZQbpFqDVPDBaP06JtG/TA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=I47ulqGDWIpa0JqNFKQbSJA3kmyahipIgDzYaR+0c0f86BSLSMk4fQCLmmG+uf/C+YY/xOp+4IHptglpBVlstR98XZllBAnumSzUvLF1+JvHOd2IzjCgO80v+lGy7QElortLazJjFn83zS2SI1zhVmHLgs1MhjbuOlfLNXy05Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TToE2Exp; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TToE2Exp"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc20so1142772fac.0
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239057; x=1789843857; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVAa2vcLmhJgPgBL+zt2cQ5v03fr313Ui4EZTagdeVQ=;
        b=TToE2Exp4sA5jtwdvfPSDEFCvS7otXijaFHMX/7EccbUKRSMGocJWGzECKJJe2z+i/
         lVN2GNZ3qIWo8hwFPDhui0/HkOyRrbzDNjB0io4vAz+VnCWIRyYKuwGnxewsCXOxwcEm
         ShpkyJ1IicYiITOHcR8PQb/CvuIsFQbN+1Oy6M7Y1QQv8U3zbLY7sxcTwjt4ck4rXrV6
         RvqCSF/8wLyrd7Q1c934K4MV/fI/yKjA6hKhm1pUBNc7H3PHhgthgq5WhUux88611VPx
         X9pM6X36TesmN4Zg08OxmJq2cRPl1uxTtjzjMa6THUODElGGnOrjYutbvUWIwaO3fcLq
         3pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239057; x=1789843857;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVAa2vcLmhJgPgBL+zt2cQ5v03fr313Ui4EZTagdeVQ=;
        b=F8wFQiNPzsCMiekgw+wiP+uSjT1n2lyY+gVT1L3wR9CHSUnji2aoP1Mgbur60CGwew
         Zd6Kb4DBfr30i+MFKyDwcW+fbf3IuRYEXN6O8oJIa4HQ5ki+7wj4t03lyboHpTIs4URJ
         5cnP+033t4CRKzFnCbXuihWUwb/GJRySzV+5dhq6l4bWKCsc+hZGqAXEuJVMeyzuiGCu
         sLZTG0uwzFTudkBdHMdckxc8WvokfQv9Y4lvaNzlZOaON5V+B1UcF4CX2nkHMJc6VLFT
         HKK+3CzkvPIGvYneM6jLEVEOh/dsasMGuSulHjuqoQ9OwxGQjQNOnGY08Bw1D9VuOLdD
         aX9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdV7nXMcIG3pFVaVRuVS9kYFp3w4DqGAl34JZDmvWaWyp4YkwH4a30SK4A0n2nk/Y6xscqIu0RUDt4emRkiwU=@vger.kernel.org
X-Gm-Message-State: AFuF++nof5ogin7fs6MNTSHDxSMNL0Y8ZzOYn6YhDmZPQOCJHSHXjnOf
	qpVsm20bUgLXwUR92OzukCrzSBZpBCnwRmiDZ/9iP4FfMeFq7wMVXWr9
X-Gm-Gg: AYBFou1b/ZFxqYJeL4UvU4maNMiI2GmdXrukojfgP0k2CfILPRWZx+ALsymMUi+1oki
	VQtL0P/7hnNS6kXf1C4HG4h1fsr6+FWPxcEfH5eLM5coBS5qvyh3UCPXNhyJYL14viCMyaS+x1a
	pQYVEZD/KY/U85s9LlqYers8WI2Xgaxvy9yg1008s4R9caay6Mbw6tdss/gVO+QRD6ps3UB9g/7
	qTL+ca+kvpmOkovf+wrw8KZUiSGWfqgplZUPe+ThmH1xzF84IeJSsxuAy/vrWx7difuVrrwoZ5h
	E9q9JYIl3Gzgar84u8YrDj6r/84dU15f67Gne++0jy86Fldq8KwAYy9qFjnArXxFloLNUvU143/
	6yBKZtMlXLxJBeVCq3EXZzKYuGUiR768M9J7n5M75NG5yEbTubEcDZ4mz1ocP8wqwVVz5bnz0bT
	09jfC4TOSzmB9LchrWoxpmWpOwatXUXooC8ZuBc3EOmUlhxPVySbPDTHGyZn6HSDl+uAYz8T/dA
	fH6EzxA3bwqrrPp1oTEnD85ID7N/L+Ff8/ORxXdAn5Y7Qj6Kwh3I26w9lpAXRYcFLo=
X-Received: by 2002:a05:6870:d307:b0:451:d77d:f2d5 with SMTP id 586e51a60fabf-47de9866097mr11425912fac.13.1789239057269;
        Sat, 12 Sep 2026 11:50:57 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5d::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64dbec6sm5034901fac.2.2026.09.12.11.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 11:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 11:50:54 -0700
Message-Id: <DLDKB6BTHVXE.PFK87O3QY1J5@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 01/13] bpf: move linked-scalar flags out of
 bpf_reg_state->id [NFC]
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
X-Mailer: aerc
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-2-vineet.gupta@linux.dev>
In-Reply-To: <20260910164635.459558-2-vineet.gupta@linux.dev>

On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> bpf_reg_state->id doubles as a linked-register id and, in its top two
> bits, as a record of how the register relates to that set:
>
>   #define BPF_ADD_CONST64 (1U << 31)
>   #define BPF_ADD_CONST32 (1U << 30)
>
> Every user of ->id therefore has to mask, and more link kinds are coming.
> Move the two bits into a bitfield next to ->precise, which is the last
> field of the struct and outside every memcmp() window used for state
> comparison, so the layout and all byte-wise comparisons are unchanged. Th=
e
> two kinds are mutually exclusive, so a 2-bit enum captures them and makes
> ADD_CONST_32 vs ADD_CONST_64 explicit at each use.
>
> ->id becomes a plain 32-bit identifier: no masking anywhere, and
> check_scalar_ids() loses its two-level "check the compound id, then the
> base id" dance in favour of a single check_ids().
>
> While here, use regs_exact() for the explore_alu_limits case in regsafe()=
:
> it is what that open-coded memcmp+check_scalar_ids pair amounts to, and i=
t
> picks up the add_const comparison for free (parent_id is 0 for
> SCALAR_VALUE).
>
> check_stack_write_fixed_off() cleared ->id directly on a narrowing spill,
> which would now leave ->add_const set without an id; use
> clear_scalar_id().
>
> Moving the kind out of ->id also drops an incidental comparison in
> regs_exact(), which used to see it as part of the idmap key; the next
> patch restores it. Otherwise no functional change intended.
>
> Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v2: was RFC 2/6.
>  - kinds are a 2-bit enum bitfield, not a byte of flags; RFC 1/6, which
>    turned ->precise into that byte, is dropped (Eduard)
>  - use regs_exact() for the explore_alu_limits case
>  - clear_scalar_id() on the narrowing spill, which would otherwise leave
>    ->add_const set without an id
>
>  include/linux/bpf_verifier.h                  | 25 ++++++++-----
>  kernel/bpf/log.c                              |  4 +--
>  kernel/bpf/states.c                           | 35 +++++--------------
>  kernel/bpf/verifier.c                         | 35 +++++++++++--------
>  .../bpf/progs/verifier_linked_scalars.c       | 34 +++++++++---------
>  5 files changed, 65 insertions(+), 68 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 9727df5af83a..afb1e5628698 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -35,6 +35,17 @@ enum bpf_iter_state {
>  	BPF_ITER_STATE_DRAINED,
>  };
> =20
> +/*
> + * Records that a register is (base + ->delta) within its ->id set:
> + * r1 +=3D 10;   r1 gets ADD_CONST_64 delta
> + * w3 +=3D 10;   r3 gets ADD_CONST_32 delta

w3 gets ?

> + */
> +enum bpf_add_const {
> +	ADD_CONST_NONE =3D 0,
> +	ADD_CONST_32,		/* delta was added with a 32-bit ALU op */
> +	ADD_CONST_64,		/* ... with a 64-bit ALU op */
> +};
> +
>  struct bpf_reg_state {
>  	/* Ordering of fields matters.  See states_equal() */
>  	enum bpf_reg_type type;
> @@ -136,16 +147,9 @@ struct bpf_reg_state {
>  	 * to a specific instance of bpf_iter.
>  	 */
>  	/*
> -	 * Upper bit of ID is used to remember relationship between "linked"
> -	 * registers. Example:
> +	 * Registers sharing an ->id are "linked":
>  	 * r1 =3D r2;    both will have r1->id =3D=3D r2->id =3D=3D N
> -	 * r1 +=3D 10;   r1->id =3D=3D N | BPF_ADD_CONST and r1->delta =3D=3D 1=
0
> -	 * r3 =3D r2;    both will have r3->id =3D=3D r2->id =3D=3D N
> -	 * w3 +=3D 10;   r3->id =3D=3D N | BPF_ADD_CONST32 and r3->delta =3D=3D=
 10
>  	 */
> -#define BPF_ADD_CONST64 (1U << 31)
> -#define BPF_ADD_CONST32 (1U << 30)
> -#define BPF_ADD_CONST (BPF_ADD_CONST64 | BPF_ADD_CONST32)
>  	u32 id;
>  	/*
>  	 * Tracks the parent object this register was derived from.
> @@ -164,6 +168,11 @@ struct bpf_reg_state {
>  	u32 frameno;
>  	/* if (!precise && SCALAR_VALUE) min/max/tnum don't affect safety */
>  	bool precise;
> +	/*
> +	 * How this register relates to the others sharing its ->id.
> +	 * Non-zero only if ->id is.
> +	 */
> +	enum bpf_add_const add_const:2;
>  };
> =20
>  static inline s64 reg_smin(const struct bpf_reg_state *reg)
> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index fb032dfdc0de..f8d7a5c8052f 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -651,8 +651,8 @@ static void print_reg_state(struct bpf_verifier_env *=
env,
>  		verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
>  	verbose(env, "(");
>  	if (reg->id)
> -		verbose_a("id=3D%d", reg->id & ~BPF_ADD_CONST);
> -	if (reg->id & BPF_ADD_CONST)
> +		verbose_a("id=3D%d", reg->id);
> +	if (reg->add_const)
>  		verbose(env, "%+d", reg->delta);
>  	if (reg->parent_id)
>  		verbose_a("parent_id=3D%d", reg->parent_id);
> diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
> index 66fb11b6c6a7..d974baad37ee 100644
> --- a/kernel/bpf/states.c
> +++ b/kernel/bpf/states.c
> @@ -369,13 +369,6 @@ static bool check_ids(u32 old_id, u32 cur_id, struct=
 bpf_idmap *idmap)
>   * and r7.id=3D0 (both independent), without temp IDs both would map old=
_id=3DX
>   * to cur_id=3D0 and pass. With temp IDs: r6 maps X->temp1, r7 tries to =
map
>   * X->temp2, but X is already mapped to temp1, so the check fails correc=
tly.
> - *
> - * When old_id has BPF_ADD_CONST set, the compound id (base | flag) and =
the
> - * base id (flag stripped) must both map consistently. Example: old has
> - * r2.id=3DA, r3.id=3DA|flag (r3 =3D r2 + delta), cur has r2.id=3DB, r3.=
id=3DC|flag
> - * (r3 derived from unrelated r4). Without the base check, idmap gets tw=
o
> - * independent entries A->B and A|flag->C|flag, missing that A->C confli=
cts
> - * with A->B. The base ID cross-check catches this.
>   */
>  static bool check_scalar_ids(u32 old_id, u32 cur_id, struct bpf_idmap *i=
dmap)
>  {
> @@ -384,15 +377,7 @@ static bool check_scalar_ids(u32 old_id, u32 cur_id,=
 struct bpf_idmap *idmap)
> =20
>  	cur_id =3D cur_id ? cur_id : ++idmap->tmp_id_gen;
> =20
> -	if (!check_ids(old_id, cur_id, idmap))
> -		return false;
> -	if (old_id & BPF_ADD_CONST) {
> -		old_id &=3D ~BPF_ADD_CONST;
> -		cur_id &=3D ~BPF_ADD_CONST;
> -		if (!check_ids(old_id, cur_id, idmap))
> -			return false;
> -	}
> -	return true;
> +	return check_ids(old_id, cur_id, idmap);
>  }
> =20
>  static void __clean_func_state(struct bpf_verifier_env *env,
> @@ -542,8 +527,7 @@ static bool regsafe(struct bpf_verifier_env *env, str=
uct bpf_reg_state *rold,
>  			/* explore_alu_limits disables tnum_in() and range_within()
>  			 * logic and requires everything to be strict
>  			 */
> -			return memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)) =3D=3D =
0 &&
> -			       check_scalar_ids(rold->id, rcur->id, idmap);
> +			return regs_exact(rold, rcur, idmap);

Why drop memcmp() ? Doesn't look correct.
Also even after above change to check_scalar_ids() the check_scalar_ids() i=
s still
no equivalent to check_ids() that regs_exact() is doing.

This patch should have been refactoring, if so, this change looks
unrelated and dubious.

The rest looks fine.
