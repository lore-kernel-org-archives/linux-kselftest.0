Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D1B3D47A6
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597913; cv=pass; b=kxY6SEHpOpf4HHFbthYmEhEnPOHtmte/enWF3uiPSFQDupoFPVQooLeaPFVkC7j1FlOk92TomUnx1IVNGgY4/jc0eZqd9nFZUAu8UqVHcTeVIUp2vPoxp256XKTA4SA9dIpKcYKkhSelR3iYRDRyshvKqft950dAr8pLwzYwXYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597913; c=relaxed/simple;
	bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDktlXB94cqOpR1DZJR3CJ6E/Ys1prJ3ETMH7N0jDvb/MY8IXsVqX3bXB6xN/A99RiCJEJSyoIAH50huDZ+ojOiNRqgR4FhaCHzxET6BeOEk4PbfFYXsbGRAUL4oPQlPWdMJ4ufGkrPoPmKp15WwH7UZHZjf9ubdYBO3r1ZjMQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggDTCvMc; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggDTCvMc"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a651f928d9so20725261fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 05:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597907; cv=none;
        d=google.com; s=arc-20260327;
        b=L/Bm6TyHfzMKOhdxKKoC7AGSKeNjZpmmZbDZxk0mNGAAmRwwh7jxkh6d8QmgKtu7sV
         sfAXUJXHoOHPOheZGmoRuizGiUK66PCr+ES60S84LVH7/snMbj9IQr5LrrXpc8mHBp7s
         8DRVlJHJNG88BJ9SUzkw//eDdUIc7WK7L1ZANcDUOzeOY/O0coBJg/pXfALxurLvQ4r+
         s8fXPEqoAD52+RTrGw8K4KIAEvoOHA94VotLArQylGGNyaCaa37RwZlFpkPsIkNFc8lg
         odQTKT2iePR010yFE1whe26oRy6JMPRBz8YpdRuevA1Dnd9424UA4euYlIP3Mmf2XWsC
         8xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        fh=4uget9PStKGNiAEbmtECo9B8BtgGoXqOMv8ZwbNf/zU=;
        b=ZkiIYk0Zk6TaIwzf6o9At2WHzd4tuPM0hFCyBWfDpqsgkakOyDAts32jybsgcW/v8o
         q5i8Kc4GPDQsXXMUw/JgANkxsPj6z/XDoy5AYQVhpvwxiPL/8Gfwkv8lHEu1F857o+Nx
         /+KI3fe0EPQV678DWcXjHkJoLZW+Psvy3NF6fc4fK1lu7kQM0d1R/Qr3HC2vM1mXzjA0
         BN/ebCH4xIDjShhgTRMQHG0CcI55qUP0E+xnkBJ+aG7N5rewrGgKjr+DqkaHEz2KXa47
         XvEmIKv/PXuuha0eV9HjnqlJfhX7fJEjyVTZyBKLndWasVrTM0Dm1aieYAuBHBdW05H5
         9IQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597907; x=1791202707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        b=ggDTCvMc87teue6kRgDl/HJL1j2olytfImFBsoanEZjkyKpv6D+/vJSmVsyFunRY3F
         s0KclcbvSlL9kYWOXJsTIL44QmD9JH9hUSSau2gNe+t/qCFLLz9HFWeC5AHAX+/74viY
         tjFf5WaqQx0F5Bab07+aXXojP97hOSAUKojgjm9NU9U/Dis7+8nd0j55WrmqMmsV6YlL
         Ichv+aYxbd+E7EAJhiU0S1so5GsGby9p7GD7Pp5sdBGgnajjYvvN9oikQzkuPJb2UDpL
         Eg5NXbBWk0mkXr6eXC7a+3W3suzeI+zAo80K1E3g5SMrXWiXlQZO68/ENDjNC0sVPbij
         uvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597907; x=1791202707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        b=IWTzxXXYfXQ0Q1qZIBb3ojYb9ST4tY65zURQeijUJc2QUxc091ke65c/SVJT4rd3oF
         T4/8GMcAT4iJwQdl7ltMCHwGX4dw9lnVUrCOaFaQSh1BtK8ZQSAevTFZBJJr7RDcI9lJ
         ecS+bQIKqJWLVaNPhSBWaaw6J8CSvVpZZ3NVG31DC17ZyWUfQa6pEwXIx71Dco93dluk
         w2RZgP/wKbRpfP+007db4t5WSmaAQqymB882O8/n1mdPMOV7p6YR9V5M1U74pT9walct
         FYyQdOmo8ryyVSRkxsWyj/cFpuKgJ+unRMuFfq+J+yx1Il1s3SwMaNQhUM7RFJue+NOH
         btNg==
X-Forwarded-Encrypted: i=1; AKwUvBwK16YBiMtCxaP1ZduYRYWTovsHJFMcrQ3ksWF6PMG+f7OA/0/4n40gdCWA947riP0WsYrbdxFQ9rJiuMt80gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKj9/9dnuJti6Bk7waI138RqXUrToj5L7qZ/r/vbaWQ8xG0A4N
	pbk2oRzdN1xt7nMh6Bz3uLqrgDvkJR5R75OCZilk4AZ9/y4MzR+Sk9WdDp9GFfcT29ZlWraC9SU
	3R6do4j0ciPYpnolljFAC1NIzqBkxTUM=
X-Gm-Gg: AYBFou2aLsvO8LgfbmIg3jkZ1PIdqCEeBNCCCmWhlY6LrtxozqQPdzBpZhnu4XLUvHX
	kLupoqfF92eOEsbi0KEHoELyNVhmBEjBDQkULVIUd0tTv0zQfSnrpGCshwBZ2aEIz6uWxdISn40
	cnAcHLtr9Al70ZATG2faOq4Tcrxq1dHBLt5ZNdATKzwjubS5VZWcXD4YnI6U9s7wZguS1c9aU55
	7Z8vOLu9+7ffxyXup6rbKRiJ13A/IDbwHyUYqirzF2CyGNy4SDpBBhmQws349vv/MdOySui/T4F
	8m1r6SA2JRQ+0cW6gZ3CSPTXJ22Pk9McUFMesMaA0O0zI9vT5XfDEPrklJkji//QM590gAMzzI5
	dlPJ7YpCPXCJDV0pDNsOWz0pg+il/l7G1ULDS40DJmg==
X-Received: by 2002:a05:651c:509:b0:3a1:51e6:fe5c with SMTP id
 38308e7fff4ca-3a63de1882fmr28825211fa.13.1790597906996; Mon, 28 Sep 2026
 05:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
In-Reply-To: <20260924011554.3494-1-sigefriedhyy@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 21:18:20 +0900
X-Gm-Features: AclHuK_Bo0nUb_h1v37TnseownwCulJ_aL1hcoodmB-NEy2KT06jfSsRCrSTQ4U
Message-ID: <CA+7S2vKCxcQMA_7E3iHMm79v_mz=z-eERZHzTquo9-HJqZQiuA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/5] rtnetlink: dump link-layer multicast addresses
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko's comments for v7 arrived late:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924011554.3494-1-sigefriedhyy%40gmail.com

I went through all of them. The only one I will take is the spec doc
wording in patch 4: the ifa-index filter and the zero header fields
are unconditional for AF_PACKET only, AF_INET and AF_INET6 apply them
with NETLINK_GET_STRICT_CHK. I will fix that in v9.

The others are either pre-existing, already discussed in earlier
versions, or not an issue.
