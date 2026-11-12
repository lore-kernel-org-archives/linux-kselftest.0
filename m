Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470305;
	b=UALl7rnMG3kxvMOgvmrzDIPkK9ssg8Gf9YTkSIPaIXFFHJFaCtIxLcOjpZEkkCXge3pk
	 C5DPWAbdu2J21y2woNP8f5W21+ALYZGdV2t0Kx+beUpndOXSEZYv3LhWQu0MXKgVwPFbg
	 XlRxZOpwHX5Ps4DxJe1b9GtWxpKWdpMT8pzBG9hGhrK5s+QSoXyfNACLf+qJP3qPEHRMe
	 P5SWFbn8WPr5bXQlGIpWk2ayu9aaWmYjXekiq9veY37R/3cZzj3BEHYKApKa1wg5nxlbC
	 q/UNEbv+sCq1ePl5pRuKuhqALcMFdb0U5uSxeImoO5/Vc2+QgP9G4HQS8z8y3UAPN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470305;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=J8baeEDTu5OVHYiB1EXVa2hEXMKqyhqoH/nQJtiPgfI=;
	b=TC9ge0m//KwaLspi0eUhV5FcEnJrLTIswIkHt9e/pR/rtTJuP04vztrW/jI5KBZG00+c
	 sBBLhdfkuV66pHUHVZMKeaOu0SEp2VO02PJp5lPy9HhcZ+3mPl7U7ndamC2o1kT/poS0e
	 BsIergRpSIF3tpPXPlKU1V+KxfJQiHrxsE8zq6kk2oGm+OuCSm3VudXxVPfynY1/1g3sI
	 364Y1QsVUlpa45CuaxbwR22qH3tpxOxTTUSfLzEonqZO0F8X2JGCTeg8UjhpoJl6vE0lz
	 KABTDfnOj9MBqhqe3BEyysiwsDHALAJA1+ngGE4/0y3cf1ViWbdprguFvYtzKIPi+aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wjN0HbQ1;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82552606A333;
	Thu, 12 Nov 2026 07:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82552606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wjN0HbQ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wjN0HbQ1UJgEwxELuwu58BfNZE+anSehR+B9rr2YqtHz6y9e/7TBqfJYsUDBTyh4BsPuFoOgOAGZG
	 dhmv0cbeITwpcXLHDT3gpylnj/V8m394l3k4h63WEn286UdWrS15Nhy3gDx5QUnAiiRu7Or2ol4/gm
	 3bPHxC5caWU6WG4Q=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af57166cd0-e0743;
	Thu, 12 Nov 2026 15:57:29 +0800 (CST)
X-RM-TRANSID:2ee76af57166cd0-e0743
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.6] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af57160cfd-f8137;
	Thu, 12 Nov 2026 15:57:29 +0800 (CST)
X-RM-TRANSID:2ee76af57160cfd-f8137
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Pin-yen Lin <treapking@google.com>, netdev@vger.kernel.org
Cc: j.vosburgh@gmail.com, vfalico@gmail.com, andy@greyhouse.net,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 yana06070@163.com
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
Date: Thu, 12 Nov 2026 15:57:21 +0800
Message-ID: <1794470241000.677408.1894102218415876135@cmss.chinamobile.com>
In-Reply-To: <20261112014942.2946303-1-treapking@google.com>
References: <20261112014942.2946303-1-treapking@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 11/12/26 01:49, Pin-yen Lin wrote:
> The prio test intermittently fails in the arp_ip_target and
> ns_ip6_target variants:
>
>   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL]
>   	Current active slave is eth0 but not eth2

I traced the timing through bond_ab_arp_inspect(). With
arp_interval 100 and the default arp_missed_max of 2, the active
slave is marked down after 200ms without a receive and the backups
after 300ms, matching the timing analysis in the commit message.

All four link-down sites in prio_test() use the new helper, and
the Fixes tag is right.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


