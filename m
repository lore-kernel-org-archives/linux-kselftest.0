Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962187;
	b=AAI20qioJfMl0Bi/aP9dWX9yhBCzY35hTVexixZVtax0BaXeoJMrWQt2FvhbbiG+W3Z/
	 wMyLDr7Dm51y/ub4iRJQXsstkm6BlwNNyg5ykHAswtv62S23PELr78k3dx/QynhUWDbHi
	 dyUwdj7UcyBpVI6tIgEFxR1SMbhYBuOS4dSeNcsnds5hqoF0YzMAoCd0btyc0yvKMX8H2
	 CLCk1FoZXR687Zfhto8Z8DGKY6K9nN7z9NHV0U/O2F4eDPHC5WThELga3dpJ/VMuuavqE
	 qbpvt9FQYFfXMwLT2YFXVbSw4ssCM8jkVFIrkRAqs0WhuJP5ED7h9W2DHFqC6G3C2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962187;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=SELXEfX9ebCtzIS5tRc2uRvMLnzGkjG+xyKR95hZo5c=;
	b=2IvsKOe1k5tcJ9EZOBHE2Xni7fItwjm23NTzihFqsYatI0W2OPc3/usgpDaUs74Gcew3
	 BJQNs8nMwpDMHV4q2gXu3iXwNo5hqvYSrsga/05T0Bc94dmVChQoCp5eEa6lPcz2MePcD
	 Jvatpser84E2kA035f+q5QGY9j5jKftxKzH503NN6RZXW3L6j4+N9tfbyYSCPVV4JV/Cy
	 Q6Xiq7LAQrbJAeztTO1B9P6KYCuF5xHMNiK4cZy+VIkJ9xHFXzAN1nRgII/n1DiYXq1/x
	 GBMohSqq422JxvlwChKr5hjVVf9RSiln5mn9VjCW5n112CMwPfHtoBX38AwKVXHcm3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwEoBc7P;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6117606D811
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6117606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwEoBc7P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SELXEfX9ebCtzIS5tRc2uRvMLnzGkjG+xyKR95hZo5c=;
	b=QwEoBc7PHd2TXN1zP7MXeyTNAQ7yD5pr2ysginA3Oqso5r0YcEFcHtAFyC20hygNlVLAN6
	qt6DZ+0aF88fBRm6mzERgTTl4DJHGzZ9a9+8vG1WyJtmcu41YzawD1hjldmT71svbo9OCw
	Ixg01nmsaOyPSwWGPYLCuDHTD8SNR9M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-5xgCKugKN8qXrVce3uZIlw-1; Fri,
 06 Nov 2026 05:49:42 -0500
X-MC-Unique: 5xgCKugKN8qXrVce3uZIlw-1
X-Mimecast-MFC-AGG-ID: 5xgCKugKN8qXrVce3uZIlw_1793962180
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CD75180054E;
	Fri,  6 Nov 2026 10:49:40 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E14FB1956047;
	Fri,  6 Nov 2026 10:49:35 +0000 (UTC)
Message-ID: <6e6a0f97-7db6-4b4f-be78-08adce9a0192@redhat.com>
Date: Fri, 6 Nov 2026 11:49:34 +0100
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
Subject: Re: [PATCH net-next v2 07/14] dpll: dpllsim: Add support to get/set
 priority on input pins
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
 <20261105151852.1844305-8-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-8-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/5/26 16:18, Petr Oros wrote:
> Add support for getting and setting the priority of input pins.
> Implement the prio_get and prio_set callbacks and advertise the
> priority-can-change capability for input pins, which includes the MUX
> type pins since those are always inputs.
> 
> The initial priority of a pin is configured through a new prio
> attribute of the pin directory, which takes a value between 0 and 255
> and defaults to 128, so that a test can lay out the reference order
> before the device goes live. Like the other pin attributes it is
> writable only while the device is not live. Priority changes made over
> netlink are stored and reported back, they will drive the automatic
> reference selection once the simulation loop exists. The setter
> rejects a value above 255 with EINVAL and an extack message. A priority
> is meaningful for input pins only, so live fails with EINVAL when an
> output pin was given a priority other than the default, next to the
> frequency validation.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

