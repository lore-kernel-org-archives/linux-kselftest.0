Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232817;
	b=MiPaZ1RhDLbB/CmD9u8BzcaMTp77oSwXclBvVnJI5xvUYpIAnZmFqaQL9BOAXdbnRX0K
	 cRhDcnkumplAVvb+DP3RZEgRtEMhW4xZ7rUhde+B6pztNz/7JM3Ob/KD5GyMWy6GnJoSU
	 1SUIeR99BARVh+94sS3kcPGJTDzwJU8XJBVr0twBNerrHYvNdYi//rgRJKElljVOk2cO6
	 qfH1MPqVpjbaEhb9KABXgF9Vk+eO8yJXNBTihcmhdaUneFv3/HUPX97hnEHQcREl8XAGP
	 DIelruCSBlTAHHvqmtBRI4xjKIKwwwLVO+5xu9xtv15urui35ECqTNGwT9bsyBW8MLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232817;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=DHIw1EPWZJB++YZvHsd7F6bNOe1Qinnyb4fKKIHoJSM=;
	b=Ne3mc2ml/rUliE3Ov95InJ8pkG5LP7TUHccSqECDak5Dg/PfbRy6CsxfAXkrVw96K24D
	 KxjppLYtiawwlZrN8zOKY+5kfpJSQqZN6lz8j2FkAYw0lEzYNScmEhofLRxDmb74u08nW
	 Oqt5o0nN5SjfLBrbkYJIkaimBZMvyuwX4gPwFaulNtTvIzDuBIbsOx3mOElJbnjvRrlXn
	 WLMGeNjKm4iiYDuBcByX46XnQoYDb09rE9/6kVsri700Iouq1/5fbWO7oLlev2pnoOSiM
	 LIjCAG31kcMd53G/JdM/1kBjfc5jD/Ddz8CKyvEve4PlVavn5ovM4KB6pzYeNZDOK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+eW49q9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6775606D801
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 14:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6775606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+eW49q9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794232816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHIw1EPWZJB++YZvHsd7F6bNOe1Qinnyb4fKKIHoJSM=;
	b=h+eW49q9y47rYNeBHrRoS7kdlGOvYflmZUGHgk6mgOQH63Fe0G3mqYdx9EhIQeRTNeob2v
	OuTGW128ZCeRKcnpMv8qiihjTQ5uEIwN3jw/rUjZG3OB20S42gEPI0UBi/PJR7y/gfHKo1
	GR+Dx/tRfzcREWLh8QPpxTuupr0RfzM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-hbW2XiHzOLGS3RfqDgBnBw-1; Mon,
 09 Nov 2026 09:00:09 -0500
X-MC-Unique: hbW2XiHzOLGS3RfqDgBnBw-1
X-Mimecast-MFC-AGG-ID: hbW2XiHzOLGS3RfqDgBnBw_1794232807
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7952180055F;
	Mon,  9 Nov 2026 14:00:06 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FF8018004F7;
	Mon,  9 Nov 2026 14:00:02 +0000 (UTC)
Message-ID: <820f8832-ab71-4f6c-b469-b49d7518196a@redhat.com>
Date: Mon, 9 Nov 2026 15:00:01 +0100
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
Subject: Re: [PATCH net-next v3 06/14] selftests: dpll: add pin state tests
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
References: <20261109093523.931201-1-poros@redhat.com>
 <20261109093523.931201-7-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261109093523.931201-7-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/9/26 10:35, Petr Oros wrote:
> Add dpll_features.sh, a script that exercises individual device and pin
> callbacks with get/set roundtrips over netlink. It creates a dpllsim
> device with the standard pin layout by default or runs against the
> device named by DPLL_DEV_ID or the first device of the driver named by
> DPLL_DRIVER, and picks the pin to reconfigure up front, the first input
> pin that is not connected on the device, so that no test touches the
> reference the device is locked to.
> 
> The first test moves that pin through the states of the device mode,
> as Documentation/driver-api/dpll.rst defines them, reads the state back
> after each step and restores the original state at the end. In
> automatic mode these are disconnected and selectable, and on the
> device the script created the test then checks that connected is
> refused. Hardware drivers are not held to that, ice accepts connected
> in automatic mode, and a pin with the state-connected-override
> capability would take over the reference. In manual mode connected and
> disconnected
> are the states, connecting the pin makes it the reference, so the test
> finds the pin connected before, connects it back at the end and checks
> that it is the reference again.
> 
> A driver may refuse a state the capability promises, for a constraint
> the interface does not tell. That is a skip on a device provided by
> the user, with the reason the tool reported, and a failure on the
> device the script created, whose simulator accepts both states of its
> mode. The restores are deferred right after the original states are
> read, and the cleanup handler of every script that defers runs the
> pending restores before it removes the devices the script created, so
> that an interrupted run puts the device back as well.
> 
> The stress script gains a test that floods one input pin of a fresh
> device with changes between the states of automatic mode. The library
> gains the state setter both use, which keeps the extack line of the
> tool in DPLL_LAST_ERR so that a test can tell a refusal from a failure,
> the device mode getter, and a check whether the pin set usage of the
> tool knows a keyword, so that a test skips on a tool too old for it
> rather than every script requiring a newer tool.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>
> ---
> v3:
> - follow the mode of the device under test: disconnected and
>    selectable in automatic mode, where the simulator is checked to
>    refuse connected, connected and disconnected in manual mode, where
>    the pin connected before is connected back at the end
> - cycle the state flooding test through the states of automatic mode
> - add the device mode getter to the library
> - honor DPLL_DRIVER like dpll_basic.sh does
> - follow the move of the selftests to
>    tools/testing/selftests/drivers/dpll
> - the Reviewed-by and Acked-by of v2 are not carried over, the
>    state test changed

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

