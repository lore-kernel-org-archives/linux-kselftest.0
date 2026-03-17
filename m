Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AD53C1991;
	Tue, 17 Mar 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750063; cv=none; b=n+8K/qi+HOGPv9qSDVWGGULRf6yLNrPONXTd0pi89gcFLrcoZj0367z8d3/mk4svTycy4h2U0qzb8h4ZI8vA/x6nBP2ppv6t3LEqaFSOO64Blpj4028dld2P/caXiazUHuiXLxnPr5eht+IJYi8vnJU2IHbW9ZGuc5bdrRy76gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750063; c=relaxed/simple;
	bh=154xV5yNFk1bqEw8USIf/c8Aeng2VxH0YrueSTDmyGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=neeXzBYOozKA/7HqL5oyNbkNl2PwxABtylYEuEH9OsgyW5MvSaksnvdS9cyJxlLDUoTEUyhcIr9yquEtCKZ6E3QNhzKjdQTo7lo6pmnxL2XiXFxMbb3EhDGMc90dmilXXTY7KBBOWbklZVAkE+1ODdKp+v6C1HD++cUv89LnAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPtMbOXG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPtMbOXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2D9C19425;
	Tue, 17 Mar 2026 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773750063;
	bh=154xV5yNFk1bqEw8USIf/c8Aeng2VxH0YrueSTDmyGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZPtMbOXGmfvaEcFvRkzB8juhKjd+GhIoz+r42OP8PQfopHCoX3sKr/PuJikRFs1FZ
	 2TB+U47QkhCXiwIhSLPACQ4kNpq1BRPD1fG8w1/R1hDmviQV/RI3HSCvttPxx88lc7
	 eSbM8xPZBzX8soHHaAkRieE/4BP4utmF6LU3wpC+pe6xmvg3Xus+S2KOTlv8NEGK9M
	 aoCKy3wfhSgOBbz1d97SgGAM8RM8I6FbwYONsLaK3tN16knXwIqSbcrR229C9FqbV6
	 Fk4pH7xhgiR4ww4LGGcdp6A+VDH7nJxUDj5Mimemqne5jpidxNGSw/McK3ATRmem2z
	 xc0gWgauSWBiw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Shuah Khan <shuah@kernel.org>,  Andrew
 Morton <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH 2/6] selftests/liveupdate: add helper functions for
 memfd tests
In-Reply-To: <abk0ke1wAiHMYnGs@kernel.org> (Mike Rapoport's message of "Tue,
	17 Mar 2026 13:01:37 +0200")
References: <20260309115441.266805-1-pratyush@kernel.org>
	<20260309115441.266805-3-pratyush@kernel.org>
	<abk0ke1wAiHMYnGs@kernel.org>
Date: Tue, 17 Mar 2026 12:21:00 +0000
Message-ID: <2vxzfr5yd4ur.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 17 2026, Mike Rapoport wrote:

> On Mon, Mar 09, 2026 at 11:54:35AM +0000, Pratyush Yadav wrote:
>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>> 
>> Add some helper functions that will be used by memfd tests. This moves
>> some of the complexity out of the test itself, which results in better
>> test readability and less code duplication.
>> 
>> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>> ---
>>  .../selftests/liveupdate/luo_test_utils.c     | 175 +++++++++++++++++-
>>  .../selftests/liveupdate/luo_test_utils.h     |   9 +
>>  2 files changed, 183 insertions(+), 1 deletion(-)
>
> Some review comments from an LLM that make sense to me as well :)
>  
>> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
>> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
>> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
>
> [ ... ]
>
>> +/* Read exactly specified size from fd. Any less results in error. */
>> +int read_size(int fd, char *buffer, size_t size)
>> +{
>> +	size_t remain = size;
>> +	ssize_t bytes_read;
>> +
>> +	while (remain) {
>> +		bytes_read = read(fd, buffer, remain);
>> +		if (bytes_read == 0)
>> +			return -ENODATA;
>> +		if (bytes_read < 0)
>> +			return -errno;
>> +
>> +		remain -= bytes_read;
>> +	}
>
> Should the buffer pointer be advanced after each read()?  As written,
> if read() returns a partial result, the next iteration reads into the
> same position, overwriting the data just read.  Something like
> buffer += bytes_read after remain -= bytes_read seems to be missing.
>
> This is exercised by generate_random_data() which reads from
> /dev/urandom, where partial reads are possible for large requests.
>
>> +/* Write exactly specified size from fd. Any less results in error. */
>> +int write_size(int fd, const char *buffer, size_t size)
>> +{
>> +	size_t remain = size;
>> +	ssize_t written;
>> +
>> +	while (remain) {
>> +		written = write(fd, buffer, remain);
>> +		if (written == 0)
>> +			return -EIO;
>> +		if (written < 0)
>> +			return -errno;
>> +
>> +		remain -= written;
>> +	}
>
> Same issue here: buffer is not advanced after each write(), so on a
> partial write the same initial bytes would be re-sent instead of
> continuing from where the previous write left off.

Yeah, good catch on both. Will fix.

-- 
Regards,
Pratyush Yadav
