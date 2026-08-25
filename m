Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06B4457A0
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662095; cv=none; b=WQ766TBT00sdIwJ57RbeteE7SifFEBOn0QyQdqYdBLbMOM2RkoxgfWhVUhlDcZtl3VqG8QYl3JpnAgy6TIUpD3W/zPmxun28gihu2qwtWpl2UcZiWJW6iNtbHHBuwh/GHtjvc/3K6Vn2DLd32TG21KPnShwgkMMMDyxui4tiCec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662095; c=relaxed/simple;
	bh=xl1X/ERnfdb/Po0MH7kJ/YHraADcPjNCbK3IAQ+MWqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoSrKsV+A8BDjP6zWD8pU9rwbOBpIXAJ/4st7vvj1taK8gqHxNPfbUj5RyuKya00fIdDCIjPHoeB2Q3aDB38rUlCC695TCZ4mDeI2axzfmODm7+Dt08hrZPWWw8V7BHlrqBptx8fQ5MaxMphr6p0z1RY9WlQmx8ufXUTPJ/vAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vaLj+Fl7; arc=none smtp.client-ip=95.215.58.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vaLj+Fl7"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xl1X/ERnfdb/Po0MH7kJ/YHraADcPjNCbK3IAQ+MWqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787662085; v=1; x=1788266885;
 b=vaLj+Fl7HSE4h7MF2Yt3FmAOp19+eVa2mpUmlNxBEDVE6fVsPtxa/cET68m/VtOSw5joC2lQ
 MqTrP2e90lJdBAxcl3DHdqAO7Ko4h2chI+v3YOTGtwHIFl2POgITrvXQ+aM9JdA3yS/UYv578W1
 PkLD84+SNRS/F9NSIWDsBhu4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [10.244.244.3] (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 952ab7d5463f0b6b;
	Tue, 25 Aug 2026 12:48:05 +0000
X-Mizu-Trace-ID: 952ab7d5463f0b6b
X-Migadu-Flow: FLOW_OUT
Message-ID: <bfe1b5fd-30d9-4d0c-9c8c-a8801a138e3a@linux.dev>
Date: Tue, 25 Aug 2026 20:47:52 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Usama Arif <usama.arif@linux.dev>, Dev Jain <dev.jain@arm.com>,
 Shuah Khan <shuah@kernel.org>, Barry Song <baohua@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/25 19:20, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
> 
> Nobody after us needs these parts of the argv[0] string anyway.
> 
> This patch is inspired by previous work from Anshuman Tewari [1].
> 
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
