Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE79257435
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593519; cv=pass; b=fYyT9w22L5N5ZalABfeN2SxdX3flbsBJtzGSoG9+aIblY9d5gRkrspN2VXDacLbND9XgfaWn1t3xaHCBOc79IyYiUMM/NdC+Dhm0DcCMHG5ylw0QC3LIIFIB8Rem3YAlQWeNlBh6/GbqaYdvLBC1S+YWbNj2yPrdpa1cx4DaIFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593519; c=relaxed/simple;
	bh=DIiuqkdIjb/ctIpjHpwyoys7CyUZDRQZHO7tc6VIfzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5Q5EN1wqTQWokToSwfcWgjiNKtYMME758OAa6Rf6tF+XWA842gGF8aNUDO/PHvEcWxA4hhr3JQy2+EQp70fk1LTX2VtW9MSgwt7p7sK6yCQHDQ+pfG0NAkMwzz+lugxcrJR6z7Ik+H2+mpX6YZJN/3zIbYDSRAHeuze6kT9sA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=hC9b10Gr; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="hC9b10Gr"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ea0b7d137so16338927b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 07:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785593516; cv=none;
        d=google.com; s=arc-20260327;
        b=aZFU5vAJb2aE+S920g3YbRJTHzeaubu96AgmhaIyW1/449VXy234Ni75Rn0b30q/7z
         2lVD06yYiHeXGYcTx0G00s3c8tPWYdkmIFXUoR0M0sWoYF7Y7Z0k8/VJUeO7xuYzOVc/
         gNRyK6Lwv2nLPcQSdVaieuDwkacrNz3IocV6GZTD3hqtB1xwlEjpaSU4ZGL9ihDDp8Il
         YIvJACgyMw6wY0VjhoPvs2VsyfNvhnKIvNN1I5gl5Pj1KL4p29DwfXhvKGBA4wWEm3gV
         Mu5BFSWZEKF5afKh71t4ndn+T25OJqKbQ3zIK3OLIkmAuXlBjcoz6kgDUhtMcWotskl3
         q/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lY3DBNb0yDaL6jMIr8DirN39C+BBh8jbElIyoEBUy24=;
        fh=Q+K10gEK0GNTiUd+sA0yuoDYgOrde15ceCEMzPBX+oE=;
        b=Uq0qiZpoIUz8ziLmtwNQkH1tySYNj6LW1y4Oz9ZUvZLxGvAgeoi7LCQOXKE/9rvLPA
         zOxDjW18EzYnCkW+5p5nXus47em7RERsKMz6ND54hTWESpQUPNfM9bIlh+w8E6CBv4DO
         BL48y1/CZ1iM3rqwA51SkzocYvvE7GTmFem4uIXyWgm+aiE541AVrO9+sDeM1Q9fJvoV
         hkdb4EXMWhUW0ybmbdTmo2xyeK00AxEKKyul2AVPmQElJEMjQ8/mQpIskvO40s+wZ00A
         1UhhZOBJbQeLz7SP0I+6mbyvG+XbF1Ux5wH6yDufHC7VZEnqn3qM2Qa1jzJT50Qb1j0k
         Nb3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1785593516; x=1786198316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lY3DBNb0yDaL6jMIr8DirN39C+BBh8jbElIyoEBUy24=;
        b=hC9b10GrUKgj/o0Z384XwtCjuG1NtZzhtX1yaqmdaNs/jf4YuRwLhbYoSRF1p7mjaO
         xuENWqIuUhKj6e5kt1Qj3xXr7QqNNFmeQt6N6rf3fjv7cUa+4JW7uGEQjH+kkPlL6DxQ
         nnHACqJ9X2hMGwbdI3K0ILDuXLAldTNJbEVSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593516; x=1786198316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lY3DBNb0yDaL6jMIr8DirN39C+BBh8jbElIyoEBUy24=;
        b=jLHgb6iI7O8OVphdLL37DwX0+fEHQvDmwr8AD3d5TzuYHXQ1+CRn4IqdUWOCnRxwqD
         4VlvXs6Y07Wxcjpufk5B/qfc72jgoXEnX6/KCzY4NDo5iPPO9NRxxdnTXYjZzY1OUUxf
         xRQyWtiDhA4pO3KDjJPds93FaJ5Hsx2YCvQhWGKvsdezotJx5y8qhmXweLrASaEeGnuX
         JRZ8+DzROCydTof2eoBMuJj/OyxLPfGVjtvSqvGAsL5QVrSdCaLXKSYe/7W3LkKBX8T6
         wiTv/EjzVauiqPAtQnDirUUG80MDeOQTtQSuQ3cBP0pbC33xxrazLHZNjKCuqZLnuRzR
         eN3g==
X-Forwarded-Encrypted: i=1; AHgh+RohSqpatcN0tPrG+6IPqEN6n6m2LeZ6sc3Gv8/Jl71DW1opPQStJL5IiLF0VBfimr3McloaG4qrYu9hP7eT5wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzog5XbBhoXK+iy26T3nUATqaYHs2yEmK7E9sVEPbpksEv5DrvM
	tKFdndZVlDAaoy7lZw17GZa22r3G9aF2RwL90X85Z8u61dwdwhDKOQoyJAjlYp4NtnXvQB7PQ0D
	wzV2cXBQX8SsrR+uM5o4keNp0RfBp/+s8RisJf0Fc
