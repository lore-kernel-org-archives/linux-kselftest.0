Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A2B335074
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 22:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329494; cv=none; b=ABhVcMkyzb1mvpBAxhfExvXru5WSUWnkXZ76Pkife6AHELiwYuKDAKR0zLIcg5Hk5KQhSYL+WV47Rt/IBUizDzuMRWFZ/IRY81sj1fDexUJJcbutq9DrLequfrYTrAmgAWTuoeqUg8SD3tj1+dgCjwtHmltgm9018MGF5g8NTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329494; c=relaxed/simple;
	bh=YI7OuwfXOaydBTv/Q9XXmhgvbOs2VgItUWWh7YHkZH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AwnajT16k2hg1oAvQmj2OI8DFupFJdrPDOErATtiaQprSHxfwO+FsHAHd+AOR2KqYDqTFm86aXxEdD9Z3qDXLRJ2UB3MoY4g47ZWY7UoxBBbBzGdPu6BWTiFBIcnWPCtt7gqyu3rjUGg6WyOU4vAJLeiiOPaPidsGwIBS8BDBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jtm40tt0; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jtm40tt0"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b8343aa8a9so1285195eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770329493; x=1770934293; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9eDseQYzgKZYQrXhIi7NMMbxjrrJgwLrfu5M307gzg=;
        b=Jtm40tt0o4Ne3KVIo3HmqAQLD4VQfC7R4N+0xPS+6BlxGkx2LgejGl2o59iklkotN+
         vpQyRa0f5cT6o/C41LhjVtifXD1DX//o7YubLtxMknylTPrFRJkodepA2C9Q/Mre8xYI
         96lU06kGLhS6aLBSMP1569cgHtq6yXjvBaHNVUg32Acrge/9S+xQwF5ZlyaL295wEyoH
         A+w1C3gDauXWl7SC01XHD1//2sh7QqgbgxihQ7vj0BdFJLt5ciWXwYP162trAn0QY1A+
         9modXuIO7uSM9rzSE9YTuI7uyVGsU+DJn0kpqeYS4TLuwdJKRVzfHGCmSuJ2EvCw0/Q7
         IBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770329493; x=1770934293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9eDseQYzgKZYQrXhIi7NMMbxjrrJgwLrfu5M307gzg=;
        b=w2G0xaf2Yxp3gJ2hqAEt3wSk5+QdqeFexIucUBLSb9oNzsMXpbfTLZkoD9xY5K0LOX
         q8zi0OK94DEm6/WUXPlCtOFpS/Mx4Q+5jDk1C9fwayL32Ec75ETJWgyRSy+LzRUXOAb7
         tZASvIHUiPH/AKq/TUxCZJ/nzg0mWsspJiZnEj+QMnwotBcoD5+JgKQ9arSXUtkyyDKq
         y5Gm4SvFm9tXDN724TljYBjz0fEUAEQQH16f1GpAERmMpvrt+cpPvWdX/iQ+YcJ2f2qT
         wbzIAeJU/6eMcrUoYZuLim3o4X6KUqJ7QLVd7oZT5lsp3+6LxQ3OcjXhxQu4GEG35Dyj
         yjBg==
X-Forwarded-Encrypted: i=1; AJvYcCVDcFe8Qj+Sbnbq+egNtuRbMZDOy6GVVWEZLSRRLNYUl8ijRxVdY44RAZ+BS/v+NNNUWu1NaSOTosx5Vw2A0f0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8nFaBk3pnZciObt81aK5KRgWxtAwAflTHDnxY/bw/I/5dxcZ
	IHwRA35ABekitydg1F7zduRVEowbEmUfmWe5VHIROiQfaUPiU/vzqW9h4beSJvPRMwYmc710oVJ
	B5bOMWJhzEghC+Q3/P2DByPIIhNCl2NhxhKb0yQ==
X-Received: from dybir8.prod.google.com ([2002:a05:7300:c8c8:b0:2b7:4f7a:4d75])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:fb8b:b0:2ab:ca55:b760 with SMTP id 5a478bee46e88-2b856a5bd04mr250824eec.43.1770329492914;
 Thu, 05 Feb 2026 14:11:32 -0800 (PST)
