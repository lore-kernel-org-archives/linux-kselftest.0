Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5C3F0756
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006780; cv=pass; b=QKxuVyvzMf10aJJn9U8sNFTWZVBl5usS5i1UR3dAvfhnGjI9lwW7msWrrvVjWG0aT8HWnmIffxkRDs8P3wJ1LeBLCUoav0lSKCxna7AqVWXHyJPsKGLpAmEtUPbKaTA5wvzSy7Sr/pUQsPtG0rWdCEbcyYkRN/RrCxRNxZe5HD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006780; c=relaxed/simple;
	bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYleuApRFfwB/iR/RlmpVvbp9GnXqsDl1jl15N0jh7WoulHl1GMDbta4vpQp3sXMPjdMIR8dxR0XIhmmdMWPGOS8Y8OiDUigXKmlTmhvYvi7bWOjIRUd6C+i/o0zSraYmW6N1c4hireCgkpUj5AlBvkuB7ewGw674zBbKYvqfVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d28bk7Ss; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d28bk7Ss"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5029aa94f28so7962451cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 06:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769006777; cv=none;
        d=google.com; s=arc-20240605;
        b=Speqea+N4tgC3ODfmttYfy5msB52UgXlV5flUFNEjv8UuSKWxalc2psw6LblL2Ql3x
         NqiFeBFmz79F5O/XedLq8qCcsORd0rRin5M10K6Tq3j64LpPfr9rSlSQlwppla93Z+NI
         EO11MeRO+N3OwT7HfQJc5ZMrM8E5XzFaYBPyRUHr1sgUdLjy22TZJ5mh/QB2NpUalnTo
         GJp+oTAWC9iTy8k2r1AMBZJsb3SkRe3M0RgAu9dt7NXsrqjZ7HLaKXUvVHZ3l1l+lfo6
         VkK6ypnNzD5D5Y7VkBsJ4gCSXAmC9LmbSKXIkdR7jrSxbmRrSwUiGXIDTN6QEbxIGfU7
         t/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        fh=aRDY5lb5ef1ToA6suJxnYZzy0WQT8PZbMgLuwZ7wFgw=;
        b=anhL++f7sOf3mymBfOCGapR2dWJwAmHszJ8WZxqC3KQwWadi3sTMQbirwJHXdV5fem
         e7t05yMP1ibX5Bh95tU/+B6Lffmlxv6WvTO6Tl2mef0hTEg4+TSav26LhkInstLCQwIN
         ocxeNP6EPMExTdoSY26MtCKgRemdXx5jIn73xmpjUaIdVPMx+SJeNZuxy6QcO5Uk70nV
         XbbLYUOZDvPgiH8eI3QJx+8YVguwJeMmeVvKigBG4RHxWw+j4tjfj8vMeIgm0E/ASmnx
         PyZRYzRv5CaN7Hy4dYAZoMP17QE+m21GeK4XLdIp/Yd5YYfW7Njyev6UkyBC4zXbJYh0
         9JIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769006777; x=1769611577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        b=d28bk7SslA/sFce7HOZK4TTDYBBQeo+OKAEYlM0vlhVpL65gsBLhCO6KPHMsWlw8Wk
         mosONMTxIPvFSicjHS9iTtQM4OuXCGSSByMIwvfm/jqbC1xRIweRK0J9DZZDDVZc7KOi
         EmcVdXOBxQD8DhtHknYdgtk9PMM+uk9lBU2xqL/xI0JVgR5ps/6oOTaoGf7VNMllYt+j
         O1xWMrpwCI2RrozBPlabGr/c3iw/PgxYCxQCpooAepiS/GQ1d4WfMn6pbMfVgsRNLVTV
         A4swtaueVj0Qi9NeCwr5GoGrM1LvcAoPI4J/2ZlREuJxFyXsDmEhmdKgH7eXfQE6oemV
         sd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006777; x=1769611577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        b=Itu97jjjTnenGDxPXtJX+lg2P9NJ9VHajBO8Uts8yjmi9UQwQbjcY2wsSiYtYkSXYW
         DBjfHUBkuSmCZ7JFqEJPtALXJv72DIrY7FeIQ1ou9GpIMk/SwEWcPw20V4Q/pkdhTt0M
         ukltx5eO31nEKSvgW/gbW8RBcnzdK1C0kit237haljJwvPVxewtwdpGAc/E6kEzC/HNu
         0lVjUfqTs3qeRUg2TrWqG4Oc9Rw9gjtJzA5LXVmJjeR08e80g8ByT2HZczi+K7XAI7hB
         LPD02FCS/Xcw96CPaLFBskj4xrWgl4Xhf9xVMpMmsdFC7qrLb75IPwe/mYKKtYesMFXA
         9LpA==
X-Forwarded-Encrypted: i=1; AJvYcCVsupNFPuwMXXqWqzbMVGZsLAsW3Vh7gkGxjl9/NxD66i7u+EY3PmIbjyrjzAq6u0b+G5LqYxPvKhocY2BeBGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kvPmu5+liuyUZ6nYMn8Ry34MfuM0Sjt3EF/HPNZO2hF0usRB
	oNJm0ncep9oF7Y95ee6AmO6+2ozpHepK3fz7N6lATvc3pwo1GakTCE22Qkga07ZhK/f2N1EcZlL
	d4fZTRRc14ZDCT4W+CGSFJSLWTnAK4wLewsLhCY8D
X-Gm-Gg: AZuq6aL3VlFKxFdQB9A/Ls5zBiBJN5vJ/XWB7SKNcRaOfqrqku/nm7qKIQeSbiS5GUG
	5SOh2yuj1TaFavZKExTmpmuzD4WnDitvYXu4v6x4lv21gAO555zqo2CyEpxnuw0MIY1t2Kocy2p
	zghY34uVI8vsuc1XIC353KYG9CYic4Xq6RxnrsdiS1+/Xx32i2dNUgigwKjzYy3I3eah/PTGhJp
	CpysYYluGKSuCIK5zsbV9cN8BdEJSahBokVc0fEMNXyp+C9MDbPoVkj7n1cmHGz7blAhAE=
X-Received: by 2002:a05:622a:19a0:b0:4f1:aa52:878 with SMTP id
 d75a77b69052e-502a153b0d8mr241578331cf.9.1769006776632; Wed, 21 Jan 2026
 06:46:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-12-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-12-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:46:05 +0100
X-Gm-Features: AZwV_QhmibL0dUAXLsxhUO5inqdEXXTvbJ-_96RoQaEHVZjV79Y0et9q-_yyNck
Message-ID: <CANn89iJ7O5+xjoHHy1RZzLMfTBke7nmh+YhHCJsdpyx=-ewbOw@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 11/15] tcp: accecn: fallback outgoing half
 link to non-AccECN
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> According to Section 3.2.2.1 of AccECN spec (RFC9768), if the Server
> is in AccECN mode and in SYN-RCVD state, and if it receives a value of
> zero on a pure ACK with SYN=3D0 and no SACK blocks, for the rest of the
> connection the Server MUST NOT set ECT on outgoing packets and MUST
> NOT respond to AccECN feedback. Nonetheless, as a Data Receiver it
> MUST NOT disable AccECN feedback.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
