Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103877;
	b=Wovg6cuPsT3LVK2KTWoyUFmf7P+BCPTHlDiomsicQR9Mjo8yQmP1yyFsdKWx/Mw53BTy
	 F/TWNzkwyDba9s1Yz+TFya41im98vaYtACXFRVe+bspr7W/aMLvJ9TTmyJibsf6OK4ov5
	 N5MMo6dR8Q7sZC2V1fDyVVkUNGuc4mWrQZGQSxYud68z880I5T4pF2CKwlkBF/n1RKNBV
	 /pzYeMtFwk6807jkO9ezvPKpmG/mMYLin3w199FNM5OfiXJzx8xyu+Ji8LdsoLIJ2snLD
	 +HCtUEf6nKDKUfoAzA3rbyCyHHCPnF9COxPggj+ri0e2ypW2BBV/c78p2x/8pUisJRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103877;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=R1vFLQhXd+Ee7U6nRfJgbj6Iy51wVYwS2wjVTcJ19eA=;
	b=GpH/g0FSsrNRQjslV64UmxI02dayu8HqrmRt0cyvb21w+ILruYOeYWfMUyNOePFaw5gY
	 4PIaaEq8se91oFWeG45K41S4D9COqFpPGKxn7onMltWt3/rjz/D0kC68Pbl3Xx9+G5yoT
	 TO2i8DWGyYaA+950gIZcA2r/3/Sbcx4Uc1bPT2EbBcPkYi762DJEaKe+NOnwnPYGyIA7D
	 Q5ZWyPRgC+9vKD/RcvmQWfZJEJbZ18B4Ri5s7E943qKOxtKV4YMiEMsCHAtJZvvbkku07
	 Hh8z+UGD1QH0qpBc2wKXEPIGH68ndQfbhiEsLLSc0k7GjtTkDO2B6ewbVx1meEU6PrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289BB60A262A
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 12:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289BB60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R1vFLQhXd+Ee7U6nRfJgbj6Iy51wVYwS2wjVTcJ19eA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793103869; v=1; x=1793708669;
 b=wAG8g9sVHDZiHUsVSPdzUYuIlsd1O8fLWzka+s4pSADrAFB7VchGNgJKiFy3QMASncjLRPcI
 kfJDXT0LM0dEE7atPk2KJhpalkG3alSfNi9hk3NMvRaJAbMh9YlOVLfgix/RUP0udeHgLWpyS9I
 mxjSoU2CfSPZ4yUrfiIpwxZM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 264de3ab2a2cfef0;
	Tue, 27 Oct 2026 12:24:29 +0000
X-Mizu-Trace-ID: 264de3ab2a2cfef0
X-Migadu-Flow: FLOW_OUT
Message-ID: <ffe057d0-6cf8-4028-800f-09dd2dabd35f@linux.dev>
Date: Tue, 27 Oct 2026 20:24:15 +0800
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
Subject: Re: [PATCH v6 16/19] selftests/mm: add khugepaged race harness
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Usama Arif <usama.arif@linux.dev>,
 "Nico Pache (Red Hat)" <nico.pache@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Hugh Dickins <hughd@google.com>, Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-17-kirill@shutemov.name>
 <85b3725a-6dde-4a57-b303-4ae2b53b60a5@linux.dev>
 <6e3c298f-9b93-43b2-840d-65c5ffa3bc36@arm.com>
 <248431ea-4bbf-4a48-a80e-72287ffbae22@linux.dev>
 <atiU94VjdEsWzdBr@thinkstation>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <atiU94VjdEsWzdBr@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 6:34 PM, Kiryl Shutsemau wrote:

> Right. Would you like to send the fix?

Sent out now.

https://lore.kernel.org/20261027122013.4286-1-zenghui.yu@linux.dev

Thanks,
Zenghui