Date: Thu,  5 Feb 2026 22:11:22 +0000
In-Reply-To: <aXj28ZAsPhp7s5sm@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aXj28ZAsPhp7s5sm@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205221122.2415333-1-jordanrichards@google.com>
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
From: Jordan Richards <jordanrichards@google.com>
To: rppt@kernel.org
Cc: dmatlack@google.com, jasonmiu@google.com, jordanrichards@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sending v2 addressing this feedback soon:

>> +	err = kexec_file_load(kernel_fd, initrd_fd, strlen(cmdline) + 1,
>> +			      cmdline, 0);
>> +
>> +	close(initrd_fd);
>> +	close(kernel_fd);
>> +
>> +	return err ? : 0;
>
> Just return err?

Good point, fixed.

>> diff --git a/tools/testing/selftests/liveupdate/luo_test.sh b/tools/testing/selftests/liveupdate/luo_test.sh
>> new file mode 100755
>> index 000000000000..90ecb16e87bb
>> --- /dev/null
>> +++ b/tools/testing/selftests/liveupdate/luo_test.sh
>
>...
>
>> +function detect_cross_compile() {
>> +	local target=$1
>> +	local host=$(uname -m)
>> +
>
> This function works fine if you run luo_test.sh directly or have cross
> compilers named the way it expects in $PATH.
>
> But if I run
> CROSS_COMPILE=~/cross/gcc-13.2.0-nolibc/aarch64-linux/bin/aarch64-linux- ./run.sh
> on x86, x86 tests fail
>
>> +	if [ -n "$CROSS_COMPILE" ]; then
>> +		return
>> +	fi
>> +
>> +	[[ "$host" == "arm64" ]] && host="aarch64"
>> +	[[ "$target" == "arm64" ]] && target="aarch64"
>> +
>> +	if [[ "$host" == "$target" ]]; then
>> +		CROSS_COMPILE=""
>> +		return
>> +	fi

The host==target test needed to be first, fixed.

>> +	local fragments=()
>> +
>> +	if [[ -f "$common_conf" ]]; then
>> +		fragments+=("$common_conf")
>> +	fi
>> +
>> +	if [[ -f "$arch_conf" ]]; then
>> +		fragments+=("$arch_conf")
>> +	fi
>
> I think the common and arch config fragments are required and we can just
> assign fragments directly and run merge_config.sh.

Done.

I wasn't sure if arch_conf would be necessary for all architectures, but it
is kind of needless complexity.

> +	if [[ "$qemu_cmd" == *"$host_machine"* ]]; then
> +		if [ -w /dev/kvm ]; then
> +			accel="-accel kvm"
> +		fi
> +	fi
>
> Do we care that much about qemu warnings about invalid accelerator to have
> this logic here?
>
> -accel kvm -accel hvf -accel tcg
>
> seems to cover all bases.

The warning doesn't break the tests, so it should be fine.

>> +#include <sys.h>
>
> This breaks running normal make:
>
> luo_test_utils.c:16:10: fatal error: sys.h: No such file or directory
>   16 | #include <sys.h>
>      |          ^~~~~~~
>
> NOLIBC specific includes and calls should be guarded with #ifdef NOLIBC

Done.

> diff --git a/tools/testing/selftests/liveupdate/run.sh b/tools/testing/selftests/liveupdate/run.sh
> new file mode 100755
> index 000000000000..3f6b29a26648
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/run.sh
> @@ -0,0 +1,68 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
>> +OUTPUT_DIR="results_$(date +%Y%m%d_%H%M%S)"
>
> I don't think that putting the results in the current directory rather than
> in SCRIPT_DIR or in an explicitly named directory is a good idea.

Changed to "$SCRIPT_DIR/results_*".

>> +TEST_NAMES=()
>> +while IFS= read -r file; do
>> +    TEST_NAMES+=("$(basename "$file" .c)")
>> +done < <(find "$SCRIPT_DIR" -maxdepth 1 -name "luo_*.c" ! -name "luo_test_utils.c")
>
> I don't like name based detection of tests. Listing them explicitly seems a
viable option.

Agreed, changed to a fixed array.
