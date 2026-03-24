Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138534B437
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383794; cv=none; b=dIXrioRsDgGishayteyJQUxQ+XajtC52E8p7j+g2ujIjQMfxGUqUU0v7jR49iF/OmjiHAwWlT6cbRIj6zjLrDRFjyOnfvB/eXdW4hJASX0DPY6QKf8vF5tS5reDlvlapqDUoAr/cqcgt2yZGsZpS1cwc71MdAtL73fH0MTz03hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383794; c=relaxed/simple;
	bh=2dmmNNaIIVMuKjl7hj+yptm3i2eKLfkeRwkuuz4ebes=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCjQuVkot7jZp0Uc4XRoqEp+G3D7BHksAnOMQMZqr3lpAISvgqSxA+n0/FAoFn17f0/zIOG2mrWl8QydFrZPTx3dYp8SUmhi7kDKY9JmNniY/FCIqokWWaY3JzAw6Im/PW6OPestawwE3V4JLoO2NSP6PZo+3WJmM3i++N5aNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ompKiEpP; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ompKiEpP"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-127380532eeso3307108c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774383793; x=1774988593; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2dmmNNaIIVMuKjl7hj+yptm3i2eKLfkeRwkuuz4ebes=;
        b=ompKiEpPtSkWBZUVc3lgQhtHiARgVIKXT45rjAajpv+sGJ46OVDcjvdxiuKq7OD1V+
         gcuclAsQwe/jtI4DZOf2Fualdz7h2H5BxdevcUOxSX1RZ/8CnXzf7J/XnOPPDADhLeJ1
         PmF7R/VgpTeR26YLypEFmG/BlbQ6OFDRkxPflrVOBVeYAZeysXMis0LhTXeodJ9j6QlK
         DoXVU96lmJ0YywOx7Yx49DrRwFIsjNwnolkuIescoR0p2TsD4gF7okZIBUTToYWg20ui
         HSKiEoSMj6fDGwyUqBKXg4tP2/tVz7QlejO8dMjaj4Rc/OUo9f/Ce86KNodMwU24x5vT
         fIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774383793; x=1774988593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dmmNNaIIVMuKjl7hj+yptm3i2eKLfkeRwkuuz4ebes=;
        b=Dhyfs0QSemK4ZSyGOHx7pfV+YcWfwrWbuG9LQb/7smS2g3b3qD0BWsFw3nOcV0jE8t
         k6p3tgkcGPbcLhrqAXy0cUaV0H7QGnK8qwQuYDjSS1iKpk3dguldghXa30OgHVxgWJtI
         JyfgfoN2qAmVMTmU4NpYFg6xv/NkHxPBtEEHJa4JEnWJAcN76tE9mdzXDJHg35mkCmXq
         LxORFYzE13wKl7/QoqmqWXcwgnRt7wyB2GXmbyZ3J8xXy7FoWer3bCdSgrvHIUHaWXuf
         LTFtYLmYvsJJ/bLt6i9mceYsS8IH8ZTDPcf7auEzogjd0FugoRGUTnclv3ualcQO3Ocb
         o2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy1CLrWyH5gB0Q4JDh16U1Z8sUNQupNfiB8MX0WLOLJpWArMqqLjq2/p70g09UI2zG2wsEH/8/WrIYp1RmbdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7s7B6iy9CrNic1oxJy8Me59n092ETozWVVlWftUo5b9wF3aQ
	1KFbyt8M+aKB8K8V0tKKPaBOi4gQiMY87zKWmLFVVHxXZSWsOfK8nWME
X-Gm-Gg: ATEYQzzq0KeC3LTUzKrDtS1546gqenbwRjG9r/usA3wMA+Kr6Uky+plgz6JxqjFuCQI
	hsGZ3nTH7uZXxSDq5l6Bo1b3ibAqdTKiN5wMbBdhkk7Qo6MDC72sQ/9x5clhrng1BzDu4SPf1kL
	yWUXxDAd6IGZKAihKPhlnxJKKaYYEqrpDNX0pJynIZeZ0Ar+OUqdXCXY5MiJDxyeC9UelRWC7if
	ogQIQVz+RdsWy37tHJB4OxMgLHEV+AB/RGAUaA+AQoSnL9bXCOSxgMEg7ETSskYvOHCX/og2a2D
	VMvLeac2DIY27UO7Odh8JFEf96LtlICW3ybQAIOU/VMo8CgyPg+ggQM9NY9bvHwHW8xiyHv+Uw7
	+Jm9vrhCLKY0j7+ZamZxNn7KFCiI8DdQZT4rsDse8urmwl8QQWMuv+O57v9i8Kp2yCWVKSIapJr
	u1PJhvK/RzBF2nIIUbwrbfTkasiaguwDPCKXwdvBoseHqJH2WOPZXJ/7SS24g/MkUV1kg7Niewn
	1g6YQ==
X-Received: by 2002:a05:7022:fa1:b0:12a:6c84:6054 with SMTP id a92af1059eb24-12a96eef696mr416917c88.35.1774383792478;
        Tue, 24 Mar 2026 13:23:12 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:41fb:8dcd:b77b:d6ce? ([2620:10d:c090:500::bed7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a73407854sm12144574c88.8.2026.03.24.13.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:23:11 -0700 (PDT)
Message-ID: <88472b1d785ef41441bf82f362a0afd96b6ce4b1.camel@gmail.com>
Subject: Re: [PATCH bpf-next v6 2/2] selftests/bpf: Add trampolines single
 and multi-level pointer params test coverage
From: Eduard Zingerman <eddyz87@gmail.com>
To: Slava Imameev <slava.imameev@crowdstrike.com>, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, 	jolsa@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, 	pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, 	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-open-source@crowdstrike.com
Date: Tue, 24 Mar 2026 13:23:09 -0700
In-Reply-To: <20260314082127.7939-3-slava.imameev@crowdstrike.com>
References: <20260314082127.7939-1-slava.imameev@crowdstrike.com>
	 <20260314082127.7939-3-slava.imameev@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-14 at 19:21 +1100, Slava Imameev wrote:
> Add single and multi-level pointer parameters and return value test
> coverage for BPF trampolines. Includes verifier tests for single and
> multi-level pointers. The tests check verifier logs for pointers
> inferred as scalar() type.
>=20
> Signed-off-by: Slava Imameev <slava.imameev@crowdstrike.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
