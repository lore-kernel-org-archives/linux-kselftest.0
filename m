Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969081;
	b=XJzZuiT3zr0WqQw8w5hg4q4w8f+AA7LrSh/ZX5dtCf/4qN3mWIgpjpNGtf1GXoZNL2E5
	 +W/4Z5Wgu81nQWVnLxtoixwL85VRPwkrsHb1BIffr+gJpKBXiUASD8XuLKvbzg8AbozwZ
	 4R9EDCURY3H/7xUwWI5NQwG9zfJvjkUU+8ZCwUiz16zUp3a+/us0eEUzbEI0XcpTfbyVD
	 oIGpI8KdLlDIYS9lpAX9AX3JMhFia5SxVs6QryiKu2t6IN1iDEAVXbhrmg0TBZrnI3RPa
	 /O5eDq3O9HUAUz3ahS3DkXyu7PPW4QQHetslR9xZM7ztzfj/zp9UzrceyVxEVHlsJUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969081;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=m22QOupz/Gj7ONgc3YhQfUsN4LYhFgGjhiGRN+k82cU=;
	b=x9LeiCWHdgDPj1mosDQHsw47DC1LNPkqp6xGomBy6TZBuC+PACq0sCF9djCqP2GYBxJL
	 v6WC+++kNzH4/c42HrFQ0Krz39Pnm1N53OcMETBkNmVMLRIr/nMJYsx2PPD27hi0PvtpN
	 CuWIIV/KBpGn/M0jnMIqJaoYTpHyl2VoTLyJLfLDlmvsJANjoRqf9+2VNfGeweAQX5h5X
	 zAeKyZzQ8nvjoqOWduPbuZeamcfWP8cSf8mby06P8m2LAm2XlcEC7uFJGLXXvFEKE95mp
	 KnbvSyy/QTHLJPU8RuAqUE9SY5tK6dbULXMRn4ES/ZJ/kBzGLYjkncKb78ArF1U2rEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qjafa3YK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E0606A329;
	Fri,  6 Nov 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qjafa3YK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955491F0089F;
	Fri,  6 Nov 2026 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969081;
	bh=m22QOupz/Gj7ONgc3YhQfUsN4LYhFgGjhiGRN+k82cU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Qjafa3YK0xGgJNwxjXBJ7J3iCGKQxc2IYZGgEozspFNho4P1EXhyZFN4k2QWmwYge
	 OjcpjE59HMF5JRRv0Ac+GeQ6HLCrHuniwhH1XqL5ivv446zS9LjJIeAL8uuqRmHy5i
	 ZphYsXU5efvyXSK7hgqogdscMcskcgHhn3v8ODQZTQgRPTbfvnijGmVN1p8/3BPFxS
	 fcwreGWBHb2/Yc36hhSGbLEMFS5qErUE3pajBMBDCPYDiICwFn97gVjDHYCVn4cGeK
	 qSk8+HwOD4/28nl2XCjhm1QPaBrAOnuT9k6KbAjfU8qfTTEEAC1iAj7qpdLRluF91/
	 QybBGkhgjrMBQ==
Message-ID: <fb9d1040-7d1e-4b72-b600-f80b6be3a0b3@kernel.org>
Date: Fri, 6 Nov 2026 13:44:31 +0100
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
Subject: Re: [PATCH v2 1/2] mm/ksm: align smart scan skips with the scan
 number
To: "Xu Xin (vivo)" <xu.xin@linux.dev>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
 <20261105-bug-mm-ksm-smart-scan-align-skips-v2-1-8a9780b6844e@gmail.com>
 <au2hqxeIz0l/DusZ@dgvxl46587.localhost.localdomain>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <au2hqxeIz0l/DusZ@dgvxl46587.localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/6/26 10:45, Xu Xin (vivo) wrote:
> On Thu, Nov 05, 2026 at 04:36:14AM -0500, Qiliang Yuan wrote:
>> Smart scan skips pages that KSM has failed to de-duplicate for a while.
>> Once a page is three scans old, its rmap_item counts down its own number
>> of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
>> at every ninth scan.
>>
>> The unstable tree is rebuilt on every scan, so two identical pages that
>> are not in the stable tree yet can only be merged in a scan that looks
>> at both. Each countdown runs from when its own page became mergeable, so
>> two pages that became mergeable at different times end up on different
>> phases and, once both are old, may never be looked at in the same scan
>> again. They then stay unmerged for as long as they live. Making a page
>> mergeable, waiting for 0 to 20 full scans before doing the same with an
>> identical page, 20 times for each wait, and checking the pair after
>> another 64 full scans shows this, on two boots per kernel:
>>
>>                                 before            after
>>   pairs merged (of 420)         329 / 317         420 / 420
>>   64M of unique pages skipped   89.0% / 89.1%     87.5% / 87.5%
>>   ksmd CPU time per scan        6.25 / 6.25 ms    6.88 / 7.03 ms
>>
>> Pick the skipped scans by the global scan number instead, with periods
>> of 2, 4 and 8 scans. The periods being powers of two, every old page is
>> looked at on each scan that is a multiple of 8, whatever its age, so any
>> two pages meet at least every eighth scan. The longest period goes from
>> nine scans to eight, which costs 10-12% more ksmd time on memory that
>> never merges.
>>
>> Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
>> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
>> ---
>>  mm/ksm.c | 24 ++++++++++--------------
>>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> Brilliant design.
> By using the global ksm_scan.seqnr as a unified time base, this patch eliminates
> the out-of-sync problem of the original per-page skip counters.
> 
> It guarantees that any two pages will be processed in the same scan at least once
> every 8 scans — the least common multiple of all scan periods — which completely
> resolves the permanent de-duplication failure.
> 
> Admittedly, this comes at the cost of shrinking the longest scan interval from 9
> to 8 scans, raising the scan frequency for aged pages by roughly 12.5%. But I
> believe this is a very reasonable trade-off for correctness. So
> 
> Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>
> 
> 
> Besides, can we add a extra description about new smart_scan algorithm that we
> missed in Documentation/mm/ksm.rst?

Agreed, that would be nice. Thanks!

-- 
Cheers,

David
