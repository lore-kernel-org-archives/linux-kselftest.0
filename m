Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE393B993A
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887235; cv=pass; b=RDrpDV1strQ+X7albJKni0rJ+s16TWsgQUfmGSscqRLt73A5WxVli/bLR2+IZn5NAIVLhg0grTVPeozpD5+iLqxv779uJfBWdLKwPNKeij0+IkDL2/sqJIsW9+jvucKE+1kNhIZ2RAMckyoNdPpiDJRbVsx0zRQYncd1kEyNIjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887235; c=relaxed/simple;
	bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbzKj3qrPcq21+2Uszij3MXJVKjlXQ+qpj0Cyu8a83wT1L23baOMmusk1XtxUMU9LofWFOcuNMKQOYuwjwwD5KS6Zq1/WLCj6YX19xfSo6a3xFvmLpbSXkMyAd8MCQ9dgsszFTXe6CXXupH75lul7Sp1G/prP7lD3R40FIouaOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfIxWMiJ; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfIxWMiJ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df93f00f4dso1169311eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887233; cv=none;
        d=google.com; s=arc-20260327;
        b=qSz0LUlSIow9JWko1nXH5OkjMS/ZED2UsTV0bZNTA9vsTS1CfZqtkzc0HYLVyfe2ni
         k937OTPlkiOv/5maVpfhzmoJN6otoib3xTqdMSHE/PJ4XXyatSV8UMYJo6O2Hj+fS9KB
         4V2KhLk0DzsjvBXR/0iSKKPFHTR/FK308xwhUjo4a+fJWSjb7TJ1d0LR7g4tJywNyazd
         8X6DqRiuFupP4IpLnzWbCqbYSTv2mLVtCKZC8OGy0uAXhZ9f3DpZYc3RPQ3PKUR31GKu
         XQfYZfVKghgR/TiWaXDxWY24VejI/iSu68PHy+TPViyHVExMewVJAThDrstRn0MJ4kdb
         QxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        fh=cypSYJ/hn5KrIdzo+k4UlhQnxECnMrFYX+2EwQOb4pM=;
        b=YDnCt+nx4yNYLmuP5Xreb7fTkMkrCemohBR0rEwAJ2rZvEMRnNlNludMK8xgcTfDFl
         1q0EZ4DU0+Z8K2J0lI6O6pPNJPhNw0V9qNVFpj17+XpHfBHUFRXdSEBf4sJMSjzs8M/R
         wz7P9Ja5Gm80QXgeEW2kKFTFnIVikEkazxeRjdNbfvbnEVkUfnzzezpkxK9TemvoYI3q
         SP2omUq82esvvHbLv5nGF/Aum1iWe/QZd43MoP6Jr+Itx1PE5oab3EN9reRaENjck+R8
         oU0GQ7U2vV4ExPp29OA8mqxYFBhsk/oqkIZ87uHAwF/RD+5kiCU+Mi+6cyIciUE410qp
         tsHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887233; x=1792492033; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        b=SfIxWMiJkqp6kmt48++eyAfDJaR9KlsXFMETo/S8Bsf2Ds/L3W/HTgT/kiAy245Hrm
         Md/pEww+uTrpeCm1Bnm3b08NwMILnVUQr0WO6ZQSXv9b9BJsmL/V3+2iRnV/4Zd0s4gT
         0nSfvvqsoY3Nb2TYBJ0Y8hJfB1w9KfgDNYN+nKGokqVG7cFluCYDrtsliIB1sS6Eo+dg
         jfch+Rcgah4YwfQ1aufIrdBANrw5bQIaMJr4w2VKlOsviHtIsjicIpmdR2fLTTxF2Olc
         zCQiW7Mz0fDgcVqTD1ChhKgKwwQbfWO/bPHrK+4Gjh0TI2J4kVGY8rODwXbKJ37KcLoD
         scRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887233; x=1792492033;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        b=bYr7skN38hUq25UtIdYf6bVM2eUHosuAHQCXxQmreIyU80wcS9mV1XKvU6an+Lk2Rd
         L08k7Dt6wGJb2320RMU9OW8fhZvRyYRUDuH+Ts46XZqBfHAd8Myb/eZzix0goV5FN+Lq
         oh3Spk9Yv7EfznfMkm4EY3dSRBi+QeNps7ArmCxihkI8EJK6jBistpvreXIzMDJ2rQMv
         6VQzD+4xVf3PQrU8DKrtqjo2yINfvA1kEu06jlC1pC0J/Xb1/ustp4fDtO4aLtHq+mdH
         U7q9WTOS7ZwLUwzrGr3KICbziwShPJGKSoYr92TqQR5Y4sQGTkqLLRzWGe2X4wDyS1fe
         5XYg==
X-Forwarded-Encrypted: i=1; AKwUvByDUnUrYKICqRG/URA/C1XxR80X8hTIyxlj1TDrpF8BYNEMbRNAFHY1IJpB30BKOPqLbo9GYEPQq6IDSBgzpRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJztFDBZyKI7/MMUmK8akXVYv4QXzItWupPQKAt0XUL8JELFpa4
	2ubIlNgy6qX/Ws17tou3Z+q80RUJUGJtwXdNl/0ZV7E/Rj3hSWXzBfIVkRj/7CGYD7cQyo/W9/x
	sMS+Vots17u+C3tUsedmIcuDwZaL8jY0=
X-Gm-Gg: AYBFou3pf014tEF6+K+h/AIPUIiLJ6Jvfo1Z1yYya+z1tKBQNgrOhhhyooZ3wqTiusD
	6smYc+13dRTOIj5Rc2d3GBXjwS8tSb3X+OyOfr9xKV3q88cjTkVIMNgzQsGhI1s8JCixL0EXLFF
	OLAiYIOxIY/pfQztKZEdZ8VcUm/x/h7RKDiy+ugtydCaieNGiXnARNviyX5N8BZ93S66V7wn/q8
	szP8oYNjPbMP8MctzLXrdK6tqufBd5iBKJIqE3VbBB00ORNrBt9dWnm+xnGw/uDd2/TS6PY1nj4
	0AfOLmXRFQHNfRytShf/IVS1zg/PzcLNT0WIpkfG/USZGfRnz/PdGmOLkpUd+vo2LTMaDELk6ci
	qpAel367jqaw=
X-Received: by 2002:a05:6820:4b0d:b0:6ba:3635:800f with SMTP id
 006d021491bc7-6ef12202b9emr8317434eaf.69.1791887232748; Tue, 13 Oct 2026
 03:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-5-sigefriedhyy@gmail.com> <179185710223.434549.6133926948819737320@kernel.org>
In-Reply-To: <179185710223.434549.6133926948819737320@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:27:01 +0900
X-Gm-Features: AclHuK8JAnqsEY2qHAL_CL6PzjdPWfJwCgFSVzJgmZ53WVtZSl4NqYxxzMIIVrs
Message-ID: <CA+7S2vK5iSraGLz2BP_akbYMHAtjV1FKE6KNx46wZNmuy1TCew@mail.gmail.com>
Subject: Re: [PATCH net-next v11 4/6] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [Medium] dev_mc_dump() is registered with RTNL_FLAG_DUMP_UNLOCKED.

This was raised on v9 too, already replied in a previous thread.
