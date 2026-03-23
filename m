Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE721A6828;
	Mon, 23 Mar 2026 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283799; cv=none; b=P0G9lea1wDrKYLAxri3to27Dc5/a4RPNhdP6/ML3ATPhxzc9rAsYssb4PCxO7WdG2Jlj9M+Vivdi2jzQArQiHYvjR9J8x3gzVYj/hZ/NgQwPLoCAC414jxphLCKauNoEXZa8wn1N7Fjkuee1Nu0OCSKqquPriKVY8DxsfccYW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283799; c=relaxed/simple;
	bh=tj3o6AUL+Vi37eybzPLld79TnpgpT5zl40N8zsuwjCg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VZ4hzPtlHqwyeZYUpqwQo4pZxIumE8emKGf3r8D8d+5RKfjNfRr0wxnB5XJy6euiZxKt4A/bKCrpEIL0wxaGks0T3jSyCyNUYp2fp9uP23de2nAr03NMZLgXCUNepsyB09KjJ7pTeGYlmnZlJAMyD7EeDx76YYKZzMOBzAOyNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=E/1Xp1tv; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="E/1Xp1tv"
Received: from smtpclient.apple (c-24-130-165-117.hsd1.ca.comcast.net [24.130.165.117])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62NGK7gU2728179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 23 Mar 2026 09:20:07 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62NGK7gU2728179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774282808;
	bh=tj3o6AUL+Vi37eybzPLld79TnpgpT5zl40N8zsuwjCg=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=E/1Xp1tvz0YNAjyw3vrqmA6eFgsCh8OAkbm31PuUibHodf3HGSbIMDPrzL8eyhoo3
	 +zdSoljWK3cMRCnOqPYApaoC5WP3mj6HawL2EhLLgPPLwTxzIH7Fi7peZGI4S1TMh2
	 MEvDQwHxFmkbzcwywBGEwoBZFAXno5wVzZsxIV37QwieTW+zK55JcAx3Q0x4rx/K7M
	 hndt2fvfNaud2ZFNGlhqJLb5bCCFTY3z0SeGEUJajLVz2lveoz1fe2O3w5vVDNL2ru
	 xdF/wsCz3/+/puaQzvaN2jd/ohTSX+E3gaPTmiCSDmRphw+6gjxu+QWhwS1fxWPra1
	 WzfZUlz0rw0gw==
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
From: Xin Li <xin@zytor.com>
In-Reply-To: <acDYXtVgSKbbAuGs@ly-workstation>
Date: Mon, 23 Mar 2026 09:19:56 -0700
Cc: Dave Hansen <dave.hansen@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, shuah@kernel.org, tglx@kernel.org,
        x86@kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8A7D5D0A-2995-4626-9423-0FCABA844363@zytor.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
X-Mailer: Apple Mail (2.3864.400.21)


> Checking Ammar's patch series, it indeed looks like a more comprehensive
> solution that not only handles the difference but also adds specific
> test coverage for consistency. Is there a specific reason it didn't
> land in the mainline kernel? If you think that is the preferred
> direction, I would be happy to contribute to that effort
> collaboratively.

I prefer the approach Andrew suggested.

Ammar disappeared so that patch series landed nowhere.

