Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917012;
	b=yGd/5pXYCZnw00YxQKaUgMqhG/SuN7TLq5oiqJIcFUZTRVZChfx2ly2K3C3dG0gyfh2N
	 fqykspo6Ms/EtxMofJD+R5XAndxIahbUZEtc836y1/Gv9l0/tn9oSQMdC7dRCtHmNoCtH
	 lCK+8SX6mM/LTVwHhTLUtGoDbjywgEIvibZZaV7poFXpjTSO7QtA4SU1i9XG7N2p4IGGb
	 dlLTlgYOQBM4r3WGwoKjwL+EkAzzUx8DFXd7oMuHOWywvzxSYi1R7UEgV/F7znEJ1bZsq
	 59480zY5Gt+GjV/Tuhk3rOfwAycEN8gnp8yJnYb/qCEDmeJjfof41frHmZ0t0KH1+1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
	b=np8S6gp/B0J4hDJAROFjKnJXAwfMNlMtXyQ0AyB2IEmNufqAqcGWB5gMguIq9P+qnxKA
	 QQEISru/KtE39oa/z2cybPnq1Ivxgm1KZFJZM+H9OMh4F/c4SLDXDr0IjByAk8YqKLc7E
	 yXToYNO4xj9rfOJTL56Bfda9hy5dc6MnDEkg6ynGVmGTip9/PWxf+yL5B2YDjGJWvEujR
	 HQgOHd9OaDPdrFE74ZNuJ1ycQrPTR38C0+eexSD3CpbjWpvIE4T5VJvovW6J6Vm+QdAbD
	 nTjpzF67Dmn312Uc+QhMCImv04fHMd/eDghaBHRZhaCfUfYqk6LlN06AfJ3vGm+0a8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iP9BgBAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF3606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26BF3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iP9BgBAa
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e977109392so55515ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917011; cv=none;
        d=google.com; s=arc-20260327;
        b=Of3CgAo6hpOHKU87VlFjZ8+7ylcwtUaBO93Oa1z7mlL7GP4+2ALfkgP9qOmXB+bAxG
         DVDMzO3zMtcaqeUF2U7vVEHIO90dQuNpuKQd2xDQ3vWbk4HalhXyfdHRZbr5HMWO8ty+
         AQrkIVL83P4JCPwueZzej8E9oCPT8oN8+stefCUJ70om89LUnAbdilkCOZ75j86T7iWL
         XTDIoxQL82nwY2yOONNqB07TUi8eqiYI7MC1Y2p235fvCMz92L9QQG+b95qHKMGxnb2h
         v4PvvcUuOdK0DjQTVnCdAqy291u+2s9ZGjuHI6PWq8jAsxlL3zVMJe+QJf8GeLxE3chm
         MlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        fh=fQAGsNBH9v7k4modSlcxFu0jFiTyiRvH+EGzR5ExN7s=;
        b=lc6qUNKRF/AhhtUjomBm9rZP7vZdDG8LLwc4ZDPHiX2ygbyXhvjn3X02HKggHxGwoa
         fkpLdHPwKIwvuwYRn+5XY0aicMx0b+alqvU6Tw2sIm1mUZnbTonXMQ1S1ng0dZb/QNOe
         SLrrqdE9yMZsJvEYOy3JeGXKgfFlLLCN8m2EMmH6lkBZyFp0RI9sBOX0mmpe6a0GjmEQ
         UGFUWrHRuLLzdHth7/0r/LTCjp5NcFSkPPxhGyHu861MRGu4Wylo2tshes+yUwvsdJf1
         bHx8Mbr9CVUswPudcNNsE9/MscrheGVAV2wTINa/mcgiR5s7fslYN4JQYYPP932Nv696
         3kFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917011; x=1794521811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        b=iP9BgBAaZ+4A+3RimSD9ZonOApr8s4gWmYWTaABf/aDdyfTq8bRD2jcxwy7ugyBGhj
         KiltjQF+2poLmDHsSb98LsTJA2j25xqN/YKk8wL5KNfTpCuwsuUCXvsw5XVRCINuSS87
         9Fe/uVAtkXQWuxBGlwUR7w5pOKMvt6sUtwZ0/XTEZH4RXCvj1eaGVWk6nVdOQISu8eAs
         a3qUFOlDzQ32mSsKtYeSLRebVLyGj5dYoTFgvRqT71GMNu/pvBWVp1ufljtIfOxyhAvY
         D6w9HDHlVw2G2SbkTjq5/jHBgHtc1aFqrZrAUwWg/9N7QCTa6tfm8piShp6wY/d4n3D0
         MMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917011; x=1794521811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        b=oPxBpuX0vbzv3fb7lcN/ZNk48EhoJBP76eNRsTjRVN7kga32kyK8lqJije6fxMCNlz
         VRt8W1OA/+NvQI7nF+mZN/jVDm2c+msoGTOkztbGVjT1I0I5V096NhhyaKkS5YQDGAP7
         4G91bCfe2nnRqf9rYt6m4FCif8WSHvPjwmG8B1FImF/tOR6TD6OtoORWnPN1PQnLMTcz
         Q/yoDeYOptJvJ/7wz8y0ov0tfLz45jT2FMgjh2KUD95qLzLtrsOjV67HojuuymOdVU/i
         PpxdBgN1uwjzmCozgSUoug6jixXhM5hvJUTzNUxujz0qY/zL2xN/arMQ4sLb7UFIejQ3
         0/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzy7dhGBWHkFhtSwPNggTCoa1E2MtjDpAfH8m74UtsJU6fF8LSaMin2oP656E39jSQ8fY6ZxpCBZTqXAV7wePA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kP0rAgOTbigLv3HtZKI+pAflMom8aF3VDIzIjoyUr8iWW/Rsq
	Mf7TX12oincLSMsHEEQyijOQqZR6u8isxpjHdZFvCop7l0pjZLbEN48NHHh/UKNyatU11dS4gHi
	FN7HGPoJWv9CzIQoiKuA6MEw82/dF8RI=
