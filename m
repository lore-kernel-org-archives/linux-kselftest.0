Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4FA4582F3
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387349; cv=none; b=te2u4fIgJuPSAB1hG3QRquA6FwN4EBpwp9oBQPw6hhLlNvmpqZySmqlF7QPVYSd7n8823Ua+u+8vH2SBGbAURg+DU5r6K8iyn42/veBS3mrdA2iX4qQ3hUdaNkiZu3YFXO/6nPWAMqdrToeNWlItXLtM8oNUXwrC+bZhEUT7dR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387349; c=relaxed/simple;
	bh=1vVk9up/G2ajHGDqr8u30o/Uk+mk5o7CJcF5GrrolKc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=DOGXoOHXZJ0w26eTmFSP/ncaCKdjWB5/mLrq9q4UZ5xqf3q2yHNSWm7Y0bHHHUyv2StGbr+wVlCzfod4RMSVZkFb/iVoSLCiBvLgkDcFveSWb3Nur1q4EWUNohhSdebdzyTfxNxzruG+vVDRYKU4KNk1Vpf12ln5z5X5JbYVeO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcWDrjje; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcWDrjje"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90e9ad1a373so37196416d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387345; x=1789992145; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=92yvnPgPUDO5sDDMqgr5502oviz33EW1DDzzaNdq+gI=;
        b=fcWDrjjeULGty3AVUl4tbuLbWKWXyym7xSf/hK3Ku6RwiznK/tLel/AZ79snHoMzwd
         +YlIPyf3R4x0TUNkZq0TMJlVL06SNZRtf0PWElGHOooZ9mS08jfsHMqqB62uyW2IYRtN
         YfaqiC385HP8fkQPTBWIBRmVYMcpt5im7gocxS296bjbJmBzg4H2SAKw0RFjPOPtbh5e
         zqqtokKh2QuutD2iEuX6J8BQTGZ4GMeiLcyzUfy8pSFACInxf7Z6qnM6GWGgwRvtidQA
         npY2ifiqMSNqnK3PeN3gPg2st5N/hfp5esjKHVD5sZYRePB/ujEh0BOVbWDVED4W4PKf
         EgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387345; x=1789992145;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92yvnPgPUDO5sDDMqgr5502oviz33EW1DDzzaNdq+gI=;
        b=LyLB6Qn5iU4bnvqYH+xQtqdiQhDAmE1cQo8qzoEsFf0XrcJ7/5l9XIiRn/3t+m//fG
         H0N9KzWKtPXiWLn0xGm53LOtsMpE644SWkm2IBpIvxEyYi0lir9nlOX2GbOz70QTTUpk
         CiQAq8o+gS5vCoKr1PwoYwGFaQeC1fu33niQTIAaaA+AOS26bvG+iRxUFigYq0ysl678
         xChGC2L4LeBsuFsszIZ+dPjG+L/60W9ARLOBFXjvptmxfGZVSzdYlNw2uBA0rgp8DGUQ
         J7Kok5PA9kMeoagnkxK5F8H8WJAudnZ9EeiHAbLe8cOZhLVgKmh+IQPWSjHsdd2t8cTr
         D9Qg==
X-Forwarded-Encrypted: i=1; AKwUvByqbFVZWF0jk28+Vo+GttgLJxtJDEPJm/cQMYwX/VrCTicRtMos3wsjywTSZEtFrA0Rt9qbm1zjcs1Ef+lX4kQ=@vger.kernel.org
X-Gm-Message-State: AFuF++knXsuY/XRVCHOOLOB8TaXBfIpY0+6TONR94Rjolgrr89whaDYJ
	FpvLMf5IJtKXyFvjVTTxs4R2FM+Ed4E95x8iIHfMp3ZsmJEr/BIfFXYE
