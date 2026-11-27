Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786863;
	b=Er3BWqZMuC4AaAUcyXJbTw6sp2sXsRmRtEBruCP2k9Ncue4u62uRYKiB+rThFmGfxayb
	 8MGHaQdc8jVM26+IHbpvyilJpr4nqYTZUu3vTxY4d/YrYLf2qLM+YZNTzCeyUSoQeNY/k
	 MMeNuLB4TA5cwjnLvrP1ItwYnM7RL/a9sZB693mnlxXrMvNDitvrnsteN6zFq+q5YU9Wz
	 oqExMB4GroVhHNrB1UUOQgisgnYtzCC8EGAjalyBJHNG8R8CAQwkvVjm/XGARL8i03NvE
	 ExUd5LfnYay2JUs7VJn4C2WbjJMRSCMRkZyyc605Wyud+JXzUZqCOi52S2kQdmighLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786863;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=RQ2WdXBL/KQxSJMQfuZnsD5Z+GcxpOTaD89rYMFmcrw=;
	b=eDUmwJymXD5f+srhIii9DcOyFVfEVI6SrzxBSZIm6Tc3Qmxi1LH8sbJ9sDJPAf/kGQGw
	 bImP3gYIUNi+ahWyXk41+2Qs71u98oAKqsf8tRXluaj4+VWCYu5jvqizu4y159Hfb31pf
	 YrmAjrwl1mKaCORwT1+m6LnkuHLTxPZ4JkeEVdM6qEC7by4z198VcfVn6LZW+/7WRbzYh
	 YHBhU6lg9kV0ui7vdqKv3BdKTxCxgSpUq58L9KrryYbk3rMp5wdjqoIskSuZ5ERTJyQ5V
	 MFiQd9GM/dPRfW7XSDLko1G7CqpThzw245Dzvc89WI/AcN6BxhTLNh5ydi5KaS4PzAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XHIXNUKx;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D8606A32D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 13:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6D8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XHIXNUKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQ2WdXBL/KQxSJMQfuZnsD5Z+GcxpOTaD89rYMFmcrw=;
	b=XHIXNUKxKhB9T7NHkAcpDRgmwLI84oTI9GfmpBDOaZdRoDZr57qLUhoivhQwsui7GgFco9
	3KLGoZ9P/0m/tMIYrWjDl+yzPqI+owfsb1GJP6j96uMRireo4ZReAPQhEDxTjyAXNoBdbK
	JLCGmCGHwqHIANawM3wtkHK1doBgBI8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-6k4Mf4LeM0Gx_fwwzbv1uw-1; Fri,
 27 Nov 2026 13:40:56 +0000
X-MC-Unique: 6k4Mf4LeM0Gx_fwwzbv1uw-1
X-Mimecast-MFC-AGG-ID: 6k4Mf4LeM0Gx_fwwzbv1uw_1795786854
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A75DD1955D8E;
	Fri, 27 Nov 2026 13:40:53 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9BF24180054C;
	Fri, 27 Nov 2026 13:40:49 +0000 (UTC)
Message-ID: <099ce5fd-923e-4946-b910-fc8b6c1773d2@redhat.com>
Date: Fri, 27 Nov 2026 14:40:48 +0100
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
Subject: Re: [PATCH net-next v5 09/14] dpll: dpllsim: Add support to set
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
References: <20261125090522.3777494-1-poros@redhat.com>
 <20261125090522.3777494-10-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261125090522.3777494-10-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/25/26 10:05, Petr Oros wrote:
> Add support to set the frequency of input and output pins. The DPLL
> core validates the requested value against the supported frequency
> list the pin advertises, so the frequency_set callback only has to
> store it. The same per type tables that validate the configured
> frequency at live time serve as the supported list. The configfs
> attribute is rejected with EBUSY while the device is live, so only the
> netlink setter changes the frequency of a registered pin and the two
> cannot race. The frequency set over netlink is kept apart from the
> configured one, like the priority, so the attribute keeps showing what
> was configured and every live transition starts from it.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

