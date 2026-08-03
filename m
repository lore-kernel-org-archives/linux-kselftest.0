Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76819259498
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762030; cv=pass; b=lv0f2snOVNKgFZxAvMPmz5xazpkrAkt8EgYfNQ49fZTuD2x5UCWkCQmtQrWdXde6x8REu99guGRI0R19LDN5M6A2xdH3YFtNF8KHnmF6crgkosRtSlT+A1+40+S6Pg4cVDfb1ZoD4TIIzR0IpRNV9/sEfHpjTwT9yc97EgjtJS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762030; c=relaxed/simple;
	bh=4p1WjIfbnjjGUejWmeuUHTxOShSwbRyQLk17H/VBNnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2WW/03IS5kgneMrjwUr/4ohqXWUuWhHf7cSsearhRY/jzLx6TxrZIvJh3u+PyKK7/hXZZ7NS6xcNAc/elVtE6XFjMmA315NeUZXu+9xiBdQGWV2SeWziqO+ncK3hJE23D0Ez8K+6kx7rl8vbOMUoxrXaOKvrIJR0HpSizs/xgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ8CxBXs; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ8CxBXs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2959472e87.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 06:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785762025; cv=none;
        d=google.com; s=arc-20260327;
        b=GRKU5YMxZkBp14frXX7MgVmGeelBXu9j/Yzj2nTl20oAXWIVnyxrddbtiP8VdlwV/+
         cpuhr4RLGFE6tpQHvS+ONuu0tON6LB4/HYLc7Av9vT0WkVZfT2eu0lQjkeIsgCFiuvb6
         datPurf6UyegWhR0pV651ZrySRXwUOIPiLKkhxfHf7Q3F1kuLmZ9Czzxll5t9PslaDE1
         r9aZgZ+yPuA+osjR0+gD3qpcpY0F30tanFyp063g1B0dL078o+tLRjb6PA/wUf0SKma2
         AC6G4n+v6+Vkrq2lVrB5S26tRI5sOUIBOUZNgTbABQ1AFHeT72ApM9x5+fQXNIQq0BdG
         Ma/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4p1WjIfbnjjGUejWmeuUHTxOShSwbRyQLk17H/VBNnM=;
        fh=yFxZbeFqUdPkF9OXUK2rCNdC8WOzJ1CW/9fMI8yY7qU=;
        b=UmWacYehgdY8QSPyqN+YYmtpggQG4eV3rYiGatXLUpm2YJ0p4fA0r4bvmzsR5uLcL6
         NBqqcZrW9iBsUmhuhXRtcPoZxVCZSkG/XzQyrkCYdEtltRw7Mo5U0/c8j/PqzvnSQT2r
         SSB2dMEd2JW8zWuJCEv4qZAdZ23Cm6+xvFlDSSOv3rjJWw4vDtI6w4jRIDKGkXwiCpkH
         lufFkLS0s4hG3sTI8opdnzxXGH08cTeEiKahX8B4Fn5+njlIK+/XEktyD++nLmuxjpFh
         TSeYhOkUCpVboj1gDHWqmRX5dkNvaoMkmqz3QajMzs0YNXI5mYAa0aLJlWz/ADwkKsDg
         imHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785762025; x=1786366825; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4p1WjIfbnjjGUejWmeuUHTxOShSwbRyQLk17H/VBNnM=;
        b=lQ8CxBXs2f4HkGiPaBqEMGMlVYg3YYWHQODs0mcT87JZtdW3OwWfErq5AjExoPVKmp
         FhYdZyXxyjr5JplhEPHfSQwRh4DITnmhpF/xV5iBoUsA6L3LKrG8ZiyXrLdnA+B/x4vx
         yL3wpEYiKk+ix03JSG2EVb0Xs1Eo8tkdXfXOAHAjXb6leu//Cr0LA1v5DIsZUgDNsg95
         Uh2osM3tdQHJbxPn3XVKT7okk+I3Pw5o++2H7NQk7lQb0gfI7dfrYrpdNSuJlMMzX56N
         XwOCVs/BKMZsLdHnNU1Dn+abNTKgF7hpzZ71iJLJqsTJYGiRjI1vfEJAWLDzRjOzMaHI
         Af9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762025; x=1786366825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4p1WjIfbnjjGUejWmeuUHTxOShSwbRyQLk17H/VBNnM=;
        b=Yc7iQBQTTm/8COYzCuPoxt3ulvVdcOiMCKHNndIArh3L5ZNyLbUUlC2vxr7eXBAT/i
         V2OBJ52Pap6VqvsPR2b+iGzsTmZuFBdbqdYVNCxgWbuatOz37jXVMJKccrE39P34hksp
         QK3VCApKK7tMC4U/A8PnSBx7/Ger2Wh1l2TBdp0fdWUTA9aj2nGTxCmVAIQKXHZuQCRu
         nTFwnJOGmrDbhN1D4Dt/8Rn5E0hk5lqFRtecyCqapDtqYBB6Y3ih5fnRrMqdiQlYQc44
         zDOtksGK7qUbNfvHBltpig497E2Rw1YKT4bu7sD8mFHazpunisMN9dPTVNKCVhzyVCsT
         a/sw==
