Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623530;
	b=RhASXM/tvEU0KGdGlUqA8AjuW24HbGk54WHcHfqWKmdk34ny6ofGD8JvaOcgsoixW3h8
	 9Gazgo/yXgDMKYD4dohgY1Lj7pkUZr3oHoZ8rM4Ih+47qhZJGRpi8ULclfI6DklOJlEC+
	 qKYbMns7dwV7U4gJ88x40mJ++9OhPGYZmVvSZ2vFPlnjvii/aFCLoO8UYQ2BsRF9G+c8E
	 uSDlv1Ul6f5D53v0pogZXFwnNOsN3p5+8+tV0Fy3myX9W2equDov7IoAbY5czIz5zQYG8
	 h7I1hKKExSqy1CrGbOLlukO0CLlVhr4W6xNuLQAC1c1/+TlxnvdD6EP4xg2BoTft4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623530;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kp7aoDMN/GoFS5U/6xhElS6ooi9rTiHMp7sSoEa6F1U=;
	b=tpOyzrTeGevgikAbmhJPV4/BH1k/YKrVJ2dcd+RvdkPx2+cjyx55iUB+eVKpaT1a8MtD
	 Lw9fRSGWz+pK7tUni9DtFT1BfcN0LzfMCfW3lW03Au6EnhzEpkAQMaO2L2k0ognE+GcHV
	 UXx+yVLJrC50KKfexy9b8hggLbXC/1qQTn5HQgkKiXHfPgqPxhvmOnMftYjvqB6mI5AuJ
	 jeZJAL3r8zQkllp6l0oO+4hl0J1WkO+RKvETdocHyNXEN6ncwpEpMS4wQojJ0qaFCKyv1
	 UrYWfx+lZN59sDp+6CXQUOVbyJKqNGZRMvplrY9xC/LQZMou6aaRsF+Morwg+U+VFdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BEKInvup;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E477606A321;
	Wed, 25 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E477606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BEKInvup
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BEKInvup8WeyMs0uuTUcwhlUmfkOvqtoXn+4Ry1/qDwvLPdqSm/SBQAlK10NZLmcexQJBO8QR2qtf
	 bNhIjuVfv4hFN7F71N8HtzvcY+zVVCJBd9SpATl/lwMBRe6H3KihvIeOOJpxJg0hH4rZcqxSzBbhZ+
	 YJbDsOhJyO2ZFJGg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b070a5dca2-f3541;
	Thu, 26 Nov 2026 00:18:40 +0800 (CST)
X-RM-TRANSID:2ee46b070a5dca2-f3541
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b070a3f71a-4ae02;
	Thu, 26 Nov 2026 00:18:40 +0800 (CST)
X-RM-TRANSID:2eea6b070a3f71a-4ae02
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: Alice Mikityanska <alice.kernel@fastmail.im>
Cc: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>,
	netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/6] ip tunnels: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 08:18:04 -0800
Message-ID: <20261125161807.88675-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <274a4204-8a35-4550-a6e2-dff96aaee55a@app.fastmail.com>
References: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com> <274a4204-8a35-4550-a6e2-dff96aaee55a@app.fastmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026, Alice Mikityanska wrote:
> Do you know why GRO doesn't aggregate >64K with sit?

Thanks for the review. My explanation was wrong: by default nothing is
aggregated at all. ipip6_rcv() calls netif_rx(), while ipip and gre go
through gro_cells_receive(). With veth tx csum off and veth GRO off, all
packets on the sit device are at most 1500 bytes, and gre and ipip get
more than 64K.

With GRO enabled on veth, sit is aggregated there, but only up to 64K,
like ipip. I think that is the p->encapsulation check in
skb_gro_receive().

So using gro_cells in sit might lift it; I haven't tried that. I will
fix the explanation in v2.


