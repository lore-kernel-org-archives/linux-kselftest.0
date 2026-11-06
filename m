Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962276;
	b=a+uXFy8Lo+vn0V741T72z3wGinpO3l+rnmsqyOlmrLCpqXX2yFM2d0fcJO/itOHhhQN/
	 mVdCG9g1iMqj0R6aZwVJ7K2ijaMR3HDlt4bsAqHNXxq9qGehKQ1OtCFrtlBwvtYRX1W1f
	 SWG/U30p65mpRp/XetHUVUA5Tldo3UXNr3Hg/3RUCBEPBMkv1iGNFI96eWl/CReeNfTQj
	 I9P3g0zNMnInVi66NzoPrN2z8zwyxMPDNN+DvxuPfigKUX31VITP+h9FcimiULHxOznwG
	 sag2jqxEG2Ag4vQxFBJ3zzEdICEgRxi/l3QufP+inJXhlIrIV1JEn0V8vMwSAdhHTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962276;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=o6OVcQuOohxB4bAo0IQsYDmoDq5Xn+lMRQTdafduBjk=;
	b=2AhEZGW3Crt9ABagQpDjITy1jUwHyWt5vv9N7/thvRfgM2G1nePMNHOTy8ugLxNwLVSc
	 oWzUjzvjdXag5IfYY0tBgCYFSVeEZNxARY5vQ8cUeR6gqZLs1j1uq+cP1s+68foRNCslk
	 oWY9cM9NikEKWTvvR9ODROamH95I8XMdRStFbZpq3o8X20+3L9AznXbyVyQ0dEpZv/Bvv
	 Gu2nfGBqYciunnoGTK7Go2oP+yOgXfUI4ASW71N4ehb6V+TnceCPJnGeag+JYxotgb1UN
	 xg42Ip+bfAX5E2z+LXdMgmYWAynwQl2BB8SzaAPpXsVaytJCoyAT8D4zElEab/62HHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vwrr15f5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24923606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24923606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vwrr15f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6OVcQuOohxB4bAo0IQsYDmoDq5Xn+lMRQTdafduBjk=;
	b=Vwrr15f5oCuutLJZZhIYT5I1Is8N/QgfR/3A8AiDCguojdC46HguS1K1wsmp+uhWvxR1lK
	DWrmYF/KYmcH02yhwDLWpqZsoma/tmDgaRvA5eepXUrLKxJjCxlwQSwjN78O9oFB642iup
	zL3dfugxh7xpEqFr4wEda8BoIhqBCm8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-zUZcGdCyN-e2SMk0vTIzzA-1; Fri,
 06 Nov 2026 05:51:08 -0500
X-MC-Unique: zUZcGdCyN-e2SMk0vTIzzA-1
X-Mimecast-MFC-AGG-ID: zUZcGdCyN-e2SMk0vTIzzA_1793962266
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBDDC1800359;
	Fri,  6 Nov 2026 10:51:05 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C7053001DAC;
	Fri,  6 Nov 2026 10:51:01 +0000 (UTC)
Message-ID: <1dfd2621-5b33-489d-83e5-84ae0ba0a825@redhat.com>
Date: Fri, 6 Nov 2026 11:51:00 +0100
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
Subject: Re: [PATCH net-next v2 10/14] selftests: dpll: add pin frequency test
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
 <20261105151852.1844305-11-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-11-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/5/26 16:18, Petr Oros wrote:
> Add a test that picks a supported frequency other than the current one
> from the frequency-supported list of an input pin, sets it, reads it
> back and restores the original value. Both ends of every advertised
> range are candidates, so that a pin advertising a single range wider
> than one value still has one. It skips when the dpll tool lacks the
> frequency keyword of pin set, and the restore is deferred right after
> the original value is read so that an interrupted run restores it too.
> A pin that reports no frequency or advertises a single frequency only
> is a skip on a device provided by the user and a failure on the device
> the script created, whose pins advertise several.
> 
> The driver may refuse the candidate. A driver without a frequency
> setter refuses every value with EOPNOTSUPP, and a driver with
> constraints of its own refuses values the advertised ranges allow,
> zl3073x for instance wants the frequencies of an output pair to divide
> each other. On a device provided by the user a refused set is a skip
> that names the reason the tool reported, which the setter keeps in
> DPLL_LAST_ERR, on the created device the simulator accepts every
> advertised value and the refusal is a failure. Once the set went
> through, a refused restore is a failure on either.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

