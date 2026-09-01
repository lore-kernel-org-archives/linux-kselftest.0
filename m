Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1679A384228
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305922; cv=none; b=TGmWttCrt2W7KwHmj27T/OwN3KH76oSWB0JHi8sb2PBRDcYsLpLqwd/wpY6LY8Xw8CbZoiSCv/z/6/lGuGQporoV21u8NZmaSfJdyuqRxL9XgzNnPECrJEMIiOykTMRVc5Ji4UseC02tIcWh0jZQURPlpn0te8BGy54X7ATqn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305922; c=relaxed/simple;
	bh=cGvE5vL7ZOo0oM5hRftmWcAR6gasWX104/vhHVUE1J8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L/y8q5TYYMy6qtfL4/GNDHOp2gdQunbPvAXsGHD94LTk/Ibt2CkXjdDMHyWwU2E5gE4GXTdG+eBWi9fOVQFlXVXRhm+KjrhpOiaYv5siGb+aKWcfqIlQbNLoQ9uJzbykE9KY2vDVsFz3aCZozoqkAZixQFQjuecrE8gASrMK0Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMnTlg4C; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMnTlg4C"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5218927884fso6073171cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788305920; x=1788910720; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0zXX73cnLrFK6+woSudd179mzXIH5/+9TezRmmSs5A=;
        b=fMnTlg4CbD9MNGLJMEDJnnJhqDWowyiTSwts85z7+sb4xiaOX8/8hCOBlmI/d/CmC6
         Q1MUfg+JFyZEW4SnkDCUQSuc0G3lhyM0TBTe0SfBubWw3vrRmoKOIblgvulLJdF/ISZt
         nCJp20rQrPscLWntMyWG/po5wT6sVGANHrvRQDkGzTy/ai/doUClLH+bOe8RU9Gy/l34
         Yi+9PEfPQN1XGIyfspfM9dmPgEC7kNPokOzsSD8ZZfw5YwAuNwYFOCIXhe3LWAFoZUWe
         nsZ5qK3bvVvEyLTwds+rMQwPwfkwtbiSrqyHoNPHECxc70TOvnTw5ASh6xQObmChI8KK
         WXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788305920; x=1788910720;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0zXX73cnLrFK6+woSudd179mzXIH5/+9TezRmmSs5A=;
        b=hfXjo3cQBvVZ4TtSOLdJkiBB3xrWy9Up9GKkerQ3DAGZWrn44YADyBMrSKCUltz7o4
         kpzcjAUP7M/TQbQw4tdrL8BYsbqgFfWNou4mWBhTkRRXIql8FBul2DPLLMlnfyAxY8AJ
         Ns8/st3ydZk0r01SrMYN5l4w3MBv5K1ijhreLgd4o4kJEXXQ6H4gshCGBWsK72TtNRqF
         o+GRnlnH0CGLiTelHWxmzbbY4zBX6heGvp0dDH4oKQ1p4BoEP44E4j9cjhICP38WZCUl
         vWkRWxUmxjKJ5QGUP2umIfrgmECqovha52Fl/v3KMS3hOqhnwRw2dwwu3r8YpOP6lSaH
         Ul9g==
X-Forwarded-Encrypted: i=1; AHgh+Rpno22BJlu+HRF3Tu9oC1Hli1nAfwZ9fDc5Ffi+QxTLPH6hbaHLdNbS0Jwgq2nNKavGucqOu9CrpI3f2vXxFEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lBuoeH2Jn+/8GUjA06/NDNpgJTfpy/7AoYEwf0Wd87TaY0wx/k
	0PxWA1ZvkvqNwikK+y7OfviNe3NH4c8GNFiL/B/x5l6yhyWE7RdxBHl/
X-Gm-Gg: AR+sD12tGrdaZJKW1LE1WyJQgNNHFUXrNiwoc2jfg1K3MeTG4i/L6Eax8yDHrQBTdVS
	R7oewZe7jnlVvu9jYVDiqPdoQgIRlB5eU9HAyY/ykqASp+S6M/3ECK4+vA547KrBRrqE572xkKN
	nqCI0iIvBFDQ+K1LM08nFuNnXcLDxfobdQRHZ//Osx9LRhDExS8N2skz6SFDj/KbEnQcAHgsN2f
	rDEVQqPyRJCsayEqsUZG6uBud/iSN2rTKoDGIZi2q6ETnRgJAE48ot/bMPTJX2SirpcXu2Iib6d
	cF2AoQeSrB8UmaMo0I/e4q22361ud6W2zGVip+nw2CkkmVmkji0TOfuP+VCj8tgIyxiUiaCnYf6
	AFAgW0ldZngtEHr57dKCqJGUvu4ZzMjwpXuY33DOTN1x9uojwGK7RnYoR+Jgzkm17vRcKSYtTaB
	DqOf0RLjGlhbwYAVcek69Pd2LNkOn8X1rEDdI6HJkWaqVmZvDBLVnpuLNjWzSbiuAtgSM=
X-Received: by 2002:a05:622a:22aa:b0:52e:4831:cdc4 with SMTP id d75a77b69052e-53036b93345mr8598201cf.7.1788305919934;
        Tue, 01 Sep 2026 16:38:39 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5303323faddsm7251121cf.25.2026.09.01.16.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 16:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 19:38:38 -0400
Message-Id: <DL4DJHDX94CE.2NZOCOIS69901@gmail.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v1 1/2] netdevsim: add TLS device offload
 emulation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260901154914.11637-1-jiayuan.chen@linux.dev>
 <20260901154914.11637-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260901154914.11637-2-jiayuan.chen@linux.dev>

On Tue Sep 1, 2026 at 11:48 AM EDT, Jiayuan Chen wrote:
> @@ -1068,6 +1070,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns=
)
> =20
>  	nsim_macsec_init(ns);
>  	nsim_ipsec_init(ns);
> +	nsim_tls_init(ns);
> =20
>  	err =3D register_netdevice(ns->netdev);
>  	if (err)
> @@ -1095,6 +1098,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns=
)
>  	RCU_INIT_POINTER(ns->peer, NULL);
>  	unregister_netdevice(ns->netdev);
>  err_ipsec_teardown:
> +	nsim_tls_teardown(ns);

nit: label name drifts a bit with this inserted here.

>  	nsim_ipsec_teardown(ns);
>  	nsim_macsec_teardown(ns);
>  	nsim_bpf_uninit(ns);
