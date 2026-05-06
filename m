Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129036F41C;
	Wed,  6 May 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051885; cv=none; b=PuyyZxOFnyiydhh+uO1KwSJ8ID1ILLigXru7iyPHH/yyeGTXIEhg9lmlF6v2cMgtxbamfNk10cQnZd3dGmLxQSVUzQbeo7SJ7nE6ITj84dM+UQH1GirTcTVansTXwt59ydFdMbCnNev5ek6HXwI3TMF/2UYS2Hxk0pxFolNybb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051885; c=relaxed/simple;
	bh=vtrz/HzLT/XZfHjsIyYqtE2HHqznXgOWYj2RjuzVc3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h52AzI5Xk6pRMJs3mhnjkDvKBTIWwaiIlm6AOg7kaOF/W6dnvtiHhL1Oym2aNHJ5zdItPnB5UFYoT0K3ebfaEjdnFoYQ1t17hdky1F1/T8oQFtOQOERaclBC6o0S9xf6j02hgbDku1gy6n1lbBwF8RGfOQuLn7BpEWslyiwMt/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YNVZl++u; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YNVZl++u"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j7OoOHB9ZeRPphxXVnwAj4bNVeeDK0KkFiEVcVNSXqU=;
	b=YNVZl++ulB7Lj+02fluir6bwhbtbxqLMkPxn2pz6YWGVOXXm6saH+jt7RQqwZU12KHe1Is2Rh
	RRqUA9DRKbaUlfL2QrdDiPZs+Cs8pMYDuZFAD4sgMtBDdKs/UrbAJ/5SbrU4Wz6Ju4uWhs070Dm
	5kW4p86Fc5a5TcUqPb3OrXQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4g9RPj28kwzmV69;
	Wed,  6 May 2026 15:11:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DF5934048B;
	Wed,  6 May 2026 15:17:53 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 May 2026 15:17:53 +0800
Message-ID: <e4a2b49a-0efe-4942-9683-9c9a5af1b12a@huawei.com>
Date: Wed, 6 May 2026 15:17:52 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] selftests/resctrl: Introduced linked list
 management for IMC counters
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-2-wuyifan50@huawei.com>
 <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Reinette,

On 4/23/2026 12:02 AM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 4/10/26 2:33 AM, Yifan Wu wrote:
>> @@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>   				    unsigned int *count)
>>   {
>>   	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
>> +	struct imc_counter_config *imc_counter;
>>   	unsigned int orig_count = *count;
>>   	char cas_count_cfg[1024];
>>   	struct dirent *ep;
>> @@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>   			ksft_print_msg("Maximum iMC count exceeded\n");
>>   			goto out_close;
>>   		}
>> +		imc_counter = calloc(1, sizeof(*imc_counter));
>> +		if (!imc_counter) {
>> +			ksft_perror("Unable to allocate memory for iMC counters\n");
>> +			goto out_close;
>> +		}
>>   
>>   		imc_counters_config[*count].type = type;
>>   		get_read_event_and_umask(cas_count_cfg, *count);
>>   		/* Do not fail after incrementing *count. */
>>   		*count += 1;
>> +		list_add(&imc_counter->entry, &imc_counters_list);
>>   	}
>>   	if (*count == orig_count) {
>>   		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
> Should cleanup_read_mem_bw_imc() be called on error exit path?
Thank you for your suggestion. When parse_imc_read_bw_events() exits with an
error, the linked list imc_counters_list will be cleaned up in 
test_cleanup().

main()
└── run_single_test()
     ├── mbm_run_test()
     │   └── resctrl_val()
     │       └── mbm_init()
     │           └── initialize_read_mem_bw_imc()
     │               └── enumerate_imcs()
     │                   └── read_from_imc_dir()
     │                       └── parse_imc_read_bw_events()
     │                           └── calloc()
     └── test_cleanup()
         └── mbm_test_cleanup()
             └── cleanup_read_mem_bw_imc()

Calling cleanup_read_mem_bw_imc() in the error exit path may be intended
to prevent resource leaks. However, this results in the function being 
called
repeatedly in both the error exit branch and test_cleanup().

Is there any specific intention behind calling it in 
parse_imc_read_bw_events()?
Or should the cleanup be uniformly handled in test_cleanup()?

Yifan


