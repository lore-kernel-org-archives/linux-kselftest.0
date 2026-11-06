Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932673;
	b=ghHTbchrmAqF97OjCCCkrsYVtNcqDRrkAtBG9Es5YitgNLwAwtqMkagffOK2hsE0f0Ve
	 om/hb8ohX41+gJzTZO/5QJ/+82dkq96Q3a0XuMiZIUL9tSNShvKoqwn1wfSzSLET+81nr
	 jd4Z1lpp98fK/tUk2F0gCfem1BRlKFJFDc+zfz49+q4tojg3umDm6NC9Swzd2Hr00U91e
	 TPXQn+mtmiE0RItbnLoB0nlBpMoZfirPIa9WdS9ORqoRbfG8rS8O8KtfqzpVHEoGEncE9
	 2xJnBf1z+WS/L3o7wq94sT8K2mcd1A/VlGQYfPsDlEdEg0b9in3V5tpB8bmGIRNhPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932673;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VHeH0IW/I0H82vbyYEbCANX2fIPlHkjru1hf4L33oJk=;
	b=32xv/9AUnG8gbG9edt1oUFl22uJxG2w3yeRATYfvD4f3UItDWE0/ZxrBBx+lWBB3b3FW
	 1AQ99b/OYhlBuYGZ4h8Iehg+3UjxroFKlXZmjDMlkkUdHhJPty3Z2xCRIikeBsHFs5Zgz
	 0MJuy43o+nvj5FQF6vljrKu7Dt+wVdm/ZTA+OAcIy27fceWzn6o9r/+jZ3mW3JX4aiOM9
	 b9/u5MNujiL2AkRgYRhIAn350pcdR5zErd7v3XJsoaoHTxNZ5YyRrSSMPQz81XxyloCAl
	 3/RIE2//SHXX1xjR9DXFPLdX0ayF9yiP3oNP3uE0Cp4UdJn3szXvLsnYhAzn3BWjhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bGuAwZXj;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC63D606A326;
	Fri,  6 Nov 2026 02:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC63D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bGuAwZXj
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793932668; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=VHeH0IW/I0H82vbyYEbCANX2fIPlHkjru1hf4L33oJk=;
	b=bGuAwZXj6Ioko+pA3aD2Ps1kMh33MvTko6TZoxa/v9GDROZ2ashlQevxgJK7ccP5WkP6GnL+RU9rnP+7cd5freTbEx43SqOWn2TPDeHOEzw/Z7oU/GtBH3Dzn6LkxaCow7hgwzs0psZON6wytF3R/WYzuHC6j7Aazn6JOS02Ij8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEA2RB4_1793932666;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEA2RB4_1793932666 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 10:37:47 +0800
Message-ID: <58530883-4b3e-4e6c-aec7-4e551cba608d@linux.alibaba.com>
Date: Fri, 6 Nov 2026 10:37:45 +0800
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
Subject: Re: [PATCH] selftests/mm: skip split_huge_page_test without the
 split_huge_pages file
To: Sasha Levin <sashal@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261105030242.1241448-1-sashal@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261105030242.1241448-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 11:02 AM, Sasha Levin wrote:
> Every case in split_huge_page_test goes through
> /sys/kernel/debug/split_huge_pages. When that file does not exist,
> because debugfs is not mounted or the kernel has no CONFIG_DEBUG_FS, the
> first write bails out of the whole test and it is reported as a failure:
> 
>    Bail out! write_file(/sys/kernel/debug/split_huge_pages): No such file or directory
> 
> Skip the test in that case.
> 
> Fixes: fa6c02315f74 ("mm: huge_memory: a new debugfs interface for splitting THP tests")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
