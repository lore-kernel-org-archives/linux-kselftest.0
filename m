Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006361BC2A;
	Fri,  4 Sep 2026 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482655; cv=none; b=kkabesCNKSWx6CJ6SVNf2rufD//cKJnJTGqYOJZNLEfZCwxUqI3gqWfiCg299jccz6SZpq1u06L7tQ0BDZE6drl0MRhm0UQu3vmuEqFxhTrEB5ZGwsVmvTB1KiIziS+5HYjIzAacDqD4j1i36V+0XymAksTgHdSAf4RNUZzivLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482655; c=relaxed/simple;
	bh=IpaniWpl4q+8kiIAFgq+x65paTc23TjQM5EsmdPM+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qj+5PcO73RowR5Kw0uMpNint+Jw+ZkX4WNhd4+be6xmt4Qa6N66htuqB8Ke9XSzO41Wfe+qKcFab+pz3zDNsPDi6+W2rMjrKi4z1IgggYPJLgaXr0ngOpWUPbmC2Ps4/u+NeQUqUYdApgC/3uSE+mKkMvCBI0dVdaQgfnbpzqtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8pOMMDh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8pOMMDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180D91F000E9;
	Fri,  4 Sep 2026 00:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788482653;
	bh=KraBssmMEiWIBzyn65iDWbUViqjTaiDbL8M21HHwgAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C8pOMMDh1Z7TttwCKihKzuccCRBEZrjT7j/gIJuixvaPcRyABx0q5vkmdefdAFVEw
	 gmTdX5+k8WBG43R6I6IRzTFITAC7liJ1tduPzDmZ+IzDSg+RSiDdPij31M3uA1LW3H
	 IPUb55zkVjTROVZWmvIoa/qGLAtXc26UbslMIIMjedyl/0jBtwTf+taIQf6DDZb5Bb
	 0pmW6bv7X/hyAAZHoW2MasZxmB/RjxFXbXEcbcmMORoVMvXtOBKaYARyejgBtGrTK3
	 kdEbBsanlq6IiPYeeUGWDInPYRArnHJxb1xPD3TOhK8jGIhZ9rIX//UBtOleT/ZwIP
	 /ZmeyT06BpDlw==
From: SJ Park <sj@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH] selftests/mm: remove unreachable returns after ksft exit helpers
Date: Thu,  3 Sep 2026 17:44:05 -0700
Message-ID: <20260904004405.116994-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903135251.39593-1-zenghui.yu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'get_maintainer.pl --nogit --nogit-fallback' on mm-new suggests adding Kiryl.
I added him.

- Kiryl Shutsemau <kas@kernel.org>

On Thu,  3 Sep 2026 21:52:51 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:

> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> The ksft_exit*() helpers such as ksft_exit_fail_msg() are declared
> __noreturn, and the ksft_exit() and ksft_finished() macros expand to calls
> of them, always terminating the process via exit().  Any return statements
> following such calls are unreachable, both at the end of main() and on
> error paths of helper functions.
> 
> Remove all of them.  No functional change.

Makes sense and looks correct to me :)

> 
> Assisted-by: GLM-5.3 OpenCode
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
