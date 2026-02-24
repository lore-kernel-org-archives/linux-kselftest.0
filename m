Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ACC36B07D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932077; cv=none; b=PtUe37uEHuErsoSUqHaenj5wtAlJr4gpDsyO0UIwjnWqw5N/5y4uieXEnasbRZQnq63sXV0kwFYeeocAQEV0tYI9nKj/eKO14yesWYOu2g+06YOv0szao1tuQ1ddHsmf9oN5/J8LeelSuUUgUH5HIXDVgWKvdrRNCSbsa4h723I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932077; c=relaxed/simple;
	bh=u8DFcZr6PrNIgWweTXks8B4ZPWysQUYeU0IhnqpvGHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnME9/flI3VxPO7xbKMwM9N8qwl5XnkjD4A1c/49WCjxG0is/N/BvTLBhFYg2bmy9ko2Cy5BjbGGu7UHMwydwPvsjm5/RSCAtc2YW0vSlguuMhiSUO5WylndtO9zg9fxov9fOIEHMP9pHGKw7XnutU8FF/GUtsmyScIl5+8lIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhVHZkc0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nvUGeYsV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhVHZkc0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nvUGeYsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771932075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6clpakBnI/FsH5CU8EtT8oTpZLAR4ADDoYBwMfYPgk=;
	b=RhVHZkc0HpXn1eTIZkPFYxurG1Toea+PiKrSEnxNMB7JXwqep1OslNP79mflMig8mP9If8
	1FgQLlTmsgfQUlY93b1eK9npyV/no+i9spbJr8y2TZezX1abiAutwXOgTQRTylPgJa8VPx
	4Mw0fEKR64p876XEVnJYODDcM6LYBmI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-s15s3Lt0OWy9b32tpohhkg-1; Tue, 24 Feb 2026 06:21:13 -0500
X-MC-Unique: s15s3Lt0OWy9b32tpohhkg-1
X-Mimecast-MFC-AGG-ID: s15s3Lt0OWy9b32tpohhkg_1771932072
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso45130235e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 03:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771932072; x=1772536872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6clpakBnI/FsH5CU8EtT8oTpZLAR4ADDoYBwMfYPgk=;
        b=nvUGeYsVl5EdxlmA6RlvpMsQ4tPzikvY8WvsPkPij5tqsKL5NgQgkLUeZX+ERnpLU+
         0PGpUDh3h+O9pQ6Vf3X0dx0G6s1QsU+JpBYzOeCviENnXHhPLO9eZv3kcyXqnehl18gT
         zrJr13QUWXU+2WnKo5hi8k3ue6kucJJfwVRGda9yfW7nISYSJozXkcDR/9BflUNbO+Lh
         QhbFZ3Qu5O8T+/vh5EPN+doBwzwCksqNz6AW+5onazQTmmi00vydFj/2g2FDZd9pSTSD
         7dUfQCz1QN8e4qnXzKjvHOZCZXrNmLqb0ixfyYpCs7gvaySRWqCFlzpqyC0PxE+Bf/BS
         HOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932072; x=1772536872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6clpakBnI/FsH5CU8EtT8oTpZLAR4ADDoYBwMfYPgk=;
        b=Y1ZIBAR7ygzvZBGF9+X0DqynLwTxhADSXJNhkn+hi2Drg5CgbxXgxTcZnEQatojO1r
         TWxk1/09fd+3jKELkcNLE7tGgQLq08IIdAmq/vSNZb6omQu562p4XU1AOfr+Cr2CahPt
         MrCc+4aqrTbln9ypCsnjxcEj04NeM4nDiKzIWH7Xf0fz2Djb/2VmW/SCG8QR+EOodHmv
         l1tXzSL3h6zC6/pVAPqe3B/pV3Q7fFijedi0lipiqKAOJHSvPtUxXyCuubj3phiTYIMV
         wTDuLSM9VQNwauGedMJufPrsClTxkcs48o6VO8IOv3giP+rV9wgtsAzZAwJPGUDO44mB
         u5cg==
X-Forwarded-Encrypted: i=1; AJvYcCWqFJCWGSo0TpS3vIDFcfYNRVAcquQiERxwWz73h9Yr+aXj2iHjivq9AOY+Fp6HDdS70HJ1ctlxq1/Lwvld01M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92/8I4ZGNnFcB2C4aNd/eimsX5zEB49jWWbQx3bibKxPZG4Ai
	bl8OXuiDgqJk/HuIvpOYg3znGHpVtu9rNYEtqtZGTPmXf7iMPF57N5pOCddWyitvjTqAE/2lIvx
	HCl2Z+XwkeiOirexRtnHcrnMLrkZ3WrqJMUXu9iZzn1aPUZkTZMQ2J5Ad1uPpaxUE/3op6Q==
