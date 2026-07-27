Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03679390C8E
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166030; cv=none; b=kTMn7AZ3itwDKQ/cyVAC+zmeT7HZYD95+x3T4+lu/mTAGvjeZ7WT7QAswRws3SB2AHL4nDQURY+qiGANo2p3/3fxQZ8x5VF9DyAm7nzDSt1k17LGkvgLdgvVHFiFmy2+WZeeIv2Ox2CN7Z57e4HstZm+Amv08t6GIEJtRm50BeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166030; c=relaxed/simple;
	bh=tNEsctqLU+NNG/v7EAor3xQ97G6fAwAace4TihTp1Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbtRuo13Ge2XTYb3Fqwe4NaumWKqwu9l5Eb0oibLRTKWH2dyh0HLBeNb1+ep/b3CtlXth/M/KR05rZdCeDE9OdjEWUScsA0wWH/mx25Ayyj4zYGZSvjMzJDHiEhuqAC/GbtE/s94Qb6unAnnXfuYa0QnNxtXDUAI9zXlXRc+7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLo8aEna; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLo8aEna"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so1856143a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166028; x=1785770828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VlC8romriLwiw5lX4tM+10Qn9Ku6TgWDoqPfgLWOFsg=;
        b=tLo8aEnaNOngSy75r3TQs5J7Cypwu6FkSOaji8+o8lS3ittOt7TJAyNTIqNcG3UnWb
         utNsWpVEIyLxl0HMeeLpZpFji2alEJyth0vGJD2ZM+DJy5P3AsOwKTyyoM3N7yyTBKZd
         gXrnRCKSki273/9lLOKH+YSb8gbS8ut/W3LCWA2J52QsXJ2on53avM68YOYHFw3VvL6T
         8CKFuFc2H3Sbe8B8MQFcqws20ZhbKbM2Vsktx8sgjRFPK7MhSZ39cPvXukG8tPbLC+La
         AA8PxtHt8rhEM2xfrJU/aU7RixeiYFhRTmSiIrMgyciR201uUdqGgHoA0GkyNgyqsEMh
         +aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166028; x=1785770828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlC8romriLwiw5lX4tM+10Qn9Ku6TgWDoqPfgLWOFsg=;
        b=q0seAbM8R1sR2vGWbQY8+to492qojtG3U9vYytc3pY2ZCu9ClUbyGJrL9xUyMTBQg3
         S4uQ7mgr5Yh021F4fIbx6owusoK7XYqlBcyJ4p/a4wchHKYOc5XO3/udUtLrk2tbv9mM
         DmVxcyyNVtYjBLunGvpIj5R/5dv/tSVGASLoUIXhMO36mhCZY6SMueNrk9xyvk/0sGSF
         K9+uLwKTlKElibGN5kgU6kkyjPNAjWEJNZtJ9Cxpm+yozNQd2QBljWYNlfnDpL60YZ33
         XWO2ulwFpwnCqGaCRS8QltNwyOpBjNQRHFPfVV/0u7FMtZ6VNIrXb059ReQh4HeDfUIH
         IMBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd8rYspymg1wPC4RCA2Nh+ohTRCciecaakCZnlLLjDvjrDp42zmov1RWP6gY1+8CBieQg1ip+Q+kEj1FUxJbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy01kua/SSBrfs0t5erzRzrCqL2ESCNDsEIOqCRfk1zt6KdaVB
	p3YgBfyzNbaHpDcv0dmThAWgenWEdgkUSwQ/TCNiOMPHpG8uS5zdMIur
X-Gm-Gg: AR+sD118FaDhnehltS/QOqbpgYTdRQUYJwsgeuXKfyEsZCJpcFiDJKGc4mnpFqGYBEj
	pDJv2gzN4jzKTmi2QSZ+Siv0+kIeUWxSKhRRhVga/a8qdJHlmCnhWNeEwDYoD/9yZyKdDzfatAg
	JgtbvcJ2gIrxb9oTwRnyjaeyy1Cv1krxBpqbnJv40Bywy/4EwGu38CnrbZl+W/UScbiNbNoczia
	0LW5MbnGV7nKeZ2M95+KUwPeS3uO5cJ2F5bICWdH+mI5RdzA9SUCSuO1aeJn2SGX66l0znCLYN3
	tLxgu6QVGU5vqBTeYTQagvlAmg12pPzll1R9BCSf5RTRtMaHIXg88AIuaFCRueP3/IfSsK7Ex3h
	KXcPI60m8OL3jjKbU7Ak6+KekWQhGdbw60Q+hkfz+zcdfwZMAQ0K4uCVh5WBTiPCqryXrcHE=
X-Received: by 2002:aa7:888b:0:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-84e5940af34mr7293602b3a.8.1785166028466;
        Mon, 27 Jul 2026 08:27:08 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b282asm3558622a12.18.2026.07.27.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:27:08 -0700 (PDT)
Date: Mon, 27 Jul 2026 08:24:04 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: sdf@fomichev.me, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Remi Denis-Courmont <courmisch@gmail.com>, 
	=?utf-8?B?UsOpbWk=?= Denis-Courmont <remi.denis-courmont@nokia.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 2/7] ipv6: raw: convert do_rawv6_getsockopt
 to sockopt_t
Message-ID: <amd4Da5CKqDuNT2d@devvm7509.cco0.facebook.com>
References: <20260727-getsockopt_phase4-v3-0-e89627544639@debian.org>
 <20260727-getsockopt_phase4-v3-2-e89627544639@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-getsockopt_phase4-v3-2-e89627544639@debian.org>

On 07/27, Breno Leitao wrote:
> Convert do_rawv6_getsockopt to the new sockopt_t model, mirroring what
> we have in ipv4. The overall goal is to move these callbacks gradually
> from __user points to use sockopt_t, and this part touches
> do_rawv6_getsockopt.
> 
> No functional change.
> 
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
