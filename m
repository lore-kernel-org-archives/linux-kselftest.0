Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683717;
	b=lsUq4NWRsi71adKttlRw1tiIYCdrO0FqC5/LEZjs0tU4VnSi6QsHAE4lslxaW77js+4j
	 ZkJb1X+bByrykojtTAvTH+yVEywLpitFil8QNToynrMj/GAfW8HUCOg/MQPIKSyUYtZEp
	 6UOYiqlpRRWnPARNh/HlLJG8yFaEV6eYOuO0FCLl03TM191lr0eqgNQ+4c4A7A6TNJXxM
	 o7oG1iETg+4J33awIPB4cNjxYh2tbEFYyIZDsG8NrexadlZdd/XJzpdBV4TWmKCy5CtEj
	 +LQtRs+NJBIG5P12LWvD0jg4f/vbL8TJJlTCnKzeFPbv6NDydKhgazum1xeHI9lJ6+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
	b=Iu2ML+gePpFCfuHT8XN/gkX/dwsx5MDShBWVsfqttK+ssemCJrsEln0ugkhxjrExzMfI
	 8zGpMmBOJrTldbmq6G4uJXx1sx9kU1n9ARahoseGwRhZ5P+MJGm2zLYW1HHqL2cpkl/zT
	 xAk0Dr654qTckql/nEGx51f4c5pQEISmSCQlTjrUUp3XJr0KuB1UQEWhVRLfoip0Er0MU
	 rIRmuXVUK8YnD4dhJx65F1ga/aN7xkA/mhXF19S/Ccy2KvyNYiqWdi3YvkScbfkoY2tT3
	 uhxHGye11A6zDx9O5AC8OSRGLJkWiDpaTk2S1AgIv/OxeBpYFet3f/wiaUOsB42ce5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABD606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ABD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso12641a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683715; cv=none;
        d=google.com; s=arc-20260327;
        b=RQuG4W4EZ3pd3oxe2lopVx2IY3ljsNl35dGFwKSygc1X44Qy07Zit14dtES8iIfh6h
         uSSSqhLXghVRbsVPPD4zSAUaE85mDMXkiiaTW0g1CM28LZhuosgR+k1egp1b7rKlrHNr
         CKidcAa1r1ci/8i+RBcYMEbgpTPXCgp+E+TGDVwSRhBI8rPelCmQNKZQNseeg35TI1Fg
         p/4ZT1J0AEHjeCas/1+Gva5eNJgWzfSSGmInd1jFtrIFh47fzibFuCXstQGOV1aq6e+Y
         0xF7kIDx6pmAbtsLwyVjv1dzwAfv/pTmIwTJr1Skino+hMD7E0ORbCY9sW6Czx9gMTpA
         1dtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        fh=EYajFL6K5Af6a5OaIzypWhOAbT3Y9jTA2ZmggKwqRC4=;
        b=IvJb69mzEgEg70kX6Cc+bniX08NPXR7/PNqNVDMm1fu5ohaharPH1dkf9Ka2nxizr8
         REtbAUJc/N1G9mLVXmYhzEFsNaQfwcOVWLJwYYVCMNzbTdtGFqE65ZWNxLhBZbMpI0Zx
         OcpV7WYFgpsunlvflz9FKz+NV4spk5r1HD25pD5pG2ys39he+2LWzhUprkV00+y7qEqy
         KXRnYTSTPN8wYbM4zdYQOqKGqYFkqFYN16Yk1afQRR9RVpHMU7Mo3ZC7ycfNEn1hMqF0
         gDPBKnQfpTXTLUSbvC//xP8lTH5QSQViDiXUvsRw6HN+kq2mYSQu2v1x25oIzzKv/v7J
         Ii/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792683715; x=1793288515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=ZE7yvOJAXvirByTnY1Vkt27fJmKkbeM5kXZgy9I6V8zc3FR5ZUPfim62uiMjPuAUOE
         6SPRwRldc/SKrFbkdXf4hRf1/c3O03pzePfvS0r71ba+enBaOiJAbZPPhMOVNCWBHZ/3
         4tVMMjYEO5ZMp0D2z+Ije+fZYXBCho9JUorRY966hydJ1JMEmhe1Q61r8qlwZrET6WFD
         +Vf85mxjx/J3HPmeM6cqVMjUUHo/y5qg8EXcl++6krOhRkzZ7rzWYua95XHaGKgRYIU5
         tGft8vrtYkKSv7UR7+/AfReVLt6gzEKNR/8xFbF0uvf+i2HNlZavauOVkq5m0veX/JjR
         FWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683715; x=1793288515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=mOy7bwzSiCPF4kJ6I3tQ4D4ROQ42429D7dzW/9ZG0HeBina9a2iJrfjA+TEWjZKOGH
         8nma7f0y5inURHlDbuVhhWNr625H4adIGkLn4w/jU4bvH08IjVq+kH62Kv5MLMWU6HIg
         9fXCSYdPo8DbaBBnTlWlxvulQ8tloZXvhTVvyvQvt2qFYDVdsh3nVcXU+c2SNHFjoph/
         sx7HJpPUWT4Wt77aXqu2oohzepF4aQWdLfhnvBp0d0chkmBOIFWw86i258ZlKRM669Sg
         X2v7OhV73IgjO4+TUqbDLaB0FtQs+49+X0QbKknYzmyAB1wJDQjstRoOA69Oswq161L/
         +Fpw==