X-Gm-Gg: AZuq6aIN6Jye/QW6W2/eln3v2unFyNsoNCsynNv58aaow+RXeN1UthHr4FN3bAKCNy9
	3xmmc/CL4eHQuj7REqfF+Mno5gAVyTtq66FbDif+R6dn5VNsbtr92PfHo3n0euIMHIFFnrUzwjp
	RAqnfmaeeGylpJnCrET9X1sW2ZIofNcLgUQ8f+1IY1Sprh4DezFa/LfnpnAx9wTQ8uPNlNJ8DEw
	e6YWYJhovXYIKlvSEF4a5Tinlk0eY8EUEldbLxHyYxt95tOerdBrduHT+cPoMDjajM5wyyEJ5aN
	ZNtA4iQnrrRxt8DW5F0kCWGinckPFDi2zF8G1qbpQTQYeD2ECWIfo6zwZiCW1ioRjDMQoTcckPE
	Q98LcdP7QYALFNs6iKzWB
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr211925255e9.2.1771932072290;
        Tue, 24 Feb 2026 03:21:12 -0800 (PST)
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr211924625e9.2.1771932071750;
        Tue, 24 Feb 2026 03:21:11 -0800 (PST)
Received: from [192.168.88.32] ([216.128.9.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm504628215e9.1.2026.02.24.03.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:21:11 -0800 (PST)
Message-ID: <d3a43f4c-1b6e-4cac-a127-3e297fd6d224@redhat.com>
Date: Tue, 24 Feb 2026 12:21:09 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] selftests: net: Add bridge VLAN range grouping
 tests
To: Simon Horman <horms@kernel.org>, Danielle Ratson <danieller@nvidia.com>
Cc: netdev@vger.kernel.org, razor@blackwall.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, idosch@nvidia.com, petrm@nvidia.com
References: <20260222085338.3143823-1-danieller@nvidia.com>
 <20260222085338.3143823-3-danieller@nvidia.com>
 <aZ1agwUGRt2Qqzv3@horms.kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aZ1agwUGRt2Qqzv3@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/26 9:00 AM, Simon Horman wrote:
> On Sun, Feb 22, 2026 at 10:53:38AM +0200, Danielle Ratson wrote:
>> Add a new test file bridge_vlan_dump.sh with four test cases that verify
>> VLANs with different per-VLAN options are not incorrectly grouped into
>> ranges in the dump output.
>>
>> The tests verify the kernel's br_vlan_opts_eq_range() function correctly
>> prevents VLAN range grouping when neigh_suppress, mcast_max_groups,
>> mcast_n_groups, or mcast_enabled options differ.
>>
>> Each test verifies that VLANs with different option values appear as
>> individual entries rather than ranges, and that VLANs with matching
>> values are properly grouped together.
>>
>> Example output:
>>
>> $ ./bridge_vlan_dump.sh
>> TEST: VLAN range grouping with neigh_suppress                       [ OK ]
>> TEST: VLAN range grouping with mcast_max_groups                     [ OK ]
>> TEST: VLAN range grouping with mcast_n_groups                       [ OK ]
>> TEST: VLAN range grouping with mcast_enabled                        [ OK ]
>>
>> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
>> Reviewed-by: Petr Machata <petrm@nvidia.com>
>> ---
>>  tools/testing/selftests/net/Makefile          |   1 +
>>  .../testing/selftests/net/bridge_vlan_dump.sh | 203 ++++++++++++++++++
>>  2 files changed, 204 insertions(+)
>>  create mode 100755 tools/testing/selftests/net/bridge_vlan_dump.sh
> 
> Hi Danielle,
> 
> I'm wondering if you could consider running running shellcheck over this
> and cleaning  things up a little.
> 
> I see SC2086 which I think can be trivially addressed.
> And SC2329, which I think would be best ignored using #shellcheck disable=SC2086

@Danielle: please address the shellcheck-reported issues. We are trying
to avoid them in the new code, and with time we will hopefully achieve
code consistency.

You can use the ingest_mdir.py script from
https://github.com/linux-netdev/nipa/ to automate the shellcheck test
before submission.

Thanks,

Paolo

