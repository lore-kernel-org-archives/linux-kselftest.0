Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6721374A12
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709489; cv=pass; b=a0MvKlkb6RHHEgwbNvOSDXexXHhy6DCDbcXonDK/Oz+pIrhTPmlzmj0+GeBkK9SsKFVvAoLitpKm56pnoVjuSeZ71+phyZgQKPMuIKSawE5UbPgLcM+LqxcFT2J9ANJ0Kcx6cp6kgEYhyie6fOPt9/39RshsKseLtnMBp+Mh6Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709489; c=relaxed/simple;
	bh=n5p78zc2rjIyApVm9wtHFVD/tFOi9RjzwbbxuAlVOl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itCxAj/PP3NqspefmF7xExyxTzoe6rpE7pMTpcvCRFv/Yo/4CgMwPnjEbKFnyOvs7/bBpA5zq9GlKzOkZq4dM0xDV1GOOjWAn7AByHfIQdmb5/y4+UDmgBo3aiovs9xHZgy1Dk7pqlBUErQexBA84oeNt5SXLkxiOtRQChmbuBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZVSbLdW; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZVSbLdW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69532288224so2299243a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 11:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783709486; cv=none;
        d=google.com; s=arc-20260327;
        b=deuh0Dc3KkqmB6UFRBe7v49FNULKQYIoN7l8BNCojqWRfTDwFyiUXjUsSUm9YXm3Kb
         ku2FA4zEDAe2b8sFA0GcI9+Yb62aMv6yclyN1BeyUEJN1WtBZtHCQQAH89Zmkh45ORfF
         y5RgsCQixeP9tse/IhDaUx2Hur8cKHAY4uGjNs4HMjmV1vm3W0KJhEnNYRdYOB76OG2+
         DQL3/vTHgy05z9vgaI1DB9mbzGBX2NWRndJ4fpZWhXnDJ6Ch+EwCfjDf19G6YKLqueYj
         c2DW8n3RZVNjZnVOZoBY3ZBk0UanHoESuwPAMhdx7tfxPf5FlS41u9fzdHvCIN1jYjoW
         jVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5p78zc2rjIyApVm9wtHFVD/tFOi9RjzwbbxuAlVOl8=;
        fh=JTiqcOzc452tbwca+MKGqZz/mK6f3cDbMRqHxkJRvg8=;
        b=QUtgSjVGYc31lXtbpFq8lxgVh/6Mca2IHxsplrzsSEDp3DJMOB/bEpJsc/dRkEHmUj
         aWK7KzwF/YETDjqASm7iG8o8fsGkEMlr86d3796xDGpsZ3ztji4dyRjrFWgS/2ZuZrDJ
         7sDAz6OS99xDBxUBDAzk0B107/fEQqXL/Wf9YJc43cP/1AHLLNPCJtV3dsv8iWHj8BXN
         h4ZaW6km44JJ11nw+/jHwmTj8n6Asehr92ORb1FxqtPTEoIFFoE6rtLg1zDubsXalsN4
         UWYeEX/UdVSsF12vofJDwiXL9Zrj1NtHBSC1Lsez4r8egHgtpCki7TvskiJbpNyQ7I/M
         dR0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783709486; x=1784314286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5p78zc2rjIyApVm9wtHFVD/tFOi9RjzwbbxuAlVOl8=;
        b=tZVSbLdWfOSR/J9P/LE8swlGv5Op6QPCC/DUsnme/OZG8G/f3pghh7WSEztp6dp6ml
         pPiOQjHSjmyEMMcSl1aqbeP3BnKA6GukqBlmSwzYwQMhPNDk48aS3gv6G46HMNvCdWTW
         h6muqa6eeldp0u2ui6yg3seyK2wFwaeubIDDtGrrkPK94LCKJnVd6V2aPUWwjkrtw1wr
         r4yXrMr/mp34UTclBT0R0CDwRm1GvMzbw/KlsC95hwmOKSPyVELq4VmzTdTvyVciJiUu
         SzVLUrWHLMBkr1ykId6gAKOahRgeGY9ZKFM4d+eymmLcorSsYDAM8mDULva/9IbcaaNJ
         8fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709486; x=1784314286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5p78zc2rjIyApVm9wtHFVD/tFOi9RjzwbbxuAlVOl8=;
        b=dbUoopimTZZMFyEGByY8dZ0ZdBTpPhhhEfZAheFsUE1kJ44UPrKFMg28BZm+8P2GAI
         8ANXeWsnbq+YDiAfXa84b+Iss2syh/spBVvWXS452o7xvee693CTJX0d1IO/P8OH1BpG
         C0+oWwmFwagHRy5KHhed7iNxfeczztviqq31ZMPuu+3idirpRHEuyfcosfFAAvAXm45F
         0IB3KVvqgxIa+47w7SVrMecyJG6cgU6EgyogxrrbQsUDg8HbhaZ160y+SMWrpTJua+K8
         fjEqKxqF3T4pWP41VNT09Ei3BHg68TWvtE4d6V1ghufuN9o3St0kL5mYOGcBM/ygU7bk
         1TmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHWJ3c8IFoTfmfPY+SYCZkdOtSBZcFV4ket/MlQ2/LbzGxsDJ8udLZNG/SlIEyG+KlCM9lWIK5Qp4CargKpzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6zw+hMORAtq1VkLJm5qg0NflOKFaqBWDliZbd0QtKUi5oRvid
	JWXu7RVUrzVrL/9hqxIEJIyyLzVWFSBMB+SZLNZ4yxMps//ZvrH08uq8FJiy7CztRCIhexH09pj
	1s7008iufykCikvvemD0p/TAlicO73EgXFc0/oLzn
