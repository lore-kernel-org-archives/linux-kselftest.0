Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726589;
	b=AI7upyw62pVgfYkgZxLrF/cn3gWpFHQD6G9XuPowKk3vSnZJA3JgT6pJuCWjHSjVnA1I
	 eQ3/jEXsJYW1qsd9IbSUoSIOucbEVHyxj2MMo91myN+vA/k/5cVN0A+5H4MLsvVFk08gJ
	 JRCb0GUuYJVkHoBm9HZbiC++BnQslcqBo8EV66VjkJm3/cOE4a7KryMrKxwhk0oFWFGiX
	 lmDJ3UnUzhywlFG79uS9qZ7ff0YzUd3rcQAcoSNUHYQ+ivx6SjC3f0llHdjgH3+tZuemo
	 8SlKF4pwrdmQmLS1iQoO1VqPcxIOTZEl4JwQvA426iI9EG8/GnLhnrGR/lFnjidKq7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726589;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TOyWCJxiwJNLQOYYjn5OoQEzpRc1jzexLEaKMhuigBQ=;
	b=PyU/Q+1kLYVweNgDRG9B+xvzpdx4kCujUsGeyHSPFx+bDyraLYrJCQYX+YXMEW9gVJek
	 joap0Wbz+QDYxbolAdqz1f542U4rUvOvGcM7Ln5OeNvm01wUKr+NXZT4R6vVEI0LMXaZJ
	 OGQtIw6bpGuAA2MbSmlZD0fTLnYJLpvGGtHTPLiM6Ynkb+1ffWZ+Mcpi7oqnHaxvtex5k
	 GZywkBpiyeTEgJ6J/cFYM+z/51nlsuWnHF5/TsWCvBEZyH6nEd0JiUV7ack7Xnk1Qrwe2
	 6unsxSM/+3VC44tABVZJH6vGm1FLt9pdt8rBPbhLGrYorh9exmFUw27sQcc1EY07f2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eQkWn0bP;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD7A606A319;
	Fri, 23 Oct 2026 03:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD7A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eQkWn0bP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=TOyWCJxiwJNLQOYYjn5OoQEzpRc1jzexLEaKMhuigBQ=;
	b=eQkWn0bPUgQPv1ELrEfu3lZzFnaPNWH/9Km9ESMpFJ0FBoj4YPy4pgfDtxtGqU
	L39Oa2RHf/WTZxTskjSo/Oy9TVa3D8Z7Ej7P3VcuvH+L3v+fksxGU7WIMEsfX4Ak
	ARFLsweXifFIIeuMfecSaCZ4dNcc090YGRJWjPwWcIpx8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBH2XMN1tpqaj95BQ--.57865S2;
	Fri, 23 Oct 2026 11:35:42 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: hangbin.liu@linux.dev
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net v3 2/2] selftests: net: check veth carrier after changing channel counts
Date: Fri, 23 Oct 2026 11:35:29 +0800
Message-Id: <20261023033529.8575-1-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <atrRQzn2prYbF1vF@fedora>
References: <20261022085842.2527-1-yana06070@163.com> <20261022085842.2527-2-yana06070@163.com> <atq8yKbnqtLBVucH@fedora> <20261023023350.7225-1-yana06070@163.com> <atrRQzn2prYbF1vF@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PCgvCgBH2XMN1tpqaj95BQ--.57865S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRNb18UUUUU
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC-A4KkGra1g6vfgAA3R

Hi Hangbin,

You're right. The GRO on/off coverage isn't needed for this carrier
regression test. I'll drop it in the next revision and keep the
up/up, up/down and down/up cases, checking carrier after each
channel change.

Thanks,
Xia Yan

