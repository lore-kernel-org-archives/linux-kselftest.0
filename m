Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B03DA7E5;
	Fri, 24 Apr 2026 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051818; cv=none; b=RKEP87DEVCpFauZuNnj1ys6AC8lRdmMy5/VQT1Xywh8VpivBtU/lFTkioow5dVOt4831Apfizfnfyp/v8FN8R4f+IwLpiBkoGsTIlHFsRc6yETGfhI3iiGO0XVsXyxvk23witdjVvtsieOnKhjf/5Mh+BQsHTsI49rCyuBwt/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051818; c=relaxed/simple;
	bh=FJU/2TkCOeajLjX0b6PlHQiWuH3XWM9F2Fppc5W6w1Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jxOXPUVGxyx34g7MkNxhx3CwWY/q0p0mhs/CX10P//hVs9Ih8MpUKxyFCv4bYwLAiDYQcJOjtBH+koy6pRqZC2l3d0ibsOGW43m6EL+nl47cE4YncsXOorjm7/Q1cBcLti74Ik9qpjh9k5V+w7EGOHSMiMRnCUSVTWmkwHGNBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iOAoXV+n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iOAoXV+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548D8C19425;
	Fri, 24 Apr 2026 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777051817;
	bh=FJU/2TkCOeajLjX0b6PlHQiWuH3XWM9F2Fppc5W6w1Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iOAoXV+nD0woDWou3qWdbKPLCxnMBb6XSFk8Fa+kFopjKVG7GJy+vOCPAwQ19OLlg
	 dsIP4hsihV5RDoBZvoocZKO/0i0MvAlvqLKtkgliyXPylDuNDOzgWGyxjgrvGnHdn5
	 7XXTVveqyBlOQ42NPRt3rr+9d/ZzDvJhrq7uC3Rk=
Date: Fri, 24 Apr 2026 10:30:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 0/2] mm/kmemleak: dedupe verbose scan output
Message-Id: <20260424103016.4ad3219ae815e45de62cfaf7@linux-foundation.org>
In-Reply-To: <20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org>
References: <20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Apr 2026 08:03:35 -0700 Breno Leitao <leitao@debian.org> wrote:

> I am starting to run with kmemleak in verbose enabled in some "probe
> points" across the my employers fleet so that suspected leaks land in
> dmesg without needing a separate read of /sys/kernel/debug/kmemleak.
> 
> The downside is that workloads which leak many objects from a single
> allocation site flood the console with byte-for-byte identical
> backtraces. Hundreds of duplicates per scan are common, drowning out
> distinct leaks and unrelated kernel messages, while adding no signal
> beyond the first occurrence.
> 
> This series collapses those duplicates inside kmemleak itself. Each
> unique stackdepot trace_handle prints once per scan, followed by a
> short summary line when more than one object shares it:
> 
>   kmemleak: unreferenced object 0xff110001083beb00 (size 192):
>   kmemleak:   comm "modprobe", pid 974, jiffies 4294754196
>   kmemleak:   ...
>   kmemleak:   backtrace (crc 6f361828):
>   kmemleak:     __kmalloc_cache_noprof+0x1af/0x650
>   kmemleak:     ...
>   kmemleak:   ... and 71 more object(s) with the same backtrace
> 
> The "N new suspected memory leaks" tally and the contents of
> /sys/kernel/debug/kmemleak are unchanged - the per-object detail is
> still available on demand, only the verbose (dmesg) output is collapsed.

AI review likes the kernel patch but worries about the selftest:
	https://sashiko.dev/#/patchset/20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org
