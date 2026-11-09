Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232624;
	b=kELFUaTS9DYNH6XFhzS3PWvmkBZ2rqvR/4l5w1fUaZO0NTeQSl3PPgrVZl2Bcv3V6NUr
	 fudCqlEMjMg3Wk1YoDjhQ3Laq19xegctX06+3wvPO8/8JV9tFnYAh1rp4ktl0y2XkHaIN
	 fNfavRJoOHRQbphJaNcrx8gdiikgUmkNv3j2FwUYT1iZUaYShT5ZSCnvD+50JA95QVqpG
	 tL4/FudTdeZPF6uufcTchnKjDjNHH9WXO4ptS5UQrcQ/qflidnSWOoPYHnwNwseg+L+sd
	 bjLj7h5BKvv1c+pe+gJTl7N+ErspgAfK5On9/ulx+5xSyHtfMgBdsj5lqJx/rx2W0RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232624;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=+Zlx9UXTcVUvxZSzHHlcX8ufFirWkBP9ER+pKSktKjY=;
	b=XoJqApYa6xEO3Mhz83OtTElrKOa4OTrQVriRQnQuv29JaOtxq1RDhaaSkgQVgOP6leM7
	 lpLV+yUeRKgrZOn8Dk8GvQghK8qE1v6jrM2sxscu0/r6EWmM49YSy27LzO/dDOUi9epLC
	 2yPKQyn/G5bCv6njSesNZPqnp7cWwDQoEk6ptfTTHOBpG6V0BWSSd7s4WIu7GQRIhs/qr
	 FScFEtGZazMqs6eB+UwV/q89dBZVY7oJV4gniUaPi2FWEZJbnNcG5GiCJPVk4fK7GG49S
	 qrNi1OM7FtDG78jxteYtd04aGZy/82QEGfWKJscj16+dN/Iieq4PUxX01O1/lzUwJsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnsdCDZK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D5606A330
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnsdCDZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794232622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Zlx9UXTcVUvxZSzHHlcX8ufFirWkBP9ER+pKSktKjY=;
	b=SnsdCDZKZ/jnb015umIXVXZG5wnob8z8BJWrtb1F75hDWW9xRbAKW/NwxkRfE7CZHPjwep
	qZiGS+gENzMCJg6rtfaKDFN40AR0/VqNhTHT0KSzm4e06luT1JIiQA/3TnfVmQGfjdTZ1K
	EJyho/6XOFGI/rmYoacOCKNky2bF2wY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-NdtykzX0Mjm6uDMm8botRQ-1; Mon,
 09 Nov 2026 08:56:58 -0500
X-MC-Unique: NdtykzX0Mjm6uDMm8botRQ-1
X-Mimecast-MFC-AGG-ID: NdtykzX0Mjm6uDMm8botRQ_1794232616
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDBE71956062;
	Mon,  9 Nov 2026 13:56:55 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F49B1956087;
	Mon,  9 Nov 2026 13:56:50 +0000 (UTC)
Message-ID: <1337732c-865c-474a-9d3d-456bee396449@redhat.com>
Date: Mon, 9 Nov 2026 14:56:49 +0100
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
Subject: Re: [PATCH net-next v3 02/14] selftests: dpll: add test library and
 device lifecycle tests
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
 <20261109093523.931201-3-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261109093523.931201-3-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/9/26 10:35, Petr Oros wrote:
> Add a shell library for DPLL selftests with wrappers around the iproute2
> dpll tool and around the dpllsim configfs interface, and the first two
> test scripts built on it. The library resolves devices by the clock ID
> chosen at creation time, since netlink ids depend on what else exists
> on the system, and the dpllsim helpers restrict the lookup to their
> module, so that a device of another driver with the same clock ID is
> never picked up. Every query runs the tool first and jq on what it
> printed, so that a failed query is told apart from a missing attribute.
> The library mounts configfs when nothing else did, and the exit trap of
> each script undoes that, removes the devices the script created and
> runs on INT and TERM as well, so that a timeout imposed by the harness
> still cleans up.
> 
> Two runs of scripts that create dpllsim devices would share the one
> dpllsim directory and could draw the same clock IDs, so every such
> script takes a lock before it mounts or creates anything and skips when
> another run holds it. The lock file lives under /run rather than in
> /tmp, since the scripts run as root and open the file for writing, and
> a symlink planted in the world-writable /tmp would redirect that open.
> 
> dpll_basic.sh checks that a device reports the mandatory attributes
> over netlink. It runs against the device named by DPLL_DEV_ID, the
> first device of the driver named by DPLL_DRIVER, or the first device
> that is not a dpllsim one, and creates a dpllsim device when there is
> none or when DPLL_DRIVER asks for dpllsim, so the same script serves
> the simulator and real drivers and picks one of several drivers on a
> host. dpll_stress.sh is simulator only and exercises the lifecycle
> paths of the core by creating and deleting devices in a loop and by
> cycling one device through repeated register and unregister
> transitions. The dpllsim MAINTAINERS entry covers the new directory.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>
> ---
> v3:
> - move the selftests to tools/testing/selftests/drivers/dpll, next to
>    where the drivers live, with the library in that directory as a
>    TEST_FILES entry; the TARGETS and MAINTAINERS entries follow
> - add DPLL_DRIVER, which picks the first device of the named driver
>    or, as dpllsim, a created simulated device on a system that has
>    hardware DPLL devices
> - the Reviewed-by and Acked-by of v2 are not carried over, the
>    device selection changed

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