X-Forwarded-Encrypted: i=1; AHgh+RptPmWRJ6fHm6mSiTBH7yn0KmGPG0fIF8PusuAccqnG+DO+m+8svwAFZappsQ/fQZCAfWG3tngk0q08pB21Ih4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmLX75H9tOWWTFMA6DqERwsbpkXIp4ZU8d/8oip/WI3l+1p+R
	FNNp+Ugxy91FKmXl4YUzX6oLOg/HYauODQ1ohrrphbTUUzpVQF+ttrQ+LjdE9cJPKaGyHwA37TA
	Z099zx9oMowYRALivoLORuXR+rtvTU0U=
X-Gm-Gg: AR+sD11uOdBayTLDFq1K4LiVav0Y+OeAKza4sgYRxcEb+TCSFYHOi2GjVbyFOD4vJxg
	SSdPqLMlQn5ntxLEBQ1pvP8MjSnNweDW/YVXmV+6Ej1TCmzb6xQuVGJIctDGgQcJR8dnvE8n2gA
	rUFbharr/RRa69XUUALilctNOuBD3vT2juVSlb1ZTtrH7xaqRLzY3EOGD4dLC+yKK/EgarxZfXt
	AhLBPNW7e9TUeSNAnwwl8XWQ0a7Wf7R92wNs9mM3cPQqs1zIFwmfqXDklXKVa6oM8jv8rKmTZjc
	pOQ1HiQPPm9lYQRznn6kTectYd3opKakwlKOSd1cApGhjIDiSMny8CI1UtZDj/uHXcj8hQ6IyZk
	NNaOA5LeCdbQL8nX62uXE4SfdQgluwrX3kw==
X-Received: by 2002:a05:6512:138e:b0:5b0:1dd0:f238 with SMTP id
 2adb3069b0e04-5b2e4f1b067mr2062725e87.2.1785762024688; Mon, 03 Aug 2026
 06:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
 <20260729120739.47880-2-sigefriedhyy@gmail.com> <20260803081454.GA573507@shredder>
In-Reply-To: <20260803081454.GA573507@shredder>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 3 Aug 2026 22:00:12 +0900
X-Gm-Features: AUfX_myofC37c6hDTOJs8L7qTMquBYj9QB6glbVxSnoqG2Naw-j78vX-dRg_e08
Message-ID: <CA+7S2vJYnHoTx7S6x6CzAzfvTYB+RNw0RnYHnASYyiNRTyzq6w@mail.gmail.com>
Subject: Re: [PATCH net-next v4 01/10] ipv6: add ip6_del_rt_reason()
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>And be aware of:
>https://lore.kernel.org/all/83360de7addb13a3b5f4d5e722148f248fdb2ae0.1784884817.git.pabeni@redhat.com/

Thanks for the notice, I will proactively check the AI comment on going forward.

> From Sashiko:
>
> "
> This isn't a bug, but was carrying the reason in struct nl_info considered
> instead of adding a parallel argument?
> "
>
> I did consider it, but it doesn't look like a good fit to carry a route
> deletion reason in a generic netlink structure (also used by nexthops).

Acked. I also considered this path but also think put the field inside
struct nl_info seems to be a wrong design.

> This isn't a bug, but since these names become uAPI on first release, is
> the RTA_ prefix the right choice for the payload values?
> RTA_ is the established prefix for route attribute ids in enum
> rtattr_type_t, and RTA_DEL_REASON is added to that very enum a few lines
> above. So RTA_DEL_REASON_EXPIRED reads like an attribute id, and
> RTA_DEL_REASON_MAX visually parallels RTA_MAX while meaning something
> completely different. Elsewhere the payload value space of an attribute
> gets its own prefix, for instance LWTUNNEL_ENCAP_* for RTA_ENCAP_TYPE.
> [....]
> RTA_DEL_REASON_RA_WITHDRAWN is an IPv6-specific cause placed in the
> family-agnostic route attribute value space [...] Would it be worth
> stating in the comment that the value space must never be reinterpreted
> per family [...]
> "

Will fix it in patch v5.

> It's weird to have 'skip_notify' in a function that is supposed to
> notify the deletion reason to user space. All the callers except
> ip6_del_rt() pass 'false'. Can ip6_del_rt() call __ip6_del_rt() with
> 'RTA_DEL_REASON_UNSPEC' ?

Will fix it in patch v5.

>This is a pre-existing issue, but does rt6_nh_dump_exceptions() safely iterate
>over the exception list?
>Looking at the loop containing this code:
>net/ipv6/route.c:rt6_nh_dump_exceptions() {
>...

I checked other Sashiko comments, and maybe the above one is worth a
follow-up? I'll see if I can get a KSAN trace on it first.

Thanks,

Yuyang
