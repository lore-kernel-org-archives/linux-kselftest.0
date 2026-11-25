Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623539;
	b=do43LOlPkra4n1lR+YI600BqMnUsKZ7d/XV0sl9E5DUmLYWkrFj8JUcoM6oFfht7n7Sl
	 auq6pz/wacLsknuOsN7eZubhERPLD40upGLxkuul6D9TF7I8B4/2W2mJcEJzmr/H5akqv
	 fFJedv3WYEazdWy1hqyn75szCufA8xe5HRgyAZ8mCPRR6SwSMjJiBT8M53n/UT2zrarUo
	 UAebvM8IaSmc4pJxBx8+dCzO1vQDoWHoJNsMWn78HHyIXrhBz/NA7OdX53QGPeYbsvbS9
	 napKOFkLw1hqsPIdHNxqGa60AE0D0EbcK1Rtsw0Ebf6FkeyydsXh5KQKoAF5mdfamwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623539;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3xA270mx4kwhnqQT3I82nAHnRVpKABDmyyE25A3rF5Q=;
	b=iJKH/xzujoxup7XRZll70PPbJcrYnkr4v8BG2NBGcV4YSZObPNORQaqhkVSFKTX8z/of
	 KbWh9tYD5XWRPH4bIW3lXqJ7MfW+dTvWinZllZN/UKzI5tnLOF/a7Txwcl+daE1qccVKK
	 VnEjH6VSqHJAslHeGp6hhjW9aqm02gtl4U2p4w4uK3EWc+WlusVL9ZB33+IDeOJ97l6Fe
	 0tq6VHYLbDwMAUYXG96LaktUaxPAQw6OYW5hZ8xWzBJMHKMeC1ABfC+V8DmKdYkQ/W8kY
	 colqxqRSY0/WKhcDUSSqn3yZj4lVgmpyxsSqYA59aNMr79YiPkT9ytnGaGJcivZ5EVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=szy6QNfh;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CA8606A323;
	Wed, 25 Nov 2026 16:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=szy6QNfh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=szy6QNfhHdxFjPpiCBcVnqWPkEZn4lxgwwiuQ4d+93ADy9MGBNiWsPCQhnBkSrw7wGH+nrOMHYGam
	 gZAe1lJKgHela9SVfmYGJYQg/W1FFwkecrynYs7co/1A7ZHtZGHVcoOpnGMEWKFDWcXgUEFe1X01IE
	 ZMh09uzG3PmCKX3k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b070a6cca4-f3543;
	Thu, 26 Nov 2026 00:18:52 +0800 (CST)
X-RM-TRANSID:2ee46b070a6cca4-f3543
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b070a647ee-4ae4c;
	Thu, 26 Nov 2026 00:18:52 +0800 (CST)
X-RM-TRANSID:2ee76b070a647ee-4ae4c
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alice.kernel@fastmail.im
Subject: Re: [PATCH net-next 6/6] selftests: net: big_tcp_tunnels: Cover IP tunnels
Date: Wed, 25 Nov 2026 08:18:41 -0800
Message-ID: <20261125161843.89244-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179557049725.3135.4073142828865813935@kernel.org>
References: <20261124013124.3693-7-yanhaishuang@cmss.chinamobile.com> <179557049725.3135.4073142828865813935@kernel.org>
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

> Could the continue move below the sit line, with the comment corrected?
> Could GUE also be run for the IPv6 underlay tunnels?

Right, the comment is wrong. v2 runs GUE over sit, ip6tnl, ip6gre and
ip6gretap too, and they pass. It also skips FOU and GUE if the modules
can't be loaded, and fixes the explanation for sit.

pw-bot: cr


