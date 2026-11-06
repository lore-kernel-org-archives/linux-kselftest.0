Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962289;
	b=JC3kgPklKy9WhEU7GPLJ6iyc4GPLCRHLqnUjhfHECncEmC8G+mODdn8BfKTNX31VIBfJ
	 cJwvH1GE18H8aen43a4rCovMuYadFUQXYmIkFgEc63GpROXf1ArpKdRz+qc6vGB1DzhUN
	 h2+X4jd9NmvIk1P7plGHD1WD+1ICtpbWAkSeERicZ86FlAMdYdYhfQ0nObB4fOmlbHReS
	 edYjxQ1KmsxedITeRantEiLuyLt84otFShJz+OC0EcknnomxdhB4aJYcihG9t0/zN1EfQ
	 /dMAyyTSJbmS3ZJcBnjebHq3Jyz39bdF5gqmFWpIPqYighiBJ13IDqgIPK4KyPXWDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962289;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=gOZFhnUAU/5uIvd6LUF8nwusQu4abl1UDmdzKSmbDxs=;
	b=bvgXtY4Eg4ogMu5PXwjrDGuWQP7lNOrU0hS+jq9O4CDKyVeymOitFZQGgVv2XB4Q0ysA
	 zULpKzObwFfJEKScpDqyboy8CrJdyfJMig/6ea5/Kh2E+kkWMT4J61nJ6lXMEcnV8zTro
	 vAfIAySNDYiIikywdpwSJ3ajcJUDorBlTWOkeTm3e3CMNRKrAGHWwtk78WERCtoqBm88f
	 edgA+9pkGGUcL7XM67LvfeI14yZ0QhTg3fD36q78z6sgVDyIUG8L10k0aQyDHVqL7Rk4s
	 GdLiZwEYXUWEDhjsVIrCWP1yp4tygytkw8iy3cqzglJ6D8DneMyArGoqYItdPiDTopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LoJk32je;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE1606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EE1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LoJk32je
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOZFhnUAU/5uIvd6LUF8nwusQu4abl1UDmdzKSmbDxs=;
	b=LoJk32jejUkYwRDvN1tg8UcNpp0mAwhg9wNJJbGRJL6rN0MlvshQZoyK4rc/WcJ3x9ntRl
	C51T0eShMXEcK6r4kxnxmWFw/L0Bz8+3BdVaBGdn4bthth8/BHyClrd639//ub82pg/zaD
	DhdyrRNja3fiGioRvmSwLCWjJji80Jk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-7Gi1EXdAMWmgh30Q9b0fqw-1; Fri,
 06 Nov 2026 05:51:26 -0500
X-MC-Unique: 7Gi1EXdAMWmgh30Q9b0fqw-1
X-Mimecast-MFC-AGG-ID: 7Gi1EXdAMWmgh30Q9b0fqw_1793962284
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 186A21955F1A;
	Fri,  6 Nov 2026 10:51:24 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0F3F1956087;
	Fri,  6 Nov 2026 10:51:19 +0000 (UTC)
Message-ID: <e5b06efd-ccb9-4e60-90cc-679435726a59@redhat.com>
Date: Fri, 6 Nov 2026 11:51:18 +0100
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
Subject: Re: [PATCH net-next v2 11/14] dpll: dpllsim: Add support to adjust
 phase
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
 <20261105151852.1844305-12-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-12-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/5/26 16:18, Petr Oros wrote:
> Add support to get and set the phase adjustment of input and output
> pins. The pins advertise a granularity of 100 ps and a symmetric range
> whose ends are the largest multiples of the granularity that fit a
> 32-bit signed value, so that the advertised ends themselves are
> settable, the core validates the requested value against both and the
> driver stores it. The adjustment is reset to zero every time the device
> goes live, so that repeated deploy cycles start from a known state. It
> becomes the baseline of the simulated phase offset measurements once
> those exist.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

