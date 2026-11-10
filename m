Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278037;
	b=Vku6gfQ+6coX/SuSrA+QauktrnocYKsmcbDxtQdMgJs7VSYoVKNI3DoUIGFgEMzZv2KO
	 6BkmT06ua/kyMJv5F2KeiA4Gl7SfPpdqK2chbSnelAOZ0EPbRywyIz6LY6371IAUyXUGG
	 3Q8zc8T1sy8tv/ikDZv+GA9toHF+FRtmqaCCFzk+NUYN3k9muDrijT5dLfUiyKcd5uXtj
	 nMpw8IzddWvsn89RmdVYg7Ax2Xux3kNvY979JVj/HBvJxq3kvM5CS/Hea3bE8e7CG1Zl5
	 CjNHtXEql2fqgisVoju4WhaO+kIE3Qq5jVFX/K2hvCrYMUt2Sap5CZmJjhcQQO1ozzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
	b=u/wEJGQac1Xu0uH/qP2srHN6j5w2X6Vx59HM3Y5TeoRugKhLWCG/wiWzu4rhS1TjSFlj
	 Sr7ciWdSw8P2mpfsI3qwoT9P347ETofacMfapgCeACrxp6eFXsSugM4mXiBZ4gKe1nNy7
	 L/2Nj9quam6ykrajddw9En8AlT7QXCYPU3bZryrmlthbrqt8YK/8bZVUWdfWi53q+nHSt
	 c9tBwGtSdIe51QjVmXDnysJqSMn9+X1TZuh1+GRCpeBXe0I451dYz0nk2dRPbR3WIKZjI
	 yCW3Sgidv7Y4tNLaUmyBEGoM8J/Q2uQIdRq66vd/i0oc83bUvGThZtKNWVYIpZGKZPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1obDVAS;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB9606A336
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBB9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1obDVAS
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2d1b4a83aso467346137.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 18:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278035; x=1794882835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
        b=G1obDVASqefxB6poYdjSmxCFHjae9eYxJSNGGnlEYlbaEUEJivW7JDtmuGERQcgQmN
         jLQt9g2DSx1yyia37PP/ykKwYVfjHoNMpAsBsWcx1xnqRLrrH9i6dHgRXVgwLRphQ3mg
         Y6aMvkPKSa0PJn/FT/cPJaxDossiDDXv6D6d/28oQy6ndp/q9nQBiOQYer/iTR21B9JE
         Xr+gk/exekmfyJoJTVs6SVqVjtObZYwFB8IzkdhjCRTYi9wYeI0qdVL1DDvdM8XQyPki
         oglumqrNc6J2a2pRN8Z7kaLNm6XEJZwSAv7/NPRMsrQ1PX8GwtTNfs5q91PjawEY7Mxj
         2T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278035; x=1794882835;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
        b=kxTU5CL8d83g3U3rHxgTJXxv6uu3zaGQDrQHq/J2Jq7uY35ThHcMggSqGSzsFJOe27
         +tx3Kr2x2WwzgCSs8XnB4U1oORsfN3Fy0v3pUBPurooWUTnWvUcwcPEknbXxhJg8A3J1
         QnaUpJlHdPWGBb22opafiJioVWfkKxaYo1uJxKvp4shpSPK0jimYM7izqzSjj/mniIeS
         yeqzJtJRYIBvn0CcXo3iHeyPeHsEv7ZNP60TuEBMp+0JlJ9AjDSFoBrW7PPdcAOtpCn6
         EnH8vqVXCOoJYh7LIZpvQEssNvkKBE4wCLDBBj78wKdcDUZZZhg6eOgYOFDjAtUsOpDc
         p+nw==
X-Forwarded-Encrypted: i=1; AL+hErF9lEeves7jWW5Q5HJtzCzaVWJOqKQhAZvp+L66T34NMZC8+hsYcHrchsmQl2d6e5RIMJK4tdi9KT88Rlwn2RQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z91R4GHfOGG3nbL/Bl4Tuu0P5hpG2LdlBj1gLr4GIxP75L4lj25
	VB9JO9aGsaE5M182wYiEE84Xnen4PsVKOpG/8DZ9s40V353N5y3QOBxs
X-Gm-Gg: AYBFou3S4P6H8bW6vm6eZ77WluDxxX3GDz4lUQL0SIENmeDoz3cHd4aM1ogfEZAYv1C
	KTUFRApqqF3gpMaSKa75xyTgvpYlBM9O4QXXasXzbqkbJpOv8wsTlRTUU3gvHwdNsCUZ5NHcr39
	38MK1/G833jXEOwzT0PvtleLOpbShSuORoOhdlcRRdI6szVEVj4XaslXs0yGMIk5M6SJiKlsWNa
	0+/+T4THoDMNpwdl46rszoO+uR/xjxRucdIywLSmUZZI1GpTTi+gKp4sb4NXMi+ecNpK2a9X583
	/uZWZmah/Qrx4Dqitjygt5hK9GlX6yePrvkYeztw+pL0FhJysxBjDa6DfIjodlLMqDCirTOWA5j
	sNDYukJGm0bqMeNkl8nb3OUwWKShJxfjfYqOHIvKDMjvn/pDB95Y8jTeSmAD/FUgaobL/31VNyU
	Vb64pQMxGhgfsQYbymeuXwYk6s277EZTxaZHe+Cv6eYx267KDP00cRMt1SXFGyYOSowVIgsMuzo
	X91lG9SAQ+Joj17URf2JDzWGU9NMJ/1LpcNLjnrHJWc3rZcQ1KbFvxrDgpmiXbwbMVGSMLD161O
	Ot9UuDNr0oNPUtH8WFWULCmBX4AZ14j/XzfGWwGMuNIP5CJtx8dOrJSpqgVWsu5940rk5koN2jv
	ckjkedpRNFfaxc1YbUTMORuJP//gwKez/OCnxy6ATmUW0eIlwKEraLHzHdz5yXxj10L2z0c0=
X-Received: by 2002:a05:6102:2912:b0:7d2:7c63:5a0a with SMTP id ada2fe7eead31-7d301bcae2cmr373574137.23.1794278035436;
        Mon, 09 Nov 2026 18:33:55 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302359221sm877564137.6.2026.11.09.18.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:33:54 -0800 (PST)
Date: Mon, 09 Nov 2026 21:33:54 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.136b3b685931d@gmail.com>
In-Reply-To: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
References: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v3 1/2] ipv6: fix cached route reuse for control
 messages
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> A connected IPv6 UDP or ping socket can reuse its cached route when an
> SO_MARK cmsg requests another mark. A packet can then bypass a prohibit
> rule instead of failing with EACCES.
> 
> ip6_sk_dst_lookup_flow() reads the cache even when connected is false.
> UDP clears connected after parsing IP or socket control messages. Ping
> always passes false.
> 
> Only read the cache when connected is true. Ordinary connected UDP
> sends keep using the cache. Ping sends do a fresh lookup.
> 
> Found during code review of IPv6 UDP route caching. On UML, the same
> connected-socket selftest fails four IPv6 cases before the fix and
> passes all 54 with it.
> 
> Fixes: c6af0c227a22 ("ip: support SO_MARK cmsg")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Link: https://lore.kernel.org/netdev/willemdebruijn.kernel.1e0038bcc3ef8@gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
