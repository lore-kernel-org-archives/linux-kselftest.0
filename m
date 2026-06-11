Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1118DB35;
	Thu, 11 Jun 2026 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781139186; cv=none; b=Mf7RvKq2QNiSM/YVuQbL8f3dytt6DIfpGS6ube3GwLnlZ84P0x2dMWRpBFf8eOAG6GnfmJoSERB3tQWm74T+QYXUV+y17JjkeSoec4d0kQdxXDQGHkQlqp3XFsbRuNz/NWO9Y/yIVuPZvT31EG5RQOLuv5Km1PO8ReqDqeUdUA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781139186; c=relaxed/simple;
	bh=wg/ryzrjzE6+WgTA8n1ebti3U9Hzw2dzCO6ZpHfEsz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMOhuGkfyVAZbwcYIVvJHswlMS9tXMap/gmAde421XSMt6ZQB9SA0RM/rwS1AbYdz/AHaFx0FuNJQuV21NhlMGPcILIh5FxEOOnsuE9O2hKK1l/907HE6DzhXlYVNLQuPp45XVVjqhgDI4FA8SPQIyXbJohnPHfsbtYpdZioFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KBeCfD2e; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KBeCfD2e"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781139174; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ST8ZWi81n2wInQZAT/+VOZXtaPdJeSF4yd+dmtqzVMI=;
	b=KBeCfD2e13JSqOf7n1h1w5z4jgiuxyY8F5R3Y0A4fNvTKTi3Qp2/wNZ37PyQWF6uPx2CjwYmpqBEBUyMaYu3hFiMAPne+1nJMUiMrmOLr4OsQObqVMOohiupWKRqSdeQTZkkI3ya46QC68/T+RX9MuK4eF9KbU0NW7JSQekCUVA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4bqNLG_1781139171;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4bqNLG_1781139171 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 08:52:52 +0800
Message-ID: <0fe97965-671c-41e1-8367-95a5968c7bab@linux.alibaba.com>
Date: Thu, 11 Jun 2026 08:52:50 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/11] add shmem mTHP collapse support
To: Nico Pache <npache@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <CAA1CXcARRvYChZbxfLg1oTh7RdKGqJUFg7M_vCK162v0ncKhVQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAA1CXcARRvYChZbxfLg1oTh7RdKGqJUFg7M_vCK162v0ncKhVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/26 12:28 AM, Nico Pache wrote:
> On Wed, Jun 10, 2026 at 4:29 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> (Note: this patchset is not targeting v7.2, but posted for early feedback.)
>>
>> This is a follow-up patchset for mTHP collapse to support shmem mTHP collapse,
>> which is based on Nico's patchset[1].
>>
>> The shmem mTHP collapse strategy follows the anonymous mTHP collapse approach:
>> track present pages via a bitmap while scanning PMD ranges for collapse candidates,
>> then use the bitmap after the scan completes to determine the most efficient
>> mTHP order to collapse to. Built on the basic framework added for anonymous
>> mTHP collapse, the shmem mTHP collapse implementation is straightforward
>> (Thanks for Nico's work).
> 
> As promised I will review this series :)

Great. Thanks.

>> In addition, I have added some anon/shmem mTHP collapse selftests, and now all
>> khugepaged test cases can pass.
> 
> Thank you for doing that!!
> 
> I was just working on adding the anon mTHP selftests. Any chance we
> can separate out those bits and just send a series for adding anon
> mTHP selftests without the file-related changes? Then your series adds
> the bits you need here for shmem collapse? Thank you for doing all the
> heavy lifting there to generalize those functions :)
It's easy to separate out the anon mTHP selftests, but I'd like to get 
some feedback first. Once everyone feels the selftests are in reasonable 
shape, I'd appreciate help with review and testing (and even adding more 
test cases on top of them).
