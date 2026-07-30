Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57950401A14;
	Thu, 30 Jul 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409156; cv=none; b=FScS6nvPAFJBeDdeEwclAaN7AFcYGcvrO4WJj1sjJsoPGCu9dO2pTcLH4CKPrg83ekhvVI2JnJx7Hd7P7sLcNM1dUFAW3zi/ogkVmCRCmv+tJXyyoexW3j6kEzCy58zqhl9yBPme77o77WqFQ7tyK6UZKnd4+VPZ/tZcvs+e28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409156; c=relaxed/simple;
	bh=4reYfIgvG2Dmta0lMuM3lR7mCEURq6JlCmf7ok2OYTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9ER82L9Qx9M/sr7pWqWqDRQhQ5QL9qYP2fGobcFOQ8VHAjJayUD5RoN4iYDjU/l0Z0PdmYkQn6ve9vJ6JOu8njAlUGZB5nL942NNqZiq9m55uI2MKC0CzYbxQWi/CALcaKNzRZHcT++sET+09ooC7jMRLpQJqIEsz11yWT83Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=m6M5aHj6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fbV+D1fS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="m6M5aHj6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fbV+D1fS"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 48B6CEC0439;
	Thu, 30 Jul 2026 06:59:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 30 Jul 2026 06:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785409152; x=
	1785495552; bh=v8qfL5g+5l6rAny93ptSN8WWrIL0P+BmkCkUxZhVh3M=; b=m
	6M5aHj6TxBoYAmny8XpJZG+FYN7KvUTtIqHC/zMAdH/02ctw08gRFnHIrWdTc13z
	6O6Qi2VP2CEHv0WfWY+m71qxEMJjg0+Nq/FQDSbeP+X57wyNCCcJDXdjjkkUZ5Zj
	JYHoue3DNHy1bcDTw9gljtd+zskLXZ7khZLajnfGcv7HRlta9ceUqXTdYzLnzj22
	LBJ8M1vBUkSd8+kqOlkb8aZXEP41rKavTSVxby1BNU/suJ5kuxTdF0fXv3GVDtMb
	HoHUFg0rCfO5ZyGHGDQMEep25dFixaIniGq+Cg2HMGT6NXxmqJQDoQxkSGMewruA
	E9fTrUcztFlD4nOxiQntg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785409152; x=1785495552; bh=v8qfL5g+5l6rAny93ptSN8WWrIL0P+BmkCk
	UxZhVh3M=; b=fbV+D1fS/3ZDHHYau2P4EHUDAskEGBrLAH+BBCSKGC2XRXcIoUn
	4VCxOFLA3U9W4Jm38fQEX65/zzH4HOcnuMeNdApxoy0NjgaOPftuNSF/GhpgCOhe
	rXJ2bq3+utV93sf1LOi1Sjvmj5Zsxh018eszuLRWgCqmDfdxtR72j6HQtpcy3L9u
	nThsIA7danmyNUS2GiS5b5CWmqWRGqj4Jy1avvQFaR+ANiKG1EEk7PM5BxEiz8wv
	zmQxwJaOTBpEHFWUOLPzuXmQhsyRxEq2WyqV76G6TLrtXuJ2+Lj4Myckq8migPWX
	FDuSlp/ISQPmKZheBtto4qU/AswdslhGOVw==
X-ME-Sender: <xms:fy5ragbiapqU7NWj5uPnl0p2O23l0Qo0hekhG29C8S6pLqY140cULQ>
    <xme:fy5rapomlLpS4hDA3ItMUYkxm951dV7WOwbUM_yMg_HJgDrgKiQ6k6YjiTFhhltzL
    -nc4UPQundeF3HsuLFfdK8ALY3uMCYtrj1fvdJMEs_lYyCBDeutlQ5A>
X-ME-Received: <xmr:fy5rakQPCaUTmPq3a8zRMCka0E6vXiPpBhxXD7ON7HbG2sEhnQOnevsTXB4>
X-ME-Proxy-Cause: dmFkZTF6ZqMe+HULlcu9OLlXeJkR5uRRuSrbNnifYIkYo1gLRtEFdGsTMZelmbMgwXb6LW
    o38UOyOUkqun8sLemvw88EZ/RyregejcxwzSsaP/Dh5pEjwtiJ6NXiYtW132+a+0Lfbaky
    A0I641IhfdQ9cdR7Fa5oc3ES8ohepFEr3ojMiPjCiuu0IESW8ifH7nR6vfZKn+R5t3Z+6C
    KINnToYP9gSwQ9JWoi7mdhnWzGw+TeLcjjiOlPb1czIeivrdFNHujLxv48+S5cx5lWKeDQ
    sMc/gE8lUTZoaTMoHmwUwdHMJoK3z3lqfAQFo9qw2/fa0OFbbnzN8Cg1dvqYLdB41M6JCG
    szT5iyn0Jg7FpymNkfBObs/S5uUwA7vv3ArIIY3QgGHnKkRfA9MAG7B8KNF7D2IjxRQWyQ
    dUnn6G++gWfP89qOYdBdCpN9BvN4b5VIp39R1vwu1Yf58Q1gCRoXm45pfdgoV5OfHcHqsx
    EpZKLngUihOxDhAz7oIrouIqduLnUS5ki1IvNHM2NZfKYgR6viImsvvblactC9uK/cPLno
    Ppt9mxsPuoR+8GslCL5yPemr5trCarC868X9dMpUf2Z81m/LDQtXTS53NziwemGJTwd84W
    EAUyp7pb+HHH0OtV5rGwrlloDsAUaeTNgRDd+0DCXnADvZfquk0LVXV/6/ng
X-ME-Proxy: <xmx:fy5ratpqJ2prdq__007F-vcr8HI9DcTdY20PV0PlV8Yxnh9RGilwuQ>
    <xmx:fy5rau11i_l616_ZgUFFXqWpAPG9Wq5iXrTZ6LYKl-GC3Y1QIiqB-A>
    <xmx:fy5ras6OAYYttHX13Z7QvBHr6cbKVL5OCJx2qJEAdbM7h5_gUyX0ag>
    <xmx:fy5raiQbMIcd4dT2fvTYiuFZoewGBjyZ99NA_G4CpumnxCSVnNuSvQ>
    <xmx:gC5rajZo0w3t2PwuAvHt0wh0aIpnx0i13DaW7XkH9qFvVlo1lNmItSsc>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 06:59:11 -0400 (EDT)
Date: Thu, 30 Jul 2026 12:59:09 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 4/9] net/tls: Honor O_NONBLOCK in tls_sw_splice_read()
Message-ID: <amsufVx5T-xs9Ydd@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-4-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-4-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:32 -0400, Chuck Lever wrote:
> tls_sw_splice_read() currently derives its blocking behavior from
> SPLICE_F_NONBLOCK alone; the socket's own O_NONBLOCK is invisible
> to it. A splice(2) call without SPLICE_F_NONBLOCK on a nonblocking

Is that needed?

ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
		  loff_t *off_out, size_t len, unsigned int flags)
{
[...]
		if ((in->f_flags | out->f_flags) & O_NONBLOCK)
			flags |= SPLICE_F_NONBLOCK;


We're not going through do_splice()?

-- 
Sabrina
