Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539781;
	b=jCotVmFq7TAYUnzVSjRzo89SUeuGpDQCkB7XbEKpfZetZFNCGE6Jlu4gsOSUv28E3oHt
	 pkyl/evarsq/IrCNOscFGlDTAqPevqzTfwfIqLb8bnFQvzxg5XIL0aFRLFpCQy1UAR8IS
	 OOHQhHRra9i90YC4UaTTtnVEovt99GU+bjn9EmrrxZDsAWbIGDXaxJTmPrVr7HnF8nf27
	 J4JNPojYpHTK6mWrG5WIKEfe0VyhX5g9ROz6iyKRe8cXUJCdBbhGPUaVd0I5N7EzteKqU
	 g7m7IEAaG5CmLQnAaweUcBk+U01sRsNM8Gk3fbCCusB1h51dB/8F/I2A/OhHHKJYTrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539781;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=5UWPlGM+o3dWohOnvym8E+O+RQOw/78ZpY1zfq1s7e8=;
	b=mvSrgV7++wMrds9bbWNwbBpmJZBvls9E3mEiqh3PO+5wqG5iEKn1OCXUlISENJRZOBVa
	 whwGMwrpwZBBRzQqD20aY4ujLgtLCtP/cCgkhOKb4Fuk5EL8ILYxg7uMCGRyRp9GqcU6s
	 jOSpc9MDCdGW/DUe+uMHDM3jQynrr9Su5QdFnUrOOzvUi3LmS5FOYviWn8w1OG43PwFSH
	 xOM8gXm0F5Rf3wVWiRmizzexgx1J7lswuJEDjMjVH92ndrf1bpkVi17eY0wkRFGCWq5m5
	 4bhAj5+UzJAfjH5y6tusD6D+uOkmGXjBW6iosd72jgjZd37s5qpn9RYbsemBCA/ysyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FABUw9KL;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40A6606A31C;
	Fri, 13 Nov 2026 03:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FABUw9KL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=5UWPlGM+o3dWohOnvym8E+O+RQOw/78ZpY1zfq1s7e8=;
	b=FABUw9KLHI8dQ+h33m7un8kvF8PX/fOjoTrVjKb3/d9iuT6VHxkMp1c0catLy5
	0qvI6EQ3lho7V8B3Eo/h4ftoEA7mNtzaTpbJcJlkiR+xUkPZj2vxGep38myDo6HT
	c5lnquD+/hyLK0lVpVXUqjitx0w5ccliFSHGkWJsd5euI=
Message-ID: <94f0b18e-6bee-4aac-a396-fa5a5eea15fa@163.com>
Date: Fri, 13 Nov 2026 11:15:37 +0800
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
Subject: Re: [PATCH] selftests/mm: Handle implicit read permissions in
 madv_populate
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenxionggui@lanxincomputing.com
References: <20261112031811.56500-1-evers_chen@163.com>
 <20261112113231.ce39807d300f102e6763a87b@linux-foundation.org>
Content-Language: en-US
From: cxg <evers_chen@163.com>
In-Reply-To: <20261112113231.ce39807d300f102e6763a87b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD31_XZgPZqXZLhHA--.33600S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr1kJFy5ZFy5KrWDCFy5CFg_yoW7tr1kpF
	WUWF1YvFsYqa47A397uF17tryqyr4fCayIqw18Xr90ywn8Jry3Kr47Ga4F9a48AFWkXw15
	Ca98u3srKr4DtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ukb1nUUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7ByvuWr2gNxqnwAA3T

Thanks for the review and for improving the changelog.

The revised description is accurate. It correctly explains that the 
behavior is specific to RISC-V and that MADV_POPULATE_READ depends on 
the VMA permissions rather than the hardware PTE permissions alone.

The updated changelog looks good to me.

Thanks,
Xionggui


