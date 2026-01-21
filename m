Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B3230F553;
	Wed, 21 Jan 2026 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003114; cv=none; b=MTCTuPH6Pov7kXJYzpJ3FaiVV0o1MAJLDv8swug6ZM8XS/gbnYGxAvZqf1u2+EwoSbtknojBOabws38zAjJSzzhq9sadESKSz3QxnHb6XsX3/fy1igG9ifLtvlN2raligcdrgIsk2ihaSvliD+SkjaP+gE6L1fd76B+BFUKiLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003114; c=relaxed/simple;
	bh=BbMCIGu3sbu4F+Pm6bWzzprjVhcgq4cBnYs4hQ+r4Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGULkPHs+61tfpQKZFqah0Lq9waAlNvd25/LkjFHAVzbRlEIgKYXLAIyc1NwT4aaJ1CkWuPNc26c1RS5DVAvNb0STUtgcbl7fC0fNTFg3wdJb8hF5K3eP7aZv2gESe2/+f5aQLlHaLJ2xtNpvSQKYwWTy0xSu2mA/C7TEhvQan0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBA411476;
	Wed, 21 Jan 2026 05:45:02 -0800 (PST)
Received: from [10.57.49.179] (unknown [10.57.49.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75B453F632;
	Wed, 21 Jan 2026 05:45:07 -0800 (PST)
Message-ID: <0b82e184-2a2d-41e9-a2ee-2664c382fa8a@arm.com>
Date: Wed, 21 Jan 2026 14:45:03 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] selftests/mm: report SKIP in pfnmap if a check
 fails
To: Ryan Roberts <ryan.roberts@arm.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
References: <20260107164842.3289559-1-kevin.brodsky@arm.com>
 <20260107164842.3289559-9-kevin.brodsky@arm.com>
 <09c214df-c3aa-48e4-9587-c54c667c6ce9@kernel.org>
 <46e50e9d-0e4a-4f81-8b43-61b897ad9c34@arm.com>
 <42b9825a-adef-4e80-bbf3-bf01b9fb0054@kernel.org>
 <ee3750f6-dd8b-459f-bc19-8c4a857d40a7@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ee3750f6-dd8b-459f-bc19-8c4a857d40a7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2026 17:27, Ryan Roberts wrote:
>>> But if you think that concern is unfounded, certainly just opening it once and
>>> reusing will simplify.
>> I would just keep it simple here, yes. If this ever becomes a real problem, my
>> intuition would tell me that probably the caller is doing something unsupported
>> that we just cannot easily identify+reject.
> Yeah fair enough.

Cool, will make the fd a global as well then.

- Kevin
