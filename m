Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2219747DD5C;
	Tue, 12 May 2026 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570689; cv=none; b=DWNYyGhtuv3IKgPPnSlhnOl6ocNaSoZGTtm33hOQeOSTltA0A3cLx8kXLKIwslsykEm/1Y6qTwatQ4Il7A6RnKW5Ec+2azub0wNUTyfoEP7o7KJjuPhLDsBm9k8ALk6rC8lebu27pmZnLQaatbhnCWrFrLP86K3pKkv2FDdmaOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570689; c=relaxed/simple;
	bh=wEyDr/bRW18sk+Eh6qeSY0G5GBCNnNAFInLo/yOFKUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJoclmXpT/AU5P6QIzj4xmL2HaF2aQrUcDqYoX7DJlOg/eGbB9E3lzhdHUUsK/Facp/6q9VtunVQjdxr4GP6pz6nuka8Tv4WkRe3MohVQw9AAxEJ+YES4GY8POEOJSf++bLOEazQWIBkGlE4/LugjUjdSZF9FZDPFAcGQcARe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KTE+l0RE; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KTE+l0RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778570667; bh=vLBmIVgGqAm1WgQmG2CCAsu20EJzohul4rqXqPsB24w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KTE+l0RELO6nyyJN3zhI4UCsnTlSEqyQ8hXGxJIrpyI+ENz8HKuR/mhvJC0UPCYfE
	 pm+gP6+kfBVf+dnCYyrVKUy8GyubzOMLtkVrlLY2QvhDy5dI2IPp2RyP2PfKZWSn12
	 amyCS77BMDy9P7RMEMON0xmW5RdKojy1GNpm/1MA=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 618BE4F8; Tue, 12 May 2026 15:24:24 +0800
X-QQ-mid: xmsmtpt1778570664tqfecap3n
Message-ID: <tencent_B49EC91555E7B93CE646566E0A2DBEB9BE09@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+Zap4hDs08HaF9zaVs0jQUNat9/uAQOz37raUQURZq4YA3VcyqL
	 jp7SC867tbUdYkbU2Iyvagw4v/z9+peY6LYMDvbsHEUABQSLIBCSR/8adNZL2DuA9Vy4+K5hDe3l
	 Hj1UO7T93RrfIkothez9lPMDm6r7QGhjUaVDlqomBgw8t04Wic8H3sDUhleBKMubQeXr5VeMZTsH
	 4hlbZm1H4L3Iy0t0T1tNu7ErtKCTvoTOo2dSHaGq1Y3GI3EFaS+jwHXyDWRlaKSgdlpu8hgmb4KV
	 FiDv7I5G6JeooJsOG+wXcTv9TA5o/WUZSHKhQqieUZuZDDUZmAaGy7TklbTNGLOOg39gTGPD07tS
	 QLfBOaVqU31xFiOQhBxHFNVpDLYrmrQ8tZZ2oEP0OLTW3jcteg4CemI+U2kpc/y9mr3YAFmij8y3
	 QS/rKos6zcEk+ffoSFRgDeYkDQ9e7goL6IWDdPTbkkCZUL7IpIEv2TfOCaff9qcoRB55r2ifGo5d
	 XccaXYDTD4KrcWNukBZWdOcTC/QB6R0hHq76anGBsOVVAb0hbg1AYC/Ddw8PWyZK6MCx5Tf2tGBD
	 7cS1+t6ogkYPWpgMh2cU+Wr0auE+RVsDe3Yog0XHdwcPjO1mQbDwJq6RgwKYIZzEwe7RiTnG+7hd
	 B8ZWq9Puaz/PqDPu6SUwas82INSo5sK+mOgHpq1zYoF5bMqSpTtaOa5eEfof8cU35uEEsZgbG+CU
	 c3XJ5RHSCYcbEWnTR3rTPwc4GhoEcm+gfDNq63C8reFUNOOcV596oXLeGDBitE0ZGTAx1FOpib6F
	 j6irYa468LB3Uf1GxSHrG5+KovLQWbGP55HyVutTJDs42KmSccvq/Sz59vQ2//FlRgUQ4FvH2EnJ
	 aRhQWOb4TrG9GSu4JI0PZ+mqFvP7TiZT4lZ4nZ7tomtI1AI/w0W5uatsgQjSwi5aNyvDJ4iO2Xia
	 ZnUFpzGEqVuZxMVibvgoKm+TwZdAnvOgwpofh5OD9EOUATBhBfzPTNch+4OvveCF7RBEMd930JAw
	 9VbHj5Aa20yo8/LwoT
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-OQ-MSGID: <49f042ac-7bb8-45d3-9e43-97ab00dd0a96@qq.com>
Date: Tue, 12 May 2026 15:24:24 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
To: Lorenzo Stoakes <ljs@kernel.org>, Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
 <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
 <agH7ONBSX7XLzS6q@lucifer>
 <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>
 <agICeiIEshWf-1xa@lucifer>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <agICeiIEshWf-1xa@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/2026 12:30 AM, Lorenzo Stoakes wrote:
> Yeah let's go with that then I think :)


Thanks Lorenzo and Jann.

I agree that the patch as posted goes in the wrong direction by treating
source gaps as ranges that should be propagated to the destination.  Please
drop this patch.

If disallowing source gaps in this multi-VMA move path still sounds right,
I can look into a v2/new patch that rejects sparse source ranges up front
instead.

Thanks,
fujunjie

