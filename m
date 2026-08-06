Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0241A90B
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050009; cv=pass; b=o3IScR7rqWYdy2qonPP2oLwNeF4JG3scyPbU8BP6km8mKyXWXo5jTaqjVvQoJ/RTRDG3q/V0R04V+jHXDmvBSTqWU9SP1USKb0ZbMmmEAksL5f76RQU0eKVptP8LMS4Y06Msqm4eWzE6Q5vuA+uJ//lW7P8IFVc1hAy+Tz/wss4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050009; c=relaxed/simple;
	bh=nr3TTEjqFzRrrWN+cPXVFVEBNjpzQCKp/KHwCXYQPIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9o+ubv+pLniF37Q0Eb2N6a737ppbwsoqvVxA0PuC5DIh4TN4qMj9gN4RSgcIqhnWy//5or5ducMJjg6P5vpfymAJIAMwBR2YCNuwMCl1pj4pdrrnzXWxSem4WwV2DnKDYf1FEfPGB9KV2ff82nVcwobFn8oFJZ1sJffgwu45Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vj2FwKGp; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vj2FwKGp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacef7d299so9055ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 14:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786050006; cv=none;
        d=google.com; s=arc-20260327;
        b=poxiwjFtwsreaP7y/zb2Y5/jntAonQh6VrezgH3Etvu3SLHhzYIiL1VIZnf2LdqMdl
         aB26hf0R83ofBJjvka9Sdo+F58nD7ii1teVGZvhlZxv9Uq2NOGhvCsz9sVdP+5YXXwoF
         TFJMcOlcUyD3C0f3DO3RaaaiE0lInriQEn9YQDR0vLFiTudEgSQpf9O+/19cmASoUqwC
         bEDLjrfXHXt1Bnu7kf82amWn9oaB4y/HVxCg778nRAIKU9imtBw4FaLBKH0nzhegYiG4
         cfjUlWCt3KSU0jPMwq2frK8qBTfMvOj/qGi0fqSgALl2QSi4FFdEKIHMOk9YRw1hCXfe
         9YyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nr3TTEjqFzRrrWN+cPXVFVEBNjpzQCKp/KHwCXYQPIA=;
        fh=MdWPFJshmrvObvffgdEVyZkwrZlOa22KrBpIMl0y09s=;
        b=lzqSIzKu1ddB8tULFm6jd5hcrn8wAqVQAPwj79Lcf9jH6coZOWRsXhFX3m9qmwr4CF
         XihZ3DOusIHO0V9qmGVz9P8/5IBUYuSaRSu61l7z0vZAJ97Sx6ZFZXa56vgmFtOhx/+T
         vDB+Fm/77mRzc+YVMsmPm62jZa3fRmgBve96Jb9HiD13xQn7zj4PX1JzhpCAxGbk+QRe
         fcb9zg1gSOYr3Zza/atMjqx9dbleBKWIwEP073Buz8tCpQ/oskXFd1ZRKpY1kskaRul3
         FVj1u8pHICItvpxjoLfablQDIDhYqCuIxZ/oAaSJ/NzOidDQYN8hpvCBh2YEHb2vI9x/
         z0uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786050006; x=1786654806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nr3TTEjqFzRrrWN+cPXVFVEBNjpzQCKp/KHwCXYQPIA=;
        b=Vj2FwKGp8ZKBIWjrhVRAVwpi/Vx2Q3XKa+aIRmF7TvG6MRtoNLQ09SUfKvzEzRQ0zy
         K2I9LSCwMu+62/lyj7GnrDRE2KFC4ZJDl8az5TB2Ig6nI7BPviKG8t94X9uuD/jsqSs8
         H1Nc32FF/SVb3Zp/eOvH8MNOM1F7d3MOuID72EH55rQCzx/7u7TG0uNOhD7oJXwTHT9o
         2PYZPIcIXAvCKPqnGUF14CtQCzln078MyceAnuqc48A9JimbCEc5L/cMOERWPIbUI5/u
         ICs8rgPAGmoN18xjZ0bxqPNeYkoN8EQVnuBkQLRfxLPTLlExVZ83ZhhNMWehi0hbdkJV
         2GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786050006; x=1786654806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr3TTEjqFzRrrWN+cPXVFVEBNjpzQCKp/KHwCXYQPIA=;
        b=ILYkbW4rj+NEX70KpJVSsJ116rQsEcGqhol2Da+h6B7OGwvFvchDf3Y7qmfXc6kjVw
         fyDP097BQNqPLxrocLQUm4cNTEyXRJankbkgFeGaNcn4lnqsoMvwMU+fOmCFsUQJZG5E
         VaBf+dTGedBh+u+rJ9sq0wWwEtdcB33cAnr6TnsaLHDe3FZX4paro6zq6UezrAIy3Qg9
         CdaAJLsQxDLcfaCCnTBe/leN/6Xuk81bwXmVes1FxSxQxE8buag9/WWGH9gbKSzggSkc
         bnhavraSajxWutQr/LSaK0+r27kafDzu/B5Srda630teMfYjidfb6Q5ZY/pygNdE/UwU
         5IEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrllc6tt+FYi8a5GqAe0TZRDfvUWTUt3llqWb8EzsewehZQDJl7wZpX4THS6dn1Vi5V+TdMZEqGz+2uW/0n3cs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+BNUS6tqLDLkT+5uvsXZ6nYNY9nU1jebSsXEuTbbGYReWVDFr
	mRLJyVCbiiSyPh56I23oY/WJ6d6V4zQHyvIKKZwdeWa+lpyX3VZrjKUhE72ZaMNdvvCW6FQJjZA
	tgXiOzbqIsX1Q/odhqzponRRkTzVIJDORx5PVDHMQ
