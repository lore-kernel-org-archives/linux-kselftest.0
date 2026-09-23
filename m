Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819922370A;
	Wed, 23 Sep 2026 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133125; cv=none; b=RJKLldB7COTlG9Fkl6MG9NKRfulVAjWJEBrvIeAPZaLhMFZ+kXHZ4z+Pb3yl4IuBhyg90PHt4IzoqGh87BjrNvm/aJOjJXe4SIdsfIAap+tHYupCNz4qeAqv0DEGR1bEhJ2wZIHsagSJPOZkb0W/fq+uGqbtlDKv8Gtp1HdTgnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133125; c=relaxed/simple;
	bh=a36Ee3YEbPH5862wbsXoPLufAschgf7elgGNcKL4ULs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XY7ZDwdeCO4dNtgSweqiYaaTbWyMCfvPQU2G83K8B86P2X0Ojp2dqqAaYRBlRg0gHJoAM8HTjOfkH/4NFQBB2zVnG6crQFjGxONVDZReCbIqv5L2nQpVn7fA54f+m1ZU+20OUpHnqBZ2OKaA2L+pVT+9y7zrrT3FXaboum2sfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fM6+ok9X; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fM6+ok9X"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790133119; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=GXqRRRTZoDrLgtSIIIeujmLVFncqWjfihFp3XOxyNoc=;
	b=fM6+ok9XqnzP751xZiXV3fbENazwmZRpgysMf4lM3pLyVlUVuxC8+bBvW+iCeHgIjImhW43S5nc6k0TipeAgFjkTBEUMze6bCaCzV4K200hIMqfVGPOdpAkmaPYFlg58I9cYnc5XahmxHX2jWUy/iO1EiuZo8WmsXT4WS2jbU8s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBVZ2Ep_1790133116;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBVZ2Ep_1790133116 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 11:11:57 +0800
Message-ID: <37f7fca9-76c3-4731-b1c0-2687a03eefe2@linux.alibaba.com>
Date: Wed, 23 Sep 2026 11:11:55 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] kselftest: mm: remove check_huge_shmem()
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
 <20260921-fix_split-v7-3-d25ec991159f@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260921-fix_split-v7-3-d25ec991159f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/26 6:40 PM, Yeoreum Yun wrote:
> check_huge_shmem() was required to distinguish shmem huge pages because
> /proc/self/smaps reports them using a dedicated “ShmemPmdMapped” entry,
> as opposed to “FilePmdMapped” for file-backed huge pages.
> 
> Now that /proc/self/smaps is no longer used to detect huge pages and
> /proc/kpageflags is used instead, it is sufficient to distinguish
> between file-backed and anonymous pages since the ShmemPmdMapped is also
> kind of file-backed.
> 
> Therefore, remove check_huge_shmem() and use check_huge_file() instead
> and cleanup khugepaged's check_huge operation in mem_ops.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
