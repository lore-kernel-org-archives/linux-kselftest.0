Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264744766A9
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525298; cv=none; b=dYcSQ8ju4EUzZxS3qHJXeuiPquy/AZJcobBFymVXT+7Iv19+4A14ejfu98UpgQBpkgWEraVwv7VuEWHqfzV54p+CDZI3dHdXRrdxYBh/EhI04ynUyFXAqNo5+dHZxHFqdMdPrb/+19VI819FzGGtl+/2N191d6AGwyWoJonx/oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525298; c=relaxed/simple;
	bh=xioRLTaKtQKL260SUtxj34bS0YbzGsBJwB6PF9pf6rY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q7cN2Q9/g1X2pLaLix4LR+OBiBqBSrHR54Jr55oxhTLog5P/xW8QjTsL/st7v+mGDVdOqQMOJbdRo6xpmtdLY1xu4XMk0+RDgvTroTWg1n2NMHnZKRirYri0cHXg5QmVxeqzIwmBP8VAmL6DiyGVEYKxjY2u2Qmkh3P+JY0RIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHXMPxtq; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHXMPxtq"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5304310b3e0so10921621cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525295; x=1789130095; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=paqRFyHFvX+txrKAZySjILGu4egNb8auPfRKWSQjZAM=;
        b=VHXMPxtqBCDRzTjtUe6mD5PCszf6l5ot3oTcufOcoijf0K2UHvyVD86IN5YRDej8Y5
         y4m5DPxSr4fylCwFVPCSegEm+tboEM8iZdjx/7GGNCtaV8mskIktZf200nIB7FHhGdj+
         dFV2FQKLekWZ0ieXUc/ornS7EoJ2Xwne+9FZNBcaGDtUPDJNKJF0qk8Q2/usj2BI++6u
         6pNeawZ0+EwpIZRizNyDEJzk2Dg5X31pCavkF8CMTrNbkswdK7kwZzR7LC/1gfc3UfHk
         3uDCUvLfwyZ++0gB4rcO9jvXeSawxugywlkJBwnmudhtXr8Qi+PyfHraMilU38Oq+Wsp
         g0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525295; x=1789130095;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paqRFyHFvX+txrKAZySjILGu4egNb8auPfRKWSQjZAM=;
        b=rKZmEHmQYBvQx6MzvVvwpVFGrDLdhTOR6rO5FzNcIfYmWnFrGk74hJBorvAghw8UXN
         bAuXSSyYyt/ZTJLjoJfAcMb0c15mqYkPOIpHMtkb94yGH84aTMjAfOlrUV/M5HVSF+3t
         ITy5LmXy/oKy+O7JPrvKhZ5Z+HVe3cjFoL44J0XfBdfcGWEgCRnhc9VZCLn1bHx8hTj4
         VY9oepfMpUaM6sfrR6zSblg9fQQS5j3vi8+bdyzzWV7qngvq7QvgP9sIEZcCItm98pUO
         wjzThBCePtmgkUHHhwtDtj6jEVgKm61YkR90KpBZcR5SWBGl3Lc8LZb20RrAqlcTnMGs
         1rig==
X-Forwarded-Encrypted: i=1; AKwUvBw4nMDi0f0hACwLTfLLn0+slMNsG/wzBIb7dlQ9Xb0nAz1ItoGUptO+ZIawfoEMhs1nu/E2/zw8A5UL9Vt6A8A=@vger.kernel.org
X-Gm-Message-State: AFuF++kUzGfbjqx46bzwjq94sbn53Px3NUYPMP6gJcjD44RfE9Wxg2Dl
	CJktplh5K1TJMMkZHN/uTCVC43Chh4x66H+t8Yr1t6CV5oN6E+xGkLDx
