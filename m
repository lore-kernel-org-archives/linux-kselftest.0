Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962103;
	b=nzLLdiNNly7lAKbi6xwuE71ySUt4Z1El8wC66/9mNUcXw37es1aVICasVQ348bdkx5QN
	 JDdjZ60A/Zjpk7zoUjOq+ysgcmRvvTAXAkakSxTAoPZjhJvTqFJ+DIhzBRgPpf9l6fbvu
	 i31+AnwsACgCdw44opC5pPBwIc/BJW49ieCWDcJ3zRDOFd9Y0adkNQH/9ofbe4VZlgWgv
	 aY7trpOFUSmGsBHrej0QgDXJcRdI9HQ2jNY8nRB0IvNhu30qhI1AvZkmuRi8AnfFIgzb7
	 O2knoRsIh8cSDsP+m8L4tG1DlcOqRBCWkH7HW5XBZtSl89pip413zRi/AdLx8h3/N1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962103;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=aiMc0wDwoJNYX6+PVQfH02AI7GASDetgditKIq2eh1k=;
	b=nlTZccJTYGyXm86AxqkJKjQpj0wraRDuEGMCoiy33Qidn2bB5h93wN2w+hartV8iToTx
	 pZtXSf1sOll9ExSK9Ml9qKbVGQGueKRLeh9rkmcimlVaT+XRdS/vox+aM7AcdzJGqgW9L
	 W9uScUqBSWeafvefG0xcMzfgoiiKOx1GxsTsBTGahpt2LmVGiXue0qOWciO/uDnXKu0xf
	 YcUN8SOmf1eUY+Q3QgGAqtCNHwgOGMKapJ5SJi2P//HCgJU2pgL4sWpmhVu6dGe7QLbqX
	 mu0/Oo/18kW75n63o9pwUe1vY3nY9r12Rk7P/rSYqMqTzJwl05G+V5QZquORlGA8PjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBntU2Yx;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208CA606D80C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208CA606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBntU2Yx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiMc0wDwoJNYX6+PVQfH02AI7GASDetgditKIq2eh1k=;
	b=CBntU2Yx13te3pwWVTRCmZzXjoFwYm6bxayVToZGs7xZQFeH1f0vA/yv9OYHEriAGdnEi5
	DMil+WfpfrPSyC9aGlDVLLEOlowK0lF40j9TstAzbpkfS5FKNGTQenYJJtLyUzT6NJX2Am
	buKWnXBiSq81vYPgy2jjfHUqXJkMi2U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-wlx1d4DaPh-CNouDyuDv1Q-1; Fri,
 06 Nov 2026 05:48:16 -0500
X-MC-Unique: wlx1d4DaPh-CNouDyuDv1Q-1
X-Mimecast-MFC-AGG-ID: wlx1d4DaPh-CNouDyuDv1Q_1793962094
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87FC01955E9A;
	Fri,  6 Nov 2026 10:48:14 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D6901800480;
	Fri,  6 Nov 2026 10:48:09 +0000 (UTC)
Message-ID: <378b82e2-8946-4779-82ff-0b9e2f33e7c6@redhat.com>
Date: Fri, 6 Nov 2026 11:48:09 +0100
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
Subject: Re: [PATCH net-next v2 02/14] selftests: dpll: add test library and
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
References: <20261105151852.1844305-1-poros@redhat.com>
 <20261105151852.1844305-3-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-3-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/5/26 16:18, Petr Oros wrote:
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
> over netlink. It runs against the device named by DPLL_DEV_ID or the
> first device that is not a dpllsim one, and creates a dpllsim device
> when there is none, so the same script serves the simulator and real
> drivers. dpll_stress.sh is simulator only and exercises the lifecycle
> paths of the core by creating and deleting devices in a loop and by
> cycling one device through repeated register and unregister
> transitions. The dpllsim MAINTAINERS entry covers the new directory
> and the shared library.
> 
> Signed-off-by: Petr Oros <poros@redhat.com>
Reviewed-by: Ivan Vecera <ivecera@redhat.com>

