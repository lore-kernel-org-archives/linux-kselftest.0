Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318646;
	b=Tobtz3YDzf1H9LyGim83aj1lOph+E5K+CpiKZhF0wDNYHz54CxVTyzKVjZYtwPwY7sJI
	 wLoEDowcDYZ61SEyzPqq4+gFKrAcTnYke8lKuqniIPRx1VPzbPjgOBQqyuldkx71S9M6r
	 jbXgR/ZkqDPfl1fffRd5gHjXNWQ+ivVmat8kgo0wlPXVnT0H7eEB8wIBWJvykKaF7kSkS
	 arO3pMiaK5vAtJBEsdHRtqJyN/2r9Pwa3vMoGFC93e8JZc/7VIGUfSTkuQu2dEnS9ityG
	 Z8O/sZFKo9upl/wsxNNs4Gi+u98R7J3qrSEjvVHdnKv9+cUwt31Hi7k/OQrtBay3dSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318646;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZW/tbBBrHjT3jjY/yjl3yYsyzG/sHFMxCNU/gt0Dxf8=;
	b=DklBGUAM0nNxEqDcKMNUEUOg+T+o56uuABNXeTDM8OWz/uPMFuCT++SZ4NLmWV85AN+X
	 fUHU4sCs0bk3V5m0rHrxCo8e5BCIK1uPNcMqHRnDYOUT50fVI9VyLpj/x72OjSbRcZwAh
	 LJBbImNGVFj4alF63QQutHocHdlPeIAm4SRP82BbsoCJukIH9Pg1RASoXfg8C/yXewT8c
	 TbM3mM7ZmnrfBiizksUEhNB4xtp1S66SEZBAuDGQAJ7TMm+zXYlm0FNeNHQQchpcE+eB9
	 kXY+6vDHGubs2zBCUXuD1ynaF3M1hTEjJO3YU1LSmXNpkgXbCFPFMH18gslrQxcMCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s0PlnXsi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F9D606A31C;
	Tue, 10 Nov 2026 13:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s0PlnXsi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0D0D143D;
	Tue, 10 Nov 2026 05:50:41 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A882D3F632;
	Tue, 10 Nov 2026 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794318644; bh=tBiEUzB5aLlq1e4ZXvazLtSz25kqr+pXX62Tu0eMJzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s0PlnXsiOHCb9aaZiL6/tHBCbdMb0Ze94Eg7TFY0qGVIphCfCTZtjXkkR2dx42oI5
	 xaamkBZCYY9pnAhblcfBlAOU8YByOLz9rS/3rL6Xogq7q1Kc44ckQW7OvzbwMdkR/G
	 zr195AE14ij6Y+91mwY+Ug32cuAmsFRYepx5LWK8=
Message-ID: <e65a384f-602f-4bd3-9071-5816b2bd4a50@arm.com>
Date: Tue, 10 Nov 2026 13:50:41 +0000
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
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Richard Cheng <icheng@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
 <avLF-PLcSFCDow5S@MWDK4CY14F>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <avLF-PLcSFCDow5S@MWDK4CY14F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 10/11/2026 07:33, Richard Cheng wrote:
> On Mon, Nov 09, 2026 at 09:01:18AM +0800, Reinette Chatre wrote:
>> Hi Ben,
>>
>> On 11/13/26 7:16 PM, Ben Horgan wrote:
>>> On 07/11/2026 00:29, Reinette Chatre wrote:
>>
>> ... 
>>>>
>>>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
>>>> possible. For example, instead of checking something like "LLC occupancy needs to be
>>>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
>>>> is larger than LLC occupancy when only half of bitmap is ones".
>>>
>>> Do you think it's too strong to say that a bitmap with n + 1 bits set
>>> has higher occupancy than one with n bits set? I think it has slightly
>>> more utility in that all bits of the bitmap are plumbed down to a
>>> working control but I'm ok with a weaker check if a stronger check will
>>> just be problematic and maintenance heavy.
>>
>> My comment was motivated by the recent change I needed to make to the CAT test
>> that uses cache misses measured via perf instead of cache occupancy. Originally
>> this test incremented the bitmap with one at each cycle but incrementing it with
>> two proved to be more robust.
>>
>> What you are proposing sounds more like an enhancement to the CMT test that
>> uses cache occupancy as measurement while following the same methodology as the
>> CAT test. At the moment the CMT test just uses a single cycle of a hardcoded
>> (unless user provides something else) bitmap with five bits set. Even with this
>> I needed add enhancements to make it more robust:
>>
>>  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
>>  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
>>
>> As one enhancement highlights the accuracy can be managed better on a system that
>> supports L2 as well as L3 allocation. Not all systems able to run such test will have such
>> capability. Also, looks like CMT does not require there to not be interference as the CAT
>> test does but with MPAM systems having each cache portion as shareable this may also be
>> a big influence on accuracy.
>>
>> I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
>> will be robust across all platforms of all architectures. Even so, I do see several risks
>> for such test to be reliable while I do not see how such fine grained increment provides
>> insight into resctrl kernel subsystem health.
>>
>> Reinette
>>
>>
> 
> Hi Ben, Reinette,
> 
> I am thinking what about thinking in reserve ?
> Maybe narrow the test to detect an ignored or overly permissive allocation
> resctriction ?
> 
> Imagine a small cache mask 0x001, and check whether occupancy exceed the
> capacity represented by that bitmap.
> L2 effect or lack of control for L2 thus won't be an issue here.


I expect there will still be inaccuracies here. Perhaps more so in architectures other than MPAM
where RMID and CLOSID are disjoint as then monitoring and controls rely on different identifiers in
the system. I am happy with whatever is simple and reliable.

Thanks,

Ben

> 
> Ofcourse we still need to think of how to cleanup pre-existing occupancy,
> or a whole new workload everytime that the pattern is guaranteed to be
> freshly new.
> 
> Thoughts ?
> 
> Best regards,
> Richard Cheng.
>  

