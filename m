Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962164;
	b=gJy5Q3zgSwZ2WSonw+oWVyqf555KyGUfItiyJ+1wrYdfYrCsud11zqSc6GoLzZUuh79g
	 OQwPpJdD+H1r0K4zLip4PEOIEnLznVUg2zjNzoLlIYXdAQvyjUWwj4zS8HDYEjOv1zH4g
	 dzNVzvkAQgSBlaH9jiEgqILGl7/HP2VVjDrSK7qoBACQOTEvCsltsKnECBQcQJyvpbmSx
	 rwgj8+ajNaWG6LIPaiW/mKG7Ggddoxj1vzaomZ61TmNkdVGgSmIW+Eol9TKxn9T18PpWs
	 4C5+fAhRKatFQPPiyIrSEYexuNOgBLcCfvPZC6+cO3Gh6E+wBvHzh8D1udUtr2h8nog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962164;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=OMScx+ZfRFBqsHaUAOcjEp0K/Uj5h/TPVm71DTFyVWk=;
	b=4iFTRnn4z0j8QbaVYtdYlsokCPdbFnA0vetZw4q8N/S7kFHm+CP+LrZziSlFUrslNp3R
	 EjI5ucx+0VfOYWpgtw6vmQhekc2nLhuCYdalZ+yrJbVFqfHK35TYJrV8Y8vXyRkjcvKFz
	 TtDWZfNuYo63TJfK1U+G20hthcbFLSZZTCfY3nKMI1eAnen5HwN+26xn+bQ200SQ2LjqK
	 9zzEoiexWWf3iUCJbf1pOFwUpqXqPVLnGTQFwayQZEui1n1S/4gpKUQyRiO2op4MI/IIn
	 Fxpd/kgNpFbIsGxMhZmRxb7FifkImmnCP8DSCc9kjY5r6eoL4A9RQWIZ3bBFxEye3sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6AUgS8b;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C4606A326
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6AUgS8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMScx+ZfRFBqsHaUAOcjEp0K/Uj5h/TPVm71DTFyVWk=;
	b=I6AUgS8b66BcHjNIzNPyZrdorgNNemfm7zjRLeOF1T0wM23JqEfCVWRigj6OeUp0al1tEL
	JmNqa845q5M/81RTbci3LhWDCjkwDItjpCWVkpneQKfm73pYCy4bbu+ZqeoOTD/BpIAmUE
	7oKc73kkpTiS/iIhssTWlPUeKV8jCc4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-j9MkFA5OOkeln0rWh6CpDw-1; Fri,
 06 Nov 2026 05:49:13 -0500
X-MC-Unique: j9MkFA5OOkeln0rWh6CpDw-1
X-Mimecast-MFC-AGG-ID: j9MkFA5OOkeln0rWh6CpDw_1793962141
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5E351955F0C;
	Fri,  6 Nov 2026 10:49:00 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C73D1956047;
	Fri,  6 Nov 2026 10:48:56 +0000 (UTC)
Message-ID: <239ed02f-466e-4a7e-869f-e9684623c5bf@redhat.com>
Date: Fri, 6 Nov 2026 11:48:55 +0100
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
Subject: Re: [PATCH net-next v2 04/14] selftests: dpll: add pin enumeration
 and property tests
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
 <20261105151852.1844305-5-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-5-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/5/26 16:18, Petr Oros wrote:
> Extend the library with pin queries. Pins of a device are collected
> from the full pin dump with jq, since older iproute2 lacks the device
> filter of "pin show", and the fields that live in the parent-device
> nest are read through a helper that selects the nest of the device
> under test. The helpers that work on the full dump normalize its shape
> the same way the id-based ones do, so that a tool printing a flat
> object instead of the dump wrapper works with all of them. Like the
> device queries, every pin query runs the tool first and jq on what it
> printed, so that a query which fails returns the status of the tool
> instead of the empty output a missing attribute produces too. The
> prerequisite check now also requires a tool that knows "pin show", so
> that a tool too old for the pin queries is a skip up front rather than
> a failed query in every test. The dpllsim helpers gain
> dpllsim_add_pin, which creates a pin directory and writes its type,
> frequency and direction, and the standard device grows a GNSS input,
> an external input and an external output.
> 
> dpll_basic.sh checks that the enumeration yields a numeric id for every
> pin of the device, the ids are taken from the dump as they are and jq
> prints null for a pin without one, that every pin has an id and a type
> and carries the direction in the parent-device nest, and that an input
> pin reports a valid state. The property test does not go on to query
> pins by an id that is not one, and reports a pin it cannot query at all
> as one failure rather than as one per attribute. The frequency is not
> required, a pin without a frequency callback does not report one. The
> device the script created has the standard pins, so an empty pin list
> or a missing input pin on it means a failed query or broken tooling
> rather than a pinless device. The library gains
> dpll_log_test_skip_or_fail for such conditions, which fails on the
> device the script created, recorded in DPLL_CREATED_DEVICE next to
> DPLL_DEV_ID, and skips on a device the user provided. The stress script
> creates its devices with a random set of pins of every type and both
> directions, MUX pins always as inputs, and the deploy cycle test runs
> with the standard pin set.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

