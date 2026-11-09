Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191376;
	b=utEAPt71ZI/Q73/OLs/T3VYRyX4iatHn0wMldLB33P3bkdECY+X//y6n6I7yKLrp+YAO
	 tGDoFf8+7250uI9VwI9Ss11yxRg8b3+8rkAxsb+LR3vKKTCjDh2D+/LJnMp0zoBE5SMAm
	 sUWURlt5yWJG1B6LB4Onm2ckLDeW43G7o8gzEgcToeub8tYYSguGWwmgdnmf2qj58zi8B
	 H4wR0crgnSfg0PWfkC7JZmJ22lLVBfq/hrqmtM8auX0y7fnONSuLx2hs7gVTnh0utBCWP
	 4C7Hv5F21s/mWWRHFZMi9fj67w8uJBen3kBPTvbsdLiBiIEWmruQLlHzpVEvBTnE5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=izPkdOWGD7c9dnxT4q6ljMe1uQrZM1waWSuUYS9fH7I=;
	b=gf1lPmeJT+kjHoV4ri7qWd4vfuRt2yiU3kJtvT8BgloZlrEyTE95usv8YX4OG3E0PqE7
	 Hw6qRSedQSkG44QOAlK7HjnqQ7qaPPB6T6Bgqotqd8xmjsDlpuYg4XO8aROmwUvTm4Zi2
	 MDwoB5kVk+mAjbm/uwhoMxluwNj33QC2w0VVbFTty51RCc8WrgXtn+sN8cVzvnLHi8d4v
	 3/j7g3EtmLiHXtekYoYbiNcZXHX5ekJLjmAf+T3ZqCK3JuQnkWeZKndind6hOYkbQy07j
	 mWS+lC8ditVXSk5ORBGUAjfgktlXYp/6h6BXdA5a0aky+Qas5BHiXPDS6eXquOslOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K6jaWJDt;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846E606A323
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 02:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0846E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K6jaWJDt
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Rwe5/vNZe/KK5IEYNJSCqaEF8U9Kcua9SWWSgmnS+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794191374; v=1; x=1794796174;
 b=K6jaWJDt6QKiOHiP6LT76nlBNWyXcA+2wK7tlinrhHzsNd/h7WsRGQJHn0LpYR/T7FuXW8Pe
 Uh+Q/nCaaSs9ulCDCza1iXwCURyR2MPFGkTF4E5i72eTmwxsiEVVWiS4eiFC+ndjZYYk1w3Y0Bo
 zlJtCW+yIlExZW/vHxa/ws+Y=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f32e565902faf312;
	Mon, 09 Nov 2026 02:29:33 +0000
X-Mizu-Trace-ID: f32e565902faf312
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:29:18 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/5] selftests/mm: fail KSM helpers on short reads and
 writes
Message-ID: <avEv/kARsXK09QB4@dgvxl46587.localhost.localdomain>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
 <20261108-bug-mm-ksm-smart-scan-align-skips-v4-3-86be8fe77e7a@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-3-86be8fe77e7a@gmail.com>

On Sun, Nov 08, 2026 at 08:22:52PM -0500, Qiliang Yuan wrote:
> The KSM helpers in vm_util read and write KSM's sysfs and procfs files
> with a single pread() or write(), and return -errno when the call does
> not transfer what they asked for.
> 
> A read of zero bytes or a short write leaves errno at 0, so the helpers
> then return 0, which their callers take as a value of 0 or as a write
> that took effect. A short write of run makes ksm_start() wait for scans
> of a ksmd that never started, a short read of full_scans makes it wait
> for scans that never seem to complete, and short reads of
> ksm_merging_pages or ksm_stat and a short write of use_zero_pages make
> cases fail that should have been skipped.
> 
> Return -errno only when the call fails, and -EIO when it transfers less
> than asked, so that callers skip or fail as they do on other errors.
> Forcing each short read or write with an LD_PRELOAD shim on
> ksm_functional_tests:
> 
>   short read or write of   before                    after
>   run                      cases fail, then hangs    all skipped
>   full_scans               hangs in the first case   all skipped
>   ksm_merging_pages        9 of 11 cases fail        all skipped
>   ksm_stat                 zero page case fails      zero page case skipped
>   use_zero_pages           zero page case fails      zero page case skipped
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> The checks come from 93fb70aa5904 ("selftests/vm: add KSM unmerge
> tests"), 3d0745e59c84 ("selftest: add a testcase of ksm zero pages")
> and 42096aa24b82 ("selftest/mm: ksm_functional_tests: test in
> mmap_and_merge_range() if anything got merged"), and b27f292de6b1
> ("selftests/mm: put general ksm operation into vm_util") turned the
> use_zero_pages check into one of them. There are no Fixes tags, as
> only short reads and writes forced with the shim hit them, and the
> helpers are in vm_util only since v6.18.
> ---
>  tools/testing/selftests/mm/vm_util.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)

Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>

> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 515031b8283da..caea045fa7d46 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -920,6 +920,8 @@ long ksm_get_self_zero_pages(void)
>  	close(proc_self_ksm_stat_fd);
>  	if (read_size < 0)
>  		return -errno;
> +	if (!read_size)
> +		return -EIO;
>  
>  	buf[read_size] = 0;
>  
> @@ -944,8 +946,10 @@ long ksm_get_self_merging_pages(void)
>  
>  	ret = pread(proc_self_ksm_merging_pages_fd, buf, sizeof(buf) - 1, 0);
>  	close(proc_self_ksm_merging_pages_fd);
> -	if (ret <= 0)
> +	if (ret < 0)
>  		return -errno;
> +	if (!ret)
> +		return -EIO;
>  	buf[ret] = 0;
>  
>  	return strtol(buf, NULL, 10);
> @@ -963,8 +967,10 @@ long ksm_get_full_scans(void)
>  
>  	ret = pread(ksm_full_scans_fd, buf, sizeof(buf) - 1, 0);
>  	close(ksm_full_scans_fd);
> -	if (ret <= 0)
> +	if (ret < 0)
>  		return -errno;
> +	if (!ret)
> +		return -EIO;
>  	buf[ret] = 0;
>  
>  	return strtol(buf, NULL, 10);
> @@ -981,7 +987,9 @@ int ksm_use_zero_pages(void)
>  
>  	ret = write(ksm_use_zero_pages_fd, "1", 1);
>  	close(ksm_use_zero_pages_fd);
> -	return ret == 1 ? 0 : -errno;
> +	if (ret < 0)
> +		return -errno;
> +	return ret == 1 ? 0 : -EIO;
>  }
>  
>  int ksm_start(void)
> @@ -1002,8 +1010,10 @@ int ksm_start(void)
>  	}
>  	ret = write(ksm_fd, "1", 1);
>  	close(ksm_fd);
> -	if (ret != 1)
> +	if (ret < 0)
>  		return -errno;
> +	if (ret != 1)
> +		return -EIO;
>  	do {
>  		end_scans = ksm_get_full_scans();
>  		if (end_scans < 0)
> @@ -1024,7 +1034,9 @@ int ksm_stop(void)
>  
>  	ret = write(ksm_fd, "2", 1);
>  	close(ksm_fd);
> -	return ret == 1 ? 0 : -errno;
> +	if (ret < 0)
> +		return -errno;
> +	return ret == 1 ? 0 : -EIO;
>  }
>  
>  int get_hardware_corrupted_size(unsigned long *val)
> 
> -- 
> 2.43.0
> 