X-Gm-Gg: AYBFou1ZnoQGTjsnOQMMxk2xO+gR1tdvs2EMvnvdKHXeb+lu09O56Hvtw7qPWVhKCgb
	t3fa3WiP77gLcHA2LJ7FcTb2sz4tg+aWEMPsXEe2/KyxRts9MwbObHNshN3GgSr6y9chvaAHHmU
	tTypq8A/e7aBIBtBFpt8bNWnu7E4h42eQ2cPpxluuEPlJB9TpQ7khLSKOxSVv51Kxrp0ggTFiFz
	Jl2zHYNe5HA4gNNyaYszWwrK6HWIS1/rcdX7ZECwHlrggbkPc4kQxILJoKa05Fg22MDBkD2rgV1
	/XK/kv6dzxmIGwN/1lK1WSTn6EYDJAwPW0bupmAqnR/Rf9Qwh2zM9Ith202ugs+V7XdTfyn480E
	bs+/bsj/QDDmgYBQ4uv6cI7M6h135iZ9Zj6VxoIWvY6oeXR4AQf4hm4gYmtljYwGNvSHdZqOzhs
	tEuPsx8fEnUvbH06ho8BNDzpsNOBDAMwYVL1lltugXSaUSoPzABabhgkVw2sSK5d98Zw==
X-Received: by 2002:a05:622a:50d:b0:530:42e5:f3a4 with SMTP id d75a77b69052e-53054a0db44mr57968521cf.45.1788525294879;
        Fri, 04 Sep 2026 05:34:54 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406976a5sm19170816d6.39.2026.09.04.05.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 08:34:52 -0400
Message-Id: <DL6JAWKEPFAP.3P0KFDGLBO3CX@gmail.com>
Cc: "Aleksandr Loktionov" <aleksandr.loktionov@intel.com>, "Alexei Lazar"
 <alazar@nvidia.com>, "Alexei Starovoitov" <ast@kernel.org>, "Allison
 Henderson" <allison.henderson@oracle.com>, "Antonio Quartulli"
 <antonio@openvpn.net>, "Anubhav Singh" <anubhavsinggh@google.com>, "Bobby
 Eshleman" <bobbyeshleman@meta.com>, "Boris Pismenny" <borisp@nvidia.com>,
 <bpf@vger.kernel.org>, "Carolina Jubran" <cjubran@nvidia.com>, "Chris Mi"
 <cmi@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "David
 Wei" <dw@davidwei.uk>, "Doruk Tan Ozturk" <doruk@0sec.ai>, "Dragos Tatulea"
 <dtatulea@nvidia.com>, "Gal Pressman" <gal@nvidia.com>, "Jacob Keller"
 <Jacob.e.keller@intel.com>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Jianbo Liu" <jianbol@nvidia.com>, "John Fastabend"
 <john.fastabend@gmail.com>, "Kees Cook" <kees@kernel.org>, "Lama Kayal"
 <lkayal@nvidia.com>, "Leon Romanovsky" <leon@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, "Patrisious Haddad"
 <phaddad@nvidia.com>, "Petr Machata" <petrm@nvidia.com>, "Raed Salem"
 <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>, "Richard
 Gobert" <richardbgobert@gmail.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Shuah Khan" <shuah@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simon Horman" <horms@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Stanislav Fomichev" <sdf.kernel@gmail.com>, "Willem de Bruijn"
 <willemb@google.com>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next V3 13/15] selftests: drv-net: gro: Extract
 shared helpers into gro_lib.py
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260903085215.3691657-1-tariqt@nvidia.com>
 <20260903085215.3691657-14-tariqt@nvidia.com>
In-Reply-To: <20260903085215.3691657-14-tariqt@nvidia.com>

On Thu Sep 3, 2026 at 4:52 AM EDT, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
>
> Bits and pieces of gro.py are needed by a second test file:
> - dmac resolution
> - the ethtool/sysfs feature dance
> - the HW GRO setup logic
> - the gro binary invocation
> - the retry loop
>
> Move them to gro_lib.py, installed via TEST_FILES (like psp_lib.py).
>
> hw/gro_hw.py keeps its own copies for now since they diverged.
>
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  tools/testing/selftests/drivers/net/Makefile  |   1 +
>  tools/testing/selftests/drivers/net/gro.py    | 200 ++----------------
>  .../testing/selftests/drivers/net/gro_lib.py  | 194 +++++++++++++++++
>  3 files changed, 217 insertions(+), 178 deletions(-)
>  create mode 100644 tools/testing/selftests/drivers/net/gro_lib.py
>

Conflicts with:
f225a7317c18 ("selftests: drv-net: split gro.py into one test per coalescin=
g mode")

I will take a look at the other patches now in case I can provide any
feedback before reposting.
