Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EC1377011
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 06:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268482; cv=none; b=IASWvPFn1R1FWjknTjTBQkAk1uJ3cYKOGl4Gu3qjh7a+rfjNt6YabBuFf9DjFSA1KYy37DurcC9IANxI8txPn1YsXMTCoPp50h3tc0JA7vlmEonjUip6ARt3/a7C7DICv7mLeYBwuDuAhytRFqyp7VcdzEw8n4XXn+SFUfBXteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268482; c=relaxed/simple;
	bh=PoiIVO3GUBKAT1xkKYbJil9iOdtYi6CU9IZ1qly3iGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXSK2vWPxu3eNuJGr+OP/xq6a3EcG1EJuAPnMNuXtliYC9nlr2Cu7JB2Q0l5zKfQP74jifKxO0PJ7syqbkWc5yPWZrW9Nxsl1/aSOGPRmZg/sIDIXJLdANufwHHPK+8ZbPNqvOAixWzZ1lqT9FYvsBmD4sxt0gJoOgkB/CSq0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDuLTfek; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDuLTfek"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso91211365ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784268481; x=1784873281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoiIVO3GUBKAT1xkKYbJil9iOdtYi6CU9IZ1qly3iGc=;
        b=gDuLTfekKbvG5ZK1Nx+i+CZFkfUUom8anKDH1kkJnLuYJAQfgXvj0T2IJNDHSOx5zE
         HWUoRgIXyQ/DEWX94ZOKEQUPYBlKPXdPLbqJuaUAsI+ZEJ8f+b4DLXRubI090Sb30ZBW
         vQpKh2kQ7on4WUNMzZTMNDp4Q05DcemrvT9qb3Xgj6B65i+/bILVguZkv177bKyIGGU+
         5yccGI4Gp/pTsgTP8yTxD10rVJEpcVCFk/SNHFC//iaZ6zg2Ck5eIxcJ7XhF2dpCxtLp
         IqeaPG9wBRgC7n6VdrnGjNQnEmH3jZ9zQMerJzf6m1RjP8rFGfeQZlOT09twKW9oN7V0
         u9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784268481; x=1784873281;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoiIVO3GUBKAT1xkKYbJil9iOdtYi6CU9IZ1qly3iGc=;
        b=NGlrEfAJzgkw9HLzc2GSeIqeaTk/ZPv2tn/Twy0u8KOl8VsQ7vEUll5I9yiQgJOTu4
         WOISRF4UvVoTkG1kmVB585Q0VEyCaYFG9KN5eCxv9IuwHaVGLXuJ0fSBpFXvUxmn43s1
         OWrKSHXUBddqN8mzowB2ciLFkrLNEclIjKEqsasYeEc2byHBVxBKZ5bFbUqagaFmnAHq
         QyN4exeG3Ac2ir+4/G1y9bPINg3O6/sM2aahMddpc+TsXpMb5+E2kX1byzvtbsN+NyaI
         PkL8T87kPmUDEkU+MNP+1z1Omf9xdG0GvEbX1eNLGp2feM+sAjC9GUerRXeIZNuSL0iz
         jGHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNwXMQX7pHzsQ9TBKxRnMFUnmi8Lt3tBRwUnC65AvDcIKGIfHQFs3XuiXtL3DuV5XrBkVK1O1XuADE7cfM288=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7PDXsxsfMwOY5apCtX+ENcjPYEus3qRvjrh3wkPiSKxF6v33/
	0J9TWA+jQokT900JE34EChRe9yYEeuc5jBaKWeS5kEahUL7XMeIjAVNy
X-Gm-Gg: AfdE7cmAlKdYUlZwiBf/xlDx9T3I5FcHX+yYNefb9WIYH9IQeT6BVcjLBUbuuVjQabU
	M8G4RUd+CCNKjKvG2kVAv2PlOvDSutDiTeQYunjBEsbP4aFPg9DxrG1GM0xYRtd1VTB3SSB+rqx
	MwnsCFxDApRlTdnuI5h6j9ADNvAoAAwtgQKjxWj5yEwP2RMy6qflPJ/D4wfddQJk6w5SSWrlDqP
	k3EDJUeIPhByMaJCqoblLtyfnfx5zzMpSdpQcfqtOyv4LzK9PsvD4976LIPmr5n8y1ei2QjQFRO
	+h3YJ8FGIrEKs1Be7cc5OlaSRCSOvWoYcxo2qQQKYmN4s0JqVr2VmGaKmPfV3BiL9d/mSGjlAPi
	1RqV0QRnZ4/6ksst+inmLmh2gScBAgB9pzqLbW1t9652WCGCnIniFOgeE3/eLerlhf9bJ2n84aC
	PbY61lnOcySeLF9yuGXOpNwzIJiwbgfAA7+gk=
X-Received: by 2002:a17:902:fd86:b0:2cf:32bc:971e with SMTP id d9443c01a7336-2cf349bb7b8mr12936265ad.29.1784268480596;
        Thu, 16 Jul 2026 23:08:00 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm4583125ad.63.2026.07.16.23.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:07:59 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: nexthop: per-nexthop UDP dst port for fdb (VXLAN) nexthops
Date: Fri, 17 Jul 2026 06:07:43 +0000
Message-ID: <20260717060743.105-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716113321.GA1636541@shredder>
References: <20260712191218.236-1-jack4it@gmail.com> <20260713122339.GA548566@shredder> <20260714034309.2226-1-jack4it@gmail.com> <20260714174201.GA1037700@shredder> <20260715074317.2271-1-jack4it@gmail.com> <20260716113321.GA1636541@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Jul 16, 2026 at 02:33:21PM +0300, Ido Schimmel wrote:
> OK, I understand. Each tenant has its own VNI, but it can have multiple
> HA sets on the same node and you want to distinguish between them using
> the UDP destination port.

Yes, that is exactly it.

> I don't particularly like NHA_FDB_PORT because it's an FDB-specific
> encapsulation attribute and these attributes naturally belong under
> NHA_ENCAP. That being said, I fail to see a better alternative given
> that FDB nexthops don't use NHA_ENCAP / LWT infra and probably
> shouldn't. [...]
> If you are going to post v2, please provide a more detailed motivation
> in the cover letter.

Understood, and I agree with the tension. I would not move FDB nexthops
onto NHA_ENCAP / LWT either, so I will keep the FDB-specific surface as
small as I can (see the VNI answer below). v2 will carry a fuller
motivation in the cover letter.

> In an earlier reply you wrote "shared inner MAC/IP". The "MAC" part was
> intentional because you need to load balance pure L2 traffic? IOW, if
> your traffic is only L3, can we do the load balancing using multipath
> routes in the overlay instead of using FDB nexthop groups?

Yes, the MAC was intentional, but not because the payload is pure L2,
it can be IP. The reason is that the whole HA set is addressed as one
anycast identity, a single overlay IP and MAC. That is deliberate. One
stable address keeps failover transparent, we just drop a dead replica
from the group with no client re-resolution. The address is also
consumed one layer up as a single stable endpoint, so giving each
replica its own IP would push multi-address handling and health
checking into that consumer, which is not available to us today.

> Related: What is the use case for NHA_FDB_VNI? In my experience, the VNI
> is only translated when routing traffic between tenants. Why do you need
> this in an FDB nexthop?

No strong use case, and your read matches mine. I will drop the
NHA_FDB_VNI mention from v2 rather than carry a speculative attribute
with no user.

Thanks again for the careful review.

Jack
