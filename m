Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186733;
	b=B14hPQi54kLBdNe+hXqmu+nLJdSqmeeu07o0c9qXCqfY8PrACjWxaNnsaBvHcSX3g6+g
	 T/nKJX6TDzAl5GRq6//VNwB+Na7FMxsui3KlF8Vx3GC9bkTw13vja1RRYxinFV7KF8R1Y
	 CUSeDZFgdGYKy5xCOpXNR34BxPzxjDpD+FICk99Gti26brCyEk6gSkZIjyIMp8hGm7GO9
	 UTa8gJHAl12qCcNscd98CCb1Dsm/qCcq/Wj2BEpNmTZCv2UcE6e1LXZvUuDKR7cXodFjZ
	 XHWX7hZROLRlatHfu3uYzgT3aycxiZYZVC8lvjkxX9WCC4dhRqkNMIvReATgIgMKmbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186733;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9mJ43myQfb09ZHFd92pajyUabxECeLaGrPpQgoogl/M=;
	b=WYPLA+TXkFhvFX9IAzWBmo8n6spk4Dfx6T/ywJHGD6WKq++p4a2cobd5YddL8PA12ebD
	 bXdzGWE6DFi1iGE/m+TSBRp7JOgRw3E9lhA0WNJJvMtebxXuc7EONPzto2rl3kYP4F00K
	 di/dPZi9bClDe23uNSdMI5dJ/mZbqluMhtIn+VmdRm5NyWjQb9L/lA0xNZ91Uhw8/DDxd
	 2I6ctS8+niZk5JxA5e3F3PnZvYvXbvA8ByLE0YVaUXJtgfq6z9x2H1rX/a5icvpVeW8aO
	 wEltPx6vuLcjmpwGApA8ldbX1ENvJoAjhvloyZsqtbq61vjL3GcUgYKaj2bAagwOz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="P2hok/IQ";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7A9606A31D;
	Wed, 28 Oct 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P2hok/IQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3329416A3;
	Wed, 28 Oct 2026 04:25:28 -0700 (PDT)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B958B3F673;
	Wed, 28 Oct 2026 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793186731; bh=YKaulhQLxUfKWnBASX1S/dUGhwJrFBUH8NuOouts5+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P2hok/IQmwm8cB2bnDnrDcPeAaV73twbAWps9caSEi5dY2Jcd844rTaNBr92pszip
	 d/LDigAE/b9OTh414eXiZq1JnhVYqaRVz2PyIEus6hbpQG3OwnnX2NsX+NjmIMCxx+
	 FVgww7zQ2JJU5HdwtOCk7+2L5pU8iAEcRnD9k6Qc=
Message-ID: <abf93d06-e330-45f1-86b2-945d21d26f2f@arm.com>
Date: Wed, 28 Oct 2026 16:55:23 +0530
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
Subject: Re: [PATCH v3 6/7] selftests/mm: check MADV_PAGEOUT file permissions
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-7-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261019171206.3331374-7-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 10:42 PM, Gregory Price (Meta) wrote:
> MADV_PAGEOUT only pages out file pages for a caller that owns the file or
> could open it for writing, per can_do_file_pageout(). Any other caller
> gets nothing from a shared file mapping, and only the anonymous COW pages
> from a private one.
> 
> main() now also checks once whether MADV_PAGEOUT can unmap a clean page
> of a file in /tmp, where the tests make their files. The tests below skip
> if it cannot, since none of them would show anything.
> 
> Check that the owner of a read-only file can page out a clean page of
> it. When started as root, the test hands the file to nobody and drops
> privileges, so that capabilities cannot stand in for ownership and
> nobody need not be able to write to /tmp.
> 
> Also check that an unauthorized caller leaves a shared file page mapped,
> and that it pages out the COW page of a private mapping but not the file
> page next to it. These need root to change credentials, and skip if that
> fails. The private mapping check also skips if MADV_PAGEOUT cannot swap.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
Thanks for the changes. It looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
