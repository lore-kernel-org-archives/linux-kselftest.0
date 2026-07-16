Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD43BD635
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189741; cv=none; b=E6oj36o2AZXa79/KR2J6oq6XgGuhRlT+BU9gK04mxpZmbEdYVSXOUmwoFk3fsC0kOqJw1QATHHpZt/5NJqePK/beoPad9srOaZJTNkW40zuHnpvLEHUbIsMSR+0Ia4uTjYyVBVKxVa1foK+hFWVgLdxPEqIpHAqNlzdifdNFFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189741; c=relaxed/simple;
	bh=0tgd4pGkh+b4WcULIJcDcxAmOTx3fcVp4oGsXrQcs8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tcA2gtzk4eW+8GFl1HBVp9rZQx5NIvrkOCoDD3J7otIRhaqPRJlaneirXrUnqti7u2s0lS3v3gqWE5JjmigjXzPeCWAzP8GjXJHP3f2fUG6+SLZYsrG5nXoBxiAS2B0rOU+sUaQwigRb1flOHLEMwpd+f6U2TtL810slMixKCbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WdjGd1Je; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sKuk6/X/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WdjGd1Je";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sKuk6/X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784189738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0tgd4pGkh+b4WcULIJcDcxAmOTx3fcVp4oGsXrQcs8k=;
	b=WdjGd1JelB787BFJy/Goxu9LCFCJ0iX5vOFGvmG0fxGa51oQpOLn9mVqOzJOT94U/RsWxR
	wlLs3wlh3PR1+RTZ8JNOkFhnLEHnXqRRW2J9N7/4sxnBayUlwEvSZGvGqNFa8RermCXWm1
	o95JECHPO3zvfrB8j8uhodMTirac2OQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-2zxZGd6oO7CADIxwDB3EZw-1; Thu, 16 Jul 2026 04:15:35 -0400
X-MC-Unique: 2zxZGd6oO7CADIxwDB3EZw-1
X-Mimecast-MFC-AGG-ID: 2zxZGd6oO7CADIxwDB3EZw_1784189734
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-69cceec5a38so8654a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784189734; x=1784794534; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tgd4pGkh+b4WcULIJcDcxAmOTx3fcVp4oGsXrQcs8k=;
        b=sKuk6/X/DpH3MkR5DsVjT0kglp/AvApMJ+mcB+96yjxXm9LggzCPGNBmm8jwYqiigi
         kZ2h52bn7W0YCHJYWEv0rhIeXAxnDwJrsyo1wNbDEobphwDYUudDsFq3YfukH3SK7lph
         uOfjnp4eq0VpQPcACaPWapMg6DF6+E71VwFR8WAQmjvRP5CWQElw7jABCl4yKB8ajupr
         Yo8FdYxq91G/o98q5NNuddmrvbTunVez+UpHGIWsMZET8ZrfjZ+NCvniFA4Dn2YX+N0V
         4Q+IT3VilBiOP0ksIStZEnW+vtBoYVS0zZ2nJJXNbRjRLZsiZNoltYNDuyDjKziOhje3
         Gyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189734; x=1784794534;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tgd4pGkh+b4WcULIJcDcxAmOTx3fcVp4oGsXrQcs8k=;
        b=fMQpvQlKF3/S+t1qsaqE+EmBjXaxQ08VYdjnFr6qttFrrl4kUSTohrxNrZDCFC9x/d
         g14NOrPH0DA76RrSA1uaIlODlc0lsjXanuW/r30LJ8lxZI93YR/Ivxisnzi+Iv34kDR/
         PQFCOYxsOf6mhwjOfubDN2hiGRgsthG9ot5b4ajPOvJ9urjLJTYn1XhWGO3BE3fZKKvY
         9m3zKoUrVzNoOEmmuQFR+Qx7drUn9Nz9RkKokuJt3mnzu1bCSOqmzMgWw/BfE1C5cveg
         Td1sxINb06yhR5iHXIWe+gFLj0gaCVN7+yA2lx8Pp4JBAcip3TajLUnC98gznqK5fmcC
         wD1A==
