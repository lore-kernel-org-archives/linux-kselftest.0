Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6429B200
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916551; cv=pass; b=QuzfpTu5HZN2ocXh2KhzI4PBGsG51qbKlqhTShQ170hufmxkJZYEk9hkd9FQJglh74tr6NQlVbshupUkJfHk794ktzL9H9xfIRGtzMjNvohQl+MTO9XZVNmiA0AHVQ3RY78MAdHBv+m9X2bJQ4imuhDftw3CigEph7lyc2jTNkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916551; c=relaxed/simple;
	bh=MQSwhbdiJCeNBOXOMm+u2E1bHED2yNrmentBhrbYLAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzAw1Vb3XfuJDLqK9OY7lmnJdWaTchJNxcbYXwvZJ5TR7IRjI9DKAvt984TbnDm1zOHXnt1LSatzwbClZIp2cIcOhMSUd88CJ32TkKn6YSvLo3r9c3LO9kvVWcXLX79KpmNbQSElmZAnzjv2Pei8e1CAUtmVo2DvF7pIBPw/CTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgRfgUkj; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgRfgUkj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a34f7ebcedso45270541fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 18:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788916547; cv=none;
        d=google.com; s=arc-20260327;
        b=dYfY/i3CcW5xouwa78hT0hohPwXVsc11kAqO/pqrSxULxgVNZGTwtut1JtmkBeo2Jf
         pnZCppGIggLZglMcHbaDruugR2OElxOKh05GpjTUWIlDb8Bw2/8poTMTbyIFtn2d5B1T
         VpIFola9vuPLKPu7CL5V5FKl00DFnixuLa0VLwMH3yNdw/o891oC8YSfuAEPPGPkjDRU
         cu1u3+sNnFP3t+bIcuiCrtyXolIuWCG4iiCboJNKPZHr04NwGwWl3Q6QJNq0e/nl7qI4
         yavDYX1F8Cz3VpdAoYrnJGIZkfY0seRKSbDSIoXKAKKALkdJeL0A9m8kSRDj/jeND3yT
         yrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        fh=HryySqq5WEHXDfO1eHdlZZd6Qo0SSvTexsa7IogVS7o=;
        b=MOGPnQcLxOq7aV98riPVuioVoRUZYKTYr3SzS5wVaZA26kPrTaVjyltVyXvB++onjz
         YAGCLfsZFHXcvK2w3O9DrlHYEsEswIauD6Y5eVu+0/0AOOu55k0IQJNqdxdy7/FM5dGH
         AZS8fC2scwleWhn71oYJ9A73PzZ6quj+9XmWufPLVMR62hpWTGudzQyrmfr5h+nRwfai
         aGJ4LfgScydsE+cUiWtvlsHaOHvso1q3NpTP/bxZULbW1wBjMgOAhYHwoN76bSuNKjJ5
         IwzXCPLEjeKBMo4yBj+IGYl6gn2wSJ4cVfKPWjlTH+5MQWdCCSRibYFJo+0degGg+NJp
         w08A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916547; x=1789521347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        b=XgRfgUkjK6mNHRl7hxl+8eb8pymDKZQJ9YyHy+h/PGbdlwy0AuD5A0cXWgrHr5/ukK
         oOppDsIAZziIHEnfOpLUdDKA2iObLQuBaiCXvoXZz2Py+C004F3O+MECyqYYkbW5lE6z
         NQIvpbeTRn/ZySrrDtqP2LPCnqXOfUKfn4KmsS8GM/JDzMjo+9FtbngC8kCf3robtOLf
         PR5g6WghGCLtW7T3RdHc/aoggsu2UpXXhKrv98Y2b28UujQYwId7MkzpFZb71BnjXsfV
         wKgbuEO0KXkZLaIsBn1uEz5FdxFOjlliHSZnMvsZmkEdp8aQI6n4DzjNIcKlDQxYB0/B
         7KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916547; x=1789521347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        b=WdaFKkdTJXzgGRyRR955Qrd1UStQSKYS0YTZp/26RD7vT40cPLNqNRKD9ZTqNL9aoa
         Zy7rob+oSSJmeSmFafF364lcSrfS2zIFCDqXCThH5XqJIAPbDGkQuzaCgSBZ8NYYWi1B
         8pKvHBmRV68OYbEIvlj1AIfoBZEs8y3M3PFZFmUbzY7wwQO8BZMgzJbtvkd2Oc+BbfaN
         Hk8cvkIDQP4wmHlzE3phI2h5lOek+7IzFrhJH+0xnysy8WZ8aASggHUICfPHIMOYIjqn
         GjyqP5wQnfdfX1n6mx1NSAiEl5EzeAG2d3R+HjlvIIHLWJ7iWcopp41mEfM2oXji2Aox
         00sQ==
