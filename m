Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B6142E83
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024481; cv=none; b=HLF1/G4O5gFUfDN3SsK1tmlVv7x/waC049cxYfOKnRQTu0VXi2JiCBZ0dxKJWtyf7PM9B2t72Hxu6wupCvPs308N5kOIALlSSwBxQy54dSxkuYWVTcCVNC8H7APJ+2op9xYCzEvRZWv5H8qjiEvNxzxoK/6CS26LGpzkBsyPGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024481; c=relaxed/simple;
	bh=Ps12wmNRlfIr4jWLYjjWW0a8gmssH21Cvl+wHQgM2a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMuL89jcNLrrrNRSaSQsY9otFclVAvqyXRORNZ2JS6T3fyVRcDWl0qhEioYJWhUPrbH8U8KimJvchch8vxywF7l2IZ9Te7gNABqr1VLRdsuuBkh3jcqf+XDUMSPPQypx+LulFPBT1TXx0V7CeivS/nAcnaRilzVFxqWH50IfaOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIzL2qx3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qf7wp0ty; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIzL2qx3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qf7wp0ty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770024479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfpLtRQfQn42RUL48k7TwWls5HiMY1YLOuBbBZW1yJY=;
	b=WIzL2qx3LcnqOJ2YeaM5ocKyfQCH72s/385KrKh3tNFiUupn7Yp2fHPAICAv2Xz62jZNhq
	1L9Ks4Cf0X0tnzEzBvQd9AXwL1L1RpUyX7I2Huu7wXV2ICzC/bFaDIi80VGdCPK1+HoBNJ
	cVB9azCb6XrV6OassQyaVOWIzpLZ4WA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-_4aeHrv9O0SC4FYxirAMdw-1; Mon, 02 Feb 2026 04:27:58 -0500
X-MC-Unique: _4aeHrv9O0SC4FYxirAMdw-1
X-Mimecast-MFC-AGG-ID: _4aeHrv9O0SC4FYxirAMdw_1770024477
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4359d70faa2so2434979f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770024477; x=1770629277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfpLtRQfQn42RUL48k7TwWls5HiMY1YLOuBbBZW1yJY=;
        b=Qf7wp0tynsfpg+pohXODnAsasJJsyCVzXpZmh2H4Db279awBF/Bsv/POQr4nOETbQj
         KWsNuyJVKz3oWMkohWlbDeFcEYk6p0BQSLVkEIn0HKJb1Rphnu7kwy1L2jIe7vuc5Juj
         3IPxaFRebINmp5Y3EicFguR4qFSx75ImebIT3hdT54PY0WIOlV4SNWnjal1XwKWlc3/C
         DEsi4GNgVG2bLO8Ey8ExIMN/xZuWE2mH4umR5/KevrnvjT/oTtRXvH5lLyi9a5T3NxRA
         IdZ/oWPztU3VfPLYfL86y5PoVC5ZWibqmM8Jw982OHG5Ad5cw+ytQka8vtxUN5ckKRVB
         Yfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024477; x=1770629277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfpLtRQfQn42RUL48k7TwWls5HiMY1YLOuBbBZW1yJY=;
        b=OQH/nFjABMcfk9feM93As7Q9BbSkCvjNCgmPBVGyHH5JWZyW/FlZUKq1Kn5DtWgJRd
         w9F+CT2tRh6j4AmdxGv/bIa5T9rqm5LJCyEaWJY8rB4tA/2W/ZpPRCc+Lx5f73ce8gMU
         G5riKeGq5joWN1cxesG6BQryS0iNTD11WUMQ731Ijt17euU+i+sXdufHhXT5vS8S5vwB
         EQRZURBTnIgddMRoUn8mpkiwGj7Q00O1ooHrfGdkMDlJItl6KP4ZnIbECwBka0nk5Lt9
         C9XGT2Cuh8XYGFmEOUa02MLdAXExwux2J/MSgPFont2yaCmM8KpE/DSiTOpP0C8A1mh0
         3O0w==
X-Forwarded-Encrypted: i=1; AJvYcCW5e7AzfMv1TG+hcJc71HtDU8e6v2dZnrGSWS62XeiZ34JRdoVUcVlHAYxnrPw7ts1y41A8GlBnBWuH/kUPJNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziG5QKdO9JDyfxQtwS+0x2RbVaNqhGhZc4LOOHl9jQab/aCrSv
	IMYdEMS7x4k765ePI2YApFOt5i4OqyvlB7X3y12W067eb261FioHu7Js8bZ/oRqs/Pyul+jZ2r+
	Vn4Z2MDCGyYAqk+kBrmZQiEZ50PD37TNTdH6vLtdYHFC1eqwPICgjTZi6awX6rM69aTk+Vw==
X-Gm-Gg: AZuq6aLUhUD2QOGJDb6aa5ltqyHlwwYq4vW/eitv5IJHoZMzYwcgyyVYerIsIIgbQTh
	HZpnPiVGTWdLerJUU5ymNwK0CrlTds6x4gr8XD1PELoxUUaRjCKJFZCowstFIao2TccBGcBg26k
	zx8l+DvqaR7BW6D7g7n4EM8hesYTbmM1rpG4ZCSB+gfhap2ABgWwCPurqLpAEG8jjy+zsiB8Kwt
	6sVJToHfmN7h4GCozpzks4biFVYu55hbeeKGyMBDCvQqe+8cRRWuh9Vc8krVlrzly2TRZaegapJ
	cA4Gr1xZPPKoLcIZlmgd449utSn+NiJr951LuEEWLe52HffznY3p1ntfRmiKEkjQSghM+rGjJzW
	A8Ml+tEXh498=
X-Received: by 2002:a05:600c:8b27:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-482db4998ddmr129478785e9.27.1770024476816;
        Mon, 02 Feb 2026 01:27:56 -0800 (PST)
X-Received: by 2002:a05:600c:8b27:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-482db4998ddmr129478555e9.27.1770024476481;
        Mon, 02 Feb 2026 01:27:56 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm437544775e9.5.2026.02.02.01.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:27:55 -0800 (PST)
Message-ID: <39c1b386-e6ee-46fc-a653-f86fa21e9e9e@redhat.com>
Date: Mon, 2 Feb 2026 10:27:51 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net-next 0/3] bonding: fix 802.3ad churn machine and
 port state issues
To: Hangbin Liu <liuhangbin@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Mahesh Bandewar <maheshb@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260114064921.57686-1-liuhangbin@gmail.com>
 <aX_6jyAQaDoqsR3G@fedora>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aX_6jyAQaDoqsR3G@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 2:14 AM, Hangbin Liu wrote:
> Hi Jakub, Paolo,
> 
> Is there anything I should do for this patchset ?

My take is that given we are now much more near to 6.19 final, this
should go via net-next.

Beware: it looks like Jakub and me are not 110% aligned on this topic,
so please wait a bit more for his feedback, thanks.

Paolo

