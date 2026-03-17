Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FA3E8687
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758805; cv=none; b=iVAtuFB/a2Qq8pUmmFshieJwfix9gWie1CQSKHp0rXjzoKSeHmGoyUd4kS6ar2MJDjbh7mYNo6P6ejG/fx51XAM8xkTkW94/iQvk6vWFLlhk3H5dNbbZFNHvPlG0n+r4AzO8pab+E90OmOMAZop2EX1OHbSgGncFvQt2I37vC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758805; c=relaxed/simple;
	bh=PJwDGvf6trB943jn00qkBQDhhgwKxS7QkCVGOozd50M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKGdaJjnOlAb4m6Bt1V5bsYLwrntcguJHZg2ywFXtqFIt1wY1wW6H6iCUgHkTNLISE+5mCDAnH9yWxGS2JhybB3cDbjAzI7Qb/DmbNVpRkMHNcUp+6P8y7peyjmxDYrnrhJGqI46fGw03NqtI5m40/Y08vMDxc138ZsEqmcIMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NO1iierS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pMlPTG9P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NO1iierS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pMlPTG9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773758803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYgcgasxNaCa6wbkN3+j7gIOt+KWXemXDliasEJTpOA=;
	b=NO1iierSMGnI9X6xT1e4X0bTzifwN7VKYYKtE6CFH9yEHBnyqJUG+l4zJbCb8utIqV7kK6
	gckJkmxYfhACHpXuzNgpBeFxZF2Rssknd3u2DRUYgpP6vAaODeMA0pqmhK2dAu111akntz
	zdXM2uESKEI3aF6+9PuGfEUpUBZJeUA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-7eQigNaeMauOMnc7UIs66g-1; Tue, 17 Mar 2026 10:46:39 -0400
X-MC-Unique: 7eQigNaeMauOMnc7UIs66g-1
X-Mimecast-MFC-AGG-ID: 7eQigNaeMauOMnc7UIs66g_1773758799
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4ec516e5so337870486d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773758799; x=1774363599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYgcgasxNaCa6wbkN3+j7gIOt+KWXemXDliasEJTpOA=;
        b=pMlPTG9PVkskqz/dOz3RrAN0rica3bqhcGOP1yr90IjXf0/wzBFNlX8jYoHw+Otgmc
         s+twZKY8zKjhRPjpJiEPYi1vL1yAr35Lc5KCsic0TxSoHFVWTjkW8oDz+t0dHZX7hdvQ
         Uy27x7kXIUazrKO2i2Hpyxw+Ilsl0xL/okDwchS4VyUB/jyOXSwsK7G2PaY7pKILbzwV
         DjrKfH9XyY0SFPj1oHEM5YHxzunlBsVxSR6wF9L8OjJzSTfz1SwGJ8UBjnKSmDD9gVhl
         Ikt2C61WByxfkov9D2mOUi45zzizXx7jYZWGgeJa7/Fe+5NKzxfgI+3/P3RuAVRWaxFA
         iTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758799; x=1774363599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYgcgasxNaCa6wbkN3+j7gIOt+KWXemXDliasEJTpOA=;
        b=MLQIpGuPYBdv0nmVzr3mcOHLKcqbOZQj9IQbs9yMBXb9oVHoBh0igJ3k2kHEmpwODA
         EC4LNSiiOj2ht9B3Fw1MCN+BlJ/MpIit5jL6PX6FnUS3mLv/+CtFvgtZMH8nTPhRh+JZ
         JpceUxZVvijQOHQrJkQXtEytoyhFZ1Rd2kLD9CmEro/6Vje2Q9lwFYlWNtFbAMOSehsi
         sg7p23p3eXnRZ6GvlTPa+ER54d9v8PuFQRbUUYl3fYuqz7lH8zhgD6HTXUzUOFqMDVRf
         uce4JJZzPgs6BrbZkP9CaxQQVIJpfxI3yXC6IO1Gf7+edW6FKpGvh7ECBIrkRq0b/pOs
         CeTA==
