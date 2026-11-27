Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786784;
	b=FOyMh5aOpKyh7pXQ8E0sSpIoNemF33Fk+3NV3kVrrVpmVoBKi0KepCIrVdPvqd/NbX/3
	 i0AHOfVi5PtqC5iyQlaqLrVm9OoIL0PY7novTqPUbJ7+qZc3cxEJBZhD57NgPDq/FPsh3
	 9VSb5wvHgYW4fwUzBRyGodA1j3g7E3YpkJxbQ+TNkmfkW2yQKNzhLJUNzWm9tqaeLWHz7
	 wznMNE2JzVR/kD1FqgO5BIUQyb/tL2imSRZQBGvzvQRXU2t5orn5hz02eCFo0xQ8hOzL8
	 pJ4hj6PlGZVJ0jHpmVk0yf0+ki/eT29miiLSKcSNtv1K4uVTLfcutpsBg7qOSp+yZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786784;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=2PM+uxG5Fn1P1YGldfCKNEzcWDpv+pjhJWUbR6zOp7M=;
	b=jWelfSjFszGzSXhUfv0aQZ6OiZNj0vkw7EvIUZQpZiXbNBNOXtTzMmmrf+vw3Sp2mZp0
	 W+JSxg2chO00aTy2TxtRP9RNIW+iwzmAaf9ER++uyKcYp3t9Smu0R8aMQqfHUxlZEfBw4
	 La2MLwn2mgpzHfkySp4PZ93q1deCQ24i447A0VNPA0ZCQZunk5XU9cvQqwiA146iLTCeD
	 NWsK4he9lkrg+rliBDQSbhCFUPDznwk9AwJugttjKCb78vHs5g1VqWOuP1Rg9QVm4Yv0F
	 mgwhvbMHiwUHr3Wd8r6Rn+EL9E39XFgn/+m8QBCzTEmHxRlbtoFQtGDk34TBPdj26iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KpegYBhL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B5606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 13:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KpegYBhL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PM+uxG5Fn1P1YGldfCKNEzcWDpv+pjhJWUbR6zOp7M=;
	b=KpegYBhL5by2LwG+XiKMmgyBjBtbY1SPjgX0ZGMLksh5ijxwaRY+NZex3xb9IX/vvfmAR8
	nS3ynVcYbZ9iXCg/yeVKlOJgTQu9uQnK5h12JKg888FpSre3P314eQ1KGFftwvGsWqrhM/
	Hd3SGgvqMfw9SjwAyKZ8JKFO0ctf6BA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169--T_V3DQhOHK6aoc1SVs_gQ-1; Fri,
 27 Nov 2026 13:39:40 +0000
X-MC-Unique: -T_V3DQhOHK6aoc1SVs_gQ-1
X-Mimecast-MFC-AGG-ID: -T_V3DQhOHK6aoc1SVs_gQ_1795786778
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FA4C1956041;
	Fri, 27 Nov 2026 13:39:37 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EFD4518004FC;
	Fri, 27 Nov 2026 13:39:32 +0000 (UTC)
Message-ID: <2505b9de-c1aa-4338-b097-59fd59ac7289@redhat.com>
Date: Fri, 27 Nov 2026 14:39:31 +0100
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
Subject: Re: [PATCH net-next v5 06/14] selftests: dpll: add pin state tests
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
References: <20261125090522.3777494-1-poros@redhat.com>
 <20261125090522.3777494-7-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261125090522.3777494-7-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/25/26 10:05, Petr Oros wrote:
> Add dpll_features.sh, a script that exercises individual pin callbacks
> with get/set roundtrips over netlink. It creates a dpllsim device with
> the standard pin layout by default or runs against the device named by
> DPLL_DEV_ID or the first device of the driver named by DPLL_DRIVER, and
> picks the pin to reconfigure up front, so that no test touches the
> reference the device is locked to. The pin is an input that is
> disconnected or selectable on the device and that none of its parent
> devices reports as connected or, where the tool prints the operational
> state, as active, since a pin can be registered on several devices. A
> parent device that is locked or in holdover and shows no such input
> hides its reference, so no pin is picked then, while an unlocked device
> has no reference yet. The NCO input of zl3073x, which iproute2 prints as
> a pin of unknown type so far, and both pins of a connected reference
> sync pair are left alone. The comment above pin_is_spare has the
> details. When the first input pin and another one both qualify the other
> one is taken, drivers tend to list their primary reference first. Every
> test checks again that the pin is spare before it changes it. A spare
> pin can still be selected while a test reconfigures it, which the header
> of the script points out.
> 
> The first test moves that pin between disconnected and selectable, the
> states of automatic mode as Documentation/driver-api/dpll.rst defines
> them, reads the state back after each step and restores the original
> state at the end. On the device the script created it then checks that
> connected is refused. Hardware drivers are not held to refusing
> connected, ice accepts it in automatic mode, and a pin with the
> state-connected-override capability would take over the reference. On a
> device provided by the user a disconnected pin is offered to the
> selection only when its priority ranks below the one of the reference on
> every device it is registered on, it could take over otherwise, and the
> readback accepts that the device picked the pin as its reference. Manual
> mode, where connecting the pin makes it the reference, is left out until
> the simulator can change its mode, a device provided by the user in
> manual mode is a skip.
> 
> A driver may refuse a state the capability promises, for a constraint
> the interface does not tell. That is a skip on a device provided by the
> user, with the reason the tool reported, and a failure on the device the
> script created, whose simulator accepts both states of its mode. A
> refusal that follows a failed readback leaves the test failed,
> dpll_log_test_skip_or_fail no longer turns a recorded failure into a
> skip. The restore is deferred right after the original state is read. It
> acts only while the pin is changed, when the test ends early or its own
> restore was refused, one that gets to the end otherwise restores the pin
> itself and checks it. The cleanup handler of every script that defers
> runs the pending restores before it removes the devices the script
> created, so that an interrupted run puts the device back as well. defer
> reports nothing about what it runs, so the restores go through
> dpll_restore, which logs one that fails, fails the run and returns its
> status. A pin that cannot be queried is a failure, not a pin that is in
> use or lacks a capability, and so is a device that does not report its
> mode or the state of the pin, both are mandatory.
> 
> The stress script gains a test that floods one input pin of a fresh
> device with changes between the states of automatic mode and ends on
> selectable, the state a fresh pin is not in, so that the readback after
> the flood catches a setter that stores nothing. The library gains the
> state setter both use, which keeps the extack line of the tool in
> DPLL_LAST_ERR so that a test can tell a refusal from a failure, the
> device mode getter and a check whether the pin set usage of the tool
> knows a keyword, so that a test skips on a tool too old for it rather
> than every script requiring a newer tool.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