X-Gm-Gg: AR+sD13g0ApHltM3S2nNHwhWsrOrZYDIV+frJIdZ8S7BWu+Au0MJ4QoiESRtPRbpn1M
	1as2T3xcYH3uWGwDtRq/HG8cN/zAtO1NM8JNAEtnJKI+b076VIaPNp7GBchp5I8sQdnpXsNpnic
	cjZpPni3Upt03lY5/NlZkmDcRLOpH1rrvWuVthoxBd2FLHRBNv0PARe9XSsY5/89xxj6tpUOAIl
	dk4px9suQljNQXBzVTCOzyEd+ZfozzuQ3cO+RL5VGOBo+M2471zB8q5p7KjidnrAjG+0EWRmohI
	KAE9dm6HdbREGVAT0Yld+nQmLMwQOZQULT1wD8mOoSnx0NSJb5CQ8JdY
X-Received: by 2002:a05:690c:6e0b:b0:7ff:19d6:74ee with SMTP id
 00721157ae682-81fd4c1e186mr57279427b3.33.1785593516164; Sat, 01 Aug 2026
 07:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785434373.git.milkory@outlook.com> <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
In-Reply-To: <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 1 Aug 2026 10:11:43 -0400
X-Gm-Features: AUfX_mzVPrYcO4vRECCIDiMsA0UZw6dhtJDjQlWPzZIYPkvX1yQD9jF19Hc0HRI
Message-ID: <CAM0EoMkEA2shJB9dBt_ZfDrZTzCZdvbggFNFdnAUz=gKkDcBQw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net/sched: reject overly deep qdisc hierarchies
To: Ren Wei <enjou1224z@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, 
	vega@nebusec.ai, milkory@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 9:42=E2=80=AFAM Ren Wei <enjou1224z@gmail.com> wrote=
:
>
> From: Zijie Huang <milkory@outlook.com>
>
> Deep qdisc hierarchies can lead to excessive recursion in qdisc tree
> walkers and exhaust the kernel stack. The existing loop check does not
> cover the create-and-graft path, so a hierarchy can still be extended by
> creating a new child qdisc below an already deep parent.
>
> Store the hierarchy depth in struct Qdisc and update it when qdiscs are
> grafted. Reject new child qdiscs once the parent is already at the maximu=
m
> allowed depth.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Zijie Huang <milkory@outlook.com>
> Signed-off-by: Ren Wei <enjou1224z@gmail.com>


This is the same patch i sent you except you changed the failure path
to send EBIG instead of ELOOP. Is there a reason?
And your feedback message is not as informative like what i had.
NL_SET_ERR_MSG(extack, "Qdisc hierarchy too deep (max 7)");
This way the user doesnt have to dig to find what the limit is.

Note: Your AI did not assist in this patch rather, I spent about 30
minutes looking closely using human knowledge.
I am not looking for credit but for your education going forward: if
someone invests their time reviewing your AI generated patches and
suggests a different path that you adopt, please add a suggested-by
tag crediting them.
Or don't bother sending any patches, just report the problem and
provide the Poc, I could have come up with that patch in about the
same time investment.

I am going to ack the series unless someone complains about EBIG vs
ELOOP in which case please fix the msg..

cheers,
jamal
> changes in v2:
>   - Store the qdisc hierarchy depth in struct Qdisc and update it from
>     qdisc_graft(), instead of walking the parent chain.
>   - Move the depth check to qdisc_graft() so it is applied at the actual
>     attach point.
>   - Add tdc tests for the maximum allowed depth and rejection above it.
>   - v1 Link: https://lore.kernel.org/all/cover.1785304107.git.milkory@out=
look.com/
>
>
>  include/net/sch_generic.h | 1 +
>  net/sched/sch_api.c       | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> index 45a1e8c78222..cbc248776511 100644
> --- a/include/net/sch_generic.h
> +++ b/include/net/sch_generic.h
> @@ -99,6 +99,7 @@ struct Qdisc {
>         struct hlist_node       hash;
>         u32                     handle;
>         u32                     parent;
> +       int                     depth;
>
>         struct netdev_queue     *dev_queue;
>
> diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
> index 668bcd60d183..65b35528d125 100644
> --- a/net/sched/sch_api.c
> +++ b/net/sched/sch_api.c
> @@ -1114,6 +1114,9 @@ static int qdisc_graft(struct net_device *dev, stru=
ct Qdisc *parent,
>                 unsigned int i, num_q, ingress;
>                 struct netdev_queue *dev_queue;
>
> +               if (new)
> +                       new->depth =3D 0;
> +
>                 ingress =3D 0;
>                 num_q =3D dev->num_tx_queues;
>                 if ((q && q->flags & TCQ_F_INGRESS) ||
> @@ -1211,9 +1214,15 @@ static int qdisc_graft(struct net_device *dev, str=
uct Qdisc *parent,
>                         NL_SET_ERR_MSG(extack, "STAB not supported on a n=
on root");
>                         return -EINVAL;
>                 }
> +               if (new && parent->depth >=3D 7) {
> +                       NL_SET_ERR_MSG(extack, "Qdisc hierarchy is too de=
ep");
> +                       return -E2BIG;
> +               }
>                 err =3D cops->graft(parent, cl, new, &old, extack);
>                 if (err)
>                         return err;
> +               if (new)
> +                       new->depth =3D parent->depth + 1;
>                 notify_and_destroy(net, skb, n, classid, old, new, extack=
);
>         }
>         return 0;
> --
> 2.47.2
>