X-Gm-Gg: AfdE7ckxOi6rjTQ5qFMiMig0Z+gHsKlypvr9/X7c2PL2LfExr6YaKVcaeIGPN9DCy4T
	LEeXxLpiYYOMaojdl50M0DAcvM79emRtb7E1F7e8+/4l+DnX4MMCSh4SfgWbI8FYEc9qalKvo3a
	hujjIUspxMLL7r98jGQsaURNZB4PLYkQ940BfVSs96ZEw37u7YerNkMXaK03KFath8J0FbGMbPw
	jIg4ehsstYG1QcoCCLQvseVYBANMOOul1N/Z5NbV7y8cLoH20MxzTmtipNIuGuDSiDG/FUYHauy
	nKBKsemz2/IvJmDFyGYPN1mvd6566EOrE56sNzKWW34BgXyLnoVPe6SNIs0w0r5/UJlr93eXVu0
	CyOir4MzGVsxlxmpLLWh/KafbxpNq9ojKI+jG0xS1Ow==
X-Received: by 2002:a05:6402:13c4:b0:698:e595:a54 with SMTP id
 4fb4d7f45d1cf-69c5f22db6cmr205883a12.25.1783709485858; Fri, 10 Jul 2026
 11:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org> <20260710-net-sft-fix-containers-v1-1-a2915c294ef5@kernel.org>
In-Reply-To: <20260710-net-sft-fix-containers-v1-1-a2915c294ef5@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 10 Jul 2026 11:51:11 -0700
X-Gm-Features: AUfX_myqvOzaMsIaJBI9tHYQ2GZKEYBZ6ZeliutyzZ2d-SAppn0G7CeVtue5cr0
Message-ID: <CAAVpQUC18R6CHS9sDyN-dqjzkU_qePVCbLN+qs+R3+uLeJ0scw@mail.gmail.com>
Subject: Re: [PATCH net 1/7] selftests: af_unix: add USER_NS config
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 11:05=E2=80=AFAM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> This is required to use unshare(CLONE_NEWUSER).
>
> This has not been seen on NIPA before, because the 'af_unix' tests are
> executed with the 'net' ones, merging their config files. USER_NS is
> present in tools/testing/selftests/net/config.
>
> This issue is visible when only the af_unix config is used on top of the
> default one. This is the recommended way to execute selftest targets.
>
> Fixes: ac011361bd4f ("af_unix: Add test for sock_diag and UDIAG_SHOW_UID.=
")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
