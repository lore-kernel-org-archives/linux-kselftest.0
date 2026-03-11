Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3D375AB4
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229793; cv=none; b=gRlDbyCPXFGz9/d8MAXMY1qv3tkhOTPaD1FG8pQJCzQOR+0RvGslavs77yRAcpMVOGw68yv78BuK3RtVxuoNbRDVqrS6TEdNPit0V71cEuw+Ai5/fy3tupbicEzX6186iwenkXfQnDnK4ZC7yLLT1XRSLWnkc6Qt2qFHQp3RNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229793; c=relaxed/simple;
	bh=kqXVxGne/MWyib/ntpXgb3tQGa6smsxb82pVRytJqLA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=KX24gM3xpRIeYJY/cFCl8e6LLBDY0jRe4cOQQgTqADBpaDSxgpVeVFUeJqD+Hkcv/K6kcEv9tI1GUHThqo4rEjAMdwxjbPADoYX4QuAXfeKF56BW8jisYka79Y7FI0RAwA78+5wiQNuhC9+UrW8mFRSQmBPWwBCmH2E0ppDpH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET6O/QAb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET6O/QAb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439f5abc829so1430031f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773229790; x=1773834590; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gtZWJKK71/PDQsHfoE3LMJRE6oUsBVmqxC597OJfIU=;
        b=ET6O/QAbDRbZxAf6vYWT/KmfSU0kQ6/f8dhdtZi9tXJU/XCCJqkM9iuA8z/pY/01mQ
         pwJ13qH1IvNNhexgd8cmapOc7ZCIH3EaHoUf5aKzZVRLcl3uN4K4yrtNNNP5BGMNezNw
         IfKFo4h2H7/MslhCb2oOLmToAg514m6mY9AUaVWMqdygE5hvklSuVEdGb7/qO4EM93NL
         3whpakSDkNOidDapdaISrzm5Z1v4iA1k4KCZjkKZ4M/pGjxPhfISadnJRBEIM2I/bJ5r
         B79trOhuYsNXK1edw5vSAUu5AxJYrfScdiuPD8RRBIs/3/D2fsA2DJOHxdDO7Mj80Oz8
         yQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229790; x=1773834590;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3gtZWJKK71/PDQsHfoE3LMJRE6oUsBVmqxC597OJfIU=;
        b=KFNRKi0DK80/5XcIMQy/lqH4MHtXO1wxR1oQNkLzs+l6n5LiA4cTF7fIbrPfM6bQP6
         GnhYDvYG+1UtMUF0vd9sJLDFHbKjBLxX2WWH7Ij8hrzE41C9ZRZcl4K0PyjV46scVYzo
         XcoFe3msSXMGOn7aLFit6uqvCfXbB1trJxDuUEcdIso7lmwHMlyoXZf05PcEV8jX0Yq8
         FzCWrSOjGpe9+KzvlfCgAXAkLVkNV13PF6lxMBuHYWOG4nXPTky0AuzMMthmUsroca9R
         p8huZ/9ezzVu4q6pCtnW7qSzZW/W3XChyxPCGFNIeqxTy/KUTsO1vBjunyl+mrRZirxz
         +ySA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJzqm6f7ZcTlgjKlmUccNW/2l42TwcRZRs6EDyJz5lEJFMRMQoRs5O5JjeUVuFUP3HbJUL7jf4Ks8nV70do8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIJNZFoRqHyGC/8SztZfG4r+ByO+wrHGy/8JTp4lIM8PoF3KX
	iHxUnJ5Rdg2A3dVsuMMv7ejIbwoc5bVIzDZAwvAsD3RY2iAJ4CNme4NDi1sAng==
X-Gm-Gg: ATEYQzwVyNkYRulWUw6zKWGYlwNL20J8JULbh8smd+OHkNSpB5dzJKgT0C9xwrLS1kS
	No1ie418YveYDqEfqiO+7D0Npkd4TUws5sXCmgrCoKspWYNSjwcUmH+br80nHBmPYVi3JzNk8/7
	nAQzgwREKsrEvgn3Z5cVuG62wAt/C8YP2HDLyVNDpzrKGen1cDvTx/pZCtfXBiYSXjwC+3iKsuG
	uUWtT32CX+rvUwMbV32Z2hkRpO3dOmEEZef6Zc40av2OkAN/r0u6PJe6aYwQonVdsOd2PhymORf
	5MbupsE5SLfaUEd6rr/8QtYUfjx76Fl/EKSSzvWvC+8dDb7+mkrUOQ9U1swEX4byG+f7tN/HYLI
	SRrvYHT4JOLFRdS0/ggF9a8OdcglSTEs0ibITF9JcIw4d2h/DJOAfqKU88jUWRgsL85WEAHzsMg
	IzcsZ+f7QyvEpMG6DxzscOl7TQoQ==
X-Received: by 2002:a05:6000:381:b0:439:b628:90e0 with SMTP id ffacd0b85a97d-439f822a51emr4501917f8f.28.1773229789792;
        Wed, 11 Mar 2026 04:49:49 -0700 (PDT)
Received: from imac ([88.97.103.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d5eesm7181960f8f.1.2026.03.11.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:49:49 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  shuah@kernel.org,  sdf@fomichev.me,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] tools: ynl: policy query support
In-Reply-To: <177319682153.3014711.5472638473199917370.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 11:30:59 +0000
Message-ID: <m2jyviob64.fsf@gmail.com>
References: <20260310005337.3594225-1-kuba@kernel.org>
	<177319682153.3014711.5472638473199917370.git-patchwork-notify@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

patchwork-bot+netdevbpf@kernel.org writes:

> Hello:
>
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>
> On Mon,  9 Mar 2026 17:53:32 -0700 you wrote:
>> Improve the Netlink policy support in YNL. This series grew out of
>> improvements to policy checking, when writing selftests I realized
>> that instead of doing all the policy parsing in the test we're
>> better off making it part of YNL itself.
>> 
>> Patch 1 adds pad handling, apparently we never hit pad with commonly
>> used families. nlctrl policy dumps use pad more frequently.
>> Patch 2 is a trivial refactor.
>> Patch 3 pays off some technical debt in terms of documentation.
>> The YnlFamily class is growing in size and it's quite hard to
>> find its members. So document it a little bit.
>> Patch 4 is the main dish, the implementation of get_policy(op)
>> in YnlFamily.
>> Patch 5 plugs the new functionality into the CLI.

I was mid review, looking at a couple of issues:

- It would be good to fail more gracefully for netlink-raw families
- I get "RecursionError: maximum recursion depth exceeded" for nl80211

Happy to address these in a followup.

Cheers,
Donald.