On 11/13/26 03:32, Andrew Morton wrote:
> On Thu, 12 Nov 2026 03:18:11 +0000 Xionggui Chen <evers_chen@163.com> wrote:
>
>> The madv_populate selftest assumes that a mapping created with
>> PROT_WRITE cannot be read, and expects MADV_POPULATE_READ to fail
>> with EINVAL.
>>
>> However, some architectures, including RISC-V, may implicitly grant
>> read permission to PROT_WRITE mappings. On such architectures,
>> MADV_POPULATE_READ succeeds, causing the test to fail incorrectly.
>>
>> Check the actual VMA permissions through /proc/self/maps and adjust
>> the expected result accordingly.
>>
>> Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails
>> with EINVAL for mappings without read permission.
>>
>> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16
>> tests, while the updated test passes all 17 tests.
> Code looks good, thanks.
>
> The changelog is a little imprecise.
>
> "some architectures" is too broad - this is purely riscv.
>
> The wording suggests that a readable hardware PTE alone determines the
> result.  riscv can have readable writable PTEs without setting VM_READ,
> and this test still expects EINVAL on those systems.
>
>
> I altered the second paragraph, please review.
>
>
> From: Xionggui Chen <chenxionggui@lanxincomputing.com>
> Subject: selftests/mm: handle implicit read permissions in madv_populate
> Date: Thu, 12 Nov 2026 03:18:11 +0000
>
> The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
> without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.
>
> On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
> VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
> with PROT_WRITE.  MADV_POPULATE_READ checks this VMA permission, so it
> succeeds and the test fails incorrectly.  Whether the hardware can read a
> writable PTE does not, by itself, determine the madvise() result.
>
> Check the VMA permissions through /proc/self/maps and adjust the expected
> result accordingly.
>
> Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails with
> EINVAL for mappings without read permission.
>
> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
> while the updated test passes all 17 tests.
>
> Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
> Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> ---
>
>   tools/testing/selftests/mm/madv_populate.c |   67 +++++++++++++++++--
>   1 file changed, 63 insertions(+), 4 deletions(-)
>
> --- a/tools/testing/selftests/mm/madv_populate.c~selftests-mm-handle-implicit-read-permissions-in-madv_populate
> +++ a/tools/testing/selftests/mm/madv_populate.c
> @@ -69,10 +69,38 @@ static void test_prot_read(void)
>   	munmap(addr, SIZE);
>   }
>   
> +static int mapping_is_readable(void *addr)
> +{
> +	FILE *maps;
> +	char line[256];
> +	unsigned long start, end;
> +	char perms[5];
> +	int readable = -1;
> +
> +	maps = fopen("/proc/self/maps", "r");
> +	if (!maps)
> +		return -1;
> +
> +	while (fgets(line, sizeof(line), maps)) {
> +		if (sscanf(line, "%lx-%lx %4s",
> +			   &start, &end, perms) != 3)
> +			continue;
> +
> +		if (start <= (unsigned long)addr &&
> +		    (unsigned long)addr < end) {
> +			readable = perms[0] == 'r';
> +			break;
> +		}
> +	}
> +
> +	fclose(maps);
> +	return readable;
> +}
> +
>   static void test_prot_write(void)
>   {
>   	char *addr;
> -	int ret;
> +	int ret, readable;
>   
>   	ksft_print_msg("[RUN] %s\n", __func__);
>   
> @@ -80,9 +108,19 @@ static void test_prot_write(void)
>   	if (addr == MAP_FAILED)
>   		ksft_exit_fail_msg("mmap failed\n");
>   
> +	readable = mapping_is_readable(addr);
> +	if (readable < 0)
> +		ksft_exit_fail_msg("Cannot determine VMA permissions\n");
> +
> +	errno = 0;
>   	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
> -	ksft_test_result(ret == -1 && errno == EINVAL,
> -			 "MADV_POPULATE_READ with PROT_WRITE\n");
> +
> +	if (readable)
> +		ksft_test_result(ret == 0,
> +				 "MADV_POPULATE_READ with readable PROT_WRITE mapping\n");
> +	else
> +		ksft_test_result(ret == -1 && errno == EINVAL,
> +				 "MADV_POPULATE_READ with write-only mapping\n");
>   
>   	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
>   	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");
> @@ -90,6 +128,26 @@ static void test_prot_write(void)
>   	munmap(addr, SIZE);
>   }
>   
> +static void test_prot_none(void)
> +{
> +	char *addr;
> +	int ret;
> +
> +	ksft_print_msg("[RUN] %s\n", __func__);
> +
> +	addr = mmap(0, SIZE, PROT_NONE,
> +		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_msg("mmap failed\n");
> +
> +	errno = 0;
> +	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
> +	ksft_test_result(ret == -1 && errno == EINVAL,
> +			 "MADV_POPULATE_READ with PROT_NONE\n");
> +
> +	munmap(addr, SIZE);
> +}
> +
>   static void test_holes(void)
>   {
>   	char *addr;
> @@ -266,7 +324,7 @@ static void test_softdirty(void)
>   
>   int main(int argc, char **argv)
>   {
> -	int nr_tests = 16;
> +	int nr_tests = 17;
>   	int err;
>   
>   	pagesize = getpagesize();
> @@ -280,6 +338,7 @@ int main(int argc, char **argv)
>   	sense_support();
>   	test_prot_read();
>   	test_prot_write();
> +	test_prot_none();
>   	test_holes();
>   	test_populate_read();
>   	test_populate_write();
> _

