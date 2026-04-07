Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F43A75A5
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556519; cv=none; b=Xoz5919AVQx3Vnw2na8RQBA0SvzPhxFj/LgHmeuRDCnY/aU+liREoIhqL4+DAx2mdQ2kOaR9NN+pSWJsM7UYHT+Pp0Sch1uQxyhgtP7LAPHBHPYwHRN7s/jNTBoltLn5qgegREtPbls6OjTBS2CyG2+QDGqZwgL22D9zrhQ+4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556519; c=relaxed/simple;
	bh=R9vZ3elU3V/8wueZHLI+PW4ahWXh1+tFL5xZ/WFiw88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6XYu74DKfIYy1a3YRr3IjAfCaYt99mK6EJ87SAPjCgAJOwH9XbWf8oAF0s3/SgJmih9KBAKQHB0j5K86JMRseU5AhVpLQG463K3AaNnCpcrqaQrQ+aKccRX7q9KxFQMxHYmGZ7BdLYeVNyPgGkNuW01HoBsY8GL0c4OWJqpBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aq3Ugf/L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8jes2Ew; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aq3Ugf/L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8jes2Ew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775556516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
	b=aq3Ugf/LxDshsl9xWJ1eY5oMtuCciGOZ5fTGPKkjLmUJGL53e5ukYgRiUxWl6WLSKCjAio
	LxS0xiYVcZCfbdzIjLDeeqiLtq7aVjs54BC8nVDbs9mYx1gxJv3sWeoVElyPeLpc48f9JL
	YyqpBLRIJOtM/TcKdo66Whe8ryZ6FPc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-oDNBTrxgNxa_YCe6Su3e0Q-1; Tue, 07 Apr 2026 06:08:35 -0400
X-MC-Unique: oDNBTrxgNxa_YCe6Su3e0Q-1
X-Mimecast-MFC-AGG-ID: oDNBTrxgNxa_YCe6Su3e0Q_1775556514
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48895008a3eso23240685e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775556514; x=1776161314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
        b=M8jes2EwdqliXQmR28jCAmpye8JSHnU94CDurVBZCR7cvRCZJGpUVyapC2DvX7pElK
         ydlbDHOPn+eX3SCc2fp06QogmDAML5q0IPsNLgEZYroAwsR0kTKc4ve7dsyL8XFJNlit
         5Z0FyeJ2fLX473lYmaMXc6K0K04hQ8CbKajqxowB9Z0QQIAShszM5/T/ZS6XmCPlyCJp
         fMElS+iRfsw5pkl7bZZIpO418/aDoOJQgKjWvmRk9RO9vvK52iKyLfxuKwRbNtEuYx3a
         DgsH2Q2GT2WkiHPCZsk/AuLrNzFMpf3YB6KwvShUuwGJm0PfM/OB3f9jv7I1vwvzbVXi
         R+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556514; x=1776161314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
        b=rF4k2KySAjBfC7RDKWaeRzwcAkl0OijFsR6GoED/Et+9bQExRFUTq/nqOUluLK/rwQ
         bTsX5NuGmxsWNhjvcY2ucs/1HrRq9c/IpKgNGF0OtV6aFNnwjgRPuKJub8WM/F4TrdpS
         wE+oBrPLsjreMKludlvcbtVMao/wX1E1nBHjhssbpb8lmadDRgr0dtI3WJkFCCjoVDt5
         z98E25g5ELVkG3JEaxwqJc1G8o62EBVuPf1/CQW3wsHVVu506CNuxTCl8svGjqj6uJIH
         c9hF3SRqUf5SPKHu79RVCqHLoxWgZWtJHlNOXNHpPg/WOHyz5mY4mHcpK13xl8fI/Ouw
         VnTw==
