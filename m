Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F423E342
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323556; cv=pass; b=fNp4s4DkrSnHTct00mtQbJUPf4tc0tFM48wKkvu4URCYbYqbcLMgMK6F4f1zJ2Pnx+aoas6u+Tyr0MuaIUwAHzcj3Vbhy8JG/obaBMwBT1iC5bPdN2qsZ/ARmia6UmNOxtt20R8+MdzE2Yy8G9NJT1iJk1i/P0g03gA+cTGIpRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323556; c=relaxed/simple;
	bh=iidgvtRYuaAhqrnd+5Px2QKaie9WCq8NPbXMgIRsVnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZUccowhOL3Zl8DRBEFASWU7Y/Pv/j/4Tbq0i9Ta3DL9ajSQQouxf1jBTOpiqtWA5ZH4L9ut3ErCxamYOl7uOh1f3HGlFjS5ORYrb/PVg2CPip4eIvn7EV3SSqWI0M9MjYm4ECfKNrdoeDEBB2a8mbj7Wsqg43hQmLZFOvio3UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foj2L3PY; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foj2L3PY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c11eba219so311036066b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 10:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775323554; cv=none;
        d=google.com; s=arc-20240605;
        b=kAm42uII7BiVHdzkrV9AAb99H8wP3UYKe479htOy7N0jRubQj+9zJbXAYeUZRfOnxC
         N8v53XVmziw0vWGxoC9dWruyQEjls/kPXZd1pMetw0zR8c8yOSC3fejGArbSfFmH4N8n
         VS4GOB/qIiLXPiKDWcgGurvDfLTWKHNpJiNEHdC9UVmAncTJ5ztWbrozu33RaEui4jIN
         5h9cIXrbYyns+iuU/wDeAtGVe4gjTYE8u+xdPy2x2HQD55MWLM7QI0NCb+IDFnr5XykC
         e4ZgHEUEuUYZgRmbRsLL0zRm4vI/LbAdxAY41pCRGl+zDlD9BzEyRNPsE8sYYBSniJtx
         CrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iidgvtRYuaAhqrnd+5Px2QKaie9WCq8NPbXMgIRsVnU=;
        fh=hI75gvxeyoLNyLVsiB6N8/uPG7+PdDMUrCBNNpUV/Vg=;
        b=BSmNOU0hmcu8ulC8GoqvXY7knVg6uzvLSPT/y13tWCOxjnLfksD5IqZcxsWsvUBAEq
         kenasytfTSkpwDR+v54u+7WdtLz1OV4USb6ditXTr3/aUPoym/IslEHrSUPvKW5wntgh
         JG26qMvVqYBtn48CqBrDu2h+VWKGOljjriZMoBifjPhbj56s0me/8+Ncm1FzI6E9QnIz
         e0AndJhm08Pd5JXukzS5F7YFJNpzGKryogIge2QyqS0D726H6HQRcKtjwUOtLZJCXRN7
         4LXiVEe404RrsKEi4EIKQu7jVN88m9usgradid7XYQk2wramjWwP2GD4T+8nXOauYbeU
         5G5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775323554; x=1775928354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iidgvtRYuaAhqrnd+5Px2QKaie9WCq8NPbXMgIRsVnU=;
        b=Foj2L3PY/2C5011OYzRTRh+FtzyiYjsJW4ZTU0VGU+uhDG0Z0IaNv8CCV6Mr6Ra6Jp
         hnsPFwzH9rhviGQ4/znbhQCN4YLmWk4FaWHU48bCBFyH3NjBqd9c3FLFBX7d1kqnA9hq
         165DkUOCUm5PsRAvobBUqBUibwtY1+Oe4BKgwNvlPnjL27WiwkIUHjqWGqgDSrguktHr
         ZCDb9kavuAG76FUklKoCVDB3mxwrmJ4a3oktDSXY3PV1h7w9K8bNLl9jqGsZkXegR86O
         PaR8p+pEho9EcGcoq7BB8KAkdA7vujIzmjwjO0FWjgjOkZV1PRN6002emu5EDVT2eTP3
         5qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775323554; x=1775928354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iidgvtRYuaAhqrnd+5Px2QKaie9WCq8NPbXMgIRsVnU=;
        b=WgeR8S0RS8JgUO/PYPBNKNRPjDBjzWkugu3pWuYqp7UGD7fg8Hfa4cQwRROmtA2tEi
         6gVR1Rf2SNz2mlk9qW6CTs7tAzPW7w8uDKuKoXDRLB4+PE1CZNdoqM16HCP7XF37psNA
         FhZ3R76rzU0cvaWY9CMllK2gugBpzvm7/C7m5AMvS/mdD8mPYcPqLHdf+6VXCBJce7ZG
         8WwX9+Eg6cTtJNRiy4Qk94NUsEkYU6KTkTVA3otHtW4uDncobmmK9TBtzZP+s0pD2k4w
         DdZlzGweYdf4mgAd/DEXfv4kC4Xxj2yZUj/7i9sAzjU8l+JfcVw7nx7lCDMCa3QrDxyv
         NnDA==