X-Forwarded-Encrypted: i=1; AKwUvBx+/X8wiUQrNvwalBgRrqJVyeGmoHF91+mnAH3MQr6ahqBNEM/T4BXq8c6vaUZgQOyFxNEVxdFu3VNt9wF+8pI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaQmFwxcWh1tfYNiUSWjJ18KgNOdGHKCebRN7Ndv8H0jUo8O7R
	eB3TVqM5ffNPanV2npRydV44TQwV1Pawklf64ycVjwTTnKe5/6Hn9e7zVj3GSUCN1JU9ef6hvbn
	WYKEutPKUJ8MetGzITOQ80imTght+JyTw2/hrMNf8
X-Gm-Gg: AYBFou3FSd0SicW5pxPO4WuFvMX5V/9An6k9h+RKB3K66rJqC2juBiOOFjRDpML0CzA
	E8TOKaZpemgIBY4jfEJdmZcqGcXqDB2YCipsMjhpW8bbzvah0dbIaoMFwZns7qU+wqrrr6j6AZl
	nPCSjMfr2n365GvfSHilpFy1cwo7ZADWDWe0Gf6aRtTEM6YnwFwPAWZukVRt9QIlwJCrVbCRQKW
	tfpCeEDFmIdePijDK7dKLFACP1/Ss8VBLt3n5wBWrHD91HPTFLSnbJuXEm9aR6am3a9d3uxSf1x
	3IbXXhXu9yi+p5pR4z6nfGWghWxJlmhqjBjPzMjfAhwVlkmR5qIX77GUSpFsYRhysOH0lYMoZYo
	ssvZ6OoagOfw5nr/Mq6S87kTVSLATmfDuAPJy54qGoTX13nW0nhQK4JiYkNnex6tFxxOxw8gtKM
	nk5o50JVVQxg/0OA==
X-Received: by 2002:a05:6402:8d8:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b42037090amr51165a12.15.1792683714889; Thu, 22 Oct 2026
 08:41:54 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 22 Oct 2026 08:41:43 -0700
X-Gm-Features: AclHuK8XnKCgw_zM2po_QzMrph49LXNIEmHOTKG5LdhHg2Whq1BLNJdt4N18LfA
Message-ID: <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

I'm more than happy to help but I'm not sure what you have
specifically in mind. What I was going to do is put a comment/readme
in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
netdev simulator, used for testing; do not call out missing or
incomplete functionality as bugs." And then hope that the LLMs and
sashiko pick the directive. If not, I can tell patch submitters to
ignore sashiko code review bug findings in netdevsim. Is that
sufficient, or do you need something else from me?

And we can always revert the added devmem supprot in netdev sim if it
becomes an issue.

--=20
Thanks,
Mina