X-Forwarded-Encrypted: i=1; AJvYcCVEWlUeLU96IkTD9vny/rNpeSyBqhbsm7MDlLXp1QIHnhUFLgZDPlagaRvdftiUqstyHyRgvFVVGeP6Jb0gVX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvMAnzg9G59YFV7wKwh4H0jbrR4wgh5bmW6wuaGF2l7/rp22Z
	V6QxNGGYRhjXdxnk2qCitwZukmujaQrAuwcx2wg9w/DSMT7aI042XI98kiBhW+u0pYbmrfNvrul
	mTAHuRz01HD/3rL6Vmo1dlJ78sGH43kZbdPkud+FMr5zx2VMsJahbaxkSSDkmz5Tufxb2yQ==
X-Gm-Gg: AeBDiesqWyPYCuxQGYbtMzyzmEMGcx39kPgqGcGzroLdHLs0hA0Og/WIBIYCId/fiaM
	v5CljlUQFJg64u6RBFMk0vqmHZWMFZ2+Evu8tPijJT6Lp8Wnu05f3eu2oXb7c9+c5z8zPPPZP91
	AAyO9YjceJeO2PL6FOmC3wTIok/FY7nNho9PFarqpWjmiv4qOwNzrThG349JL836ftJnHkr2rR3
	m2hcG495nXYX6rBW9HYAPFH3YXl6JzqG0rU5CnHoMOoG5TktHjI5IRl3cTf12CbGlSArDBLhK2o
	aF602YGb2YWVi/7XGwYujJqLBKVT+3mEl4QCAHJrnlIZzLaQOsderExWfhbks45Ep0QCXUf3j8e
	Hgrz9tuJx7NtzYUa9ywhv78gOMWIIm1qJknqPKOMCDjrAyjutf+LPB+6HEg==
X-Received: by 2002:a05:600c:e40b:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-488997aafe8mr177853455e9.20.1775556513875;
        Tue, 07 Apr 2026 03:08:33 -0700 (PDT)
X-Received: by 2002:a05:600c:e40b:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-488997aafe8mr177853105e9.20.1775556513445;
        Tue, 07 Apr 2026 03:08:33 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm531203475e9.12.2026.04.07.03.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:08:32 -0700 (PDT)
Message-ID: <3ae4bb0b-6f4c-4477-9c67-f2122eedad8c@redhat.com>
Date: Tue, 7 Apr 2026 12:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8] selftests: net: add tests for PPP
To: Qingfang Deng <qingfang.deng@linux.dev>, linux-ppp@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Felix Maurer <fmaurer@redhat.com>, Petr Machata <petrm@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>, Dianne Skoll <dianne@skoll.ca>,
 Jaco Kroon <jaco@uls.co.za>, James Carlson <carlsonj@workingcode.com>,
 Andrew Lunn <andrew@lunn.ch>
References: <20260403034908.30017-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403034908.30017-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 5:48 AM, Qingfang Deng wrote:
> diff --git a/tools/testing/selftests/net/ppp/pppoe.sh b/tools/testing/selftests/net/ppp/pppoe.sh
> new file mode 100755
> index 000000000000..f67b51df7490
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/pppoe.sh
> @@ -0,0 +1,65 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source ppp_common.sh
> +
> +VETH_SERVER="veth-server"
> +VETH_CLIENT="veth-client"
> +PPPOE_LOG=$(mktemp /tmp/pppoe.XXXXXX)
> +
> +# shellcheck disable=SC2329
> +cleanup() {
> +	cleanup_all_ns
> +	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
> +	rm -f "$PPPOE_LOG"
> +}
> +
> +trap cleanup EXIT
> +
> +require_command pppoe-server
> +ppp_common_init
> +modprobe -q pppoe
> +
> +# Try to locate pppoe.so plugin
> +PPPOE_PLUGIN=$(find /usr/{lib,lib64,lib32}/pppd/ -name pppoe.so -type f -print -quit)

Minor nit: here stderr could be redirected to /dev/null, since the
command will likely emit at least an error message on most systems.

Could be a follow-up or added if/when you will expand the self-tests.

/P

