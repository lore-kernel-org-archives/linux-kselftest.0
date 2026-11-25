Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576893;
	b=J/K6Ai+5veKbldWaE819fWYKJpPMJhaIy+2yGYjxlhsNam/z4X27lrLKkT1nmEtPyIXT
	 sKwhs1BEyhHN98Q7CxxqLh4OMtVW5k7McLTwVxe5o2ti90xARjTRo1kI9nzhRaKF7LtaB
	 Q+RNyVI6gtYQ5h696rMEwjLzjVVIoFKu5UsEOs+VkZbu0SQ3kJKNs26s01Oi1HlzxjdVc
	 fsSPd/VIcsowaH+02xSX6NUpCxFMjVVbVxUSary+t39RKgdszT7d/iy7kC+c9ulez1yzS
	 WhVghuWRZnmMETo1WGs9+XVGqnbGq757lCjwk38TCEJ5QeEzeD3Q/zZBmrzHfNjVJhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
	b=t1Ix21OSfFjhVV0N0tOdhfqygvKlHZOYl7ZF2AhfDJhsvygzmEsdv2HKHD9/jbJ4RFFU
	 zPAfGxBohfmkAVmdELhDtDobTlrmB+f1APRQmKmVWalciHIaxbtZtPnhYtrIR0Wkk5OG7
	 T+jbdAdNISbFe+xP425BdtylpT9rXaa5XPOnFML9gqFskb/t5FUkhH9adzsIBTRB7Sqt0
	 9wOZdgknQzn54gId5dgKp+7J/G0AZmaYL7nDIPYyN7SMDd0UsG6GRYyXJn4QmHtwOdHZT
	 b2eyxIi5LYOAYY2Dd91QdpMhl5kOgzvNkagvRuDWO3YM9EY1NzqTVOIRoiOyBLcQMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA2606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 03:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAA2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386cf1041cdso614391eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795576892; x=1796181692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=0hr5G6CiYwviZ48zaFQj1P2lBE1BZI28rhQg/97jLtjNS4k+9YIzro5JBC+nnhbGi0
         TuFxd/JwRym2eyvsjKppO6aEkqIVCyMjJOue3YzcyqDqTaivIX7Z9omDLJPcjujOiHPf
         3vONMosmapHms46Za13J5qGttrAwgfX9ajcciGxnfHoyTxhjpP1tXVPEd19NP8e8GYf+
         7Brv1edZxDBWs4J3zfeM8Bsy0mX6Rnnj1B4Btj1kW0Btg1PmbpKtNsyAS7ud7BtdIEO6
         LAxNC8lQNDQBTq50pzTueurl7xU3RBBmCZWv0RzRBEtUDxlUFgVZ9O9v6dJoAjICg1HX
         kNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576892; x=1796181692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=QWzzYkmVRFl8SVSfiwvw2LB+kQv68UtMymA/K9vLI5bUIhGR6DHSdMS6MozFjvnKDq
         Vi8Ydm+NjwZRisBv0ka9h0R2+EZN6TMDq7lM4dFa7DJMsa+zxO3hiej1Jluja8mmjQMD
         AcoG2Lx7k8yKa1/wtSLYFRl4SigZGJUb3mdn4aUeSUaX7HKVXadjQ1oSP22C+aI6p+cA
         rrZN4p89+aJTN5bEioB3minw4JPb7HzR8Vw5Z5sXJ9ZySDMUIFYvUHY7c9uss0UqY5a+
         0SrRG5qA5iKTzvDH8AYWdq4BkLNBz0M6P60Og0mEIwH/+koLDVGpLc+34T8dHn05GGwS
         VdGQ==
X-Forwarded-Encrypted: i=1; AL+hErEp0GZUYWWgQk3DphExthL755nq7WG3PIIwa0GVmxVtSEogG4PW8SqamOuxkX/ygzTzfDy0l4E1R166gkom724=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YYMkgIJwxxUWrFBPrKmIRhmya/HDn+y7Jd3RBl+lwtHHRT3oE
	UsuZQozcvqCRiEvdiqyOYVKnqeBWcUsujqlI9Ljc/XMoKYDlvOO8MkCC
X-Gm-Gg: AZFdTZfoLHGhBpkaADaNl9N5MRM5o29z4WW7SIIxWfdhPUaBJzVU7CJgWjmPlOT9How
	60uCMQg6FGD9BURBPukV3izrBcPoYCs6bf/WhDEGkMLYinA17fbIyt1MhyJuu2LORWis62k1heX
	8iCiCpewPP+6T5JOo44QK0cw5lxNSD9KqKXdrBHrUEPRasunpd6mMqJWa2o0ONHN6ngO9ApUPUn
	h17FJa1cJEERgb4yh4skmJq4CK37WPM7ycAeoxPDmk1XiFyNFfR0Q8flMg6Os4P+o6oG3c5AkSU
	8N0VuYyQ1riATvu3XT/Hq6SbYtuxcwHvkBr1ndBDg8K60UuhoYm3g9vH0f+EK6nbu1+7HrCMvWG
	GTPDfb1yxAJvioBvJeRUHhZcc7Aw7DCtNZ7v09fXFIKj76rPXcZUwTpKaBmIb6DxJn3CFdbI9ll
	h95sPg3aUmo0fH5bmIOMA4BHDq4sKoFHFJv8TQZk11TVfqKL88Lu1O3sHQ5LTYURtNWpqiiVlmT
	kzoWVEqFAtoLBSD5y9FIVmOhb4HSCNEyl8YziTLInYfOKjN8czdNaUCPxJDKr0Zj9lAFs+wmwWH
	AYPZpif0LctMxPffUgBvRRCoLBeyrBq2+zNxmMkJGkICX8+dGm06UIBaEZH2Hx96MWm7nzsZrOq
	uhU5bZJ6vn6fEX74Sq9W3n16EGUNcIGF4fxdbOJQMKWqHh4loA6HDb/tuGJB/xXyHuYeHa++AtI
	Q=
X-Received: by 2002:a05:693c:835b:b0:386:b5ad:b719 with SMTP id 5a478bee46e88-386b5adc3cdmr7111743eec.33.1795576891727;
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm7256012eec.17.2026.11.24.19.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 03:21:23 +0000
Message-Id: <20261125032123.2664525-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179553579407.3135.13476478403966318528@kernel.org>
References: <20261123155503.2497063-2-anilkaushikwireless@gmail.com> <179553579407.3135.13476478403966318528@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 03:56:34PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Can that window still leave a socket as a member of a group ID that no
> family owns? That is the state this patch is meant to prevent.

Yes, and the commit message says so. This window is not new: it is the
same for groups with GENL_MCAST_CAP_* today. Closing it was patch 2 of
v5, which was not accepted:
https://lore.kernel.org/netdev/20261110121831.01412fb9@kernel.org/

So this patch only covers joining an ID before its family is
registered, which an unprivileged user can do at any time. The window
needs a family unregister during the join.

The selftest issue on patch 2 is right, I will send a v9 for it.

pw-bot: cr

Thanks,
Anil
