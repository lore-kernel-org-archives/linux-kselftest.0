Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8734E325C
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971129; cv=pass; b=hUEWsqZMv3ikJfXmEwhiOop+mMNuGPy0dfgrv3n/DfVCSEH3Ack6HfR89a5//Z6BZMihzXS8eFs527MG57pqolABxi9XsRtr1OUTPn5kc82g3G7iT/inYYP4XtaDVXoAZrS37gTrgGwopPVvNebO3ZHe4xVz+isyi7jVyYVryp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971129; c=relaxed/simple;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgA1bJD5pPqTD5L9zY0Fb6Ij9mYshAogOVv5dZg6bVipJmCp1XTBT7IzUegngKFNrQAfFm4jMZQhgxi4+3dgqkMnhUgRITjO13PDN6cc4PyvBMxAQcVyVhIqcuGLFaABpUK5fOwy/WtXhiLEU/OwrZblle37BJhU0y5mHkJdEYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PK1r923x; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PK1r923x"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-87ab6e5f91eso25138387b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971126; cv=none;
        d=google.com; s=arc-20260327;
        b=npbazNA70hMInAyLHRkzbNrFPvjg62nAzxWUeYZwdWW4v6l84snhO2kTLLrmhTOKpF
         RapSpJo+Sut9IYMM3oa5dPiSQytWWFobuQR1i+fTC2FEtkL/lqoYZW9jXH3BhcQA+Ll/
         7aHSG7OQGLkA4mpLIBn3MJX0xIpJBTH/3Vbe1umuhDhEDpck0o9bwl8WszM4uwPlkcrt
         NUGLhRjRAmtWLsWykd6DkDA7ZM2tde9Kq1hOWZ84GJhEvUkDw17y+AwH+IET5Mus2Hdt
         otJ170P/TpZGatbe1qSMGPm9o8AZhKSr+KMjOcQlKADGxrOFc2RvlsRshHjlWZk9LylS
         8znQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        fh=4U88+ANAAWNzllpjH2h67gr8uY/crS9DtOmVqpgYIwE=;
        b=aUggXOwmWDTAVN3xtnOk6dbW088CvTWkfkfcCUh6kZfwMQa2s+G7vFNCFyJX3Oqkwp
         0KMUrcAjUpwxvNV3yHQq7JmigcirLyDGtV2t9QQshyx2IDOxreixmdHx+/cVtvasrCIN
         4+CrOWq69E2YYQi79H9XdWPhgizuF+LnRJ0ZHzznNa7+9HdeLzA0pm5oIY4fACLy6dFq
         Mljg7wkocyOzKTGvwIepGRK8P9EZTPpoO5pqU+AOJ+21me5AURIPAoYmw86JHoJsitvu
         MsUKvE7JSeNcbIERciIBIbBt9op4wBPRE7ATkKpTJIWG+yV1f3T9XFhxoGiF1637HWe3
         3zXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791971126; x=1792575926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=PK1r923xhU7qDZUbZmXe0yFUiSBca3J8XHIHs9qS+//TYB4Fft+Qo2Ljqk3oG6sPvs
         ExQCXNC1AHfaOK+vCwWLnwkjAKTf2UBbROgtrQXr86a/xPPl6cnW8uxv3/TF1HaeunIL
         WDiDbbme6gyhDZGG95JeVXsSEylcaz4DknthCfgSWs5Ausu5ByUHgSsm7wIUQRywIF7U
         6L6dKDQwf2C+Dc83KQaib+KmDPGD3y03epzqW/Cg6zX34bmKNG+1EutwDxzYAA5TyPdM
         vvgnoK8SarlTBCqLg0ZTdzmtuFchV5igeEa4cykI2Ygktz2Ux2qUDOT2+uGnWf2ewKNE
         z44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971126; x=1792575926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=HBDnqUHtpHmpxOcwZLunGPlwqyDEzx1bGeBBCirGd+4e5pGgLLvxq1S2RoIRwE/yVq
         k7YjGIGyjvb88ikFW0Cy88Q63uze1S7kRhuo1drbsgt6AMgN5/L8nj7jZmdLizkdI61V
         vQJO1DT1FrdwEwRUzwlLk7a7q3Iwr02G7h8X6m4zhV9vG4sz3IomzCAhTtAiJ9rYnt2/
         xsZQElAPlX2wHVBOy37L77nKfW3ul44oRDixNAucurWCaENNKtB5axpjkwX358XkwfDw
         caTwXM4PS6nq8mHdfKC5Tlj4KhBqyzo7gGWjEosBcTCBzGfWOyjQD+IFF0NU64sACuTH
         7Wsw==