X-Forwarded-Encrypted: i=1; AJvYcCX/08W+8o5Htbih9dretc/IPxtnyIlxERxIPJI0P2BpS/6142NBkL933Rt+uLOp9E6UG1mIfpRRbbJwYcNFaJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xVh7g8HRqLULdjCHYGQJUFtizrNow4Bg3t+GC9/f2QtzsdTQ
	RPP0+9EvXssUnKMc47A/SfZTMBXHgX2+Q7vYBnC6YJyOuc1fkG0Vt5nK22VVA/Nn01aJfG/f/Sq
	dlkYvE1RweH6MLyg7BLvHBBOi/v2YP4I=
X-Gm-Gg: AeBDiesTbAJPQKMD0daM8A3kcBBzBlHhbXLVvn7iBbwWDtSU6NzX0EXRWuViww0H658
	zAA2HNPTdh6My0m1hurU1DCrktWRt1CdlMEKY8uAzueFs9i1TaTUmkx0CFmNGmBOT/4oYYahHBy
	oG2oidxAD1C4q67GXYwPmiCjb5QcgKLygA3YB/J+07vRqYrHxlxYJS12LGdsHsxon/Bc4fB1tdh
	/nAXTAF39idced61hOmDLTFIcWLJEikaSwH9MjwKzAkF2mLq/FXeB6zDqB/H/KgK5ofXA2UPTZj
	/AQRV5w=
X-Received: by 2002:a17:907:ca19:b0:b98:4b8:1046 with SMTP id
 a640c23a62f3a-b9c67922d67mr245594366b.31.1775323553422; Sat, 04 Apr 2026
 10:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
 <20260330191611.16929-1-royujjal@gmail.com> <20260331141647.GB1637150@shredder>
In-Reply-To: <20260331141647.GB1637150@shredder>
From: Ujjal Roy <royujjal@gmail.com>
Date: Sat, 4 Apr 2026 22:55:38 +0530
X-Gm-Features: AQROBzBVeQxzaE8wUvFhFsGym5EPOw52jRhY5t-OqeOyQKNixaLBWAKYKMiyQyE
Message-ID: <CAE2MWk=CSaijB_x0BzMtVGjuibqbzuCov8y+3Hm2UodrJJpF3A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/5] net: bridge: mcast: add multicast
 exponential field encoding
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andy Roulin <aroulin@nvidia.com>, Yong Wang <yongwang@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	Kernel <netdev@vger.kernel.org>, Kernel <linux-kernel@vger.kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026, 7:47=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wrot=
e:
>
> On Mon, Mar 30, 2026 at 07:16:06PM +0000, Ujjal Roy wrote:
> > Description:
> > This series addresses a mismatch in how multicast query
> > intervals and response codes are handled across IPv4 (IGMPv3)
> > and IPv6 (MLDv2). While decoding logic currently exists,
> > the corresponding encoding logic is missing during query
> > packet generation. This leads to incorrect intervals being
> > transmitted when values exceed their linear thresholds.
>
> Thanks for the patches. I will take a look, but please read:
>
> https://docs.kernel.org/process/maintainer-netdev.html
>
> In particular:
>
> "The new version of patches should be posted as a separate thread, not
> as a reply to the previous posting."

I have updated the cover letter title and sent the new version as a
separate thread. The same can be found here in this link:
https://lore.kernel.org/all/20260403150050.1235-1-royujjal@gmail.com/
