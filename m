Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FE23741
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049967; cv=none; b=ZpQxLB9t6/972OOMHC5ZLIuufQdBeLLqXWYj4JLpoounurs4ogSvOP9VxrirGysQVjwazss9LEDYsdiwrtIuWDOaBgJqtPEfSHYWtEikjwlVhsx+zZJh3Ag64P44UqUYojzdsOAdVLivo5rF278jy4pYR61fV96Yt+CJCFoutbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049967; c=relaxed/simple;
	bh=r1vbyfeCtYG6OGx7YM1c8slsjLM5GVhJMK4JM/LtzFE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Wn5zy/iOpMLFrqzSdJ0xtyr3mkbIri+COhe9gfwavtG1tu9JEtkDuQ8QOBdwa/wBFXJrc3xjTR0iCgF4gQZlY2vpIp3v9Z78rAkHV3/Uyhu0rXgpvjKTbxe/2T0Iaxyr7xR105ESbDFLcSde4lTiG3CZ0S0o62IngVUs4Hgsid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=iuQ8spfK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="iuQ8spfK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304e83724bfso7693681eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 17:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781049965; x=1781654765; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj983b4aP9iTymCXxslRDVIMvDkVOBbHTYZp1bhw+6s=;
        b=iuQ8spfK1Iat4dw7kvDF3eT0iRlrgXea8KgeclovNgqmuidX8lMZtX30UsXf7EZkZB
         w6p4NrXwy92qPMAekQNDEWW/W6I/zuY0H/u/Sc/7A2Upk0I5t95ph6JNR65U2rLgtpdm
         NLI+M/o5675+3eoCVCzu6KBAnDFu2j8IC5DkOpQS5QGGUzATHxtzSFz188Sn4xCaSvP2
         sMY1/xCgDzwXzGzjdOG7yadGOhxkINQD6zEkTUg+u+A7PgJ33Qj+Ygg6PHf5P9nm9d7T
         u5+csh++zvP4PGTg1HzekkkDhVcU8tj0yJMXLjkgZleg5fGuiMGk6ExeLimeEN2iPixR
         CtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781049965; x=1781654765;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kj983b4aP9iTymCXxslRDVIMvDkVOBbHTYZp1bhw+6s=;
        b=pPoyPlwHhMylew8KlUqh3+xwypU8nLAa03yTFVKnh3rk8QR2evdYFhXwuICQNS3PRN
         +QzrikCgOD4IgxZX0mt1t3OJc7Xieer45uwNZBzGzd1VbKq7s22b7y1hKP9RMj6b6QkW
         /FGkE/66YH0+4oKQTfiBunYu/guCWJU/h3OaGVgJcAC0QRjDYWQrYkUbExZFI3pFKDVZ
         vlVWGaY28FrocotMiujFqFOoWeyjVJYo/YWcnYa7JXvY6N/V0Euts9X+NVWdTD5xqNVz
         pfFX3piTOrHjkZkLS8iCq++uXOJNGM30tmrJRVLodrZ++LH/CWTparC6BrU2stYC64b2
         SVgA==
X-Forwarded-Encrypted: i=1; AFNElJ+dDI3Ik9l11MuviO1izNpT0+KOLKZHtcbuLcwdJ36ioz6FATMwWLhlPXzJjGygI8dKT/klwJNuUWY+dRD8nhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1M8NNBJ4qnI7lsh7ys9/o+oNHjhM06rrQ9Gck9HK6/vEvj0z
	ZJ3/6MYUPTCeXvmSbf2ALwq9Ciq3BWvBqYxweB10DJ0I2yZTWLxsRiS2KU3o/ofFubY=
