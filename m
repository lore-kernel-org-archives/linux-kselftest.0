Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525026;
	b=XKBgAO+stHA/WKAT42q64q1Q579tksSjMeh6hM/dikOO3p25lCHLbyazIbuIAntpZMZ2
	 IdGrGxZx8q0eDjRkI5m48IIZW/HcG3qmxrlqk9VogZV+XEn8l3lYteuQnI546LBs/24cu
	 yToH6CkguB2LmeNQAcRpKY7VjS+rS5eYjdLlONyId0UtC5IcAPjIJeFjvBjxXxDRSyS/M
	 u5XQCDzK/auLJgdPETcXjj1eOF/JfhA3o21KNYiODItKld+EDybfkFqhYRg4pYa4fczwD
	 ngZZeaBbm9vZoRK07z+CZ4rv3W2NZNuxLC2y1DE2JLHx/M1JRwZNfy3S/pGZe7Rf0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525026;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NHpzrGhwScZQqo5O3e3O2msFByF8OHa6DDMLJsoZ0Lw=;
	b=ipMnFCOgYBvNN0qdjk/4crB6Pxnk21qfHyASoUOWdH3ZpS0XgpNxCrAXRWJei2dE4EOX
	 VGRWGh4At7sdSsmCBGFqL+xeHANHfmHrESQBHvDvFSjwE9K48iCHaju2GQqB6rPdGYvZ8
	 EvwWNlkQ7UCrEby9YT2C96NevX48IKmp0KyqOvSw/muxdh22rkCKq6JyGhvuMBmJKpy6J
	 P8VUaK6wER2e/3DdOGW7C17FUm1BfvjmjZL3ED94jYFQ16lEHgKNmnxwvnDf6nGmr9B3I
	 0Sb3LnCnd2/Aq0kk6JFjJkYk22j4tV+0DowaRXdajX0KIVrZjojyboHA1f0fAmziPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=TpfD+fe2;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B3606A31C;
	Thu, 12 Nov 2026 23:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=TpfD+fe2
Received: by mail.grapheneos.org (Postfix) id 385623C08EE90;
	Thu, 12 Nov 2026 23:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794525025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHpzrGhwScZQqo5O3e3O2msFByF8OHa6DDMLJsoZ0Lw=;
	b=TpfD+fe2XbvMUKrxV5bPoum/lSqERE3OPAsv8/ZAM4Z5IVIjJt5nXxClnXmYYI9rNe0xnf
	xSXaWjsVWiY5W3U3PwxDYT77BcKP0Dmvlzd2C0NipnrVTajy3//NYXITh4vzeqhc+NpbW7
	heCXxlxn755vPT/+vVKnmq5WWhP4e9S5BkLpwGYjPG5hrq1vxJLDAqddPXqELLszV1ZD7p
	Pua3V9LSny60FH3Cse9Jj1GWVJ9o7u6PjFOLtI9/ZL54W/2LLXLNHvU0u0CJTTb66tbTwS
	WiGvS7htiPmV4RNAxneLUCttmLISdzfSbgjPT/Ka1YbA/bBRav8A3ZBOKKYtFQ==
Message-ID: <306d2707-3cc8-4899-a0cb-df36a53ace2c@grapheneos.org>
Date: Thu, 12 Nov 2026 23:10:17 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH net v2 4/4] ipv4: replace obsolete routing comment
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liamsmith827@proton.me
References: <20261110061536.10811-5-liamsmith827@grapheneos.org>
 <179451823662.2199510.13028840415362290242@kernel.org>
Content-Language: en-US
From: liamsmith827 <liamsmith827@grapheneos.org>
In-Reply-To: <179451823662.2199510.13028840415362290242@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 21:17, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Is "always taken for multicast" accurate when the oif is an L3 master
> (VRF) device?

This is not a legitimate issue.
