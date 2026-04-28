Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DCA392829;
	Tue, 28 Apr 2026 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777342940; cv=none; b=pZHifRGMUlpvZQZYryBCZeP/bunHyosCLT6rvdHSVvvBXDdUbjVreabZMdjfarfwxc2sXVAyabhnxbCwf57/RiLUntKZkSyvh613+SOHYtmrKBRMxQ8tKht+tJg/TJIKJcIFt6ijJZhtLHAh2noMKIuUa+ULO0WOMYx8KmvUqB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777342940; c=relaxed/simple;
	bh=94slqjkIQVyhe/A12lRNTfUa9WB3u29FMPa8rxdScTg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hOuxXt69a2G2jFm0YHvhYhiAxsYsk1razv6Zwkx+hVp3L7DUY/F+xsE2VhFAEtXANRLn7q+hSSf8qf+1RjjDHuk7oko2/9IjttxBoJAVUPdM5XORe1WCZPqyz2kUQIf8oeDDBGUfCchTmfVhKT1fg3fb5xsH0m9RMhmUpRBzkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=pqFmWNTk; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="pqFmWNTk"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=slP5ntnfvW78WgZpNY2pjWv8ZV6WHz7JT2kbRbb2KJ4=;
	b=pqFmWNTkK87kfZU/JQ4oAl25srib3lq/JTh7+sRo25TEI+3y5H6bRMZjg1E3mf7OgQ3g2c22s
	ONcOVvkx5Mp5aksFISBORfwQ7ZDUVBmPY+rTkUjU2SGsBGnQDewO3WK7GVtD1CfDVQhhvEpKXDh
	hRtgiZaJ5qlUB++Kzi2Z0BI=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g4PCT1JyvznTWv;
	Tue, 28 Apr 2026 10:15:01 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id CC7804055B;
	Tue, 28 Apr 2026 10:22:12 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Apr 2026 10:22:12 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Apr 2026 10:22:11 +0800
Subject: Re: [PATCH v5 4/4] selftests/mm: regression test for
 panic_on_unrecoverable_memory_failure
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<kernel-team@meta.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
 <20260424-ecc_panic-v5-4-a35f4b50425c@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <4d8cdc38-113d-f268-a0de-d77dd2337635@huawei.com>
Date: Tue, 28 Apr 2026 10:22:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260424-ecc_panic-v5-4-a35f4b50425c@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/24 20:24, Breno Leitao wrote:
> Add a test that enables vm.panic_on_unrecoverable_memory_failure and
> injects MADV_HWPOISON on a userspace anonymous page. The page must
> still be recovered via SIGBUS — it must not trigger a kernel panic.
> 
> This is the regression test for the panic_on_unrecoverable_mf()
> recheck: a buddy page being concurrently allocated to userspace can
> briefly land on the MF_MSG_KERNEL_HIGH_ORDER branch (refcount 0, not in
> buddy), and without the recheck the kernel would panic on what is
> actually a recoverable userspace page.
> 
> Run in a forked child so the SIGBUS path is fully exercised; if the
> kernel ever regresses and panics, the host VM dies and the harness
> reports the binary as never returning, which is itself a clear
> failure signal.
> 
> Skips when the sysctl is not present (feature not built in) or when
> the test cannot write to it (insufficient privilege). Saves and
> restores the original sysctl value.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Thanks for adding a selftest. Some comments below.

> ---
>  tools/testing/selftests/mm/memory-failure.c | 84 +++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
> index 032ed952057c6..9cb8d694aee94 100644
> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -17,9 +17,13 @@
>  #include <sys/vfs.h>
>  #include <linux/magic.h>
>  #include <errno.h>
> +#include <sys/wait.h>
> +#include <stdlib.h>
>  
>  #include "vm_util.h"
>  
> +#define PANIC_SYSCTL "/proc/sys/vm/panic_on_unrecoverable_memory_failure"
> +
>  enum inject_type {
>  	MADV_HARD,
>  	MADV_SOFT,
> @@ -355,4 +359,84 @@ TEST_F(memory_failure, dirty_pagecache)
>  	ASSERT_EQ(close(fd), 0);
>  }
>  
> +static int read_sysctl_int(const char *path, int *out)
> +{
> +	char buf[16];
> +	int fd, n;
> +
> +	fd = open(path, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (n <= 0)
> +		return -1;
> +	buf[n] = '\0';
> +	*out = atoi(buf);
> +	return 0;
> +}
> +
> +static int write_sysctl_int(const char *path, int val)
> +{
> +	char buf[16];
> +	int fd, len, ret = 0;
> +
> +	fd = open(path, O_WRONLY);
> +	if (fd < 0)
> +		return -1;
> +	len = snprintf(buf, sizeof(buf), "%d\n", val);
> +	if (write(fd, buf, len) != len)
> +		ret = -1;
> +	close(fd);
> +	return ret;
> +}

There are write_sysfs and read_sysfs in vm_util.c. Can we reuse those?

> +
> +/*
> + * Regression test for vm.panic_on_unrecoverable_memory_failure.
> + *
> + * With the sysctl on, hwpoison injection on a userspace anonymous page
> + * must still be recovered via SIGBUS — it must not trigger a kernel
> + * panic. This guards the panic_on_unrecoverable_mf() recheck that rules
> + * out concurrent buddy allocations being misclassified as unrecoverable
> + * kernel pages (MF_MSG_KERNEL_HIGH_ORDER).
> + *
> + * If the kernel regresses and panics, the host VM dies and the test
> + * harness will report the binary as never having returned — which is
> + * itself a clear failure signal.
> + */
> +TEST(panic_on_unrecoverable_user_page)
> +{
> +	unsigned long page_size;
> +	int saved, status;
> +	void *addr;
> +	pid_t pid;
> +
> +	if (read_sysctl_int(PANIC_SYSCTL, &saved))
> +		SKIP(return, "%s not available\n", PANIC_SYSCTL);
> +	if (write_sysctl_int(PANIC_SYSCTL, 1))
> +		SKIP(return, "cannot enable %s (need root?)\n", PANIC_SYSCTL);
> +
> +	page_size = sysconf(_SC_PAGESIZE);
> +
> +	pid = fork();
> +	ASSERT_NE(pid, -1);
> +	if (pid == 0) {
> +		addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> +			    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +		if (addr == MAP_FAILED)
> +			_exit(1);
> +		*(volatile char *)addr = 1;
> +		if (madvise(addr, page_size, MADV_HWPOISON))
> +			_exit(2);
> +		FORCE_READ(*(volatile char *)addr);
> +		_exit(0); /* unreachable: SIGBUS expected */
> +	}
> +
> +	ASSERT_EQ(waitpid(pid, &status, 0), pid);
> +	write_sysctl_int(PANIC_SYSCTL, saved);
> +
> +	ASSERT_TRUE(WIFSIGNALED(status));
> +	ASSERT_EQ(WTERMSIG(status), SIGBUS);
> +}

Could you restructure this test using the similar format as other functions, e.g. TEST_F(memory_failure, anon), in
this file? It would be good to keep them in same style.

Thanks.
.


