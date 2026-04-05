Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8E3019A6;
	Sun,  5 Apr 2026 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420458; cv=none; b=I56x7lEg2DDLHrtyVBob7ZOln5+mS2tAf8s6C179OjkbTV4zX8LsLT/89aMsydu9EwK6GJp+XNzb+j1aajhH1NIlWdujZ4/NL4GVrdPCUDL0eWkAREKwb5JomFiXZ6MSUUrZMjm4p2tdRyfTxuNxjUf+27O5HYZe8oQAg6exh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420458; c=relaxed/simple;
	bh=rocj01UV7BIqAUTcND10h4o/563Z1X6DhrT6J4DgXzE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tABbeJV645ISOA2c/QJqITyv7LK9g0Kag4T1XAIbp1Gl46loERXj1sNePefKbq7hh/hd2m8pG3wOWLIHmjOO57KTPulLnbig87/Htwjly8DpZPpNCoNYI86XXiCMQ/g6GZUl8ZO1gjmT7CGNQam3SO8PT7uGBanx+sO3m3ItSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C7mL6Zq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C7mL6Zq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA2EC116C6;
	Sun,  5 Apr 2026 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775420458;
	bh=rocj01UV7BIqAUTcND10h4o/563Z1X6DhrT6J4DgXzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C7mL6Zq3D8NjVhvUHH4xW6YUJTJq+Kt/xW9f/ZvzxSM1s3HbZ3Zwsd0PQjaM5zpLq
	 PaWy9pOvBRSOwWd3f9cSexpZozXNoDyk2ucDP0bnXxFEqmnABJoA1u5AVNqO4Qy1lY
	 z9a9ngqvdZXG92K0E6/C084DZ0cdUmlu4C72jlQ4=
Date: Sun, 5 Apr 2026 13:20:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: CaoRuichuang <create0818@163.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH] selftests: mm: capture write_hugetlb_memory.sh exit
 status
Message-Id: <20260405132057.c1ae7267911c5657cd5a3fe9@linux-foundation.org>
In-Reply-To: <20260405194623.84218-1-create0818@163.com>
References: <20260405194623.84218-1-create0818@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Apr 2026 03:46:23 +0800 CaoRuichuang <create0818@163.com> wrote:

Please word-wrap your emails!

I fixed it.

> charge_reserved_hugetlb.sh backgrounds write_hugetlb_memory.sh and
> immediately stores $?  in write_result.

Yes.

> That only records whether the background job was started successfully,
> not whether write_hugetlb_memory.sh itself later failed.  As a result,
> the test can miss reservation failure and OOM-kill outcomes that are
> inferred from the writer exit status.

Seems that way.

> Redirect the writer output straight to the temporary log file and wait
> for the background process before inspecting write_result, so the test
> records the actual exit status.

Looks good to me.

It appears that this code is from 2020.

Question is, will this change break the selftests because it discovers
previously undiscovered failures!

> index 447769657..2f52ad7c8 100755
> --- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> +++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> @@ -193,9 +193,9 @@ function write_hugetlbfs_and_get_usage() {
>      [[ "$private" == "-r" ]] && [[ "$expect_failure" != 1 ]]; then
>  
>      bash write_hugetlb_memory.sh "$size" "$populate" "$write" \
> -      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" 2>&1 | tee $output &
> +      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" \
> +      >"$output" 2>&1 &
>  
> -    local write_result=$?
>      local write_pid=$!
>  
>      until grep -q -i "DONE" $output; do
> @@ -223,6 +223,8 @@ function write_hugetlbfs_and_get_usage() {
>        sleep 0.5
>      fi
>  
> +    wait "$write_pid"
> +    local write_result=$?
>      echo write_result is $write_result
>    else
>      bash write_hugetlb_memory.sh "$size" "$populate" "$write" \

Do we actually need to play these backgrounding games?  We run
write_hugetlb_memory.sh then synchronously wait for it, polling its
output.  Why don't we simply run write_hugetlb_memory.sh synchronously?
Do away with that grep loop and the replaying of
write_hugetlb_memory.sh's output.

The 29750f71a9b4c changelog doesn't explain why it's done this way. 
Maybe Mina recalls?


Thanks, I'll set this aside for consideration after -rc1.  I expect a
cc:stable will be wanted.

