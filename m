Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431612;
	b=W28GLipMDdJUm+lYbiIoBxlq8+vyvq55JMzIbZ7pEA34IVDpxGKJo1L2pSFc6O060hID
	 JONmgRyYkaOiB9RXRWkb9fSBbfCrDom3goJWXPuz/vBP+cbP4s3JK98gKKVZ24+/MP6/F
	 MZS8zufZjLUY9YAwDP6/SmmTUiLsIV+hLWxwIKOSSjtYwAL+u97PektiOvm14bePn4TkP
	 SOrZ0EobHCctD+wWKhSHTk3InzyT6nb/mktGc/NJBj7qZ9QOEafBCoGAYSEVa6Cdb2aWl
	 0ucMLwdHgu1/MvMaSfEt2p6Jl7VEQDTGr31EHAlju2wxwqFmeHCIlMoZ2+othKdQ/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
	b=BMrA49IobETwaEITd6GOVXmoVqEAl1qLS4PTvb8OaLpmiGif/gAkKIpxnerzWDb/PxhB
	 bxyWNuslcIAA4q23AYrGthfOVmSmHPDls1vVAiGTvnt42KTZOrTeduLR0UJCsM3a10cUO
	 mxAeh0ljRvXsKXvOj/LeM7nC1zleRluyDsmvBT8xX5E+0eSJDZU4D0gHB5Jo7agMhAXwW
	 1nVQYA71GC+lA9EeefaEMDjt0WnREvVuampOPMpqCXDw4sedtHhBkVsdgp7kp0lM8zgDB
	 n5yxLAqFN868G9xKIH7qWlVlvjSWIFO5uZ9HwXR+PE6yhI43WQ6HusWAtbWHiPefuHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB3606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 21:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1822914137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794431611; x=1795036411; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=lOKYDDEaWLLmAvnd3LQM0bZSGO0Yo4zxUjhMLVMO/5rygvi8q8nMWDBolKHpWEnZ7I
         8IjHA09+4z1l6wWIPKTnsWvBSjL7gYDA3ctTpeAx6z9ZK337J6Uf5jjqFo6G3+wBdeY0
         dsYm8PuwGPaQ1azj/WiNEYekFt/Vbp40p4yon3qKCZ+EUmprRGmN0dxN7v8AxfFM1AFa
         62G1cV6MN0GEOuYVWOf4swqYwLcEmmyAgk9tMyz+iwa/jiUA1R6LHxWtIcgpkT9qAnD+
         ulFbXBewxvne7l4vQnGgmrXU4rw3c4cxc5H8SCq+zK1ahVJkKWQMH2F8eKWHTiT1Odli
         f7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431611; x=1795036411;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=WXQISWd2j9zrZSsc8Jrv9bympZgN1Xmrifr258zaMIpywjE1xgtcUlCKDlYm2PhPKr
         H48jzu9G/hjh6FRYCAfLOdkPo9USHEAnghQC7fUTPYVvoPtoIddDLK2ulfBxb+hHCjWt
         axkSgEhuwwWszOESukskckL4cudRp1clqSvp36yQ2fynE/PkrtLwZjYEi/eHqIoMtjzW
         qjRZEZYdlLmnUtTtTF0wDFgaAQesXt6eqoTCr0ZgGOCAwURip5F0jpd5oeKV0VJEIgvC
         ZZfodHe3uLCLwDm/wsBSJYE/iShlWvKYyYzC9TzM/aHOxS0O2ptH+5nqs82D8qlHv1Zw
         Lx1g==
X-Gm-Message-State: APuU4Z+AnTUen6+LYIMe4Ew8AZrRwKU2zkxA2BOhj2d+16WxFokqp6Mi
	EEWX9uEOxE4Sq8SsGTFfRcmWG3O00IEtvVhTHVtDIDLaIcpOcRmw6I6ZW1WEbETSHAU=
