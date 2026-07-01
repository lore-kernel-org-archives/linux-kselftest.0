Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6773B388E;
	Wed,  1 Jul 2026 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889153; cv=none; b=A+tvg7xo0KNagRKxhmUfAn8UF2kKnYAAvCs6zgkbjTvHGKwOoXpJZSSVsSUNluJxa23R8tRu7VaHnAOh6Vih8Aq6CvXRodPJSkWcnOwjco0zuGUzH8QzXcUGEMP0GK3iZkFqaPRs8vmYZLmnLXMIWlr0IWE6nGLaBV4S/UeHMc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889153; c=relaxed/simple;
	bh=bNAaRztB9GuqH+0F/E4KtnhKwcxLH0iyorEPyaQESzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+qqzmWeIjrs+7FW6XWtqKsOnljLE60IlqZIpCAXAoZPqvSC3pR+SQm5S+dpdzplSTe3wganImNslEz2Z8sxsTEPOEFIKoMUNGIe8ZAaLNhKlhakyuqKIMwNfvPUOBmKdYgmLH+Gu90dE4KWiECbeAk349i7ohijbYKQtm7Awd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=efNSzYIj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="efNSzYIj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E21F2BCB;
	Tue, 30 Jun 2026 23:59:06 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7AA93F85F;
	Tue, 30 Jun 2026 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782889150; bh=bNAaRztB9GuqH+0F/E4KtnhKwcxLH0iyorEPyaQESzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=efNSzYIj53fOdbfCQ+VS/foDFbGIMlDjAQsk85Tki62tDxl6PX3g8sjIgZhqqScDl
	 Ht1+a/dP3Do5WlW5d8eaLxsKnFTCcMy47cUFRMxuKVjIKvDjWjoXITqdLtypQRTjah
	 oqmFK2O2B+vZsRz+mGo4ITl1TZFUf9qY4PB8UOSY=
Message-ID: <2b0e5b7c-d2c6-4680-86d7-1db8e0c02696@arm.com>
Date: Wed, 1 Jul 2026 08:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
To: Andrew Morton <akpm@linux-foundation.org>, Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630222022.60d0951b90af8857971ad10c@linux-foundation.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630222022.60d0951b90af8857971ad10c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2026 07:20, Andrew Morton wrote:
>> v8:
>> - No code changes (relative to v7).
>> - Updated Cc list: added developers identified via `git blame` and
>>   `git log` on tools/testing/selftests/mm/pkey*
> Kevin, if you have the time, please.

Sure, planning to have a look this week.

- Kevin
