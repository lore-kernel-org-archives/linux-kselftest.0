Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E93DD505
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002585; cv=none; b=CQ99nz8StwBhxjbXMKdvOZWiAI6AYDzT0w6gqXOLsaX7k/dfs1drZtyK9IOzCJajYHAvFP4cKs7l8e7gFc/o0W04LQSH6IVBemOyL1doMj7uMoiouSQ1p/83FjIbgnqcjdkLkU6+ich109Mz0dY7vpO5Dqk45ACrcq+eAtpQmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002585; c=relaxed/simple;
	bh=+I/emWIMpz5OK9O0WDpDRa3M0xoLc3qCWoaFHxS7tU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAl66yoCQaeSfyVfqwG0JX9SxqhcWbAQKrr4bznI9apXMRUme5upokYDR0ldkN39K86cZfZAFFjnypHxNjlBxmWV01hFuiwb2Cn8CnzSnL1jlfsKEDRcu9jAEaDGmr4axzKjYOB30CK28OSWRx13PKxJt3ZEOYhICqqTIk9pwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YU4iWvNQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXlRV9au; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YU4iWvNQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXlRV9au"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781002582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/WfzyLR/nks8SQbfnC26t/FYPJsMiOkM/D4jryDNZ8=;
	b=YU4iWvNQhmyJWv3xm7QlmjzymsUpL5yUx5oZgsEzlr8pI+mwP388X5m3qsS0cmHUwfLy7a
	323llYSCUoDHv2JVV3Sh4w8QshEx/ZCpwzOIjKVb/2j00nLZWCS49jSEjQQG8g3SkCOZJ3
	UiaJ0CXz3Aos5DURlwAJK5kqaMnA6e0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-Tix6Nxc0P1Sz6M0ocJemZQ-1; Tue, 09 Jun 2026 06:56:20 -0400
X-MC-Unique: Tix6Nxc0P1Sz6M0ocJemZQ-1
X-Mimecast-MFC-AGG-ID: Tix6Nxc0P1Sz6M0ocJemZQ_1781002580
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45eec2badc4so2653788f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781002580; x=1781607380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/WfzyLR/nks8SQbfnC26t/FYPJsMiOkM/D4jryDNZ8=;
        b=OXlRV9auelMMmPy1PzKMCqfsdnGmgYn3V+JJxzCERUE4APgORp3MTCZIHxW15WQGxZ
         tlnl1kCq3isTSq1fO75JITJFS/BRWYUqL1613LJ/255Q4LqowjzLXKthTjFnEn0/fRM/
         NpxGVxtftj+J1TjybRaehesV9w+ypBnCesjv/4dodYwDyxUKhMYU4kLWjIIaQb1Yo/6/
         77fZRR1trHJiTX1PNoBb0F8YlhRf+vk8DQ3Cn1wSCukt9AYslFGrhM+lHWoJhUaHoWG3
         lZ6Hd9WCP7dpNuyswSJ0kWBRjT+vA6ThA710gT1LmOUyJlpUhTM81mQtuVz8OCoxSzG5
         BSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002580; x=1781607380;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/WfzyLR/nks8SQbfnC26t/FYPJsMiOkM/D4jryDNZ8=;
        b=XbfY8I9GXLkGmQ5SeK1vmpC9hzEeEeAGYEq26GkxvcEU4/i0aA+hGiXEgs9Z7dOUW+
         NpshaFSNJx1zmUDoDZ/PKRn3DRSUgcl9k2URCL2+tfyDUWd3S+CpJKHnBWqV9WJg4puH
         movSKPBe6D0Xe+kcnLKq+HQ9/K1cCq68Z0a/g+XppIaionT9tNy1l44ng86ch2RZRWH0
         zv4ZeCocRQlE7R3szPAnxV821cTdw3tx/1dvgt5UT6n+T2ukLhnQJkjx+27lw+WQmMw4
         VFu87btVtbbhpWSnIRU8Ttv0puq6qJkR+x79mIxLR4q6M9e9FCuhx4fD9UJHR6J28Wbz
         ScEw==
X-Forwarded-Encrypted: i=1; AFNElJ/iyv1dkZv3gXbt7yqxjYAz2AoXcpoLp5iLS4L0pr8E32udqUJh1+39dWs6xIuwy8NUkCJFA2Fj2r31mFxtFfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywGvoCwQheHGryOnE5AlYIotoOxzlWJnXSJ9HmDvOSopFeYuEg
	Wr1sNvyr0c0HreoyNQ39hzak0CjtIsULoWqfVYLWefxqoHiCf80N7UhpnUmo+oi+mc4H03DRjPD
	oPJQRmdRn+Q8P4XLnDrwmxQ1p4KG8lzEbvztxJj6XQ53y9b594WwqSqRjOmHp5Y5vPUpHtg==
X-Gm-Gg: Acq92OFZ9vguHv05P0wSdh4L+W5+INIodrpt+MOb5+cKI5ap13E2ghdpeBtaHahf6vd
	T/CrSeU/9nUV/6Q46dXRpQI3iyzqrIufZH+umld6p0y+RSU/CAgEVzEy0wzzpwQmatRr3ROZVy4
	ZGougDzKRFJnwe/ByaRcNx7gt7p7wvqOvrNgzH8mfYK6Hr70/kiN9Y4vbA1fKqqZY+paJUVi0Pl
	beVUbDsYBPFebcxuGM8X9TFDeD2tWv30NVzkhHxhXpJgVB9w46xoeo8O2MRkPahymY9RLGa3xvZ
	nCp8a+BiOkH1Ma4N1/2nb3VsH5ZSQhsoPraWkmavERYW0Pg7isxomHUM6RdOc0xDYx8lsb7To8T
	6El9JGngpDABT+vIYSqfB2NGtUCDT/CUJjTmWNINazX/Li2V9eE5cDja33L3tKBr0tw==
X-Received: by 2002:a5d:4c45:0:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-4603063a18amr22853094f8f.36.1781002579615;
        Tue, 09 Jun 2026 03:56:19 -0700 (PDT)
X-Received: by 2002:a5d:4c45:0:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-4603063a18amr22853054f8f.36.1781002579214;
        Tue, 09 Jun 2026 03:56:19 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm109104155f8f.27.2026.06.09.03.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:56:18 -0700 (PDT)
Message-ID: <c530d07f-5841-4bfb-b296-b47fc0ce0614@redhat.com>
Date: Tue, 9 Jun 2026 12:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/openvswitch: guard command substitutions
 against empty output
To: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org
Cc: aconole@redhat.com, davem@davemloft.net, echaudro@redhat.com,
 edumazet@google.com, horms@kernel.org, i.maximets@ovn.org, kuba@kernel.org,
 shuah@kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org
References: <20260601115307.1411211-1-houminxi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260601115307.1411211-1-houminxi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/26 1:53 PM, Minxi Hou wrote:
> When ip-link output is unavailable, when the upcall daemon log has not
> been written yet, or when pahole does not know the OVS drop subsystem
> ID, the affected command substitutions silently produce empty strings.
> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
> or matches against wrong drop reason codes, all without a diagnostic.
> 
> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
> also align the MAC extraction to use awk '/link\/ether/' as in
> test_pop_vlan. The drop_reason guard returns ksft_skip because an
> absent subsystem ID is an environment issue, not a test failure.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>

IMHO this is net-next material.

@Aaron, @Eelco, @Ilya: WDYT?

/P

