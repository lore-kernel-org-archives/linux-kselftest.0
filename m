Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D503EBF0F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 01:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771811752; cv=none; b=KqNe5stUTXJultbRWKfyqnVZet86fvN+8q5u5Nce9JBH+a1Nm/MztdHvlWkKWeXdoj1crUj1dwbdjcaTt1q3muE+6zA2o6QnREnUxFBL3YfiEhz0R2FEHfEcNIA7UUBQy2sGLD51qkQvmY9yoTLHaQ2L4xVkil7145ssZEDj7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771811752; c=relaxed/simple;
	bh=Z3ojgZMFwjTSR8AVzblv2PUdH28uAd2J0RLH+zjamzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecd8EQL7o4XllTH7O9uJ150rpmO5qsOyKdlNO7xtooUcdKwvfI1BASV0Z0Q1+oBkaYDWOW/TPpTXVG9dJOEHvFfnid5QH3JwoWGfdCESHd/hnG16CESVZHig2BwHd6AqA+dKjLUKOcpGJnrygl4h0lsked8smnO3N2fVG/nq51M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZAr8HpH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZAr8HpH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so1297209a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 17:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771811751; x=1772416551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYLMgxnhRDhS6IkKiyt4RiLyD1JMu1hdEP1SNpq952A=;
        b=MZAr8HpH77V4mHydHo/gc1iEuDR3nF78O7clSAmyRMXm66R4YHsFw1OYEcFzAHIGFQ
         ZtFKHR2y7yaSyAFDOvdmM3sikJCHpxSh+GXzZYB1wVMh5Othjg+OFoOS/qZ4rA+C8gS/
         N1Ia71NirD68pf3ogj4Kkx/yLIREGafJQrzywxIo5KfK0FBeUtdsPq1qS5/cgjOZBnND
         A02kx+0jc1ZPwrsXdF+mQNrffyY/VaeibqLznWLA9yvI6kz6KkvziKw1T8ngo63BABJb
         G/+lpPQn5KgaC1r/eSVtiaQdkuTSWMaAyaR8Ds0xVL5wbAshmDPd2BGxwhK0AUx/sujt
         AUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771811751; x=1772416551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYLMgxnhRDhS6IkKiyt4RiLyD1JMu1hdEP1SNpq952A=;
        b=e3rH18LFiXabDUC1ZaQvMERgerznBrtNXuNyqn59ItMy9LMDpI8X7QYY94qnWtWT7D
         cKaGJwUcLKq3QQ8RogIkYY5UZPTpeJPcCaK8vTQMBddnLjoGzT2OWLC1ESK3NtSwk9sJ
         MS90VUT9DmyE02cd85Lnqo/N+EQIuBMvpjQRr882oXyy6cTwgnjYzHBQoeLOfs3TDiFW
         ZJIg6sYfzUaTs8IfHLuW7fKqlZ1UEAq/UJWj9QUWHPj40OGF2YHWVxb+2moTzu38o9IT
         kZInNxjVK+8abxLoB5xzSKHPqPFuVs5IqeKDZOzFsXCYVmAJHIyxdbi9sJdUFl3cX0mM
         OAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVlrc4RqK7IDNTGuaoK6SJqANHqeqeHj+yRJ/JotPm1X3bFI/jHtEhgQy4ClDinZ9SrA57aDJbJPWMRcXdl32E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/KZL0tKF+DBDkEnQLxfZEiYzTcRU1qW7Pekn//NtUrQcCwga
	lRB2AjF/lGcTzI/Xy9yqt3+cxtsyVNeIlI0J4da4WoocejgAGCg8gvAA
X-Gm-Gg: AZuq6aIc8HOdz6PSyVQdRo8Y3H8nN3gbchiUUyR8U++A0ox2ddRHchPTB1svNC5cH/z
	IAl7JQxEnrhgUKg+0wZ94XPC03hEOIfDYBe9sn3bz0yVyEvD/Pne39HWsnxScVCN+pLH+08qRI/
	J8b9QEqJPFFCUQ9OI47TWp9m14eXUUTwpqGr52Pw7TjVczgHtne8D/7P8zuiS+tEhKB/ruPsIWU
	C1zlP9+ppV7h6ZtYhp665JMwBF0FuTE+Cj9rVzN+HVuHOy/qYAJ/UF2L6IN6Do1YYaOZxlCwxGB
	8w89T3nR0R1fMVCcy+yMskzKOykkyGJH43sOOcHDJjefHwPeIKgAq0D+zTdaCSppcgliDk0Y2Pf
	R15B4r+k5b2GczTgJWAR/Ewt5aV0v0XDLEvBDgBjgQCOyE+dXS7/k67Wssyqd/U3LAULo0BSWgj
	57E+7s0+OfxqQ/ebVJLDjG5VbHhkA=
X-Received: by 2002:a17:903:3b83:b0:2a0:ba6d:d101 with SMTP id d9443c01a7336-2ad74463a70mr68332515ad.21.1771811750817;
        Sun, 22 Feb 2026 17:55:50 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e350b4sm56286565ad.4.2026.02.22.17.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:55:50 -0800 (PST)
Date: Mon, 23 Feb 2026 01:55:43 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Mahesh Bandewar <maheshb@google.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv2 net-next 0/3] bonding: fix 802.3ad churn machine and
 port state issues
Message-ID: <aZuzn-6vFrcoD9RW@fedora>
References: <20260114064921.57686-1-liuhangbin@gmail.com>
 <aX_6jyAQaDoqsR3G@fedora>
 <39c1b386-e6ee-46fc-a653-f86fa21e9e9e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39c1b386-e6ee-46fc-a653-f86fa21e9e9e@redhat.com>

Hi Paolo, Jakub,

I'm not sure what I should do for this patch set. Should I re-post to net-next or net?

Thanks
Hangbin
On Mon, Feb 02, 2026 at 10:27:51AM +0100, Paolo Abeni wrote:
> On 2/2/26 2:14 AM, Hangbin Liu wrote:
> > Hi Jakub, Paolo,
> > 
> > Is there anything I should do for this patchset ?
> 
> My take is that given we are now much more near to 6.19 final, this
> should go via net-next.
> 
> Beware: it looks like Jakub and me are not 110% aligned on this topic,
> so please wait a bit more for his feedback, thanks.
> 
> Paolo
> 