X-Forwarded-Encrypted: i=1; AKwUvByZhtPuKahF9igl9XDb+goiOcTlh5d1aIW+fhgXe+oGHMttphhUZMaocOW3l1qDef8WTmARuuXkGWYo04qfiP0=@vger.kernel.org
X-Gm-Message-State: AFuF++niugakAf1wNsnPFULMewQv0BEwcs/3FqOThD7Y8DgM78IuYSsv
	gsz+qoVSR0o48VTDGByxUFw6w5RkAgHGLXapo1Ty3/Nyjp8db/XppdH9FmFrkqmY4RegdH4nGmk
	QVzaOs2yBpNk89LtfctL2Y6dqESwcn4M=
X-Gm-Gg: AYBFou2g2PtNPK38wKn3ChCM8494iOs/yCacNFIUrixiLLjkGPu8LJpHemE8dylVDtI
	4lvs3yxI7FTfodtmbdTItmPFFUfC1dimpXUfMEOSSxPTBFRsdy5wr4qIjTHbtrTD73p2qIaTywk
	vsv5KbuA0zBX2bWFbpVV3N0sSGtQBcijjGxfMmD/U2FVeRbJNFZwIowJh3csWY70LVGPFJPz30H
	QUclfkU/T4ZTl4NYQDyb4Q90INvWaFngCIV4YNBwYHRiSyI8b2Q9+nFVkoNjVwAwXhVhlbWmy7u
	sRe1saIN40U1e9ueN8i78MyQHFccoumaYgvaZcEqo+pL8fZ9iT3k2eg3EgQ6yCMGtSEVKH/eH28
	ovR8Y72ZWShY=
X-Received: by 2002:a2e:a98c:0:b0:3a1:eb3d:d30 with SMTP id
 38308e7fff4ca-3a371ba9be1mr37005571fa.10.1788916547185; Tue, 08 Sep 2026
 18:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
 <20260905093932.43726-2-sigefriedhyy@gmail.com> <1673485d-5529-415b-b1b6-60e27291e3bf@kernel.org>
In-Reply-To: <1673485d-5529-415b-b1b6-60e27291e3bf@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 10:15:35 +0900
X-Gm-Features: AcwNN1VKTW3usIKu3ouYSVflf7oviyQs0HuBjHgGBr26olQ879IgU8NHIR61XhA
Message-ID: <CA+7S2v+vdR-=XJYNrmY5djFPW+4uLtHJYaV3iDsmuCEQcB9FMQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
To: David Ahern <dsahern@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:56=E2=80=AFAM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 9/5/26 4:39 AM, Yuyang Huang wrote:
> > +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callba=
ck *cb)
> > +{
> > +     struct net *net =3D sock_net(skb->sk);
> > +     unsigned int flags =3D NLM_F_MULTI;
> > +     struct {
> > +             unsigned long ifindex;
> > +             int addr_idx;
> > +     } *ctx =3D (void *)cb->ctx;
> > +     struct net_device *dev;
> > +     int ifindex =3D 0;
> > +     int err =3D 0;
> > +
> > +     if (cb->strict_check) {
>
> this is new code. It should only work with strict checking.

Thanks for the advice, I will fix it in patchset v2.

Thanks,

Yuyang
