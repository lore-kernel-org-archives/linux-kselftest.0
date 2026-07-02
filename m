Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5620391E73;
	Thu,  2 Jul 2026 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977566; cv=none; b=RrXDTnCdkY5hbQyvb3LvUTdGw7KsA5WER/onsMWC0UrdQI29TOh2nVuZz12ddgzMFPs3PrtuzQ4aE4ZnA2eYpGnzfl6rIRNN2limKIRg8cJElf5PnpdTJLfbbZDlkYeAtnNFls0tT4WUtHyd4ztAqovYwQT2J6DjCo38V+m/GQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977566; c=relaxed/simple;
	bh=yvteik4NgRVlKdJXBZQB/hUgCjwTKgL0ShkNIu5ExSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxV5MsUUAxhnYhx9YAX+5fZvBDqAQVt0wXzkGkPeRGEAHCtDgP11t/xby/C4QLnFk1/QyRUiQ/l/tVmSnBrF7rnOvKGImT07NNDtdgBd+/3YQ0ny7KyGffsEh1RrEZ7+y/RatxVrVrLoFaSyOHkiemnq/mfso0JsVu9+TFIDZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qkcWbszX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qkcWbszX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B437F3587;
	Thu,  2 Jul 2026 00:32:39 -0700 (PDT)
Received: from [10.57.81.212] (unknown [10.57.81.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C803F85F;
	Thu,  2 Jul 2026 00:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782977564; bh=yvteik4NgRVlKdJXBZQB/hUgCjwTKgL0ShkNIu5ExSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qkcWbszXa96r83D4J8SR6PK5GG1LAStbQYq35+2/FgM3BgG81+kQGg8GSuifk3QjQ
	 BLLqWQe6erIs9wxXsZAuN7xa1jEGu4PuC/TVNB1WNe0HgHtRm2q6fqz16qhQIjivpL
	 +82po4CA5Td8igYr7sMENX9EkLe0sVAabAswQfPQ=
Message-ID: <39e0ad44-4d6c-44ad-b271-b5a55fff7106@arm.com>
Date: Thu, 2 Jul 2026 09:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] selftests/mm: unify pkey sighandler selftest
 assertions and tracing
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, jhubbard@nvidia.com, joey.gouly@arm.com,
 keith.lucas@oracle.com, usama.anjum@collabora.com, yury.khrustalev@arm.com,
 zwisler@google.com, hongfu.li@linux.dev
References: <20260702062332.911786-1-lihongfu@kylinos.cn>
 <20260702062332.911786-3-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260702062332.911786-3-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2026 08:23, Hongfu Li wrote:
> Add per-test tracing to the pkey signal-handler selftest and use
> pkey_assert() for error handling. Each test enables tracing at start
> and disables it at end; on failure, pkey_assert() calls abort_hooks()
> to turn tracing off so ftrace is not left enabled. Signed-off-by:
> Hongfu Li <lihongfu@kylinos.cn>Acked-by: Mike Rapoport (Microsoft)
> <rppt@kernel.org>Acked-by: Liam R. Howlett (Oracle)
> <liam@infradead.org>Tested-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
