Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576336;
	b=CzwENhG+GFLBS+4Qpi+U14n7AHVGWm5jM1zYOmG100L3woNIADW1BsYVUj4e8p73qt4V
	 cdPxCGXeBCViQ+ogeHiPL7Y+JP9hxE/i+KYrRorD6n/m6AxvSnCJ1Q3c/S2mDvAcblhMJ
	 EX5Y3u3G9/wYCrmfazspMzmO50ikrwNez0hj9JEeP0eemF3KrYU1GtsyLBOWjRN6QrVPM
	 yjxFGS10BZ364jbpRWad7jjuVtVb6fmdWnq/8ZktqnocbwJhJIDSGPOa1Ield8GJ21K+s
	 EYfWTPEnWhKN2DttY7P+AmKgLbGwg7XTpIRDVkNgkFXzbK9beUvLmr41hjh3MmqysVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
	b=bA1CDW5oGi12BJzCrDfY5xBRg8sOkMYxaFlPYT1dFE9CRMHr8B3YkuxDF2NyDAAlrIdb
	 RXjR4o0VCU1vQEI8Na3Nsl6mYmp4BW+fNL9ccBvHT8wP4MePyUcZB6ioxDM5oMzJ2AFec
	 SkTnMAEuzNvhX2tGMGTmbsObL5lQDoYe9c9wnzFgrPvT7hrQHBp/OvvXXRy7miqkDwS+V
	 V/x6yuxEjKYTNZBsk5da5fR5VoDVlh+NAh4WpOk0WiuRoIo6y32huAODfM1mDn5X+9T9u
	 GSKGgXY015Iu3kI6s9DGFuQc+4VXrwlPjz9VAv2KFIuyoGPJU9+ys7dfhPXfWnCRrRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bFdHvy08;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773F9606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bFdHvy08
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b118bea471so3057667b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 02:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576335; cv=none;
        d=google.com; s=arc-20260327;
        b=beMPLY54SJ5ZoERjL7SSaTWf1db6Ulo5ff8IAD7Z3II/llIq09qxyds/44VnBwJcfu
         6DPvziXvpnHrSVpjVwpVn1H5G2Si/3tQ4gKmvuc6G87TjoDYzJ0uVjwLrhfdNP8SUsRJ
         sYlM0X6QL7+TgVyJahe7L7nd9ADuV8tvEd06sKf8l6TMulb5doUMK+c0/bzOaNpGSQjP
         1ErSj0AD//EEH+sUGvaCiNqW65ZuiFGGFkNa6nMAGcnAqGGiVTv2teauI1HHZVy9pKZn
         50RzfiGQU2mQy4J7+VjkYPcGO2jttXCS14eSWeARklr69vXJrBvPwjf2fjviAFOWOFPM
         aomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        fh=/KzDjv/1OlZJMsTZg83nfoyl5jScD90McBpf95V7zP0=;
        b=FiNfvSW0N54gelUTWlzsgpon3l8SU8tdvEwfRWgGEYc3mhq3USXM/+IF8PRLabIm3P
         BZ8MNmEl/wz15qoXlomQ5c910OmW2m2octKrU0tI6uA+aihUIIJmr46fiZbbBButfmkL
         /ZkdgAr2qzJmmdkNIcJ/0nQ0mNyLVkiCGkso1NJhRuv6FCxZxGmBpbDUgiSg8ALewJ0W
         5IxifmNTPzCbP5ewJ36rwThKDJNXIIORgE0TWC9kNB378/wHhUuq0cDB32FGoiEbJlQE
         eqx75WNWLgiUGiV5znRcTZ/M9iHQTn57vz/4NmnIBZLCRhe9OMGxoBOez3iw1VW9vJYO
         Zl8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792576335; x=1793181135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        b=bFdHvy08P5qTB+4vC3oEIRt/xKMa3RZ5dVG7cKzf2O6NwQgBTnKsoJAKPu00bMNLqX
         eDayHVV406lPN30nVfCqvhQsSPAMYRUsDDx/Yfu8By1+D71d6Xs2cYpYqDcNkhyuHWUr
         QTWvxkxavzRGSjvR+pobQhyGFRotU54L/noqHEgJG1EYXju2pcCE8w8XGdtXZI2ELx9v
         SVqkS0saCjWz8uxENbAQB1dqqIeVrCEl2mUE6lr9c9g0G/CctkGjy2YUYbz4fdva9jH/
         pl//1WVpvsuc7nb8TCyOSdjeFtNpUQvQTmZDg0TltV5F/bFhVAWImJnglr0HUmpi+9PZ
         a7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576335; x=1793181135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        b=M3q1MA8Z/ujxdC9k0HzbPwjvrtJXKAAsZ5/Rc1gLeNLkxz4xwjfsx02mLT9JUn1W86
         boDqMW0moDZF01myoReFW7ImE44LqJWfQWRtY6iLEqaJEbyuyu5gKQh4E1OLBWhC09hf
         K82MdHJgVnRpVB95NsfncUpxo2jXmfBjI+8DwJmDe8PltnTFMsEQ3DA89wjFp9VndKUz
         BsEOKXqIn9N0X6WT7XJxuc4625CYAtmJbw2xHIKazBcC7f7F6ZiHwkPTXDUCNF3hF1Tw
         FUfCqGE9jahY75y5XpLrcSbaRkS0vEey2cct3nF36fd9u+6cCkXbjaDCWfgH4Z3yEcgY
         nofQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9MHkqzTBPNWu2eCjsoQpbzPxUR+vEN+vlQ3kJua5uL1je5gv9VpdTGlBcnZxXgfsTL5u50irXfGowzXO0oBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjKHc6RoU9cqNcxcOd/VoVvZFbWlEdIK6SxAtwNrTyRQi4S8Ua
	qrKmHP3H9lPhaknu9cXBSqjH0hV17gkEnyyghFLYeNaBCawJWfLnftXZMNXHdb7kxEM5+/RCNpc
	ZU9awoqXr8stzNyqgg28IgZzAbEY+ZD89rnKZf794
