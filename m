Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175205;
	b=ctyIrZnfFECVW3nB8KIT0nwugm7l7zeh9GxZL1HX4hjNHDVmqXNy3KriiDBxI8oCzNny
	 xq/eFMs+WZbvDVsM572ZtE9EhgT/h/qTncRfngoNU3ACNacTJ34DvEYqhceg70tBswa78
	 FnQ3ptDfxB9T8w/Rl+mIzkGq8uOLryRn43pgS08zjjRKVXSCGHZI10iTTaOBq58dgB+yU
	 07p+YKaGESV6aHxIK0rkps35foiYKHBqhvgLQ1ncREntFjMa2WjO443EXZUXTkXjGQE+0
	 pIyaHFc9oqK4vyhuQ6avBcwRtXEg77DnNb0HmCXQcIjrTtsrYKFLXaUj/CLYYkzX6AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
	b=i4xJRgmOIb4QRcCUQvTWzEQv77BUu92p0DlO6sYxIg8JRyZcXgdtFRLmkfX+ZUfst/74
	 CvmNSOQYgmPSlunu6sDBSVKCuf5xUND0K0Y4r1bvqep5Ac/l5P+KGV+uCiJSL1rjoSuEl
	 Vu7PgKAzWYR5nOrZILRXumwT1HC0xvLzdsoSr1ADY8OyUohXN0qZh7SynpiA6JHWeApvm
	 9snq29ntqUaJy8jB1isibOuWSWAmcv94VBe7zyOaWvPDZO++BvZ2aqc7VY14klI00u/3B
	 6vggCOXVCUhcomjh+2HBtTgDmEsRE6GDh7Y+qRAz2Y98/7H1OnM7ITuqy/cc4MoJCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t+4k8Ci;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513EB60A2601
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513EB60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t+4k8Ci
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so6468295e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175204; x=1793780004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
        b=0t+4k8CiMsN8rPI0idoPqjYbF2Kw2hKwDRaG8OWnlzy2CBSM2GeQpQjORaAeIcpXjW
         Q2uOzh8brR3pEODXEo4xeNT1kxapuM2/Z14e72hsuVCFqGn134q5HYzR1gTmMxaCYXIH
         1PBFnYvNRDYFaa7YFCKeymxx4rQ1EbZTL+72Si/9/Ge9i0vzuuK6tCFCvJweEmBc/ZKb
         qA/z8AK62WLP5A0Zub4jf5RdZHda76OGBJr7TPLlT6K6Lgo5j1CtNxGc3JTAO67cZ3xy
         cktotQaThqA8R3hXrHasIGrZy/+9JqmNglPyPDC8IoKyi7CaNVb5JuFJ8VzbltiUwwaG
         W4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175204; x=1793780004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
        b=mwnZJo348fDMPrCbNsiUH4Fg1FJxORw7jMJoaa5cFBZv+YMjweIV4ETvpssLyY5KEx
         YFjGEbJ/3IyrlJqxzWsmlzGKw0tLze/Xdp62QJWTPSS4I8xuLYyCwGEOSlKkLhuyisj9
         HnANrL276RSs78pfEeowqvIocrRmcc6VxYizaOvwgyUwfTwvBGSbTYmHG+Pdd7i2fbf+
         gta5ZN23LVVUQdKBjZ2M5FWy1MoTkVeGuBcc0hwByzaF/tnWeP2nG28VWWltGsaHhS9F
         A8JcXeu3VR5vn0NdPLMBBPyfVY9sC1avePc2XeEeicDWIOIdbp4/K/XXcGQ6SQstFhbJ
         tsJA==
X-Forwarded-Encrypted: i=1; AKwUvBy5OzEuezQCoQCflswcOp5hRWQY+zO+eLPPLnYdlxgGj3wXJLXAlUWSl1qhoAPju+xOFnUxDUEV+m8AxATMtSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+VIaNHZYtaoIZBaWJwS1RSxgeVg4rutIdoWFJI1vwAzv1oHqD
	ohC8OGWAUwsorFUMZLnTroKzwp0Xpz63UzhDSKY8+YxYBUX3ztFUBfc1
X-Gm-Gg: AYBFou3Yatd8CgOC1MuwTIqGyin8yy3mmRHpJqAi2uyVsQ0Oe+XefGHByQF2TtQ//Sd
	w3BQi7Qu8wXzAYgxRv9ZOuMbSO9ehJ4GCY1wIivwzx8yMEIrexKO0WrtmA6azpCx0O+UbmGqPuv
	zzWqOUGA8xx2TXC3sV9Jg3cplBL7mPrAMiBYPg8JQ7imfeac0hdHlZ1AvRQ3tHNNU60gzoYO+fo
	N64B7tuA8WDaHUYjcvKiSPCV0j8Aw1mAmJ46N25mdWYXvXXZWcCdSNtwkZo311/xSv+X+uf4IgQ
	e4KxcwIw+Mc5Ka66MpHoPVJUcu6sk746PBH9/TRfFy2E2mAnyuMbIZ+l82mUeFJKge+9Zth6pl3
	L9OGKCvxiBkVZyhIm2z41N9vLIE5887Voc2KyNAbN43uFQwGOWHuFrgqWuCogRr70Ydi+D7nzCS
	nslUZ79W9ztRHxHa9mDgzOD3FuumYVn6NRqXBf4aZIefrgOFC+CD+X0k6fnhehVl5q7wODppy2R
	r5cpAtkUVKp5HFmLYdZ2icL4JZaJI1l2yj0WnyQFpykOPSBkjPQkImeMaNdKOvP8wwlvyFF4Guv
	ugsYNbt8wnlHjkbQFMrDq7bq88OCfDX08sq3HJ6TDMTbiw==
X-Received: by 2002:a05:600c:c117:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a9672030cbmr23856025e9.22.1793175203701;
        Wed, 28 Oct 2026 01:13:23 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm30046085e9.12.2026.10.28.01.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:13:23 -0700 (PDT)
Message-ID: <6c73ec1a-4dc4-4c18-aaf4-e85ca73f64a4@gmail.com>
Date: Wed, 28 Oct 2026 09:13:22 +0100
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
Subject: Re: [PATCH v2 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
 <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/26 5:07 PM, Qiliang Yuan wrote:
> run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and
> for the pagecache folio split cases of split_huge_page_test, since
> tmpfs does not give them large pagecache folios.
> 
> It only does so when xfs already shows up in /proc/filesystems. When
> xfs is built as a module that is not loaded yet, the check fails, no
> XFS is created, "khugepaged all:file" is reported as skipped and every
> pagecache folio split case of split_huge_page_test is skipped with "No
> large pagecache folio generated".
> 
> Load xfs with load_module() when it is not registered yet, so that it
> is unloaded again once the script is done. "run_vmtests.sh -t thp" with
> xfs built as a module and not loaded:
> 
>                                    before    after
>   skipped tests                         1        0
>   skipped split_huge_page_test cases   43        0
>   xfs loaded after the run             no       no
> 
> Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 56f5416681da7..ba77fae5df4f2 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -428,7 +428,7 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep -q xfs /proc/filesystems || load_module xfs; then

doesn't this also match selinuxfs? with SELinux on, xfs is still loaded
after the run. would grep -qw be enough?

also, needs a rebase, 6593a15af108 ("selftests/mm: skip khugepaged file
tests if mkfs.xfs is unavailable") reworked these lines.

-- 
cheers,
jose a. p-a