X-Forwarded-Encrypted: i=1; AJvYcCV2oSXwaSw9ckup0mKudI0FDsoDwIWK7JDwhM1ZflXwD6/Zc3b2fqKRFZ9NdCmJHCPjg0k7EcHIfddZcT8L4nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwphdnD00PaSA+tAeja3oetoW6Sq63JbXOM7x8KC5T0HHvR0kbn
	LCxrQt/mhwL/QsuRXSGatPG1GPfdICox4vO5gDI+JCA2bR3eByxq79bnBYNSedIpn2r0QctsuRk
	WxRmjPovQNS6wrUZ3k3JKs5UU9iDfKeGzLl76Vlu2XypnxLNktUu3nEUk3pBZqbSKIaqn1g==
X-Gm-Gg: ATEYQzwpnf+wx+KK+2FTutqBcCOM7fpW+ZNOIl2f9Ite3CHvEWZdPnxeqltRA5VbVis
	bitQt1hPCDr76KeThbe4LQOF+YWwG0DtD96pqMht8pJviwqZqysr04cTrKRsCQo9gphAg+g008J
	MLjcowysik62AFMu4w1yIYmfwykPEheAJum6BFFb1ZwvuMzmoKjY1S8dB+SZC+UGqy8kHqY/w6Y
	m4StwDkDGPGgw29HOxD5Fl1/uZe5I1R4zpDcIseTveCBs7YgXnZNROOX9ZgYUJd5E6rK/h3U75y
	mzPMorvkYFWpBLSoEpSQ8J2fw5vv4T2yzDF8xGmLR46f7/uC9+ZFM+E1OC3TICQmzWj8kD+0Hnk
	yinb4qPMA/5wIN2WPKxmGgYcz9bfrdeHmEzwWPvyFqiJirdqTUrAqt6A=
X-Received: by 2002:a05:6214:130d:b0:899:ee4e:63b6 with SMTP id 6a1803df08f44-89a81f6062fmr268303346d6.44.1773758799341;
        Tue, 17 Mar 2026 07:46:39 -0700 (PDT)
X-Received: by 2002:a05:6214:130d:b0:899:ee4e:63b6 with SMTP id 6a1803df08f44-89a81f6062fmr268302936d6.44.1773758798845;
        Tue, 17 Mar 2026 07:46:38 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4feaaebasm49171566d6.37.2026.03.17.07.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:46:38 -0700 (PDT)
Message-ID: <302d1a45-dd5d-4d50-a99c-ce73de196d0c@redhat.com>
Date: Tue, 17 Mar 2026 15:46:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] selftests/vsock: fix vmtest.sh for read-only
 nested VM runners
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
 <20260313-vsock-vmtest-nested-fixes-v1-1-d0e6274c3193@meta.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260313-vsock-vmtest-nested-fixes-v1-1-d0e6274c3193@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 1:00 AM, Bobby Eshleman wrote:
>  tools/testing/selftests/vsock/vmtest.sh | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> index 86e338886b33..c2cfcdf05d99 100755
> --- a/tools/testing/selftests/vsock/vmtest.sh
> +++ b/tools/testing/selftests/vsock/vmtest.sh
> @@ -42,6 +42,8 @@ readonly KERNEL_CMDLINE="\
>  	virtme.ssh virtme_ssh_channel=tcp virtme_ssh_user=$USER \
>  "
>  readonly LOG=$(mktemp /tmp/vsock_vmtest_XXXX.log)
> +readonly TEST_HOME=$(mktemp -d /tmp/vmtest_home_XXXX)

shellcheck complains:

In vmtest.sh line 45:
readonly TEST_HOME=$(mktemp -d /tmp/vmtest_home_XXXX)
         ^-------^ SC2155 (warning): Declare and assign separately to
avoid masking return values.

> @@ -451,11 +464,14 @@ vm_start() {
>  		--run \
>  		${kernel_opt} \
>  		${verbose_opt} \
> +		--rwdir=/root=${TEST_HOME} \

And here, too:

In vmtest.sh line 467:
		--rwdir=/root=${TEST_HOME} \
                              ^----------^ SC2086 (info): Double quote
to prevent globbing and word splitting.

Did you mean:
		--rwdir=/root="${TEST_HOME}" \

The first occurrence could possibly be explicitly silenced explicitly,
but it's probably better to really address the latter.

/P