X-Gm-Gg: AYBFou3ssuFBuFQecXVfU+O4E8Ztddt1TPmbA+ot/5M1LdYgLbpZ6TYIDZcWqws5HX4
	+iFTwKzMC0KNYDHtnyQqa03CqvoJ/1y3w8f9oUOsziJxUOdfoFWIlFuPyC08fHF5De1e2MbKyez
	+ugBgbQ7WKg8pmiWSHPcG3JWLj6CqDf4wOBaCJqQNUfXRWGEAP6XHdX1p0hlfBGTZKuOG0Mnaic
	sXnIYnKB4I0malWTudtG6GVVf9lYeIPU7u+AmgOAg+7bhXFV9ysNYVd2edWU7SWpsn3Q9efZ/1k
	4vEkaY+8G9pXvtd0DMW0mJA0zrhGvFZ1H5QmW4H8+z6iYzf/ooj7MY4SUfXtLxq1JTpP7wARJ8c
	AufzakTE54D1t8ipZ7+1vSoW39YVO1dsETuYFl24F4jAOhxKNO3mcXlCfzKa1CanmfJOfqDeuk1
	p4VTdfAMpdhUaAaFTRnlXMaK94tZEKJO1dwKMas5IMubr/nAJMmi36lN7tr9S/cGire+GV+vy7o
	bs3AKr85EQQKGKMkrvn7KAmHlq8KfW3vLtcfQ2Dz89TOspz/t2lvuwnz191DS+vNJv+c9R5HBgA
	LgsfkVq2okDfuNyoIAbQqPlJJhuBLizXme0/Of50voaGbUpNlMD7t+Y4Ea/KrBuMJkOGO6WDEXJ
	y1UEhg6clXK27HmM+bCjZx2aPyHdv
X-Received: by 2002:a05:6102:2d0e:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d4fb2577edmr1659351137.11.1794431611247;
        Wed, 11 Nov 2026 13:13:31 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023838a9sm4907083137.7.2026.11.11.13.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:13:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:13:29 -0500
Message-Id: <DMSOX12JE1BL.33ASGRFO04NUM@soleen.com>
Subject: Re: [PATCH v5 5/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-6-pasha.tatashin@soleen.com>
 <179439592041.425130.6098227055493441109.b4-review@b4>
In-Reply-To: <179439592041.425130.6098227055493441109.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO sessions are frozen automatically only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
>> iterates through all outgoing sessions under global write locks and
>> freezes them serially during shutdown. On hosts running multiple
>> workloads that quiesce one by one ahead of kexec, userspace needs an
>> explicit per-session freeze point so each session can capture final file
>> state under its per-session mutex as soon as its workload pauses.
>>=20
>> Introduce LIVEUPDATE_SESSION_FREEZE on session FDs to freeze an outgoing
>> session early. The ioctl runs .freeze() across all preserved files in
>> the session and serializes their metadata. Once frozen, no additional
>> files can be added to the session, and subsequent freeze calls return
>> -EBUSY. Freeze is only valid on outgoing sessions and returns -EINVAL on
>> incoming ones.
>>=20
>> By default (flags =3D=3D 0), session lifetime remains bound to the sessi=
on
>> FD: the session stays frozen while the FD remains open, and closing the
>> session FD before reboot (for example, to abort the session or on
>> process exit/crash) unfreezes it via .unfreeze(), unpreserves its files,
>> and reclaims all resources. During kexec, already-frozen sessions skip
>> the late auto-freeze and are published into the outgoing KHO subtree.
>>=20
>> With LIVEUPDATE_SESSION_FREEZE_COMMIT set in
>> struct liveupdate_session_freeze.flags, the frozen session is committed:
>> it and its FLB dependencies are immediately inserted into the outgoing
>> KHO subtree via luo_session_publish_one(), and the session survives
>> close() with full ownership retained by LUO until reboot. Once
>> committed, closing the session FD (or another session failing to freeze
>> during reboot) never unfreezes or unpreserves the session, allowing
>> processes to hand off preserved state and exit prior to kexec.
>>=20
>> Update the uAPI and core LUO documentation to describe session freeze
>> and commit semantics.
>
> Please teach your LLM to use shorter paragraphs, focus on why and don't
> list every implementation detail, but only important ones.

The first paragraph explains exactly why; however, I agree that it needs=20
to be more concise. I will address your comments in v6. Thanks!

--=20
Pasha