X-Gm-Gg: AR+sD11mnMjNgocIvluHz5vr+bRD9TzcFC8/n85VBARErqcr4lYV95w4UDusOJzh0q+
	F+jpEFKfXEJCEqewsjE5hSzX/ZIPJRavKWZ5rooyGOb5huoXKMYbHKNfqET2p/3yobaWrUEbmyd
	1wloVZYm77GIUV8A9Mlz82iUtuaM2S7TxXYrwL/RLtrR6SxSrluNRs6oZsQDG0jqqLwXsH5yu4t
	IVYYfbHMETF6rOrkpkjsJcuQbpG9/7+NY2a7C1gJU3vM3xGIf89gyJwWEsVH2/fKTe/5AklvFrJ
	yhrhkMM4YpDklShS4YnPq6qPYNto5ze0PJTEJlWTvNtHzUk64Df5oRT16jT8AWzQ6k0CtMDjevx
	tTFZxFgXd/Q==
X-Received: by 2002:a17:902:d4c1:b0:2ca:e0ff:eaa0 with SMTP id
 d9443c01a7336-2d12024e012mr1715455ad.2.1786050005384; Thu, 06 Aug 2026
 14:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com>
 <20260806121631.13175f7e@kernel.org> <CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
 <20260806133435.38c34e31@kernel.org>
In-Reply-To: <20260806133435.38c34e31@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Aug 2026 13:59:53 -0700
X-Gm-Features: AUfX_mwfch4NDc4wFCxGKUTkco01WXZ6MdhsrQ5uDE3VIJlaVnA_HqAXXxdO6so
Message-ID: <CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:34=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 6 Aug 2026 13:05:49 -0700 Mina Almasry wrote:
> > Yes the test fails, but it gets past the flow steering configuration pr=
oblem.
> >
> > And in the code, the change looks correct to me. If flow_steer is
> > False, then we don't pass the -c arg to ncdevmem. ncdevmem is written
> > so that if -c is not set, 5-tuple flow steering is not possible (the
> > client side port is random), so it falls back to 3-tuple flow
> > steering, which doesn't work on GVE or any other driver that supports
> > only 5-tuple flow steering.
> >
> > run_rx (devmem.check_rx test case) doesn't have this problem because
> > it does `flow_steer=3Dnot hasattr(cfg, 'netns')`, but run_rx_hds has
> > this problem because it forgets to override flow_steer at all. This
> > patch fixes that.
> >
> > To be honest while looking at this there were a few weird things. Like
> > I'm not sure why the python arg is named `flow_steer` (it likely
> > should be 5_tuple_flow_steer), and why flow_steer setting is tied to
> > hasattr(cfg, 'netns'), it should be a proprety of the driver you're
> > runing on (unless all in-netns drivers will support 3-tuple flow
> > steering).
>
> Could we clean this up and add explicit test cases for inserting
> specific rule types? We want the one-sided-tuple format at Meta,
> falling back silently would be a loss of signal.

Do you mean forking all the test cases so that we have
check_rx_3_tuple and check_rx_5_tuple, etc? Won't that be annoying in
the future if every test case needs to be duplicated twice? And
potentially again if there is another deviation in driver config
support specifics?

The current approach is that yes we have 1 set of test cases, and
they're supposed to auto-detect if 3-tuple or 5-tuple is supported and
fallback silently to what the driver supports. check_rx and check_tx
currently work this way. I occasionally find breakages on 5-tuple
setups because they're less common and fix them, like this one[1].

To be clear this change is not intended to break 3-tuple. It's just
porting the bit that makes check_rx work for check_rx_hds. Whoever
added run_rx_hds probably did not have access to a 5-tuple-only driver
and missed this needed change.

[1] https://lore.kernel.org/netdev/aDXbNuCPNKRYYVRk@mini-arch/

--=20
Thanks,
Mina
