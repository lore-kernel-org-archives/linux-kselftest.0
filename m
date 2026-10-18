Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D0321F5E
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292023; cv=none; b=NEN2Y7x2NNr3vkLlENU7nxJjgTo/PCcz0KJQOxw51AJ6qJYEQVSGdMewmxeCG3qu+kIt5lLILs03neiyBADcFOAXjZxIaaVtoAaLjILspr/j0I9us+yPwOz8J8xT8Jl7onWLTzNDj67NdeQYfX7uLQoElaRgyar7gaBNtyo509A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292023; c=relaxed/simple;
	bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=in7DS/aHMLux4CVfKkIscVgKeK0sPqFq8S6sgXwU7WCboHHuzZQx4cYM5V/Do4XDnUOrVBWaMCry8A/Taf2E6XMNuBIKZ4JHwT9KaHARPIburiXvl9BXc1mrm+JgpmNFeHaPOXZJlmpNN/IeubuIuuY5sWSpLY5teQsH14qvfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=vtjpyZaM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="vtjpyZaM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2055573c8cso122708066b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 19:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792292020; x=1792896820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
        b=vtjpyZaMej8Yz9x2R5/U/H0oFkmd3hnmdPU+tCMBIl1+WCZSgQsF7LWmQmtryy6LoV
         EFNF4qRpkjX7Nm31+nqoeWOUhatLe8DTxdggm968U7I6G+/LGWEW0h5eR4YRIKkfIpMG
         G00ug6QsitHLKRXrLYYdm9LE+jD8wFyep0WYencNQFTY0teAeCZ+dA5CcsDTOvItiVMy
         EfNVYQfz3z6APzJkg5rqkDHz+c7LAfQkHOL7TmFPhg1sdGswogyqUg+GCszNaTsIBCRM
         KQVRmTjrZPKRIngHGnG1hwkcfx8hRCsHlbIv1ShIqbwn6WN3uvlP2ZOj6mAZw8TtdSSy
         RUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292020; x=1792896820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
        b=b2u6sNhlA5KmI/vt63UH5OLGM2JLE/PNcu+qiyYUs35Do1VMxDnMd0IgVwzq+rxHWr
         NzGRD5mZGLCLka8HVN4NushwOAIER0z/RN3vH4ZA4acri3Y9cgur0JyMebYf0oR5MiWy
         HMg4NYHG9Vgghs7GwDfHKime97msR+7x1I4WgPfWcamsJZxT6XVkqt7Bro6ewvLtZJi8
         b+OqFTZhN9xsArNX1GvaOYZBWMH59acY1uYUCWia09bTQkszbjNB5m2qE6ab9bT6LnC7
         gILy5NLSMkaKd/T6P118UlblIlh6MI9YvJvBQnIqeIDXXaEoMXPbfSXzi8JPgbX0ThAT
         sqDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgT53fsDaIEu4qIYyQOYhocO/AkoczqnctOexM0Akt3v4bsMGtaieY6QLu8j88TjdB/H1dFuLKPRm6LoxgowU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo4UZTJ5+7XRdTC6Ly6RQfTPv3f6IgZK5yp4AB3I5vBzr73LZz
	vsrc1nFeMcf6S7frqj5rESxCaRseuf6CIJztVQD8TX4wZNfZ4y1X1zcMWlFY56o3+Q==
X-Gm-Gg: AYBFou3rb+zvCXfWlVChiKMGxW9yqivAwSArsvsB30ZmJO+VZp/TKwSadN47BM2AfqF
	0ORaxD/hvoLhmxYbeXQ3xxyGEu34iTNxMIyDb+9g8X5k0rnsae0erWxBkIyyY5cmdsjBwuD9Fhb
	yExnW6u6zJ7xo58ri/e3O4A9WWuIiDEtD2PfFG01Z4MH+1DokaxUbI5sgoumeefCw9ATVHk+ubm
	alnq/EuWQGMT9OZLi7++olaPUtVe4RPdHu437TGt2EaKEzNo6HTNZ6MDVppNTDeTp59mA3/v0i+
	xt/5sYC7cLKrHfa2qItRIcWtfUnwSk1+YH7+VwYyurU0l955i1FKJNEJXXVtQ4bx54kPatnjJUw
	YJPvcqxkVkvH8wlDpg5ypVZ1kffJIYDOC+hcshqDnZ7UEvc5C7XoGlN/38768X7XHVBnOra5BbS
	b7Uq3BKH6WoMvP49UVa7eJGclCwvfulReSx0dE7daHXoSiz4Djkbq7vhCMIS728bfynA1eyYJAE
	2NBwkI9OoaNe2a+aFLRLC/fZDvKzDJoGm2Vj557EXRPcL5mmfJDyQKQGoMFbnYluYJB5FUy3Gxi
	BFhJ/41bzu9xqnM2ZuajVo6/2D3Nbc3SbK0k9BpJ73LX7krm0xPDM5rAyTsrt7o/q0kNfk8ynG5
	edE89Jz+2Ec1/TRjxK3G7UaSMZqJ9gkZWIFefhLPSsJUlyBiIB+NuGLo3/9Pv2kizchrYpOHXbe
	PwyPDa+G3O1QSbrTnT1ebrvZOsFNXNIt9CAwvJuE2Hk2oC9Wzc7ROoVwWEbZAI3QkH65Wv
X-Received: by 2002:a17:907:94d0:b0:c41:285a:46a9 with SMTP id a640c23a62f3a-c41a08d9fc4mr265085666b.46.1792292004094;
        Sat, 17 Oct 2026 19:53:24 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f24740ac10545cfe8be1a407c1.dip0.t-ipconnect.de. [2003:f2:4740:ac10:545c:fe8b:e1a4:7c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd1130sm227219666b.25.2026.10.17.19.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:53:22 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@nbd.name
Subject: Re: [PATCH nf-next 2/3] netfilter: flowtable: update upper device stats in the fast path
Date: Sun, 18 Oct 2026 04:53:19 +0200
Message-ID: <20261018025319.1445197-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQmpPlfT_DSd9dq@chamomile>
References: <atQmpPlfT_DSd9dq@chamomile>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:53:40AM +0200, Pablo Neira Ayuso wrote:
> I mentioned it is a feature that these counters are not bumped,
> because packets are not passing through this devices in the bypass.
>
> This allows users to see what packets follow classic path?

OpenWrt users report it as a bug. On my router a 268 MB download moved
0.15 MB on br-lan, while the port below it counted all of it.
conntrack already shows which flows are offloaded.

> But if you insist, then explore a way to synchronize these counters
> offline (ie. not from packet path) to see how it looks like.

OK. The gc could add the conntrack counter delta to the upper devices,
which would also cover hardware offloaded flows. I will try it
downstream and post it after the fdb series.

Julius
