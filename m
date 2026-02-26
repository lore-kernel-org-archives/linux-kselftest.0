Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994322E3E9
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109622; cv=none; b=A7buO9mEIH9zETOYGJTcldzimdp17x5/qKT7/nRoaWAKhRS4SiqYORVChUMg19gWxKpBlYk1PPQhkajZSWyVGZKweR0ujxVMnQFUXjCH/haJXTpx8q2afdCC6P5zO82tQv4HOxoY2w9WThYErph3zGEY8mz2e6M0m1uz2MvpcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109622; c=relaxed/simple;
	bh=jEr42KT8rQz0J4fP2oyOgD4lF5klf6J0VQ4i4eWJWNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxF6HXjEtV8x16nbIc6iYcq/FqLDFmhA1iarORY31ZNSyu18Xr+6Wqg5cyeNatjJNflClXCYPDchstPVLQKen2mgRBJEczDeutzuUomly3L1bDNiTV9FHfwfNi+zE995OJkufGr6WZORj43B8Es6s5QW7njcq+GZ2JZ9b6imFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEjwTS7s; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEjwTS7s"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso312303a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772109621; x=1772714421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihv8RXYdMK4zG1euH+qM5DQoIBC1ZNF6k3w+q1JGEmA=;
        b=gEjwTS7sJTCKnl+JCzoOLD167TShlN5XZRN3Yb2xkRmU68SXiWyRlTARiatNPL9Jwn
         42td90aXbiOxFg6yUqnHpTUsZvZTjYMebvoE4D6xGzZ1Gxf8W+FZtsTmSpO1EBBmL1+4
         tHHjZQyphppDJ8xMCY4CMVFjKLL8YqLoHQxqmmKoKeiXXFQoAwib3Z8igVoY6OW45LYR
         FakEhYela2UO8olLqQkFn8uOcDK6S9YJqz2MfmBVyrk/Mc3n8/AxsVy+hnGEnSewTzzN
         H7IY/VRW2CNkx+28jjGMN7Xnx791qbDrznRL10wzNCgsmB8n2FDYA0mpDBMpx6HMx3wf
         GJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109621; x=1772714421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihv8RXYdMK4zG1euH+qM5DQoIBC1ZNF6k3w+q1JGEmA=;
        b=fVavkIJ6qDb9dhMhXebhLijYzWkNVbXcU4UXAr7ol4xYLgLyk+Y4NQnjoC33lz2rbI
         o9xB6767FLpcIbtjpMDutVlgzhdQpsH5VaycKbmqKABZ9bPlz2YzL/5U5DaIajrbSO8a
         zCGersDlIq8CdKmxRhavNDtyuh7nrm76Vgp1VHjnqfAgo0IMYp1BzFSGI97QkuDsctpK
         djwTc2lNMmteBZOsx9F0v4W/vyjsEi90WoIuLTHtHVFeCfbNTeQet4IwBa6IdWyMW4bz
         11GgLEzSxugi/ZS0gC6uuGWTtd9ycTY8Xv15dcGoGW8LPZL5EBjNOZn8Q7gGbfKKLzSz
         Q/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVbBT4ZfNQaLoudq7SS5Zxf71eY6v6hDJGP9NuMFQrXhecaDF3WBtcejo1v9AHVVca/iridbD0ACJRz87rWnaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/EUfrNRCuhxutMHNej5iSdndLUqbxrQfqJ0dyhvfymSfsxYDH
	vaedwQfTb+1ZzEXh/Z6B2U3O14t+axepfgwfxLEOz3BIqgsldttxDFiW
X-Gm-Gg: ATEYQzwGYdL+IIzY57ZGfDHJANqu2JruwsNmQQfu/Y9eAdnuCk8y6nWDNFURZrX+0hB
	sj8Q1OtLoeEJMN9nRmXnbB9TLcvyVCh/Z+OM0kEvZXBDqcXo97x1NHVZOoFPN9LMRmmbyiu/SSC
	0dFcJB/TLD+O9HJvZb5r4p/hqcCumxQAUQXaEqbO3nOq0LJTPuiCfRPhNYPkYPpEXNpZNDqwE2u
	jBLZuLdJ840SUmuCi542la1xUwJbCoudVW6X1092V2NBqhk3JKTXj6nffbhO7FeTpFDAi+AmEIl
	/iqzjpDcLS2t0pqUmgLe3M/9XHnzU4XGDMbbSdKMRgFLgWC+KPmn0QFPg5MEm/P1buZiK7Ep6O4
	3BtvYmlrqWnLr/5U0Yf5KQrLGwiaDfhAlDHbqC6FQvqRKW8fZ5P9rKCrb6Q5ab1q0XJvojV/k8G
	ASxCBz8V5HFsXbxz7wvcsv2HNjuaY=
X-Received: by 2002:a17:903:19eb:b0:2ad:99bb:3129 with SMTP id d9443c01a7336-2ade9a9fa34mr42511045ad.50.1772109621038;
        Thu, 26 Feb 2026 04:40:21 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa5asm25476605ad.60.2026.02.26.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:40:19 -0800 (PST)
Date: Thu, 26 Feb 2026 12:40:13 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Mahesh Bandewar <maheshb@google.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv2 net-next 0/3] bonding: fix 802.3ad churn machine and
 port state issues
Message-ID: <aaA_Lb4cAAmp-w9q@fedora>
References: <20260114064921.57686-1-liuhangbin@gmail.com>
 <aX_6jyAQaDoqsR3G@fedora>
 <39c1b386-e6ee-46fc-a653-f86fa21e9e9e@redhat.com>
 <aZuzn-6vFrcoD9RW@fedora>
 <4f497c2f-d086-46ae-bad7-44285bc34a2a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f497c2f-d086-46ae-bad7-44285bc34a2a@redhat.com>

On Thu, Feb 26, 2026 at 12:55:48PM +0100, Paolo Abeni wrote:
> On 2/23/26 2:55 AM, Hangbin Liu wrote:
> > I'm not sure what I should do for this patch set. Should I re-post to net-next or net?
> 
> Jakub and me discussed the topic off-list and the current agreement is
> repost for  'net', with fixes tag.

Thanks, I will repost to net.

Regards
Hangbin
