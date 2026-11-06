Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962220;
	b=P2rg1aJmDaO73qmqn+f9zqP8bXtaT44M8YngZnbJck+X9sMaphk4h0gF21elJ+3TzSkW
	 1Cg2Z/EnvXq9hkSkNhyp7bluIA7wxJUH95icNbJAy/XdHyF7ISMyBUp8vThEntTNda9CR
	 lyxdoR/HSDINUFE3UaZRm73WEEGTuMxR1cuN/xQm3rKUsdHBfWtvA1Y7fB46Fg7q9a1T/
	 6cjysJlYkynbMb1CZVRukEloQxDaT1o7/Vshg2R4YPQ1tH+sOcVRvqGkMdRU0Szr+STgE
	 aD9zpdczTibbD6epsJMeA72D1aFSjf5QSOZ/RGTheCVcjlkW+rqNwKoYiFK31e9LN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962220;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=JoGxU1FmWoIU8UQ+roEGVXwQfBtIFU5DeEvnVZCDq6k=;
	b=5NMdi+aXYMT1yHo8aq0+cnmY7ImD5pIN1xlJFHgLhhsLh7c0yYr1lds2xhKrNSESJUEl
	 9wEkpe1RqfIu4tJvAp3iVJktuRpMAAfQASqTGKwTwNG2Vj88B1CQ/v6GUSPSWTsNPUUAK
	 OQI0rQY7gH9OaXnh48LweF7yQWpv2ZC64PZfRB0KBxaR4UUZqYiRVgWEKEmbpZtXPWY2B
	 Zpr6VaE8PMLSbpN3DBL3GPZZAryCIy0GxDPh0+UTagTSATw/T0JwCyIWPJrHKMp+4VFAp
	 rh0xxknFjLn6l7IGKjMald2QBDWc5ARIM8HdlsNku+YM3mvivWPGENqfMesiTry4GAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZesrjnO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9C606D81B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D9C606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZesrjnO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoGxU1FmWoIU8UQ+roEGVXwQfBtIFU5DeEvnVZCDq6k=;
	b=NZesrjnOXWwTRkQGNpgmCYreqf309as2WmPd5RN5uMULJYfWGtiBuwd/nHfkJk24/xKoul
	/0gYRMGhqxnZ7m99kt/Rr+EwHG5znMrPZAiUQ1Z5KiGA62mG0lkDysgNc45sQcSwJS7jdN
	ZwXFjgfLiMBt/z+O8OKSmAhtA2nY2GI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-dYFMcNNNNEWLqLiCwqSYaA-1; Fri,
 06 Nov 2026 05:50:16 -0500
X-MC-Unique: dYFMcNNNNEWLqLiCwqSYaA-1
X-Mimecast-MFC-AGG-ID: dYFMcNNNNEWLqLiCwqSYaA_1793962214
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADF391955F54;
	Fri,  6 Nov 2026 10:50:13 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA1F81800480;
	Fri,  6 Nov 2026 10:50:09 +0000 (UTC)
Message-ID: <8650a441-1c03-4b3a-aabc-13e047831ff2@redhat.com>
Date: Fri, 6 Nov 2026 11:50:08 +0100
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
Subject: Re: [PATCH net-next v2 08/14] selftests: dpll: add pin priority test
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
 <20261105151852.1844305-9-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-9-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/5/26 16:18, Petr Oros wrote:
> Add a test that sets a new priority on an input pin, reads it back and
> restores the original value. The range of priorities a device accepts is
> not advertised over netlink, so the test tries one below the current
> value and then the small values every driver accepts, since a large
> current value may mark an unused pin outside the settable range, as the
> ice driver does with 255. A driver may still refuse all of them for a
> constraint the interface does not tell, so that is a skip on a device
> provided by the user, with the reason the tool reported, and a failure
> on the device the script created, whose simulator accepts every
> priority. The test skips when the dpll tool lacks the prio keyword of
> pin set, and the restore is deferred right after the original value is
> read so that an interrupted run restores it too. A pin that does not
> advertise the priority-can-change capability or does not report a
> priority is a skip on a device provided by the user and a failure on the
> device the script created, whose pins have both.
> 
> The dpllsim_add_pin helper gains an optional priority argument, which is
> written only when it is given, so that a pin without one keeps the
> default of the simulator. A priority is accepted for input pins only,
> so the callers pass one for those alone.
> 
> The standard device lays its inputs out as gnss0 with priority 0 and
> ext0 with priority 1, and the stress devices get random priorities on
> their input pins.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

