Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD501299
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781997; cv=none; b=CEXsaAwkYCyuta7BlLFT2EnZputGnOdcQtTkPhRbh3Rih/6tPLbldbx4Qtuh4T8fhneIuvZ1BkuMqnVxCFZKNaNcl53Rh/J8NC0R4J65GZrWMjVcrGoHb2wAfJicnpvbjrDOcmNCyU88f3EXm9lFnUB9DkWIZM6qp24CJvHiaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781997; c=relaxed/simple;
	bh=CmJey6zW6gZQHUwSRtJfbdEySzFFefHFLUZjWb5UfHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tW03lvF4ZXUs9CSvQpe53BiJEdtOCcftASfyYvJ0CZJylXEwwAB38XOYUcZYdlje/0cAMfjnqopAxlAy9AQI+Vch/io5wlR/Qfw5VM1AiQtwbKtcbQEuRRbmtz7uNpzV8Zw4Z+OtTpGoSTId2Y8LR3SwDaPplwdicaO8jy859TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJjMe/Ew; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJjMe/Ew"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acac47206aso3143647a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790781986; x=1791386786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTz7JFysavVzx+3a8DoDd2wDpfretAnN3j2Hpag3BAM=;
        b=kJjMe/Ewi883Zr55hLAReTogAxTfTn9oA3HHmS2btoN6cAAiFHXJ151GyKOxyFOGpg
         IHOG2KUqY6476g4V6DPbRXC0XPHHiZ9a56P7CRDOltWqXs3aflIuuFCSFoJ3uP/ehfi/
         hhNpcDagGVTMzjl3ZEfg86hjUSjzc+WeKIAyA01Ie8gqa408VWLnN+dfU9LvzAnWEEDD
         KRx5IR9+i5myf1C1ixhQ349cV2QYlcCXs1y9BNWHD1AEFL296/+wzAjz6cquFxFxTBSG
         yDRzZ7tFyZKQe62/ERYBGv5qnSrtRDvFRnwhwvFP93gCO7hyBiLjQV/cVjbqOJdMql2i
         PanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781986; x=1791386786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTz7JFysavVzx+3a8DoDd2wDpfretAnN3j2Hpag3BAM=;
        b=cpMo7RELadBDIL6mUFJiQu2SIJVW9E23ik2tfavZD2L2H7SwDRFOjuoJhbijW0+/pT
         H0FB8e3inbzhDz8oeGFpPCLLLD9LpSbANVfqMnU0Pv5TIzD26ODXO9SA9h1Zu0wXMe0d
         fXjrhkcI2DbCLeZXJUj0EEKKwPnRrOVSdH828R9NmMuf3WSeUNtcSXmJxSlPctkAd+bJ
         2jqCmEDgFXqFOUbJ03syl96w08zCEFRzjo663pYbMm/XYgk+7TxsR0nfXzQ08j1inIMJ
         AVPc3Z9iMyBQy051kg5/vnAkrnkr+h2EgXQlTifTp9jJInOjFpCWV8CadY8NouP/FFsP
         12Dw==
X-Forwarded-Encrypted: i=1; AKwUvBySDSDpKv/rmUSH2IJmphG0Bq4X2Qw+ImkyzGI+CFIWU0amK8cV396d8BVLiobsN+YvwB8iQlO6oENSnyzg0oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ4LeqKLdn/h3aVuKZcBgnCiYfnSoHw+3j9PBqmYNuzzSD4YVE
	4ydMTCZ9yfMOR4M8Sul3UijHNDb+0r5SeK5nabFbzIswdg9I6gCu6o67rcb3rUGwyBw=
X-Gm-Gg: AYBFou1jIpdJkbXLuQXWqmocJwwHObpO6pXudCKw4KeOspUuXJfz+HoDiy8e106hwU7
	4xEc7EsEP7vaLb3dIQWjHd1SiWZh2NFhIoIZXjL/0P15aqO3ID/KyYhh+L9amh7pUseBXv1Fl+U
	TkeICLS17DHLxSIAyizC2CAUiAlxOx7wqRdk+OdSyR/SnUROYOJmGWCFRkGK1W0Y/xRazHAGU9t
	W2G26epRSNjGZqg9yYCNdKQLQdOkuV/os7n8XVCzQqhls2tNWoBK0mCBQL7tf0fzLNaZsiwnbYJ
	8bYZgGzDAEBZ3yWhsP/z1RBWAg9/oJ2zWQJwjo1hJAvqLNwJq+4E8HaRPp7qKBivdFt/PFYmS3c
	grurb8tjrjePMB1UsA6wBGGLX07hr17wSkeDH2iJz8J1vqE2vnMSx86/LZKakUAF3Ie33tIa/el
	CaHwqWgGyhn7C4NwOsHhSfsoMyzPrGbpY/wRRotPOaMBvwL2NTACQf0QOv3EbCdjPcIfmcRX2cC
	FY=
X-Received: by 2002:a05:6402:46d0:b0:6aa:f187:26b8 with SMTP id 4fb4d7f45d1cf-6ae1994fe10mr1077601a12.37.1790781985959;
        Wed, 30 Sep 2026 08:26:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm954439a12.19.2026.09.30.08.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:26:25 -0700 (PDT)
Message-ID: <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
Date: Wed, 30 Sep 2026 16:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Zide Chen <zide.chen@intel.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Mingwei Zhang <mizhang@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260924172928.2110956-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/09/2026 18:29, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> There is no longer a kernel command line parameter
> (`arm_pmuv3.reserved_host_counters`); PMU partitioning is now completely
> controlled via the KVM API using `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`
> and `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When

As far as I know there isn't a straightforward way to get the number of 
hw counters from userspace. You have to either parse dmesg or attempt to 
open incrementally more counters in a group until it fails.

This makes doing things like "use all counters for guest" or "reserve 
two for the host" difficult. Maybe it's time to add a file to the PMU 
that userspace can use query this.

