Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D41DFE12
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 01:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769994905; cv=none; b=cNZTAXHhng+Z2xQRtNCa5YP8rLtUzXODHgRQLFdIJ7v2h1+AdzU1hY0JZXl61UIC6HOaqZwd9QGqbxaLwxwEL+73INrkI+Sb7lLiuDfYIyg5TSsoR5rP82Ixyf1ij6+sy7N1Zi64n1tFWuCFxg8LmLuD4IujXU+/L/aGoiODBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769994905; c=relaxed/simple;
	bh=syzntiNe7cMdUYOVhT2KP31mPnru7JZE8PNdiV1OMh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmCcTUC6aq2p61qQmtqA2TObhb5leu0rqTmdgHs4JoEh/waoMa77EXqslg4Qo88aTIN/UGkNpMo3aMb5p/6LxIqEsqIGrP1v73owMf6ZIStcvfX+MxPikMrs64qH6Pp9lwbj0np8hSVlgUPJ8LsMAU6dM3H3pG/uT7/n0oyXG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBeRH6/n; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBeRH6/n"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a743050256so24354655ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 17:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769994903; x=1770599703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wuc/jGt1/k/NrtrWQcCBMsVvTpJg7wRrACpBUDrc7M0=;
        b=LBeRH6/nQgbjxFEdwr+45orN6IfDgjSOUi1mBUpJ4E3Ghxq6uzNkk9QXhcTFYf41N6
         R/zjBEnB8+zIq3Kffxk8HJJtZHQp1K5NQxNzdQ/MoQqvsEJl6P/wJ8tRIMlvDmlXfcqq
         jLAh/Qgb0w69Jasr4o9n9TEs5Ul6jAagAN8DQEw0oKWdSPjp7Yph3WmT5qs/fAQWiAb+
         dYmjS+YwfrN6ZPnOdUPTg6/4XTLG32clwOlOBnW2zitwJoskBU4CJOekuH3Cgqp1XCCy
         EX6fSn7ZUyzPcq379W8eUKwX5UZHrz84DCpnhDMDXo2Ik7pWnr0bYrT7ld8R9BxZuCOa
         bqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769994903; x=1770599703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wuc/jGt1/k/NrtrWQcCBMsVvTpJg7wRrACpBUDrc7M0=;
        b=m1lJ22oExmUmJuF41H/k/nPvBv8cZW72STyT5LJ2taBgdrGuV1JyQIzzooJU/s4oj5
         7qCEvxrfqfGE1KLS4Tbr1USmKflRTP8ygG2fSIgwhgyzSPFJIM+Lxi4d5AWgJFliZztm
         qahoVv3dJ133pnnqoad5ikMtCKb5WuDO3JKRqPgmoJD7dnhXfcPPvUSV/drbWogAlqIj
         hdsGGo8jKZgT17/FXvFahva+LBknuuF4fsU2paTT3a2WdTZR/RdZK95foab0GcLgslOt
         /ShKMuofLmxPWjFNbWFqoPUrEWzaXSKdFmQ3lq2qGRsM5kNB8LBEQQHkhdf4WaNxtyV7
         QhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsskY6OzSsbLD/uO0MoomEKoa+Gk7BCZUqCi6GH3Tt6PKFqIfmBDSi38BSWCCNniKiPnhutWpO77nOnnC/bsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+7hZy/zQrjvoN3AcIBi8kKFdM4IF3oFDezne5jWC9SLplOo82
	TMcEtl8OwlwxIokwu9+7VZCnZ7CnqMaxAXh00dnImfVyKoWRQ/6PTX8g
