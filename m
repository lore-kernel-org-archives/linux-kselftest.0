Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6D326D51;
	Thu,  9 Apr 2026 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775731700; cv=none; b=D3yQpi3tkjuvSIu/ySehcAiESqWmHaWIC9URXZOiq/xN4nuJ+8EmtYFZIKOKoNR2As/vw7rxekNLXxDG7RzPKWlN95zb79msih/kbKhlH56YH1snDHh5x8gTWhl44ReGfdfwZw2ro3JaeXJbIYuZmqs6+r9b784DGXIG2brxMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775731700; c=relaxed/simple;
	bh=Jx7gEXI9vJ/oyMVdgHUEoqOvId83JfYBNs7L/9ysO+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABj29ST4l+dZmhXFTaBD+T8sFgjje31pjfYzx3nvgZ9z4vPIvS9L94yLligivaNqLq0lRX9P/zhU9/MqMiIq18Ec7n3tuKzNHrlawc3CEQAknoEZ99n50xaW6ck8SpQxWTS43+6A/q1nEdNuVjPzsMxTo24bhej5lkqijX2GKRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovA/s+7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovA/s+7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB469C19424;
	Thu,  9 Apr 2026 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775731700;
	bh=Jx7gEXI9vJ/oyMVdgHUEoqOvId83JfYBNs7L/9ysO+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovA/s+7sTstzRC1cWBwDEAQ9EYOpR2DEwLICJDIAaYmEu5gPZKeeEhiNCt+tM3i3+
	 UsULDu5W9SYWMNSuC+skESNI45NKwkE+tKBm/pjACs8evI83EP4StmGwhQ6M5Hl5zr
	 AH9J8IlwAb2jJLXRtLYYBI8tMtlBBcQyfDHlKL0QVfFzNM5pzKj4lIctiSmMubmyps
	 6VZAd9xOKG0crUT334xKGfEDP8ajbOPGCujwnHTuwOL/bg1eM65Y3VYGtYc7Ud4ea4
	 KUTecHfl+4Jdbg1lUhBfvzeKDfaNkC8qcv3tnh/kEzj0jL1cSL9HBzlgBLuTRbap+s
	 Hky0OaOkF8XUg==
Date: Thu, 9 Apr 2026 13:48:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: CaoRuichuang <create0818@163.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: mm: stop relying on killall in
 charge_reserved_hugetlb
Message-ID: <adeD7VijQIaT8gWU@kernel.org>
References: <20260405213126.1161-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405213126.1161-1-create0818@163.com>

Hi,

On Mon, Apr 06, 2026 at 05:31:26AM +0800, CaoRuichuang wrote:
> charge_reserved_hugetlb.sh tears down background writers with
> killall -2 --wait write_to_hugetlbfs. That depends on killall from
> psmisc, which is not installed on minimal Ubuntu images, so the test
> fails in cleanup with "killall: command not found".

Can't we just skip the test if killall is not available just like we skip
it if it's not run as root?

> Track the writer PIDs we start ourselves and signal them directly
> during cleanup instead. Make write_hugetlb_memory.sh exec
> write_to_hugetlbfs so the recorded PID names the long-lived test
> process, and redirect async output straight to the temporary log file
> instead of going through a tee pipeline.
> 
> Signed-off-by: CaoRuichuang <create0818@163.com>
> ---
>  .../selftests/mm/charge_reserved_hugetlb.sh   | 25 +++++++++++++++----
>  .../selftests/mm/write_hugetlb_memory.sh      |  2 +-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> index 447769657..757df4878 100755
> --- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> +++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> @@ -44,6 +44,8 @@ else
>  fi
>  export cgroup_path
>  
> +write_pids=()
> +
>  function cleanup() {
>    if [[ $cgroup2 ]]; then
>      echo $$ >$cgroup_path/cgroup.procs
> @@ -193,10 +195,12 @@ function write_hugetlbfs_and_get_usage() {
>      [[ "$private" == "-r" ]] && [[ "$expect_failure" != 1 ]]; then
>  
>      bash write_hugetlb_memory.sh "$size" "$populate" "$write" \
> -      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" 2>&1 | tee $output &
> +      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" \
> +      >"$output" 2>&1 &
>  
>      local write_result=$?
>      local write_pid=$!
> +    write_pids+=("$write_pid")
>  
>      until grep -q -i "DONE" $output; do
>        echo waiting for DONE signal.
> @@ -261,10 +265,21 @@ function write_hugetlbfs_and_get_usage() {
>  function cleanup_hugetlb_memory() {
>    set +e
>    local cgroup="$1"
> -  if [[ "$(pgrep -f write_to_hugetlbfs)" != "" ]]; then
> -    echo killing write_to_hugetlbfs
> -    killall -2 --wait write_to_hugetlbfs
> -    wait_for_hugetlb_memory_to_get_depleted $cgroup
> +  local write_pid
> +
> +  if (( ${#write_pids[@]} )); then
> +    for write_pid in "${write_pids[@]}"; do
> +      if kill -0 "$write_pid" 2>/dev/null; then
> +        echo killing write_to_hugetlbfs pid "$write_pid"
> +        kill -2 "$write_pid"
> +        wait "$write_pid"
> +      fi
> +    done
> +    write_pids=()
> +
> +    if [[ -n "$cgroup" ]]; then
> +      wait_for_hugetlb_memory_to_get_depleted "$cgroup"
> +    fi
>    fi
>    set -e
>  
> diff --git a/tools/testing/selftests/mm/write_hugetlb_memory.sh b/tools/testing/selftests/mm/write_hugetlb_memory.sh
> index 3d2d2eb9d..49164bbfc 100755
> --- a/tools/testing/selftests/mm/write_hugetlb_memory.sh
> +++ b/tools/testing/selftests/mm/write_hugetlb_memory.sh
> @@ -19,5 +19,5 @@ echo $$ > ${cgroup_path:-/dev/cgroup/memory}/"$cgroup"/cgroup.procs
>  echo "Method is $method"
>  
>  set +e
> -./write_to_hugetlbfs -p "$path" -s "$size" "$write" "$populate" -m "$method" \
> +exec ./write_to_hugetlbfs -p "$path" -s "$size" "$write" "$populate" -m "$method" \
>        "$private" "$want_sleep" "$reserve"
> -- 
> 2.39.5 (Apple Git-154)
> 

-- 
Sincerely yours,
Mike.
