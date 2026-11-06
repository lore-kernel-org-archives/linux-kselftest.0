Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962335;
	b=vnRf5MOPveFehrhtEGwhQ6CW2xTef6lo+JVHYg/VL9YSNNB1n0rIFEW7Efj/uPzTaa6m
	 cmdQhXgcZtlzQGHDHRd1ltdyE2YpTDPvVp+Uc8Z7GOj5I+VeYaN3L0WJ4N35ql+nCjagx
	 J0RAe2HE8AedCRcCA/qWGrYVOIdPQUdRDY2B5pPXfVySgtgy2eKjJkbgEnU4q6tJZwDLq
	 siawY1YzGo7kPcdL1arxZCMCfGiHBQyeT/Fwc4ESEMcH5FhZ3Kb76z/qRGiO2EjiUfaGZ
	 fYRoclbuENkBVj48Eh9AgNenXkwjMqYgOoPxM1zM6z+5I8QkutcyHQak/X+iUTGhRcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962335;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=BjHfKACEWw1yT39SIoyzSXqMcGaGQJy4fXAp5Zhpq54=;
	b=PMPIv7Yrw34dky12gvO6H735/nZW+UuZV2JqL3ZAAjGfsgFssZk/zXs3A7nniIQTSOpV
	 2KAAryOulHy3WPuVOXPLgf2s8J0dDHAgYOyonm/Rvj0l1bxuk8jsBqTDi57WWAGXCfbs+
	 fjHQvwcYx6fGF8AyP8NxL2XGV/mw1yHZ0lJDCit2lNoAQbEJUpVunzmwJ3lMDaH9WeRmX
	 ZWCcJ8aNx71VlRHPNAx22pwQcnygCNUAcMZmeFAAtMUI0jLBZgZ/U3pPLHRR7/OjfE2uW
	 ZXmnEqwCLnmEUgK1MVLHlzGz7rJUK5yK0KDQqTb/WVWEx0JUkOngD7l2ZxZpM8sV57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwLTsSIk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A41606A334
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A41606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwLTsSIk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjHfKACEWw1yT39SIoyzSXqMcGaGQJy4fXAp5Zhpq54=;
	b=QwLTsSIkDKQeiFzBLRzMPNC/W0wnpHtQ2YobBlPo1AcFzRj6HRsakm85qB94XqQNZnmeIS
	JlX2FZLkkN6FF4Gq0OctQMVE3ZcggEGEbQsQuHeFWDdp0wvRBsC0R0oWAQNk4F1n+Ey9/L
	iLWWdp5FWwM8AhoiVuUOFh6PMYaDVTg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-y7HnwtcQOgKp0V4Lpzfjdg-1; Fri,
 06 Nov 2026 05:52:08 -0500
X-MC-Unique: y7HnwtcQOgKp0V4Lpzfjdg-1
X-Mimecast-MFC-AGG-ID: y7HnwtcQOgKp0V4Lpzfjdg_1793962326
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 480871956068;
	Fri,  6 Nov 2026 10:52:06 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30D64187C371;
	Fri,  6 Nov 2026 10:52:01 +0000 (UTC)
Message-ID: <5314bb81-f271-403a-b4cc-f2dd01750b3a@redhat.com>
Date: Fri, 6 Nov 2026 11:52:00 +0100
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
Subject: Re: [PATCH net-next v2 13/14] selftests: dpll: add concurrency stress
 tests
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
 <20261105151852.1844305-14-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-14-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/5/26 16:18, Petr Oros wrote:
> Extend the stress script with tests that register and unregister
> devices from several processes at once and that keep a number of
> devices with many pins live at the same time, checking that every one
> of them is visible on netlink.
> 
> The workers run in subshells, so the parent cannot track the device a
> worker has in flight. Each worker removes it from its own exit trap
> instead, and the parent reserves a range of clock IDs for every worker,
> so that the devices of a worker cannot collide with those of another
> worker or of the parent and whatever a killed worker left behind can
> be removed by name, at the end of the test and from the cleanup
> handler. The handler stops the recorded workers together with the jobs
> of the shell, gives them a few seconds to run their exit traps before
> forcing the survivors, and goes on without a worker that does not die,
> since one stuck in the kernel would hang the teardown. Deleting a
> device treats a part of it that is gone by the time its step runs as
> removed, so that a removal running concurrently with the one of a
> worker does not turn into a spurious failure. The workers inherit the
> open lock file of the library, so the lock is held until the script
> and every worker have exited.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