X-Gm-Gg: AYBFou16DC3A+Ox5OtHDtjlC1sKbkoIcARniGY0hFKuZJ/SXLe4Z02MwRTtJoM2L8Ed
	vRzd7VYJ2+iPOTsDL6F7XqPCLDrmo3P8R2UDnExNezxrZzA4ubgLsA7u0pmKzMgwME2dgssbgfZ
	1s2UsFQgpihuSbjtbQrG1T2F8yfYHqJ727Toy0gSL0ywfmc9hgYfqPDYH/u1BMX/PoGU4E+2ICs
	e/KXWNeAmNzYmQefpUinppyiD7zzFgVyGg3xGcJcq9gz/ymKPMtBLrptjEcXns93sEx6eCoDf0N
	z5kzTIbPpa4Gh4uy87JpjQv7QQYLoxHn87EcCrYNMvo10krk9g37AVblkTNg2LmspCD6uKzwNch
	DkAgWgJx8H89713BfWe5bOEVes4k/OLVGuRrr+dpVgkzjWH1jT8zg9MlquN68dSKc7MBChT+jKh
	DxIKvH6jjQomHChR2NaSGbgjFB+BH5Aev4hvVcbxyjwG78SEQ+XVPQB3vQWbzd2WnGfuNlzaqsC
	5v5zJ2fX9ySzStH2jviwKKD94DPAPOA++pjUX91GB8RNCFwsvIibSjXrRSmx6bFM/M+rjYHec0g
	RJyEK8EidxrVW2junKtoOHUakBBEbZcG8mQlmHeu6pB+nLabbds79T4JJ+ZHBMQsHZPxRlQ=
X-Received: by 2002:a05:690c:e653:b0:8a9:da0d:1d94 with SMTP id
 00721157ae682-8b133fbd819mr5144797b3.68.1792576335378; Wed, 21 Oct 2026
 02:52:15 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atQmpPlfT_DSd9dq@chamomile> <20261018025319.1445197-1-julius@bairaktaris.de>
 <athy9HUHBPfCBKu6@strlen.de>
In-Reply-To: <athy9HUHBPfCBKu6@strlen.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 21 Oct 2026 09:51:40 +0000
X-Gm-Features: AclHuK-pk6kFTufeu4wo_iVpKWwHjnmfy3Rd4sMx-D_9eg3gvY73gs9VtcFkc1Y
Message-ID: <CAC1t37KrcwpXz5BDrPMpKBdpwJMon=WQWs8sbxDh-FrGFkAaMQ@mail.gmail.com>
Subject: Re: [PATCH nf-next 2/3] netfilter: flowtable: update upper device
 stats in the fast path
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, netfilter-devel@vger.kernel.org, phil@nwl.cc, 
	coreteam@netfilter.org, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	andrew+netdev@lunn.ch, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="UTF-8"

Am Mi., 21. Okt. 2026 um 08:08 Uhr schrieb Florian Westphal <fw@strlen.de>:
> Conceptually, with flowtable, offloaded packets bypass that device entirely
> and therefore should not touch stats of the virtual device.  At least
> thats how I'd expect it to behave.

Fair point. Users could just as well report that as a bug.

Pablo, I have a v2 ready if you still want it. Otherwise I'm fine with
dropping the series until the expected behaviour is clear.

And thanks for giving your thoughts, Pablo and Florian!

Julius
