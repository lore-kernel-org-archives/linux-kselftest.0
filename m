Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411533E2ACC;
	Sun, 13 Sep 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295070; cv=none; b=uDM/fv7CpfJ25hkluj7dTUBt4KzrTUKKuF1H5OGy4AZlzHWLtXyxQcZhlO8xLjTe4m6M01/fwdsuGHpxcLk2Iyzv5RxqffNCduyLJNO9oXp1+issyQawB0eGUXrgB8WZfwzjkNwsYtncVt4CQRJNQSW1+ykqXGqrMZERSy7Zcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295070; c=relaxed/simple;
	bh=Ppyco9I84ddMlU1O9ZYk2ofbAJAiLguvAB2+4QTqXjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kgyglerhvy64kXj3ExxPC6AxC3Yv6OJhSV8MXN5C38r8H7dLln6rf/JnoQjMWNF8PSYgThOicGymdJO4lbq9OLbbWNfkE5x8/F+rL6JC1EmkzfGULzQRyYuFr3lO9SRKO1jfGIEPjHFtHV1FTto0lJ2oaveUNH9g1F4YtFxkdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qrdk26jQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qrdk26jQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64F9F1655;
	Sun, 13 Sep 2026 03:24:15 -0700 (PDT)
Received: from [10.57.81.151] (unknown [10.57.81.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B3A43F7B4;
	Sun, 13 Sep 2026 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789295059; bh=Ppyco9I84ddMlU1O9ZYk2ofbAJAiLguvAB2+4QTqXjE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qrdk26jQPzo3hTOw4vj2lavydgi6kLds3Mc6wUWXNkYP0OLLkerE6TqRvtuVkPkrn
	 x88a+mwXm6HJ4/7B/c6GQdrc1qSSrQe/cBEcZ7Xp3U3jDY8oHz31lImuA8hWnlQ+lb
	 uXK0fyoWHc7AA6+QlbuBAHh50KvhlJ3o1+iedjQA=
Message-ID: <777919b3-5935-4f1d-b642-e1e56f5a82f8@arm.com>
Date: Sun, 13 Sep 2026 11:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] selftests: Skip SUD tests when unsupported
From: Christian Loehle <christian.loehle@arm.com>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
 Thomas Gleixner <tglx@kernel.org>, Gregory Price
 <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
References: <cover.1786965107.git.christian.loehle@arm.com>
 <499c6893-5daf-421d-ae11-31d0d9332241@arm.com>
Content-Language: en-US
In-Reply-To: <499c6893-5daf-421d-ae11-31d0d9332241@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/26 15:56, Christian Loehle wrote:
> On 8/17/26 12:16, Christian Loehle wrote:
>> Syscall User Dispatch (SUD) is unavailable on architectures without
>> generic syscall entry. Such architectures return -EINVAL for otherwise
>> valid SUD prctl and ptrace requests, which the SUD selftests currently
>> report as failures.
>>
>> Probe SUD with a valid disabled configuration and skip the affected tests
>> when that probe returns EINVAL. Unexpected errors remain failures, and the
>> existing coverage is unchanged on kernels that support SUD.
>>
>> Christian Loehle (3):
>>   selftests/ptrace: Skip get_set_sud if SUD is unsupported
>>   selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
>>   selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported
>>
>>  tools/testing/selftests/ptrace/get_set_sud.c  |  8 +++++
>>  .../syscall_user_dispatch/sud_benchmark.c     |  9 +++++
>>  .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
>>  3 files changed, 53 insertions(+)
>>
>>
>> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> 
> Gentle ping on this

Another gentle ping, this should have all the reviews to land, right?
