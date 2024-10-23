Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6D1FBC99;
	Wed, 23 Oct 2024 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729719988; cv=none; b=F9KgELTWW0EMknK84z9+1QLRV8S8UMztVlmJHY4o5j5u7h0AyWR8m//Cb/CarkREor6yZK3bkrioWMsev5gxoB2puArLFmnDD0fBbD9enUyzupmoUxIurn5xKxJP3fXqIWXkWaOfCCA4W4c7avpuZsuXuKikTLK9U4RErAmvTzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729719988; c=relaxed/simple;
	bh=7NBApcW8S/lkiFhHmEOD5kmPtXG5z7IyJ5P4UgsThgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi4skOQaZaro+Jybuvg9HOfP182ye15nACc7p14AX2pG/caS2D+JkOBoZQ3Wgn+o9Ozm92aVT6DrLFzhMkIXcGxlJcNOveKKZ2TzdT0S9kXlSM3GefyUl6rX5pQZJCAG2yeNP9x/gBUaGqgMo/mjLJ2Pq47CpmkPL5evD1I3/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWCKKUtY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWCKKUtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D126DC4CECC;
	Wed, 23 Oct 2024 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729719987;
	bh=7NBApcW8S/lkiFhHmEOD5kmPtXG5z7IyJ5P4UgsThgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWCKKUtYwnBQmQWOlpAvbkrBv1UtUXdAsZlgIOrMtfsxu1t4+2ZPbt+XPoD5SSmoL
	 megqlFEbxFjTEY3s5zmEs5Bf+7/y95FX3VtBaUbCrJcnIUnfSSDnS1kP8P8okL6elb
	 oLyaYRV7oTNXkWHd3nmzNUGdP8KP3VIX1z5efci4RqlKaaW6ECF7f9qWevH5p7mqkQ
	 IaIeQoU+3p3vfX5+gle/+tjDDIsCtNqe6ExJljinfzihKw1qQOrZk+B3+gY+08siEW
	 XDGplcH1xr75p1lE6ARn2tpyrD4u5R2asUMink+7gdTuxmlRjEKrIeS+ARvnfxbF3r
	 hF0eZkcW/vdiQ==
Date: Wed, 23 Oct 2024 11:46:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: selftests/sched_ext: enq_last_no_enq_fails testcase fails
Message-ID: <Zxluscvm4S9qPgKo@slm.duckdns.org>
References: <Zxknp7RAVNjmdJSc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxknp7RAVNjmdJSc@linux.ibm.com>

Hello,

On Wed, Oct 23, 2024 at 10:13:19PM +0530, Vishal Chourasia wrote:
...
> static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
> {
> ...
>          ret = validate_ops(ops);
>           if (ret)
>                   goto err_disable;
> ...
>   err_disable:
>           mutex_unlock(&scx_ops_enable_mutex);
>           /*
>            * Returning an error code here would not pass all the error information
>            * to userspace. Record errno using scx_ops_error() for cases
>            * scx_ops_error() wasn't already invoked and exit indicating success so
>            * that the error is notified through ops.exit() with all the details.
>            *
>            * Flush scx_ops_disable_work to ensure that error is reported before
>            * init completion.
>            */
>           scx_ops_error("scx_ops_enable() failed (%d)", ret);
>           kthread_flush_work(&scx_ops_disable_work);
>           return 0;
>   }
> 
> validate_ops() correctly reports the error, but err_disable path ultimately
> returns with a value of zero

Yeah, this is because the failure is now communicated through the scheduler
unload path which has richer error reporting. The exit is triggered
immediately but loading still succeeds. We need to update the test framework
to detect this failure mode too.

Thanks.

-- 
tejun
