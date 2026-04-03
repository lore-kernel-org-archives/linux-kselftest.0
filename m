Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4730EF89
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775212285; cv=pass; b=qMuA/vLwwjFZZ7YtyJZs5hdp8+Z2bPe3Yw0yjPXwOCv6PR7KIkSwS+/41AhQap2QHbs2h53NssebYD+W0nWZpbpto6Cyrl6LFtxM1Qsba8AUcFeZ4pW/E5OBkgDVBgFkTBPJlcRNxG6dWwmAct3pDIazjnMGwI6nHrrHaGRBusM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775212285; c=relaxed/simple;
	bh=aovUneDvP1GBNolJAjVlVkkQADn5zmmkErYFqtVNwNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiZliLqCQqxewvrGyA83ruwO4L1vzagmj5RwdjiOaWIoe+6wFD6OeDDqFEaH6E10K8a7K+2mI+ZilLdAA07zaUKr5/zlkQ393Ki5KpQF0EPCMjWkNZQuAg8DIRK3n+grDXp7UVNJ1pW1++PlD+7swyMSPVwuXjFjvowJrBZJgdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDxRykA/; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDxRykA/"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso3353606a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 03:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775212281; cv=none;
        d=google.com; s=arc-20240605;
        b=f8yGgyHapRGe9+C1DBDhQSh5mP7J1Fwe41mFyImk3TbkNo5Mp6VmQWB3GjTDLB0Czq
         uBxe8jjbZCjwgBJfKKRfuPYgu+7vAToNbNgKs9FZPi2KtwE3ehn1mrBx1NjQGZWQdubq
         M5SsB9viPrWVZgdjnc79mxpAiTVPE73GI7Er6kOTdq3f70E7mSrSnK9CMZVvtDaKtaVs
         PyzjB+Dxw/2nVsIsNyNbT8WMit7WA4aenmeVcEhvzhmdydLhg931RFWY8/MLn4JByTzB
         robo/xCReI1Vd1/0yLhngHtLH7UnDukfW/+FOVSYJ/fURZ1iaRkwBS7bShhQiCHtmQgy
         4YBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHwL4zXImEU/IfCJ7oBNFaaImV63q09hkn+e/UcNPOA=;
        fh=tkW2q2I8jMm/Qu17m0t4Qiarxxkm7CVABN2XKo+HYVk=;
        b=X7EOjBwxwWeCTot3hUugbZd3rxrDq6meZ+s9LR4DgC1hPv0TMtRXM06/vn3Hh7Sre7
         joRxg0YhawdbCL36GIMJ7D3OpIxAMMq+DBdrAd8It3W/O1Xpuek/SQQ4u9TlAtabWHeq
         T0foRGaQkc9lIlz+fiJEry3IP75ZOIx162m5vd6sG3Hx9kDFdPwEbH6/+frDCM2wBheL
         HCNYFNmhVVEkXUcwwFSlS3UyZaEKWWhzz51ya4cpoXRcWB+n90WVHHWzJ+yNTPPPwQLp
         RaHY4DgdZH14knRNeLdQD5w3cAKnswx4ChCn2Hwr+QDgvY9TXlCIdvRLtiP6MAVBNpmT
         YMeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775212281; x=1775817081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHwL4zXImEU/IfCJ7oBNFaaImV63q09hkn+e/UcNPOA=;
        b=ZDxRykA/ceBc+Lg1qnQgY6Rjyz1ySfH/Ga9M8oDV5SBy2WtAYOAPsg8RxOREOIREV0
         A6xbJXwbthrs/FEh6cOIZJtkt4MbrF/US9MEk+6MAWDPv9vHGPDXI18jVfZm6a8igHJ0
         wQGMeonmROvJrxFDdaLssBPpRrKAx31tLxDZestO6jWSaFB5SYolrC+pXBSpzF8OV+K+
         VJhD8s6LhaxBAOteerG+BOcQfCU+kjIZm8hiNE54xSRVPxJgqNqxFt8KaVJr4INZIYhl
         QF+s2M0TrGl17+bjXd4vzndGBSJSUqKIz/Py/9qJQtfSHtyS72b1LesY3kCqYZKr0Omm
         VBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775212281; x=1775817081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHwL4zXImEU/IfCJ7oBNFaaImV63q09hkn+e/UcNPOA=;
        b=TIs4zkQfuFK6HOpJcLsUeP+stZO6qaZLOKUZWl+HoBZwsBGq0HUfN1CaVw+AqVaEc1
         XVivemrz4TTRIwKtV2q9LaujhavMu5JJkEKoutYyj1hed4m4dTnVfnSYwsm1lrzRpVQv
         NNFTDByUVd+sBVVxVk0SY3qFJFRbC20Kik51tXyfcav7vjaLmIsmpm9a/h6okdnqq2ul
         mXqRSX/1+Z9InMX9h6etJ8+eS58SCx6pro8UAg6kSzw6bVu7RTozozd6xjeiS11+za/G
         KvBxBe8thc1efgjHfxi3BRfHUuW/LBnKIvcwHS5OhrDjjtM5NUJihsWhm271kBq//bOG
         g0dA==
