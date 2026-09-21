Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CAB3403EA;
	Mon, 21 Sep 2026 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990491; cv=none; b=ctAIkm7fwSKBBkGeA4j4vGn64M3wx6qrlVbEubA1R7R7AnQpQ6FtZ/NxW87UkXzcAY2y+qUf4wSWiuPkZorzFiCGl6SZZUrbIOKcZFvf86ciX0B33CCSwbBmrUSX9yMGBvsow8fgT3pkjNDmSrYtIMZleKMPEFvhqnxkm5EveVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990491; c=relaxed/simple;
	bh=QV+v46sViJKLhMIGNt/Uz3iIskoe+UK8OyD9IWvb7Pk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PQU8LEqdGgTrULljKTAdXGK1spEtdLk04Wd/mDYRWMJQQaH2EBaHnAI3fR5+kvHmtbPkbf6c/Ib3pDwepNl/Hf+YObtuQuBIhIfAgrRdQgkZJIMNHPlVCzyDLUEJUSQvgzQmNemf5JggpTgcI3usAUFkNsYaY5AQBjsn832LdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a/zhrjT3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a/zhrjT3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E27A176C;
	Mon, 21 Sep 2026 04:34:46 -0700 (PDT)
Received: from [10.0.129.72] (e127648.arm.com [10.0.129.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 846BB3F86F;
	Mon, 21 Sep 2026 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789990490; bh=QV+v46sViJKLhMIGNt/Uz3iIskoe+UK8OyD9IWvb7Pk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=a/zhrjT324WOAls+SGrH1oXsInwRl4/iMkvHicAHoCcc+u3cFBIBWffspAZwQqHgD
	 mns6EBaB5kNljRJbxRTHhYiyxc/ayD44SYanujZr/B5vhQ3ihX/jStJddNYXvml92V
	 vIQxLH0eQqsxHVMPdQuMp0jLwNC9N4OmlEAGbfl4=
Message-ID: <7a65fc72-7f9b-418a-ad26-a2cfac1d4898@arm.com>
Date: Mon, 21 Sep 2026 12:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] selftests: Skip SUD tests when unsupported
From: Christian Loehle <christian.loehle@arm.com>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
 Thomas Gleixner <tglx@kernel.org>, Gregory Price
 <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
References: <cover.1786965107.git.christian.loehle@arm.com>
 <499c6893-5daf-421d-ae11-31d0d9332241@arm.com>
 <777919b3-5935-4f1d-b642-e1e56f5a82f8@arm.com>
Content-Language: en-US
In-Reply-To: <777919b3-5935-4f1d-b642-e1e56f5a82f8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/13/26 11:24, Christian Loehle wrote:
> On 8/26/26 15:56, Christian Loehle wrote:
>> On 8/17/26 12:16, Christian Loehle wrote:
>>> Syscall User Dispatch (SUD) is unavailable on architectures without
>>> generic syscall entry. Such architectures return -EINVAL for otherwise
>>> valid SUD prctl and ptrace requests, which the SUD selftests currently
>>> report as failures.
>>>
>>> Probe SUD with a valid disabled configuration and skip the affected tests
>>> when that probe returns EINVAL. Unexpected errors remain failures, and the
>>> existing coverage is unchanged on kernels that support SUD.
>>>
>>> Christian Loehle (3):
>>>   selftests/ptrace: Skip get_set_sud if SUD is unsupported
>>>   selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
>>>   selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported
>>>
>>>  tools/testing/selftests/ptrace/get_set_sud.c  |  8 +++++
>>>  .../syscall_user_dispatch/sud_benchmark.c     |  9 +++++
>>>  .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
>>>  3 files changed, 53 insertions(+)
>>>
>>>
>>> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
>>
>> Gentle ping on this
> 
> Another gentle ping, this should have all the reviews to land, right?

Shuah, Thomas,
Either of you mind picking this up in either kselftest or core/entry?

Thanks!
Christian