X-Forwarded-Encrypted: i=1; AHgh+RptBxffpfKpxKBxPHWXkXikmeEEsSoVSpxw+m/FVjf5ioxlgCRSK+wcSLa3uwMgbpk0C3+D6hCEWRxuYHLYD/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPF9YgvFYFEnw95jcA5wFHUQOC2riWEWjl8BnXN1J5VS7qQgUj
	iX3JRA7IUXz/jDLDfIg/3tDEelGZulOo+UUTOhaBqm3RdtXuc8knpJ+0IF5th+BB75Pw3YIlBK6
	kEOJ4O3ynvCAr3pAof22cexf47mPmdtAoSpyjUh9rbpBFfrzoja9XdRcwZDMCxwfHHCw7iA==
X-Gm-Gg: AfdE7cm93WitxHKGaYA8XATN+Gx9ciFbYFa3a8fHxplOrvhu00IUJHCivQTOFF55Ii0
	p7ek/1fVyyxEszZCI7YAyl/Y0KgLr+Bom/jHbqSMkCNW/k2uTo0FjtzFUM2FseT82pC+UQ3y03S
	XcRTF6Lw45JNCvzxagyIho72ArBLPIf7wtrutFLyNzgR2QhcnR+/2mQ04PC4yvRf8joewiAn5DW
	wKRVvhoNywyazIvi+FRHvmmIV3CuXXkyMMIsC3Urh7U7n1Fw8ZDigNXi/Dt7K92b6juLJzzDKBW
	wtrB+ntUp4N6Jn/7hz96cvGNwaZt7GJLIatEvCu4VG8yMvLXIIVFqkAJGDvCgyp4KMzfdlk36xw
	UD924VAo/4sk7lyiTGp2OcbTT/YZWPQA154JEHey0pZ9X15FE
X-Received: by 2002:a17:907:25c8:b0:c12:91a7:9cc3 with SMTP id a640c23a62f3a-c1692114fe5mr73196266b.13.1784189734058;
        Thu, 16 Jul 2026 01:15:34 -0700 (PDT)
X-Received: by 2002:a17:907:25c8:b0:c12:91a7:9cc3 with SMTP id a640c23a62f3a-c1692114fe5mr73194166b.13.1784189733558;
        Thu, 16 Jul 2026 01:15:33 -0700 (PDT)
Received: from [10.44.34.17] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2878eaesm4243784a12.2.2026.07.16.01.15.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:15:33 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Conole <aconole@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 dev@openvswitch.org
Subject: Re: [PATCH net 2/7] selftests: openvswitch: add config file
Date: Thu, 16 Jul 2026 10:15:30 +0200
X-Mailer: MailMate (2.0r6292)
Message-ID: <454FC9EC-8F3C-4999-BE7B-91EADC392EF7@redhat.com>
In-Reply-To: <20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
 <20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 10 Jul 2026, at 20:04, Matthieu Baerts (NGI0) wrote:

> The kselftests doc mentions that a config file should be present "if a
> test needs specific kernel config options enabled". This selftest
> requires some kernel config, but no config file was provided.
>
> We could say that a sub-target could use the parent's config file, but
> the kselftests doc doesn't mention anything about that. Plus the
> net/openvswitch target is the only net target without a config file.
>
> Here is a new config file, which is a trimmed version of the net one,
> with hopefully the minimal required kconfig on top of 'make defconfig'.
>
> The Fixes tag points to the introduction of the net/openvswitch target,
> just to help validating this target on stable kernels.
>
> Fixes: 25f16c873fb1 ("selftests: add openvswitch selftest suite")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Thanks for adding this Matthieu.

The changes look good to me, and I've tested the configuration and
it works fine. Note that the config cannot be used for the OVS
make-kernel test as it's missing some modules. But that's fine for
the purpose of this kselftest suite.

Do note that when adding new tests to the openvswitch kselftest
suite, they should be validated against this config, as the upstream
CI uses the net config, which has more modules enabled.

Reviewed-by: Eelco Chaudron <echaudro@redhat.com>

