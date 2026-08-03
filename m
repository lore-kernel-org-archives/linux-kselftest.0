Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE6360EC0
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727595; cv=none; b=uTcZg5tkHng0+M/+tNOmVdhRh4J654KHaGB5WmFDEiy2uvilH69eI+QpRX4A7BKuXToPsQuKoaJ6rFpyvv6/MlX3aoAjlRgjHd5QNV0hgXhbzOzQ3eDKMG6anhrA2CyEcog2rBpxUaeZ+qxfEciyz36IfPFHO2mlLSS5KJVfap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727595; c=relaxed/simple;
	bh=q0Iq6ZtSP2Bo6Kr/xjePCnb4yWA7JsFK+cxdHKTVT1c=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=m3jccJcBs+G+IYwAJrzwjxACekQkozUG1SHfDHZI3C8KM+2vgamEIgHerzsdO+TWqGaHh1exckVEbHjSng8zCIJgH3g4GuFAeVgcdBlVQubkQclCG1A3Uq3/O06TFr9eLo+e4cC9tWNfT7Va9R28UIB/F6borzZZxvNrxZiP2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjhLtax5; arc=none smtp.client-ip=74.125.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjhLtax5"
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-4955f00e593so4618655e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 20:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785727592; x=1786332392; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rW2m4UfJFTFczcwxnDcti6pYYCW920pNNinJvPy7q7A=;
        b=LjhLtax5AaA4c1bBb4namimn762R7jAK7CAGgejlmA68oQFADOuniBHNjWZJAtzKUr
         A+HXrP1pkfYfawcmps5wDkibEksc+OmA5uYyzhxTjgbZiaujjsbuexgtLNasSjtRVzEY
         0jeuMjlJPxJnBHK2MogYYROF2kEH/1LsyYMI4WU+VTs5JjCKyQ0yvxrpjhvsGcf8fVuQ
         az0hLvGwdT6VU3hX3g0duZODuumaN8dL6elnuvPpwIYP0E1QUFmphH/YwbawF+XMdM/E
         yOVYio4hIYbNqJ55FiiaD1m/i8nH15eqNF80GCfML1m9WOiVIBpDu5tC+ANJMZm1qHIf
         I0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785727592; x=1786332392;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rW2m4UfJFTFczcwxnDcti6pYYCW920pNNinJvPy7q7A=;
        b=IG5+Mz7Wo5lB2CmE4KsRRsK/6ZdrpgtoGTwBVlT13a91uBqlECUQi+QWywb7zyfaKK
         Tqkcn5nIU5jcIM0PgAGr/JKWRytzyD2wcFFAP1HT4XTzMq+3aybUd0jPGO/V/A8NJg2Z
         Ig7+NuP0Nn19fbOMxYGzY2W9+mvBuexP57/pnwvs3WW66bxvk7L9DUgZIa7sE5u/Tz5J
         sudJDzjSkuHeNrbA2t12E7Qtxe7sJiSStMwP9ng6+gYwva41Le3rOBdVwzx/FPW5ATMq
         0nTGTrO6Wpm6K0xrW8cSTOeZ1rFHlfAPdQW8RITqjtNmRiiAARjJ3oVUuVC6Ytq/1wJO
         9YRQ==
X-Forwarded-Encrypted: i=1; AHgh+RokHWYAYf8sCZ0HSmrPmGKdepdhvcR7PYYxGPY9ldSo2yG/5lfkmF07I2uNa0/Zvu3/X6h0YmdpUjRObtrzXqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWlgZjR1SpHUHeNa+lhTwu5Cma/6CmNb3hO6LpTf3khC4Wxq4C
	HQK5ijb21drgquZLZU8Erh/9i2VJ+CcKFChwNsYMaX6TdaXWBYkasKVJ
