Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5343955EB
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711851; cv=none; b=fIhK4nFsdVXHI7mN5NOI2JFOVI9XtTqpSg8y4RcJnAjXOxNe+oT6B+0A86w9ZoHVQl1qNe/WKUmWLLWQI4lKRGYcOjUy6PnSLCxaVjGFsNOO7V/IhErTqfKqwF5+ta8vx0PP+EtkklM/Fi3zhVOue6WThdxp8jSEQDJuv+V+1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711851; c=relaxed/simple;
	bh=Xgg9HNCjyRGX23AO/sCUh+nwGgu/rEK41LJrspiAXD4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOaw0KTNmxff0kNAgjm7SB3cgHf5ZfgLuSViT90b6g6DtEmOMOk22WFN5d2Ote51OuYTrUGVRFSr0jng4HvxbUiE/c6ufGByrlSWUbtYR0hTM/fvc5qvCeW+zl5hPCeYTdU8uKPTG9dvo7ye/geTqNEePYP39PjXyUMsCwDpagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR/FSUa3; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR/FSUa3"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13354eb66baso3822019c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711849; x=1779316649; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EjgurmqF9AmDhw7t4esTINtqU6esw5454d78bG00bqQ=;
        b=PR/FSUa3c6vRnSXWzhuis1p7TFcWMstQ71/cTTvgss9ZgDSlz+ui30EClob2//MXba
         wNLCubb4Adat6EjJqCpOJ4grOMJPV92iJkF/KQJ1rg5MXzeh3WOEosCwaPOMMix993gc
         SjD3F8MxhBmmnwA8ys3NDCN+N+OdM3TLmNbouKUpaJeK3gc6L3sRZFQHQ0P1+mz6Iop8
         U6ZXIqlEbh8qi8+LkFkPuFyYYP41J/WXtlwMUGhPU8SHu2fpkhjtC2RHJiK8K5vIwyHg
         JNoOqqgijTKzwR7qhMpyoGegUkpgh92tCKjm8+bSJy2kF7wZeEYlIom60Tj1xZxIlMNW
         insQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711849; x=1779316649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjgurmqF9AmDhw7t4esTINtqU6esw5454d78bG00bqQ=;
        b=Jth0CCn9Eqflj+SbIWkt3VRjUN0M8bTvIN0zmctS5xY6Z6+iJomN/Kbjl7MezrGZkX
         +dDaYEzTazU4eNbL1NHORz7M74hrm6xWLy0/x9ZxRi/6A/yPe+/pZ652u8n4BytRMAUm
         RDhHnSnIYp/6dfG9vpmgKBGo8MHFh8i/uhElb+yq8AYpePD90tVYTG2o89gdxsX7SnmE
         L1HV0aXvudm0qsAdMzqOA4LZJfjNEngbD4Qyhv9ONUO8aKpwX/aPcF1wAzanpIk/xdkv
         VqAX1x00kb5EJq/nQXk9bl1x8UJqPLsDYwsub2S6MPV+QQSAb4+2lZsEdHMGZAGAVjVh
         wZ1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8NFf8ouLviP1opJqQlOHLHgThQSgbAuALyzNvEJyAiATmyR/uKwc3zod6PSg28n32k4zQjDXV4PJLvnlo0H6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8eEfcJtRckaN3HEaePe9zuRf0RI6efmAIxrHcX7juDmp7I6Sl
	8rH8PdHjpEzJbHmO+Xu725pDuyonTVxbeN9ZYERsevtm3IEE2ahz4OOc
X-Gm-Gg: Acq92OGAIu28qCJQkPlatca9hqhCTP0wJequhukk2RCb5OZN9WRPdmelr3pLiDLi6oE
	wqtbYzM7xak8A24hxX5hhxPYNEKvQT6KerEcqApIBubBu+UDZ+lSP+giW7VMQfVmGvmWL9Tbm/Q
	d41LpmO5P5c6sKWbtOrnQLTLlnhCDG/LesC+PNxtvszHG3wT50UBMCeiQJFxSbJ4lUVffYCHSkP
	ebXoP/msYdw0akraX+927xumESWs82niNp/NynEh2+cQtyA+GrSP7AtjB2qLqMz4NvCkXDCcTOM
	0iyvZVv8f4DHO6GNXDqoglTxIpYGAFRuMZ14y41mhjGYzt2cis0f6biukBtmqFbTOp0fXfZw5IH
	AQUErix0HWqBn39Td15jLpVQPdTZP0F2Nmqg0jFrW5xYpmU2BFNT62/OJOkc1chnsa+4xDsKKBZ
	W9pr/9njVmXh2ocOuEB1AMHHABigSXBz57FKuRB23q8Yzq7RmOh6fr/7FXv/OrLlEya1Nty+RiM
	WEn73mtrixpg/27BA==
X-Received: by 2002:a05:7022:2513:b0:12d:b654:8176 with SMTP id a92af1059eb24-1342ee48a6fmr2921477c88.1.1778711848861;
        Wed, 13 May 2026 15:37:28 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm739335eec.25.2026.05.13.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:37:28 -0700 (PDT)
Message-ID: <0419643c9a04bf0824066742e52e3f197b43909b.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 7/8] bpf: allow non-owning list-node
 args via __nonown_allowed
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org
Date: Wed, 13 May 2026 15:37:25 -0700
In-Reply-To: <20260512055919.95716-8-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-8-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> KF_ARG_PTR_TO_LIST_NODE normally requires an owning reference
> (PTR_TO_BTF_ID | MEM_ALLOC with ref_obj_id). Introduce and use
> the __nonown_allowed annotation on selected list-node arguments
> so non-owning references with ref_obj_id=3D=3D0 are accepted as well.
>=20
> This enables passing bpf_list_front() / bpf_list_back() results to:
>=20
> bpf_list_add() as insertion point (prev)
> bpf_list_del() as deletion target (node)
> bpf_list_is_first/last() as query target (node)
>=20
> Verifier keeps existing owning-ref checks by default; only arguments
> annotated with __nonown_allowed bypass MEM_ALLOC/ref_obj_id checks
> and then follow the same list-node validation path.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> @@ -12017,6 +12022,13 @@ static int check_kfunc_args(struct bpf_verifier_=
env *env, struct bpf_kfunc_call_
>  				return ret;
>  			break;
>  		case KF_ARG_PTR_TO_LIST_NODE:
> +			if (is_kfunc_arg_nonown_allowed(btf, &args[i]) &&
> +			    type_is_non_owning_ref(reg->type) && !reg->ref_obj_id) {
                                                                 ^^^^^^^^^^=
^^^^^^
                           Nit: I think this check is redundant, type_is_no=
n_owning_ref() should suffice.

> +				/* Allow bpf_list_front/back return value for
> +				 * __nonown_allowed list-node arguments.
> +				 */
> +				goto check_ok;
> +			}
>  			if (reg->type !=3D (PTR_TO_BTF_ID | MEM_ALLOC)) {
>  				verbose(env, "%s expected pointer to allocated object\n",
>  					reg_arg_name(env, argno));

[...]
