Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962238;
	b=SmlL9yQLJDFopxuh7UGnWnt66i6hVmTlnsRVJiIKqLIZVueA0xLn1II/srJ7Bqn4m0CM
	 0auZBDMpRsRdFangquYkRSpC8k4fWEVyAzIo7nwgZk+KLGVv7CIDfmm9UWFMwJnGBox/h
	 KxrJPyaJbKCsgZj2a2IRdOiSvUIw3qviK4XVRFGIeJ4SAKGqabG3RvRAmHwqNlxp1l81S
	 Vy0KoWKakOzvlxMMnfxkSIWvqwjj2b184pawqz4EvJGUpYO5v7xaju8i9+Gb9hOkjUCHg
	 wQo9E53hCukxv8EMwdM4YIiJ5g2bAc9zS3fNoCZLLFgCk1bpILV+5uLkCNa4SLw2Djg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962238;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=VaTuCkSJKJEAY9i/vs3DHvelrwbFZGh+V9o299AVh+0=;
	b=pLKYoo/lnMth19FIazpFh+wVJKPxnTFFogEvj0F4CGD+SMmn/G2rli1CbyACBUhx/S0I
	 6pL4PShajcdEwqT52ou+0KL7sXrr3tiOSOVW0RsZ6eSK9CVZCHf961skH0o07m9/Q/WNz
	 PBYz39HRlnB0Pn9kfh800mv3TU6lqiv6Ou17d9Zj9SNsmMPunqdPMbGAY17YitoJwvwDF
	 Oi7JVoMBTl6q4mrrcColxNCea1jf4n88opBGxWCY1F+rnFHEemI+3TKHlLKgNgWoZve+A
	 K42Z7NHEI3NjNJKQZJsQ2iE3W/qd6XZ89TUkMKc7IRzEQeD2XQZstWncKWm3fNYAgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fClGYev6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A3606A331
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510A3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fClGYev6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaTuCkSJKJEAY9i/vs3DHvelrwbFZGh+V9o299AVh+0=;
	b=fClGYev6E/70KWl7iCtYNCoZ8uoPqSZoWhv8ILMwNfw9mXj6CqXsvsyVhNWx1V2RNxtUn4
	4lepRh4WyXShpgKgLvRCm7VomEuKsmLg5wVW3zlyGQZPc7O4wK3q1avOEAX+/Q/8uJy6bd
	qkH8JDn3bFbvddIyKi+byP11Bf74apQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-JvABvuXbN5igis4jHvFBdA-1; Fri,
 06 Nov 2026 05:50:32 -0500
X-MC-Unique: JvABvuXbN5igis4jHvFBdA-1
X-Mimecast-MFC-AGG-ID: JvABvuXbN5igis4jHvFBdA_1793962230
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FC211800848;
	Fri,  6 Nov 2026 10:50:30 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56A281956047;
	Fri,  6 Nov 2026 10:50:26 +0000 (UTC)
Message-ID: <bcad7df2-4515-451e-85ec-aee53e391f27@redhat.com>
Date: Fri, 6 Nov 2026 11:50:25 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 09/14] dpll: dpllsim: Add support to set
 frequency on pins
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261105151852.1844305-1-poros@redhat.com>
 <20261105151852.1844305-10-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-10-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/5/26 16:18, Petr Oros wrote:
> Add support to set the frequency of input and output pins. The DPLL
> core validates the requested value against the supported frequency
> list the pin advertises, so the frequency_set callback only has to
> store it. The same per type tables that validate the configured
> frequency at live time serve as the supported list. The configfs
> attribute is rejected with EBUSY while the device is live, so only the
> netlink setter changes the frequency of a registered pin and the two
> cannot race.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