X-Gm-Gg: AR+sD13k0kHq6qFG5C6713BlY3dcvWVMdT4+F3zB2n5cgEVuUgUKbrYi/+vlBLzWg2C
	69z6/BnG8PWY5uiWNIu+wkGTcR7ke1zaj17NY2mUBzEG5D3TcMgmik/LDTUH05dH+ytM4MMzOAz
	38y72xv8tcmgTkXjDl5kQlmjmaHyZM0FosTzQ0nM+dDmQfS6phYqdxzCT22rAircbYixMDRYcoD
	ojY3ckeklAa6D4qcLwji6og+90lGjMK2yrBZvaXvmsei80ZxItlp3CsxbL/yGsqPdiO6Bv7Bch5
	M7eHruW7vqsKkGwWrSTMM2t+5BgdiCLYvIuPjnZUsSXvUclw1QMWSSOZIUqD00CX2zf8iuhxOkG
	v1pM6h/v4z3WhZNBU/qbuq5kUcQMY7wP5Cxf9fQinbXPf3g2AMUrHiAuuxheZLIpFaU5SadCjMr
	IJSiviKs9iRbHvYDjS8/moon8Fu8dO4NfoepbVryvUim64g/vLf5ZSvgHyvcOguEIXE5Ni7ORzr
	DzYLDdJRnX9QOx2f/7zsbq0P692Hf0RKODSQIpwd+lYB/YEoAufUaBbtwrUzRriVrVHK93tlb59
	djdWV8F15Tkju3qbYy/v/XSqUT0=
X-Received: by 2002:a05:600c:e548:10b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4980c649c63mr132917915e9.6.1785727591863;
        Sun, 02 Aug 2026 20:26:31 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba8032sm156577785e9.15.2026.08.02.20.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 05:26:31 +0200
Message-Id: <DKEZLMC43IZL.3IE6NNLQWJI0V@gmail.com>
To: "Ning Ding" <dingning04@gmail.com>
Cc: <bpf@vger.kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <shuah@kernel.org>,
 <danieltimlee@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated
 pointers
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org>
 <20260728033837.1466123-1-dingning04@gmail.com>
 <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com>
 <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>
 <DKEYIUKP4IPQ.M7KVG0KIIU1E@gmail.com>
 <CAJP4iusjn58Uo7uE8NzicZQmKoips9fu8+bV0jEJFUNmXz8K_g@mail.gmail.com>
In-Reply-To: <CAJP4iusjn58Uo7uE8NzicZQmKoips9fu8+bV0jEJFUNmXz8K_g@mail.gmail.com>

On Mon Aug 3, 2026 at 5:21 AM CEST, Ning Ding wrote:
>> Second, I don't understand your explanation. WDYM by "after the access
>> permission check"? It gets invoked for BPF_WRITE, so should be rejecting
>> res->key =3D 42 if 'res' is a pointer with PTR_UNTRUSTED flag set. What =
am I
>> missing?
>
> The direct write will pass this earlier permission check since
> type_is_ptr_alloc_obj does not check PTR_UNTRUSTED:
> if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->type))
>          return -EACCES;
>
> The later PTR_UNTRUSTED branch is not a rejection check. It means when
> accessing a pointer field through an untrusted parent pointer,
> propagate PTR_UNTRUSTED to the child pointer.
>
> if (ret !=3D PTR_TO_BTF_ID) {
> /* just mark; */
>
> } else if (type_flag(reg->type) & PTR_UNTRUSTED) {
> /* If this is an untrusted pointer, all pointers formed by walking it
> * also inherit the untrusted flag.
> */
> flag =3D PTR_UNTRUSTED;
>
> }
>
> For res->key =3D 42, key is a scalar, so ret !=3D PTR_TO_BTF_ID. Therefor=
e
> the second branch is skipped and has no effect.

I am talking about this bit before all of that logic:

         if (atype !=3D BPF_READ && (type_flag(reg->type) & PTR_UNTRUSTED))=
 {
                 verbose(env, "only read is supported\n");
                 return -EACCES;
         }

Why is this not enough? 'key' is scalar, but 'res' which is being written t=
o is
still a PTR_TO_BTF_ID with PTR_UNTRUSTED.
