Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574763;
	b=Yq6haCVwSwMto/X0mvOd8Bilz8YdKdxKR04SfJpACtLefgZPBuX4622GHxI82ufjHSGi
	 +73dMOUAD8DjkrJ27yNhNayLqCPwwjxue38kHXHFPwG67Gwm9O+NUPs/9Tlb2e2Qgze4q
	 qU2DEpsuPruIYIK1U5ZQYd3y452wii4lgYFnCdwOhB43czZlufk1GrZbVlX1BytjCEZRc
	 CadCFB+92VWX/pNXyJFpMFI1ts8VMcTqSmWwTgLpSJYziKF4frhSJpgYhHbgcVmk5sjVE
	 93tGxZi5qsxQghtua64miRJaJvBP1fl6Kc1fk18uTbmgsRHdmSSOhJsYxg0FJYgj2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574763;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=L9o0QAn31EhODg5Xk6yf6VXd8Cb1/NtuAjQyDpQKKWc=;
	b=CM4XUyyeJ2inJJEKkIoUk9RDUgFGfAKCAEgr7m3ci/3ajWei7dh/ER77e4CfFcD43xHv
	 52KwmaDw3CwqTVTCRWglYHV0K0afRAOxYRaDHXaj2j0LltE9KUeLeFBpSTNDBOKi5Fr7s
	 JzgYQeyq889K5S91FsE+i3nOIJPvbjztRryXFbG8pZFQLBCa/NCkMP+j6e8/9ejFIb1Oc
	 GI5DhR7/iOkOVTRW5Qzp3Vh39xM7XqCx16Tow7RnmFM/OEtKmXsk1ptfzhr43w5apgPm2
	 GBOR1EXChzr9NKQvDzS3OSKS/zXFbAlCoOAMLI4/qj1NUvWDDMiqgt7YLJmdzrOW3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TuxtysPG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F19606A32E;
	Fri, 13 Nov 2026 12:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F19606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TuxtysPG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA0A81476;
	Fri, 13 Nov 2026 04:59:18 -0800 (PST)
Received: from [10.43.20.13] (unknown [10.43.20.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3EAC3F673;
	Fri, 13 Nov 2026 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794574761; bh=IA8HbrwIcSv7yszpiNKddpXBErCGjQg6blFLc6aN5Qs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TuxtysPGkHekTOZWakO1gsh0ZU6UXYkeHjTVMySBTC5bRkJpe89iJYfrTPPZBsPsP
	 RNfp6yInd9YavKXA4MaZUVcMvkkZZJkxd1I85hSj+EcPLh+OwTih1jHciCoqfVxaxp
	 PEP99UB64GxvcCTp4Xozo9TLGLjSplxdXdRAwpgg=
Message-ID: <827c5b0b-ec80-43bd-abdb-8fce4a8b1df9@arm.com>
Date: Fri, 13 Nov 2026 11:51:14 +0100
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
Subject: Re: [PATCH] selftests/mm: pkeys: wait for the child in become_child()
To: Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Carlos_L=C3=B3pez?=
 <clopez@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dave.hansen@linux.intel.com, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kselftest@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Hongfu Li <lihongfu@kylinos.cn>
References: <20261106164639.2959195-1-clopez@suse.de>
 <20261106135739.113e4b432ecb6e92f62e37d4@linux-foundation.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261106135739.113e4b432ecb6e92f62e37d4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2026 22:57, Andrew Morton wrote:
> On Fri,  6 Nov 2026 17:46:39 +0100 Carlos López <clopez@suse.de> wrote:
>
>> become_child() forks during test_pkey_alloc_exhaust() and has the parent
>> exit, so that the remaining tests run in the child. However, the test
>> runner only waits for the original process, so it sees the test finish
>> early with a success status while the remaining tests keep running in
>> the background. Failures after the first fork are thus not reported in
>> the exit status, and the remaining tests overlap with the next selftest.
>>
>> Fix this by waiting for the child in the parent and exiting with its
>> status. A previous fix avoided waiting, arguing that the parents would
>> keep holding their resources [1]. Particularly, the parent keeps the
>> hugetlb reservation of its test memory, so the child runs out of hugetlb
>> pages after a few iterations. Avoid this by freeing the test memory
>> before waiting.
> Thanks.
>
>>  tools/testing/selftests/mm/protection_keys.c | 16 +++++++++++++---
> get_maintainer coverage of selftests is poor, alas.  So it's a good
> idea to poke around in the git-blame output to figure out who best to
> cc.  I added four new lucky duckies to this thread.

Thanks, looks sensible to me. These pkeys kselftests really rely on a
lot of (black) magic...

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