X-Gm-Gg: AYBFou0FjY06aNpYZR373Yx/nwcdkABmzbRJBRXim2fsRCUgLVMlYEzuC0glZfpiRCY
	kv2NheLHy4gNk3oyaq4UiubJMHQiJO52O9Kc7mcqa2ftnyKZtB6oFC2vXt2l0ndlhI3Qt6Rw4MI
	nxNo4imR4UeSttfJygBxbzc43rnDY5J62I+No93hbbQhv3uTiUovVKz2oaqx8jNs6DVetidqfu+
	uYYFnjCCTHrBAGLjiP79C0oOmbRtsFMq+8hOT9lNtHlsmVSdTvFHAtHniqcqqjU50Wk/ISYhcBq
	lmee00fAIcGLgWOw6hN9M7CiMdevwcLWFqsIvkd46k1gvEAg2DbyjgS08TcK0kSfG3Pc55jxO4/
	oMYHl0ZFp8XW34cW5sqDiRUW4kJxOocJAg6ZYSuDdBXfworxIg9yYjU6QpkQGL/zQjaHxeRMJ9b
	fV3NCO2bZ+CO7CyWgwpivPaOMAy4Y8Rk1Dply9a540jId2BvmVz6TaloAZpNogWcq0jmSDTAzWy
	kEo
X-Received: by 2002:a05:620a:2954:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a18796e7bmr659611285a.39.1789387345406;
        Mon, 14 Sep 2026 05:02:25 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a0cfa2299sm556890485a.18.2026.09.14.05.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:02:23 -0400
Message-Id: <DLF0VHGQ0BW3.V17URE6WVGN4@gmail.com>
Subject: Re: [PATCH net-next 2/6] psp: don't report the main netdevice's
 ifindex to associated namespaces
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-3-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-3-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> PSP device is visible in a netns if any of the devices (eg. netkit)
> are associated with that PSP device. In the main netns we show
> all the associated netdevs + their netns id. In the "container"
> netns we show only the local devices. But we were listing the main
> netdev in all cases, even though it's meaningless outside of
> the main netns.
>
> Report ifindex only in the main netdevice's namespace. Absence is
> already unambiguous, the by-association flag is set exactly in the
> messages which no longer carry the ifindex.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/netlink/specs/psp.yaml | 2 ++
>  net/psp/psp_nl.c                     | 7 +++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink=
/specs/psp.yaml
> index e9c2ee7e28e0..f3266763c325 100644
> --- a/Documentation/netlink/specs/psp.yaml
> +++ b/Documentation/netlink/specs/psp.yaml
> @@ -38,6 +38,8 @@ name: psp
>          doc: |
>            ifindex of the main netdevice linked to the PSP device,
>            or the ifindex to associate with the PSP device.
> +          Only reported to the network namespace the main netdevice
> +          lives in, an ifindex has no meaning outside of it.
>          type: u32
>        -
>          name: psp-versions-cap
> diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
> index f91665748dde..b57366b5e032 100644
> --- a/net/psp/psp_nl.c
> +++ b/net/psp/psp_nl.c
> @@ -294,13 +294,16 @@ psp_nl_dev_fill(struct psp_dev *psd, struct sk_buff=
 *rsp,
>  		return -EMSGSIZE;
> =20
>  	if (nla_put_u32(rsp, PSP_A_DEV_ID, psd->id) ||
> -	    nla_put_u32(rsp, PSP_A_DEV_IFINDEX, psd->main_netdev->ifindex) ||
>  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_CAP, psd->caps->versions) |=
|
>  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_ENA, psd->config.versions))
>  		goto err_cancel_msg;
> =20
>  	if (cur_net =3D=3D dev_net(psd->main_netdev)) {
> -		/* Primary device - dump assoc list */
> +		/* Primary device - report the netdev, dump assoc list. */
> +		if (nla_put_u32(rsp, PSP_A_DEV_IFINDEX,
> +				psd->main_netdev->ifindex))
> +			goto err_cancel_msg;
> +
>  		err =3D psp_nl_fill_assoc_dev_list(psd, rsp, cur_net, NULL);
>  		if (err)
>  			goto err_cancel_msg;

As an aside, this got me looking at psp_nl_fill_assoc_dev_list() again.
The PSP_A_ASSOC_DEV_INFO_NSID handling there looks a bit buggy. Caller
sees -1 when the assoc dev is in their namespace, unless they are in the
psp_dev's main_netdev's netns. In that case, a self referential nsid is
allocated with peernet2id_alloc(). It probably would have made more
sense to just only include PSP_A_ASSOC_DEV_INFO_NSID if !net_eq(cur_net,
dev_net_ns). I don't suppose it makes any real bugs reachable.

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