X-Forwarded-Encrypted: i=1; AKwUvByH6PvucW3GS8beI/RElj4iAab/mq1QkREgRTHdCUZn+eIRI1WCO0a93MxemEeONaL0o+NR6NU8pmdVvCTa+Hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtnamLN9Yw5zPAf30VlOToskbg2qo9r34bmOau6UGKuOQeA6qE
	TupDw+axD7nWm16MrDlAxZlXNcJKHnjKzL0QPapmt0MRm8rXiVAvfWtPtVp1jvWJw5PcAjvcFaz
	YpYqv5AYTjxHPDTBGjnn6B4sATY3U8NIv7HR6vVhzYTMCObdxRPtiMWba93q0JQ==
X-Gm-Gg: AYBFou1RMl/bw6aaQfh3BK5dFKVwUb6MpL5/A8Yw4ib/4qj8BbTlKDLFN65ppnDzevS
	98f8BjrAnRTTBKvOg3Xps8elnecCLSMkm9AD5ffTXh9GKHZ1HOjiV7N9IoH0LuGo3uMHNyneOv4
	AowfA2hzalTfowVnuyZdEApNW3+KuN7XAtDZAxz9adNtaQ5ezpBbA2V0PgpdsPhpE4vp1OYEe1g
	72YcxOC2/kqHvlWZcnRtzwWpl9Vxw53Gkl3fp+fhC0fiJd18lwXShi10mkdG4rqs6KMxyTs5N8e
	t1vy7NDIVrJQTH6wWjua6PCfqtaWl/GVjDq0LJdfnKBYPvK7Ws+/58W/+cwes5Y5+JykzNpB8Nz
	MKa63NYZHIlJI6mavPKnHV2XR8LyVtLsW+OeUABOcvJD1EGTIU9wli0d2nE0LzH3fnAHCQ37NAU
	Y72mB6vILXDjtq7bzHQJsmLXxfH0ZUKNj+rFRNu2JtIXUVt1iWTpHR6JpygaOrBn0C/a/zkP/7o
	4SIScjSNcxlp4KewCnhftVW5gJVjYmDL5k1z2d6CH6wvyEV8+ZDayyJ2Nf5fRVzJSY3p0PDr76M
	0JXrKafbSX9uPg==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b09e22273cmr36219317b3.7.1791971126209; Wed, 14 Oct 2026
 02:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-2-julius@bairaktaris.de> <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
In-Reply-To: <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 14 Oct 2026 09:44:49 +0000
X-Gm-Features: AclHuK_at13xJpgBNhwlZvLzlUVxJXDvkN0LGkLWSuS73Rn7U8oFN9DIXlg-t_w
Message-ID: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on
 flowtable offload
To: Jianbo Liu <jianbol@nvidia.com>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com, leon@kernel.org, 
	tariqt@nvidia.com, mbloch@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026 at 03:17:00AM +0200, Jianbo Liu wrote:
> The handler is only in tc_acts_fdb[] and only accepts flowtable flows,
> so NIC mode and tc flower rules are rejected as before. Looks good.
>
> The comment says what the code does, but the consequence is worth a line
> in the commit message. Because the action is ignored, the priority only
> reaches packets still on the software fast path, where
> nf_flow_offload_forward() sets skb->priority. Once the flow is offloaded
> to the FDB, mlx5 forwards it without touching skb->priority, so the
> offloaded packets do not carry it. Refusing the flow to honor the
> priority would keep it in software, so ignoring the action and keeping
> the offload is the better tradeoff, it is just not obvious from the code.
>
> I checked this on ConnectX-7: with the series the priority-carrying
> flows stay offloaded to the FDB like plain flows, and without patch 1/3
> they fallback to software.
>
> Nit: "prio" already means flow table priority in mlx5; skbedit_prio
> would be clearer. Not a blocker.
>
> Reviewed-by: Jianbo Liu <jianbol@nvidia.com>

Hi Jianbo,

Thanks a lot for the review and for testing this on ConnectX-7!

I will send v4 with your suggestions this weekend.

Best,
Julius