X-Forwarded-Encrypted: i=1; AJvYcCUNaV0QVr20X25D4x/KS8Vh1mEmo/dCvYAbnhp4m7DS+x84mJuUVRMwat784qc+FEbIwgi5v+PA1ohc6p7X8ao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrkja+jCSOXv7+wdwoqeb4EsG18h/6hwj1qejwRxSTYBHQNMX1
	4GQoLEp1yIzykqybW4XGfCTtnXlzR71blwh6MNGXBBaOeJxZUzxs0kTNPPhPDUZiTfFp8qC+jfC
	pVy2+FadfIAhh/w5NIOkP+xXgX04P6yk=
X-Gm-Gg: AeBDiesrg9VNs8/eq6rquiuzOp/HcvFZXt3ilZXuVGBYHIX2hPgXhw8JmVYH0oswmGl
	VKx1Sv9e7wHcb9nJj6j0TH0IaTNIdO18F76yCsO1IbQr86mmMxTEgXE1lqNFf1UW82mH+GRBhdM
	oYijvEy/4VOwqmncclTURR0A2mgB1x1hg8hwyakdlsQJ/mZ/QOfuJ1pQcIml2X55VFn5QdszwoV
	XILeaDZECwRDIpeSg1XJIxC4qCmLDh/XZTzRvDiMpUsWMpHWj1Ef3n6BmDXbZoDdbgpj5hO283d
	BkAxB6k=
X-Received: by 2002:a17:907:d005:b0:b9c:393b:f6a4 with SMTP id
 a640c23a62f3a-b9c679adcd8mr122872766b.28.1775212281230; Fri, 03 Apr 2026
 03:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
 <20260330191611.16929-1-royujjal@gmail.com> <20260330191611.16929-6-royujjal@gmail.com>
 <20260331141347.GA1637150@shredder> <CAE2MWkn3gPc1kBwy2p7r5bx6QozMStM0N6oEutT7g7GnJrKteA@mail.gmail.com>
 <20260403101944.GA66518@shredder>
In-Reply-To: <20260403101944.GA66518@shredder>
From: Ujjal Roy <royujjal@gmail.com>
Date: Fri, 3 Apr 2026 16:01:05 +0530
X-Gm-Features: AQROBzBqpVc7_CAPXcQpzbI6yBbYR-8a-svH1NtOipIeuqjLRiO89y7FSqh-KG4
Message-ID: <CAE2MWkk0_B78wEnt+NwrCZ0653W_BHxNWjT+7F70KWHtmiugKQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/5] selftests: net: bridge: add tests for
 igmpv3 MRC and QQIC validation
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andy Roulin <aroulin@nvidia.com>, Yong Wang <yongwang@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:49=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wro=
te:
>
[...]
>
> Is there a reason to place them in bridge_vlan_mcast.sh given they are
> not specific to the per-VLAN multicast context? bridge_{igmp,mld}.sh
> looks like a better fit.

I could see the framework is ready to validate using
bridge_vlan_mcast.sh script. Just had to apply a new tc rule to
validate QEURY+MRC/QQIC fields. Something like this.

                tc filter add dev $dev egress pref 10 prot 802.1Q \
                        flower vlan_id 10 vlan_ethtype ipv4 dst_ip
224.0.0.1 ip_proto 2 \
+                       action continue
+               # AND Type 0x11 (Query) at offset 24 after IP
+               # IP (20 byte IP + 4 bytes Option)
+               tc filter add dev $dev egress pref 20 prot 802.1Q u32 \
+                       match u8 0x11 0xff at 24 $intvl_match \
                        action pass

And writing a few lines will validate the test for IGMPv3 QQIC non
linear value of 160s.
+       RET=3D0
+       bridge vlan global set vid 10 dev br0 mcast_snooping 1
mcast_query_interval 16000
+       check_err $? "Could not set mcast_query_interval in vlan 10"
+       log_test "Vlan 10 mcast_query_interval option changed to 16000"
+       # 1 is sent immediately, IGMPv3 QQIC should match with non
linear value 160s
+       vlmc_check_query igmp 3 $swp1 1 1 160
+       check_err $? "Wrong QQIC in sent tagged IGMPv3 general queries"
+       log_test "Vlan 10 mcast_query_interval in IGMPv3 is 160"

>
[...]
> > Vlan 10 mcast_query_interval:
> > TEST: Number of tagged IGMPv2 general query                         [ O=
K ]
> > TEST: IGMPv3 QQIC linear value 60                                   [ O=
K ]
> > TEST: IGMPv3 QQIC non linear value 160                              [ O=
K ]
> > TEST: MLDv2 QQIC linear value 60                                    [ O=
K ]
> > TEST: MLDv2 QQIC non linear value 160                               [ O=
K ]
>
> I find the latter clearer.

I thought so, hence asked which would be a better version of log.
Thanks for clearing it.
