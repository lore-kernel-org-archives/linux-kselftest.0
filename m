Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAA4E77F3
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724848; cv=none; b=IVors/Q0veQVZLZx8hiOybdOljbOikCeqSjB3Qylufe+ySqlgo9379mUKcj8zdTSG6EgARAhQzSLJ5JdPzm10p0Nj4wyGoD8C7XIcRUQ6WUCmF9VCXZaxKydXBZNsXE+K01BPkceO45umJSMJPbivBGCY8OZbdGhfibA0ejF86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724848; c=relaxed/simple;
	bh=21BdaXn+aXicksfhcnNmMDsFu4APPEfR/vUajY39fXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/38bJ/760AdsRNC/Oe215etMpL3oephY+Y/0FIpx3ebT2+9k5jO99qY0PiQ9HCd6gnNVP/+OrD7yIyUd8wX2hlOKoyEaXSFTLxBFvOF2+qmPbTU5YSL3K6zjbujogJWmzWl6HURI/Sv58FZGhF6/B01Q+SH4UbHKb/Z0m2pKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Leo0yHoP; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Leo0yHoP"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso2662804a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790724846; x=1791329646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZrOY01z4EAWqgOPMnx+FKjXEAkFljL8pV12WM+AKhjs=;
        b=Leo0yHoPjD/UTRWJl8ED1nwIv01Yl/TRfPtUxaBq1MggylSU8oW+inVfgbTo95NuS2
         ZDnetdWAUp2CKrZYX97GiEozRHr9VMp5JzlHxKndyDhlxvLFETBBZ9esQtcD7cSIcquc
         SZwAnVq+VIG7lA0uH/tDGNCgWHV4/K43pbOA/6Z9zt9RfNS1W7BZedFSbw7PBmLNsLly
         9iepUgE3+o5zEKpZn0mCbVOSyAf03ocv0UEb6A4/mTq2EFsn06J07AJS9O2BxrULEZKL
         u5FlZTt4Dy2qX2ftbHrqB2J7TJhZ1WmoWaPTzAHmzHdlONhWK+4t5v5OkQ986SPAsJ3w
         rY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724846; x=1791329646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrOY01z4EAWqgOPMnx+FKjXEAkFljL8pV12WM+AKhjs=;
        b=nizmnrH8pixIxbw2L4qnSY5Gnq12IWWQjoc4nYUH7uLFFQCy2U6YH7gqGjbr5ahVGD
         IsdyTlIMYbAp7jTYdBPi7Z8Toj4MMfy4UOC6kq2zMinUqoRdG7ntTpK/C4q8lm3XxqCS
         PID/g+z+qY1/qablM77BXNbujJNw96SYji47tfO2jLJSwU5yDAWUgIG7Ws88PRQKUAms
         zlbqi7kGJBMZoE2IUk1MxqAPNhowJ567DLPqXPhuS6NktgdDl3NwYcLLLtfEYuEF+RhK
         MA1c0FRRL1dvuUUD2iVCVUJYOvwMk4XrxCWc7wC11IftYenCklGUs8/fIwncLS5BXyW5
         Okcw==
X-Forwarded-Encrypted: i=1; AKwUvBxqOuWM6pAlH47S/Yta1SXvr+B+jtJIoQ+RLOO/TacdAeA0rjSjEUhhIknT/MnOB6q5DE1zDanD8T3QAPGhvwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIba1iakh9y5HmcnFSr9PafY57q4PH8BpKTdxDqJhm8QXzaf53G
	MUrIgh8haQ/k0a/JlPBn856EXsQUEBAA+8vxLvDZ2kumKGEpxPgxR/xa
X-Gm-Gg: AYBFou3S5JPGurdWySHrObkREhpJLHihSgWCQ4eWpPW/+cpSilnkUQu4wH8mUH7zdRL
	Ha4E4BqafOmrhwKGOHsWKJ3PqQJ6Bk/RiFVf0Ef3rPPaZdJ34eTTY0i9LGvfGfu28l3oGu/EFmB
	dErI69eKJTDVKn57x9Gft6+KQCOfZzHdGzFF6cBLc3AG3MlAdoNmItkPfYNLk2zcJsfUqCh9goX
	5Gd1t5JyffsheehG7g386gYMB5GL1zOSoAz7rn23tLG4bR6qyqZPLIkvZBd8PMIJRI0UgZSR1Ec
	gt9Xw4lmolweVaWc2jwOx76oLWs73w1cSi4Z7h2xAdkqzCKftnlrX8Cd62iIC8OM1cWIScTjRrE
	rLRx3yQPENwVg5jMKj1zIPjBd3DlKtiI+cSS2PoAv2g9io12vsng6VDid0OJtT2ny7vcMZoCrG+
	ZkLQivfrRGdIfhVX5wHYlbxR7xbKtKZIlagDLzfbhJVlYSReOrWMox6DORSm0a8dO1
X-Received: by 2002:a17:90b:1d4f:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a4bfde6c04mr656202a91.19.1790724846094;
        Tue, 29 Sep 2026 16:34:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca3b0d13sm193050a91.5.2026.09.29.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:34:05 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:32:24 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jv@jvosburgh.net, 
	hawk@kernel.org, sdf@fomichev.me, emil@etsalapatis.com, liuhangbin@gmail.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
	aleksander.lobakin@intel.com
Subject: Re: [PATCH net-next 2/5] netdevsim: add ndo_xdp_xmit
Message-ID: <arxKg3-oojhXAZjr@devvm7509.cco0.facebook.com>
References: <20260928223648.2739371-1-kuba@kernel.org>
 <20260928223648.2739371-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928223648.2739371-3-kuba@kernel.org>

On 09/28, Jakub Kicinski wrote:
> Bonding refuses a slave which has no ndo_xdp_xmit once the bond runs an
> XDP program, so netdevsim can't currently be enslaved into an XDP bond
> and the propagation of XDP down to lower devices has no test coverage
> at all.
> 
> There is no data path behind it. netdevsim does not advertise
> NETDEV_XDP_ACT_NDO_XMIT, so nothing should be redirecting frames here;
> anything which does anyway is counted and freed rather than dropped
> silently.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
