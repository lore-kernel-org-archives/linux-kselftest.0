Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786841;
	b=hLY1nNATs0Mdib/1aVEyDHMVMOrWCGqsVgoWI+z7lSDBR+IRHSJRjRjpQPG0ClbgrvvH
	 jL2nSVbPFI1nG+77KZ6NY5+WYtZXych0HqM0EwJ93j8TsMGpoNfI0/uJZ4a6KxVutapql
	 cqd0WNhSY5pcz05DxNN8GnmgsLrskQ76N3cz4rVysi8P2LmQMCwQAXuIeaT/slphBtbRf
	 wrXluzNx+lfTv/zNiAFwfph+FOvbt3QtF41GI+wj8CuBXxP5eui4f+DEhiDz0UixSO2g0
	 1koAT716jATKtygPI0esh208bAFAmIK98/RhHDSSBvl7ZblK6jB8f1t1+kw4O1otAWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786841;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=+++htzLaVrGkvQnjm1karEJsL1q5AA/35ff8G5m2bmg=;
	b=b25kC9/TRFfiWy/CybmT0FwhbfbAreeQxJO4TZX5xOk/2Jt9AAnOy1QTN2iiyA3XV2P5
	 VVbpZJ2ar3jhj6v4P65dVoCKaxAzPiI4c9J+SshlPivLMo9YeRhjnmk2ICX81qERWc5FW
	 rrFj6bPHoPUmi6xCzf8f6rIHd0P/fSGCpwF2WVsNwNPNNy8RnOu7qWelPznZBTejdiLbp
	 go0/pJ+X+SOSK9MxCPuG9E06rwmNwCq4sVdmJ7Te1f1iWOE4SPh46Q2qrpmE7b+1ibapx
	 q1tKYzdTOiu1+SZ5czR20rW+zDt6GCcvL8JNurzgFyYaWOKT7kPsunyQTu0v7lBjWtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmkVX9Ky;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538D606A329
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5538D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmkVX9Ky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+++htzLaVrGkvQnjm1karEJsL1q5AA/35ff8G5m2bmg=;
	b=CmkVX9KywQmsz3VlrgQYNlFgH+yo5s/pQr1R6TtEx+MvF7fd4te5Ha5Q9YgLdiO2ot2YfC
	NI6SpDLy3LOiY2StGp/QtQdgL/LiQROUT1m8F5xL/Nwj4fiZ3fzPxAPOZgbL5BADtGVhQ/
	9xIEOA79kdj0c3VKFLlrkIDiSgZc1dk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-Q7glbEb1MnqY2j28k8Yu3w-1; Fri,
 27 Nov 2026 13:40:34 +0000
X-MC-Unique: Q7glbEb1MnqY2j28k8Yu3w-1
X-Mimecast-MFC-AGG-ID: Q7glbEb1MnqY2j28k8Yu3w_1795786832
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2662B1956079;
	Fri, 27 Nov 2026 13:40:32 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11471180054C;
	Fri, 27 Nov 2026 13:40:27 +0000 (UTC)
Message-ID: <826f2aff-5f94-40c5-8c80-82ae0f0c11e3@redhat.com>
Date: Fri, 27 Nov 2026 14:40:26 +0100
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
Subject: Re: [PATCH net-next v5 08/14] selftests: dpll: add pin priority test
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
 <20261125090522.3777494-9-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261125090522.3777494-9-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/25/26 10:05, Petr Oros wrote:
> Add a test that sets a new priority on an input pin, reads it back and
> restores the original value. The range of priorities a device accepts is
> not advertised over netlink, so the test tries the two values above the
> current one first, none above 255 though, ice hands the priority to its
> firmware as 8 bits and a larger value would turn into a small one that
> ranks high. A lower value ranks higher, and in automatic mode a
> selectable pin that outranks the reference takes over from it once its
> signal qualifies, so one below the current value and the small values 1
> and 7 are tried only when the selection does not consider the pin, in
> manual mode or when the pin is disconnected. A driver may still refuse
> all of the values for a constraint the interface does not tell, so that
> is a skip on a device provided by the user, with the reason the tool
> reported, and a failure on the device the script created, whose
> simulator accepts every value the test tries. A current value the device
> does not take back could not be restored, so the test writes it back
> once before it touches the pin, which changes nothing, and ends there
> when that is refused. The test skips when the dpll tool lacks the prio
> keyword of pin set, and the restore is deferred right after that write
> so that an interrupted run restores the value too. A pin that does not
> advertise the priority-can-change capability or does not report a
> priority is a skip on a device provided by the user and a failure on the
> device the script created, whose input pins have both.
> 
> The dpllsim_add_pin helper gains an optional priority argument, which is
> written only when it is given, so that a pin without one keeps the
> default of the simulator. A priority is accepted for input pins only,
> so the callers pass one for those alone.
> 
> The standard device lays its inputs out as gnss0 with priority 0 and
> ext0 with priority 1, the plain input pin every stress device has gets
> priority 1 as well and its extra input pins get random ones.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

