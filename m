Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEC43F8C9;
	Mon, 17 Aug 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981285; cv=none; b=Bsu7MjH6+SJu5jcafW5p7m3TN9tNLS/oRoP5ZZr0OzBDlc7uotFDlqZqSrL3tjBfAgnSvh0Aakxh+iooA5coOBIll2x9mvAQmjskKFGduQ+AsxYbx0yp90PhTOyF+MPhRSoAbkv6ob0O/PXGtKRtgjK8yLNU36LwFzksKv3lDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981285; c=relaxed/simple;
	bh=3qYPThCtHH1kyCuyDgCTeYiyXbpv+pUU4fawM7RQa0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t10tPq6Ac5M1PQ/e4RdSdkppb3u75xoyimPIaAUUSrB+1uD0NJaAeOcuttY9S5/8ESJoQUmZHsehas4LPlZUhcxNh+qNVcw9/f72uW6gGuGCyVGCrceva7V9cvfjvbM+uMBMeiATM6UGokUydu7H1gF87hzgBzxtovSPDgIMAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkAyF9dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkAyF9dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CEC1F000E9;
	Mon, 17 Aug 2026 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981284;
	bh=1nm8z1ScEuwdhcGe4VXXFM6xKV7SZ9R/OpCKnbX93Fc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XkAyF9dkN+pYMtyDNZ14DnU0azwUlCB5MdhbG3J+mIb7SJbFwatiQYtq2h+WzKeLp
	 n7MnHHO8XnMHXAARETR31kQ+FvzhwTK6epSYkenWqQVwDHL5qW+0Zl9ivyCH01QfD1
	 KT5lun1I9HeF4o6oqvcq9gwjdWzJDfKz0qFFG6QLFCleC/3vy2zzem5fJxPALKtB5d
	 uGMme1TgEpPWnGC0i9PnR/5s5etJ3oEig5Ue4BwuEepZUcI/QkvrTe0hEwaajpZlV9
	 iLey6Ih7+TmGVL6TLknTdxNcrHqgOFNli4+p9eFLg/CW9rK2Qr1nXU1X3bwPcunc6d
	 pbieyEDgX2ghw==
Date: Mon, 17 Aug 2026 08:41:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lei Zhu <zhulei_szu@163.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@google.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Subject: Re: [PATCH net] selftests: af_unix: verify SCM_PIDFD pidfd in
 cmsg_check_dead()
Message-ID: <20260817084123.75fbbf97@kernel.org>
In-Reply-To: <20260817061121.239648-1-zhulei_szu@163.com>
References: <20260817061121.239648-1-zhulei_szu@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 14:11:21 +0800 Lei Zhu wrote:
> The cmsg_check_dead() function receives an expected_pid parameter but never
> actually verifies that the pidfd received via SCM_PIDFD corresponds to that
> PID. It only checks the child's exit code via PIDFD_GET_INFO.

this breaks the test:

  (scm_pidfd.c:282: errno: None) wrong SCM_PIDFD -1 != <PID>

If you want to improve the test please repost this patch in 2 weeks
after the merge window. This patch should not carry the Fixes tag.
