Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4846984E;
	Fri, 31 Jul 2026 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542337; cv=pass; b=AilO5doQMnvU98F7LE9C+T0Wojvc8J5vo9K4o0EfzEVVlBe3EQjoe8k5lcAcZcFtsA9vIICpEWSyKgVyzphiPTn+X7eK2dOuonIpr3s4TaGHMq8kcS6Chjr42s46EGmfRThUWGUnOejpLR+g08URNdYW9vRjz8olB4jLfsrHSiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542337; c=relaxed/simple;
	bh=mo6pXLOyzWGPvV+SRjFcnVK2GADShBbEEkDmF0jsBmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdFMCa1suFGTdkgQCT99tpu03ml/WbungqoDeEShl5e+A8CjfiMGB4OUiyg9DKT0L1PGixnDYlOXZS747LIzd1CmCVErhREB7svA9ITi8rKfSyvVoyqGrcfKUM2pRzbcuha3vc2cUNJiF+To+C+jc7uZTDHZ+5Cz/2XJ9T7qc64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=CxrScL4s; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="CxrScL4s"
ARC-Seal: i=1; a=rsa-sha256; t=1785542320; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Bt4OyQ9iHkrsu7E1mSYC9Dvb7pnOQJC0y7i2XkqB47rmePr8qjTVlQ6ZOinBieNcdc/D6OsvE8Hjoub6M4rEEX1BHbBTIe066uJvpRMRNtk1IBcC9Mv1m/2ZvMqMuAx+d8fDqNxhCDwlO3OXjB8xdy8CL5dI6Bgh3RnQWeMXqZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785542320; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mo6pXLOyzWGPvV+SRjFcnVK2GADShBbEEkDmF0jsBmI=; 
	b=TGo2iXbkUUkn0qf7OjkIY0X+D1WScEPzRA1dLFAftmVnGvAek+STdQXo82WeN42sHA5sOnOQFthJtOu7IrcTejv4K+xr7OIBQKAl2fzyN7axnOLyt8W6wd6oFvr3D/dKPfp8uXptlpL+Em7hZkws6IiO+ZkGOkCUhtkPB+uIGGk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785542320;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mo6pXLOyzWGPvV+SRjFcnVK2GADShBbEEkDmF0jsBmI=;
	b=CxrScL4sd2cD8qKE5IG/iAE8VFkcdjVlw+exh9P46RABuCsoAQwbH0vJlSbWdEVs
	fDBf4t+CJdrkD9hkavzA1nRtGp0Tcc7s6NUBMb3Py7xhbtGC47I9mHdulS9Z1971m0W
	f+jYuP6YockAyCS/3V1wvy8WtbYOE1htPOel3Agk=
Received: by mx.zoho.eu with SMTPS id 1785542316490642.2782910859671;
	Sat, 1 Aug 2026 01:58:36 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: xiexinet@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH net v3 1/4] net: hsr: fix packet drops caused by GRO superpackets
Date: Sat,  1 Aug 2026 02:58:15 +0300
Message-ID: <20260731235815.204307-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731090224.18-2-xiexinet@gmail.com>
References: <20260731090224.18-2-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This mirrors netif_disable_lro() and dev_disable_lro() faithfully,
including the recursive lower device walk and the split between the
internal helper in dev.c and the exported wrapper in dev_api.c. Clearing
both NETIF_F_GRO and NETIF_F_GRO_HW matches the changelog.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
