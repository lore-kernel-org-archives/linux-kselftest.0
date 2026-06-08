Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2433655F1;
	Mon,  8 Jun 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918008; cv=none; b=AhRD8m9zpVerwuezmbzaquhb6UAuYa62v4MS6ngHURYtno6L8KiV7ABika0VXtBZU1WwCPcOIZD8sRXnFaS12oGxKE1VVrfrJWB3WVc3gs2qYctsZuAD3yQflyBXntsRJN89l1H10EmxfHtSgbtrQuv7McXVL2qYXiFrqkj8NYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918008; c=relaxed/simple;
	bh=t0xiNzRFH2GlWmfuVuRo1kZhYNIljG20MsXzjBE8J7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAlfMxOloObVo1s60bntd8I3slVlKc7c74V1js3LqkXl3W5pc9LFf3cLxITtuaGXcFio00V7LmhbuFsY5QMIWCXTc/G4/AWQyVNppFEzFo00x9fcQNmn2od90Q+7wEJelFaYu3LTg+4Ww1y1SQNlw3+k06n0y5xenQVhdl2UQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oXMiV+Xj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oXMiV+Xj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD412437;
	Mon,  8 Jun 2026 04:26:41 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E00763F86F;
	Mon,  8 Jun 2026 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780918006; bh=t0xiNzRFH2GlWmfuVuRo1kZhYNIljG20MsXzjBE8J7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXMiV+Xjr0oZpEJK/9eUWP7q5NdlK24aRQ6uPgNG8q40wSOdgfcTN5DY2KgioMWki
	 pwLWqk2gpRqkPJXC3IgJzk/ZXUxRAy4mbcW8QiZOVBwlLZ0rYvA7dB4lgSV/RSUFO8
	 GUcT1bkJf4TmqFkPhQ4lhcOICPo8T8mP8GqnZwUw=
Message-ID: <73ecf8fa-7357-4d5b-97cc-11d526876f5a@arm.com>
Date: Mon, 8 Jun 2026 16:56:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: fix ksft_process_madv.sh test category
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260608103224.344101-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260608103224.344101-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/06/26 4:02 pm, Sarthak Sharma wrote:
> ksft_process_madv.sh currently runs run_vmtests.sh with the
> mmap category. Update it to run the process_madv category,
> since ksft_mmap.sh already runs the mmap category tests.
> 
> This avoids running mmap tests twice and ensures that process_madv
> tests are run through the kselftest harness.
> 
> Fixes: 6ce964c02f1c ("selftests/mm: have the harness run each test category separately")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  tools/testing/selftests/mm/ksft_process_madv.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/ksft_process_madv.sh b/tools/testing/selftests/mm/ksft_process_madv.sh
> index 2c3137ae8bc8..edad2d2d888f 100755
> --- a/tools/testing/selftests/mm/ksft_process_madv.sh
> +++ b/tools/testing/selftests/mm/ksft_process_madv.sh
> @@ -1,4 +1,4 @@
>  #!/bin/sh -e
>  # SPDX-License-Identifier: GPL-2.0
>  
> -./run_vmtests.sh -t mmap
> +./run_vmtests.sh -t process_madv