X-Gm-Gg: AYBFou12wwEBkQEeQCxb1y/ZCcgcYNNQX8VzmfpxnBXm0iCw0Yix1bpeVUXan15pupz
	i/iJtOWGrnudE6vDWdaSnIPI/suTXPaZZozjWGNDg+GslT9R99yevCm8GAF9PtCYYpCLeXD5Th6
	zsqb6Cp5DHztCffAQq0WZwiDO71cqDtnmlb35SZCnAypXqwEfMNfsSepGenQI3eqwCiuNxje51v
	JGt/ypLFVUG6VM0NIdemJytuYyPV5IEDNFDm2Kz28/eie6Veq9Su//W2loZgOfCl0ebUBTDgirU
	E3H25jPAfpPvNE2NOIztrGTYA3a/WfVQFKYc8zKKPC6zrcheywpDpk5RXo/4MtgVLeEKK45fwak
	FupLqCSfjRn8zz5czT1afZlKWb4J91QNHFwYlWUlsQ93ZZB6KIz9jt0g42ulQmFCyqa4wHruuAc
	8eszlV65cR0CfTdHmfKkeT9R2u+02VgTP+jQ==
X-Received: by 2002:a17:902:f605:b0:2e9:a090:dd69 with SMTP id
 d9443c01a7336-2ed40dbd792mr10719095ad.39.1793917011326; Thu, 05 Nov 2026
 14:16:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com> <20261101103221.51534-2-dennylin0707@gmail.com>
In-Reply-To: <20261101103221.51534-2-dennylin0707@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:16:39 -0800
X-Gm-Features: AclHuK8Q4YahT7MssTrhujdgEAS5UbVDPCCKhtVvtn_dsDLqpOo6lwdZkjFPtNA
Message-ID: <CAEf4Bza9Q5AyzdybDwdQzAJKUJujAb_c7jtSAg=dpOPVWXo_uw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] libbpf: Normalize enum values according
 to signedness
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:32=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> BTF_KIND_ENUM stores enumerators in a signed 32-bit field even for
> unsigned enums. btf_dump_enum_data() compares unsigned data against that
> signed field, so values with bit 31 set fail to match their names.
> get_map_field_long() also sign-extends the field: for example,
> __ulong(map_extra, 0x80000000) becomes 0xffffffff80000000 instead of the
> requested arena mapping address.
>
> Add btf_enum_value() to extend an enumerator according to kflag and use
> it in both places.
>
> For data dumps, keep the original comparison as well. Older BTF producers
> did not record enum signedness; an eight-byte BTF_KIND_ENUM can contain
> signed data such as -1 with kflag clear. Using only the helper would lose
> an existing name match. This compatibility comparison does not truncate
> the data value or change the numeric fallback.
>
> For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
> enumerator can therefore match both its sign- and zero-extended values.
> The record cannot distinguish legacy signed metadata from unsigned
> metadata with the same bits.
>
> Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
> Fixes: d147357e2e59 ("libbpf: Allow specifying 64-bit integers in map BTF=
.")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Link: https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/lib/bpf/btf.h      | 6 ++++++
>  tools/lib/bpf/btf_dump.c | 3 ++-
>  tools/lib/bpf/libbpf.c   | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
> index 57f12630c5d1..eeb4984d6c57 100644
> --- a/tools/lib/bpf/btf.h
> +++ b/tools/lib/bpf/btf.h
> @@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct=
 btf_type *t)
>         return (struct btf_enum *)(t + 1);
>  }
>
> +/* btf_enum->val is signed even for unsigned enums; kflag records the si=
gn. */
> +static inline __s64 btf_enum_value(const struct btf_type *t, const struc=
t btf_enum *e)

btf_enum64_value() return __u64, why not make btf_enum_value() return
__u64 for consistency, and then cast to s64 in callers if kflag=3D1?

pw-bot: cr

> +{
> +       return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
> +}
> +
>  struct btf_enum64;
>
>  static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index ea9a34db4c00..b636dc4185a0 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2373,7 +2373,8 @@ static int btf_dump_enum_data(struct btf_dump *d,
>                 const struct btf_enum *e;
>
>                 for (i =3D 0, e =3D btf_enum(t); i < btf_vlen(t); i++, e+=
+) {
> -                       if (value !=3D e->val)
> +                       /* Keep names from legacy signed enums without kf=
lag. */
> +                       if (value !=3D e->val && value !=3D btf_enum_valu=
e(t, e))
>                                 continue;
>                         btf_dump_type_values(d, "%s", btf_name_of(d, e->n=
ame_off));
>                         return 0;
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 02e75b183ed0..cecd6b5f27de 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -2627,7 +2627,7 @@ static bool get_map_field_long(const char *map_name=
, const struct btf *btf,
>         if (btf_is_enum(t)) {
>                 const struct btf_enum *e =3D btf_enum(t);
>
> -               *res =3D e->val;
> +               *res =3D btf_enum_value(t, e);
>         } else {
>                 const struct btf_enum64 *e =3D btf_enum64(t);
>
> --
> 2.43.0
>