X-Gm-Gg: Acq92OGrCswYEdFIUSVgAQk+5neTor3sUutQRK5Xj1NuNkzCZO5YryOaL4WEcR0XvIv
	kUNzToQnWb9hoHhbm0oYfYOAhDM0JDiaIymkoJjhjKKAYAQuY146g9tbPlqHPXb33jihZ1PoH80
	2RucKT9M/OixoKEr8LYytKCJ4gDfoK7wzz8CCPRbHC/+TNkFThaaWUxDVQ80Vx1M3j1ZVXaULP4
	0ifZIShVBeF++6dFQvWyawTiysRTrO4HmDhIRgunBepXoT0PRhfEV6D2JeF+o86c/8dFSwAGotw
	bvSvmvMnHF+uSbfvqigDfvwdYOF8qlAozkdvWutcXFBMPZE1wxqp1CCoeb6RxuAEb3TD4ke+Wdq
	mKLaF+JN1Kjz7ZvyB3GJR6SFc7NRtu3Fbv7/Q+XwP2sx14s8x6IatiQnQuBbEqwd9EFgMtjXstO
	3pZ470agUQKO4q+Gg=
X-Received: by 2002:a05:7300:d70d:b0:304:c520:4e14 with SMTP id 5a478bee46e88-3077b32888bmr15659364eec.11.1781049964814;
        Tue, 09 Jun 2026 17:06:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3297])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm28979462eec.8.2026.06.09.17.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 17:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 20:06:01 -0400
Message-Id: <DJ4XIOT2RVMT.28I5LA2UOZVUI@etsalapatis.com>
Subject: Re: [PATCH] bpf: Unshare cloned skb before devmap egress XDP
 program
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Menglong Dong" <menglong.dong@linux.dev>, "Sun Jian"
 <sun.jian.kdev@gmail.com>
Cc: <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <martin.lau@linux.dev>, <davem@davemloft.net>, <kuba@kernel.org>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <shuah@kernel.org>, <liuhangbin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609100214.337538-1-sun.jian.kdev@gmail.com>
 <L0cwr1-KRSKR7-dJdjDmJA@linux.dev>
In-Reply-To: <L0cwr1-KRSKR7-dJdjDmJA@linux.dev>

On Tue Jun 9, 2026 at 7:06 AM EDT, Menglong Dong wrote:
> On 2026/6/9 18:02 Sun Jian <sun.jian.kdev@gmail.com> write:
>> dev_map_redirect_clone() uses skb_clone() when redirecting a generic XDP
>> skb to multiple devmap destinations. The cloned skb can share packet dat=
a
>> with other clones.
>>=20
>> If the destination devmap entry has an egress XDP program, that program
>> can modify packet data. Such modifications can then be observed by other
>> clones sharing the same packet data.
>>=20
>> This can be reproduced by strengthening xdp_veth_egress to configure a
>> different source MAC for each egress device and checking that store_mac_=
1/2
>> observe the MAC configured for their own egress devices. Without the fix=
,
>> the SKB_MODE subtest observes store_mac_1 receiving the MAC configured f=
or
>> the next egress device.
>>=20
>> Fix this by unsharing the cloned skb before running the devmap egress XD=
P
>> program. Limit the extra copy to destinations with an attached egress
>> program.
>
> Hi, Jian.
>
> This sounds like a good idea in this case. When I have a look at bpf_clon=
e_redirect(),
> I found that it use skb_clone() too, which means it has the same problem.=
 The
> data can be modified by other xdp prog in the destination NIC if we use
> bpf_clone_redirect().
>
> So maybe this is the default logic, and I'm not sure if this patch can br=
eak the
> existing users :/

I think for use cases where we are using bpf_clone_redirect() to use
one clone for inspection this would add an unnecessary copy. Maybe
adding *_copy() variants instead of changing the *_clone() would be
better? That way we wouldn't be changing the behavior for existing
consumers and the naming would be consistent with the skb_* methods.

But more importantly, is there an actual use case for the kind of API
that the modified selftest requires? Nobody until now has considered
the existing behavior to be a problem.

>
> Thanks!
> Menglong Dong
>
>>=20
>> Tested with:
>>   ./test_progs -t xdp_veth_egress
>>   ./test_progs -t xdp_veth
>>   ./test_progs -t xdp
> [...]
>> =20
>>  destroy_xdp_redirect_map:
>> --=20
>> 2.43.0
>>=20
>>=20
>>=20