X-Gm-Gg: AZuq6aJiELzhQlzGJRfYmJKXHRVCWsa4T8lFw0wIjXBT1kQoIwqPgfzG5RopxbRIjj5
	xxNhCztK3Ryug5txRoDXGJCAF4UFu0TngUFemks/w3YVfpvaAl1jJh1WPpSZwhIVIkmGwLJ1xVV
	nRfszGYuuIqyYlkoJK9+krrKCH/mW+nQ0j3639d05MpEDuR1PV1Pg/H11fPXFOt1yw6DM3Ta/QZ
	hYjdWPQyCaI0kVJYUmdHUoVWTthl8zDwYhjkSwwMtNn8SpvM1UyPgfroda5a9Mn9JNMPTuT/UtL
	DQm1tREF+oEEWcbXt/pPRK0jVMyUMJxN5CSWuM3Ezw2l9zSdywQJqGPG57QDtRxKPXhNjcNKgmL
	PQLsjyOMIosolkTNbvkIeQgIc3ARwrzw9U3HkuABohrAcTWPpVDUFWyQSsoTbArdvqdpWD215r/
	E26yEXmItkHQuho9A=
X-Received: by 2002:a17:902:db01:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a8d96df1b2mr94411485ad.24.1769994903033;
        Sun, 01 Feb 2026 17:15:03 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da8441sm11937631a12.9.2026.02.01.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 17:15:02 -0800 (PST)
Date: Mon, 2 Feb 2026 01:14:55 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Mahesh Bandewar <maheshb@google.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv2 net-next 0/3] bonding: fix 802.3ad churn machine and
 port state issues
Message-ID: <aX_6jyAQaDoqsR3G@fedora>
References: <20260114064921.57686-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114064921.57686-1-liuhangbin@gmail.com>


Hi Jakub, Paolo,

Is there anything I should do for this patchset ?

Thanks
Hangbin
On Wed, Jan 14, 2026 at 06:49:18AM +0000, Hangbin Liu wrote:
> This series fixes two issues in the bonding 802.3ad implementation
> related to port state management and churn detection:
> 
> 1. When disabling a port, we need to set AD_RX_PORT_DISABLED to ensure
>    proper state machine transitions, preventing ports from getting stuck
>    in AD_RX_CURRENT state.
> 
> 2. The ad_churn_machine implementation is restructured to follow IEEE
>    802.1AX-2014 specifications correctly. The current implementation has
>    several issues: it doesn't transition to "none" state immediately when
>    synchronization is achieved, and can get stuck in churned state in
>    multi-aggregator scenarios.
> 
> 3. Selftests are enhanced to validate both mux state machine and churn
>    state logic under aggregator selection and failover scenarios.
> 
> These changes ensure proper LACP state machine behavior and fix issues
> where ports could remain in incorrect states during aggregator failover.
> 
> 
> v2:
>   * The changes are large and not urgent. Post to net-next as Paolo suggested
>   * set AD_RX_PORT_DISABLED only in ad_agg_selection_logic to avoid side effect. (Paolo Abeni)
>   * remove actor_churn as it can only be true when the state is ACTOR_CHURN (Paolo Abeni)
>   * remove AD_PORT_CHURNED since we don't need it anywhere (Paolo Abeni)
>   * I didn't add new helper for ad_churn_machine() as it looks not help much.
> 
> v1: https://lore.kernel.org/netdev/20251124043310.34073-1-liuhangbin@gmail.com
> 
> Hangbin Liu (3):
>   bonding: set AD_RX_PORT_DISABLED when disabling a port
>   bonding: restructure ad_churn_machine
>   selftests: bonding: add mux and churn state testing
> 
>  drivers/net/bonding/bond_3ad.c                | 97 ++++++++++++++-----
>  .../selftests/drivers/net/bonding/Makefile    |  2 +-
>  ...nd_lacp_prio.sh => bond_lacp_ad_select.sh} | 73 ++++++++++++++
>  3 files changed, 146 insertions(+), 26 deletions(-)
>  rename tools/testing/selftests/drivers/net/bonding/{bond_lacp_prio.sh => bond_lacp_ad_select.sh} (64%)
> 
> -- 
> 2.50.1
> 
